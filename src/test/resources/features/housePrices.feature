Feature: Do some stuff with house prices
  https://www.dropbox.com/s/hlbl0pujz7dbakr/house_price.zip?dl=0

  As a Dan I want to find out about house prices in my area so that i can tell my landlord to F off

  @wip
  Scenario: Count the rows in the data
    Given a table of data in a temp table called "housePrices"
      | postcode: String | price: Int |
      | AB54 T34         | 7593       |
      | BG45 4PQ         | 2          |
      | BF45 5PZ         | 3          |
    When I count the rows in the table "housePrices"
    Then the result is '3'

  @wip
  Scenario: Calculate the average house price, by year
    Given a table of data in a temp table called "housePricesWithYear"
      | postcode: String | price: Int | year: Int |
      | AB54 T34         | 1          | 2014      |
      | BG45 4PQ         | 2          | 2015      |
      | BF45 5PZ         | 3          | 2015      |
    When I calculate the average house price per year in the table "housePricesWithYear" and store the results in table "averageHousePrices"
    Then the data in temp table "averageHousePrices" is
      | year:Int | averageHousePrice:Double |
      | 2014     | 1                        |
      | 2015     | 2.5                      |

  @wip
  Scenario: Calculate the average, min and max house price, by year
    Given a table of data in a temp table called "housePricesWithYear"
      | postcode: String | price: Int | year: Int |
      | AB54 T34         | 1          | 2014      |
      | BG45 4PQ         | 2          | 2015      |
      | BF45 5PZ         | 3          | 2015      |
    When I calculate the average min and max price per year in the table "housePricesWithYear" and store the results in table "statsHousePrices"
    Then the data in temp table "statsHousePrices" is
      | year:Int | averageHousePrice:Double | minHousePrice:int | maxHousePrice:int |
      | 2014     | 1                        | 1                 | 1                 |
      | 2015     | 2.5                      | 2                 | 3                 |

  @wip
  Scenario: Calculate the average, min and max house price, by year
    Given a table of data in a temp table called "housePricesWithYear"
      | postcode: String | price: Int | year: Int |
      | AB54 T34         | 1          | 2014      |
      | BG45 4PQ         | 2          | 2015      |
      | BF45 5PZ         | 3          | 2015      |
    When I calculate the average min and max price per year in the table "housePricesWithYear" and postcode "AB54 T34" and store the results in table "statsHousePrices"
    Then the data in temp table "statsHousePrices" is
      | year:Int | averageHousePrice:Double | minHousePrice:int | maxHousePrice:int |
      | 2014     | 1                        | 1                 | 1                 |


    @wip
    Scenario: Convert date to year
      Given a table of data in a temp table called "HouseSalesDate"
      |SalesDate:string |
      |2016-09-12       |
      |2014-11-02       |
      |2018-03-09       |
      When I convert the Sales date in "HouseSalesDate" to a year and store in temp table "SalesYear"
      Then the data in temp table "SalesYear" is
      |SalesYear:string|
      |2016            |
      |2014            |
      |2018            |