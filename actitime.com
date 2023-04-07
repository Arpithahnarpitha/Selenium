from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()
driver.maximize_window()
driver.get("https://demo.actitime.com/")
time.sleep(1)
driver.implicitly_wait(10)
driver.find_element(By.NAME,"username").send_keys("admin")

driver.find_element(By.NAME,"pwd").send_keys("manager")
driver.find_element(By.XPATH, "//div[.='Login ']").click()
time.sleep(3)
driver.find_element(By.ID,"container_tasks").click()
time.sleep(1)
driver.find_element(By.XPATH, "//div[.='Add New']").click()
driver.find_element(By.XPATH, "//div[.='+ New Customer']").click()
driver.find_element(By.XPATH, "//div[@class='customerNameDiv']/input[@placeholder='Enter Customer Name']")\
    .send_keys("python ")
driver.find_element(By.XPATH, "//textarea[@placeholder='Enter Customer Description']").send_keys("HDFC ")
driver.find_element(By.XPATH, "//div[.='- Select Customer -']").click()
time.sleep(3)
driver.find_element(By.XPATH, "//*[@id='customerLightBox_content']/div[2]/div[1]/div/div[1]/div[3]/div[2]/span/div/div[2]/div/div[1]/div/div[6]")
driver.find_element(By.XPATH, "//div[@class='components_button withPlusIcon']").click()
time.sleep(5)
driver.find_element(By.XPATH, "//a[.='Logout']").click()
