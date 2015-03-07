package com.spaneos.onlinetest.web.config;

import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.spaneos.onlinetest.dao.OnlineTestDao;
import com.spaneos.onlinetest.dao.OnlineTestDaoImp;
import com.spaneos.onlinetest.pojo.Category;
import com.spaneos.onlinetest.pojo.NormalFeedBack;
import com.spaneos.onlinetest.pojo.NormalTest;
import com.spaneos.onlinetest.pojo.TestQuestions;
import com.spaneos.onlinetest.pojo.TestSection;
import com.spaneos.onlinetest.pojo.User;

@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = { "com.spaneos.onlinetest" })
@Configuration
public class OnlienTestAppConfig extends WebMvcConfigurerAdapter {

	private final String PROPERTY_NAME_DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	private final String PROPERTY_NAME_DATABASE_URL = "jdbc:mysql://localhost:3306/HIBERNATE";
	private final String PROPERTY_NAME_DATABASE_USERNAME = "srikanth";
	private final String PROPERTY_NAME_DATABASE_PASSWORD = "srikanth";

	@Resource
	private Environment environment;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations(
				"/resources/");
		registry.addResourceHandler("/css/**").addResourceLocations("/css/")
				.setCachePeriod(31556925);
		registry.addResourceHandler("/img/**").addResourceLocations("/img/")
				.setCachePeriod(31556925);
		registry.addResourceHandler("/js/**").addResourceLocations("/js/")
				.setCachePeriod(31556925);
		registry.addResourceHandler("/fonts/**").addResourceLocations("/fonts/")
		.setCachePeriod(31556925);
	}

	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getInternalResourceViewResolver() {
		InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
		internalResourceViewResolver.setPrefix("");
		internalResourceViewResolver.setSuffix(".jsp");

		return internalResourceViewResolver;
	}

	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		BasicDataSource basicDataSource = new BasicDataSource();
		basicDataSource.setDriverClassName(PROPERTY_NAME_DATABASE_DRIVER);
		basicDataSource.setUrl(PROPERTY_NAME_DATABASE_URL);
		basicDataSource.setUsername(PROPERTY_NAME_DATABASE_USERNAME);
		basicDataSource.setPassword(PROPERTY_NAME_DATABASE_PASSWORD);

		return basicDataSource;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {

		LocalSessionFactoryBuilder factoryBuilder = new LocalSessionFactoryBuilder(
				dataSource);
		factoryBuilder.addAnnotatedClasses(Category.class,
				NormalFeedBack.class, NormalTest.class, TestQuestions.class,
				TestSection.class, User.class);
		factoryBuilder.addProperties(getHibernateProperties());
		return factoryBuilder.buildSessionFactory();
	}

	private Properties getHibernateProperties() {

		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		properties.put("hibernate.dialect",
				"org.hibernate.dialect.MySQLDialect");
		properties.put("hibernate.hbm2ddl.auto", "update");

		return properties;
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getHibernateTransactionManager(
			SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(
				sessionFactory);
		return transactionManager;

	}

	@Autowired
	@Bean(name = "onlineTestDao")
	public OnlineTestDao getUserDao(SessionFactory sessionFactory) {
		return new OnlineTestDaoImp(sessionFactory);
	}
}
