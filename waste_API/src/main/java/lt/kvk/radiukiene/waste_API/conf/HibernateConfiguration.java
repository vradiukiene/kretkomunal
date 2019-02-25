package lt.kvk.radiukiene.waste_API.conf;

import java.net.URISyntaxException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan({ "lt.kvk.radiukiene.waste_API" })
@PropertySource(value = { "classpath:application.properties" })
public class HibernateConfiguration {

	@Autowired
	private Environment environment;
	
	@Value("com.mysql.jdbc.Driver") String driverClassName;
    	@Value("jdbc:mysql://${DBHOSTNAME}:3306/${DBSCHEMA}") String url;
    	@Value("${DBUSERNAME}") String username;
    	@Value("${DBPASSWORD}") String password;
    	@Bean(name = "dataSource")
	public DataSource getDataSource() {
        DataSource dataSource = DataSourceBuilder
                .create()
                .username(username)
                .password(password)
                .url(url)
                .driverClassName(driverClassName)
                .build();
        return dataSource;
    	}
	/*public ComboPooledDataSource getDataSource() {
        	ComboPooledDataSource cpds = new ComboPooledDataSource();
        	cpds.setJdbcUrl(url);
       		cpds.setUser(username);
        	cpds.setPassword(password);

        	cpds.setInitialPoolSize(2);
        	cpds.setMinPoolSize(2);
        	cpds.setAcquireIncrement(2);
        	cpds.setMaxPoolSize(10);
        	cpds.setMaxStatements(100);
        
        	cpds.setTestConnectionOnCheckin(true);
        	cpds.setTestConnectionOnCheckout(true); // If true, an operation will be performed
        						// asynchronously at every connection checkin
        						// to verify that the connection is valid.
        	cpds.setPreferredTestQuery("SELECT 1;");
        	cpds.setIdleConnectionTestPeriod(600); // If this is a number greater than 0,
        						// c3p0 will test all idle,
        						// pooled but unchecked-out connections, 
        						// every this number of seconds.
        	cpds.setMaxIdleTimeExcessConnections(120);
        	cpds.setMaxIdleTime(600); // Seconds a Connection can remain pooled but 
        				// unused before being discarded.
        				// Zero means idle connections never expire.
	        return cpds;
    	}*/
    
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() throws URISyntaxException {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(getDataSource());
		sessionFactory.setPackagesToScan(new String[] { "lt.kvk.radiukiene.waste_API" });
		sessionFactory.setHibernateProperties(hibernateProperties());
		return sessionFactory;
	}

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
		properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
		return properties;
	}

	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory s) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(s);
		return txManager;
	}
}
