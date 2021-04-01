@fixture.set_workdir
Feature: Multi Active Satellites Loaded in cycles using separate manual loads with duplicates - Two CDKs
  This is a series of 4 day loading cycles testing different duplicate record loads
  and different hashdiff configurations, i.e. incl. PK and CDKs, excl. CDKs, excl. PK and CDKs

  @fixture.multi_active_satellite_cycle
  Scenario: [SAT-CYCLE-DUPLICATES] MULTI_ACTIVE_SATELLITE load over several cycles with EXTENSION not changing and a mix of duplicate record change cases - Two CDKs
    Given the RAW_STAGE_TWO_CDK stage is empty
    And the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat is empty

    # ================ DAY 1 ===================
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1222 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1223 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1233 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1224 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1234 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1244 | 12301     | 2019-01-01     | 2019-01-01 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 2 ===================
    # Between-load duplicates (or identical subsequent loads)
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1002        | Beth          | 17-214-233-1222 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1223 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1233 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1224 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1234 | 12301     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1244 | 12301     | 2019-01-02     | 2019-01-02 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 3 ===================
    # Change of count/cdk/payload (and hashdiff) + intra-load duplicates
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1311 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1001        | Albert        | 17-214-233-1311 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1312 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1312 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1312 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1322 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1313 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1323 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1323 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1224 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1234 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1244 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1244 | 12301     | 2019-01-03     | 2019-01-03 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 4 ===================
    # Between-load + intra-load duplicates
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1311 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1001        | Albert        | 17-214-233-1311 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1001        | Albert        | 17-214-233-1311 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beth          | 17-214-233-1312 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beth          | 17-214-233-1312 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beth          | 17-214-233-1322 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beth          | 17-214-233-1322 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1003        | Charley       | 17-214-233-1313 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1003        | Charley       | 17-214-233-1313 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1003        | Charley       | 17-214-233-1323 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1224 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1224 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1234 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1234 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1244 | 12301     | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenna         | 17-214-233-1244 | 12301     | 2019-01-04     | 2019-01-04 | *      |

    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # =============== CHECKS ===================
    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK table should contain expected data
      | CUSTOMER_PK | HASHDIFF                                           | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1211\|\|12301')  | Albert        | 17-214-233-1211 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1212\|\|12301')    | Beth          | 17-214-233-1212 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1222\|\|12301')    | Beth          | 17-214-233-1222 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1213\|\|12301') | Charley       | 17-214-233-1213 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1223\|\|12301') | Charley       | 17-214-233-1223 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1233\|\|12301') | Charley       | 17-214-233-1233 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1214\|\|12301')   | Jenny         | 17-214-233-1214 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1224\|\|12301')   | Jenny         | 17-214-233-1224 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1234\|\|12301')   | Jenny         | 17-214-233-1234 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1244\|\|12301')   | Jenny         | 17-214-233-1244 | 12301     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1311\|\|12301')  | Albert        | 17-214-233-1311 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1312\|\|12301')    | Beth          | 17-214-233-1312 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1322\|\|12301')    | Beth          | 17-214-233-1322 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1313\|\|12301') | Charley       | 17-214-233-1313 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1323\|\|12301') | Charley       | 17-214-233-1323 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1214\|\|12301')   | Jenna         | 17-214-233-1214 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1224\|\|12301')   | Jenna         | 17-214-233-1224 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1234\|\|12301')   | Jenna         | 17-214-233-1234 | 12301     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1244\|\|12301')   | Jenna         | 17-214-233-1244 | 12301     | 2019-01-03     | 2019-01-03 | *      |

  #todo: test needs to be finalised
  @fixture.multi_active_satellite_cycle
  Scenario: [SAT-CYCLE-DUPLICATES] MULTI_ACTIVE_SATELLITE load over several cycles with EXTENSION changing and a mix of duplicate record change cases - Two CDKs
    Given the RAW_STAGE_TWO_CDK stage is empty
    And the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat is empty

    # ================ DAY 1 ===================
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 12311     | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12312     | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12322     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12313     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12323     | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12333     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12314     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12324     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12334     | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12344     | 2019-01-01     | 2019-01-01 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 2 ===================
    # Between-load duplicates (or identical subsequent loads)
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 12311     | 2019-01-02     | 2019-01-02 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12312     | 2019-01-02     | 2019-01-02 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 12322     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12313     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12323     | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 12333     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12314     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12324     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12334     | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 12344     | 2019-01-02     | 2019-01-02 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 3 ===================
    # Change of count/cdk/payload (and hashdiff) + intra-load duplicates
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | 1001        | Albert        | 17-214-233-1211 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92322     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92313     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92323     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92323     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12314     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12324     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12334     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12344     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12344     | 2019-01-03     | 2019-01-03 | *      |
    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # ================ DAY 4 ===================
    # Between-load + intra-load duplicates
    When the RAW_STAGE_TWO_CDK is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | 1001        | Albert        | 17-214-233-1211 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | 1001        | Albert        | 17-214-233-1211 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92322     | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 92322     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92313     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92313     | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 92323     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12314     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12324     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12334     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12314     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12324     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12334     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12344     | 2019-01-03     | 2019-01-03 | *      |
      | 1010        | Jenna         | 17-214-233-1214 | 12344     | 2019-01-03     | 2019-01-03 | *      |

    And I create the STG_CUSTOMER_TWO_CDK stage
    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK ma_sat

    # =============== CHECKS ===================
    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK table should contain expected data
      | CUSTOMER_PK | HASHDIFF                                           | CUSTOMER_NAME | CUSTOMER_PHONE  | EXTENSION | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1211\|\|12311')  | Albert        | 17-214-233-1211 | 12311     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1212\|\|12312')    | Beth          | 17-214-233-1212 | 12312     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1222\|\|12322')    | Beth          | 17-214-233-1222 | 12322     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1213\|\|12313') | Charley       | 17-214-233-1213 | 12313     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1223\|\|12323') | Charley       | 17-214-233-1223 | 12323     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1233\|\|12333') | Charley       | 17-214-233-1233 | 12333     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1214\|\|12314')   | Jenny         | 17-214-233-1214 | 12314     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1224\|\|12324')   | Jenny         | 17-214-233-1224 | 12324     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1234\|\|12334')   | Jenny         | 17-214-233-1234 | 12334     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1244\|\|12344')   | Jenny         | 17-214-233-1244 | 12344     | 2019-01-01     | 2019-01-01 | *      |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1311\|\|92311')  | Albert        | 17-214-233-1311 | 92311     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1312\|\|92312')    | Beth          | 17-214-233-1312 | 92312     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1322\|\|92322')    | Beth          | 17-214-233-1322 | 92322     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1313\|\|92313') | Charley       | 17-214-233-1313 | 92313     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1323\|\|92323') | Charley       | 17-214-233-1323 | 92323     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1214\|\|12314')   | Jenna         | 17-214-233-1214 | 12314     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1224\|\|12324')   | Jenna         | 17-214-233-1224 | 12324     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1234\|\|12334')   | Jenna         | 17-214-233-1234 | 12334     | 2019-01-03     | 2019-01-03 | *      |
      | md5('1010') | md5('1010\|\|JENNA\|\|17-214-233-1244\|\|12344')   | Jenna         | 17-214-233-1244 | 12344     | 2019-01-03     | 2019-01-03 | *      |
#
#  #todo: test needs to be finalised
##  @fixture.multi_active_satellite_cycle
##  Scenario: [SAT-CYCLE-DUPLICATES] MULTI_ACTIVE_SATELLITE load over several cycles with CUSTOMER_PHONE and EXTENSION changing and a mix of duplicate record change cases - Two CDKs
#
#  @fixture.multi_active_satellite_cycle
#  Scenario: [SAT-CYCLE-DUPLICATES] MULTI_ACTIVE_SATELLITE load over several cycles with no CDKs in HASHDIFF and a mix of duplicate record change cases - Two CDKs
#    Given the RAW_STAGE_TWO_CDK stage is empty
#    And the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF ma_sat is empty
#
#    # ================ DAY 1 ===================
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1211 | 2019-01-01     | 2019-01-01 | *      |
#      | 1002        | Beth          | 17-214-233-1212 | 2019-01-01     | 2019-01-01 | *      |
#      | 1002        | Beth          | 17-214-233-1222 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1213 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1223 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1233 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1214 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1224 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1234 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1244 | 2019-01-01     | 2019-01-01 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 2 ===================
#    # Between-load duplicates (or identical subsequent loads)
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1211 | 2019-01-02     | 2019-01-02 | *      |
#      | 1002        | Beth          | 17-214-233-1212 | 2019-01-02     | 2019-01-02 | *      |
#      | 1002        | Beth          | 17-214-233-1222 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1213 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1223 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1233 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1214 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1224 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1234 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1244 | 2019-01-02     | 2019-01-02 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 3 ===================
#    # Change of count/cdk/payload (and hashdiff) + intra-load duplicates
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 4 ===================
#    # Between-load + intra-load duplicates
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-04     | 2019-01-04 | *      |
#
#    And I create the STG_CUSTOMER_TWO_CDK_NO_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF ma_sat
#
#    # =============== CHECKS ===================
#    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_CDK_HASHDIFF table should contain expected data
#      | CUSTOMER_PK | HASHDIFF               | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | md5('1001') | md5('1001\|\|ALBERT')  | Albert        | 17-214-233-1211 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1002') | md5('1002\|\|BETH')    | Beth          | 17-214-233-1212 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1002') | md5('1002\|\|BETH')    | Beth          | 17-214-233-1222 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('1003\|\|CHARLEY') | Charley       | 17-214-233-1213 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('1003\|\|CHARLEY') | Charley       | 17-214-233-1223 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('1003\|\|CHARLEY') | Charley       | 17-214-233-1233 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('1010\|\|JENNY')   | Jenny         | 17-214-233-1214 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('1010\|\|JENNY')   | Jenny         | 17-214-233-1224 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('1010\|\|JENNY')   | Jenny         | 17-214-233-1234 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('1010\|\|JENNY')   | Jenny         | 17-214-233-1244 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1001') | md5('1001\|\|ALBERT')  | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1002') | md5('1002\|\|BETH')    | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1002') | md5('1002\|\|BETH')    | Beth          | 17-214-233-1322 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1003') | md5('1003\|\|CHARLEY') | Charley       | 17-214-233-1313 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1003') | md5('1003\|\|CHARLEY') | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('1010\|\|JENNA')   | Jenna         | 17-214-233-1214 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('1010\|\|JENNA')   | Jenna         | 17-214-233-1224 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('1010\|\|JENNA')   | Jenna         | 17-214-233-1234 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('1010\|\|JENNA')   | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |
#
#  @fixture.multi_active_satellite_cycle
#  Scenario: [SAT-CYCLE-DUPLICATES] MULTI_ACTIVE_SATELLITE load over several cycles with no PK nor CDKs in HASHDIFF and a mix of duplicate record change cases - Two CDKs
#    Given the RAW_STAGE_TWO_CDK stage is empty
#    And the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF ma_sat is empty
#
#    # ================ DAY 1 ===================
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1211 | 2019-01-01     | 2019-01-01 | *      |
#      | 1002        | Beth          | 17-214-233-1212 | 2019-01-01     | 2019-01-01 | *      |
#      | 1002        | Beth          | 17-214-233-1222 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1213 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1223 | 2019-01-01     | 2019-01-01 | *      |
#      | 1003        | Charley       | 17-214-233-1233 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1214 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1224 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1234 | 2019-01-01     | 2019-01-01 | *      |
#      | 1010        | Jenny         | 17-214-233-1244 | 2019-01-01     | 2019-01-01 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_PK_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 2 ===================
#    # Between-load duplicates (or identical subsequent loads)
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1211 | 2019-01-02     | 2019-01-02 | *      |
#      | 1002        | Beth          | 17-214-233-1212 | 2019-01-02     | 2019-01-02 | *      |
#      | 1002        | Beth          | 17-214-233-1222 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1213 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1223 | 2019-01-02     | 2019-01-02 | *      |
#      | 1003        | Charley       | 17-214-233-1233 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1214 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1224 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1234 | 2019-01-02     | 2019-01-02 | *      |
#      | 1010        | Jenny         | 17-214-233-1244 | 2019-01-02     | 2019-01-02 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_PK_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 3 ===================
#    # Change of count/cdk/payload (and hashdiff) + intra-load duplicates
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |
#    And I create the STG_CUSTOMER_TWO_CDK_NO_PK_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF ma_sat
#
#    # ================ DAY 4 ===================
#    # Between-load + intra-load duplicates
#    When the RAW_STAGE_TWO_CDK is loaded
#      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1001        | Albert        | 17-214-233-1311 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1312 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-04     | 2019-01-04 | *      |
#      | 1002        | Beth          | 17-214-233-1322 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1313 | 2019-01-04     | 2019-01-04 | *      |
#      | 1003        | Charley       | 17-214-233-1323 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1214 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1224 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1234 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-04     | 2019-01-04 | *      |
#      | 1010        | Jenna         | 17-214-233-1244 | 2019-01-04     | 2019-01-04 | *      |
#
#    And I create the STG_CUSTOMER_TWO_CDK_NO_PK_CDK_HASHDIFF stage
#    And I load the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF ma_sat
#
#    # =============== CHECKS ===================
#    Then the MULTI_ACTIVE_SATELLITE_TWO_CDK_NO_PK_CDK_HASHDIFF table should contain expected data
#      | CUSTOMER_PK | HASHDIFF       | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
#      | md5('1001') | md5('ALBERT')  | Albert        | 17-214-233-1211 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1002') | md5('BETH')    | Beth          | 17-214-233-1212 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1002') | md5('BETH')    | Beth          | 17-214-233-1222 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('CHARLEY') | Charley       | 17-214-233-1213 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('CHARLEY') | Charley       | 17-214-233-1223 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1003') | md5('CHARLEY') | Charley       | 17-214-233-1233 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('JENNY')   | Jenny         | 17-214-233-1214 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('JENNY')   | Jenny         | 17-214-233-1224 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('JENNY')   | Jenny         | 17-214-233-1234 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1010') | md5('JENNY')   | Jenny         | 17-214-233-1244 | 2019-01-01     | 2019-01-01 | *      |
#      | md5('1001') | md5('ALBERT')  | Albert        | 17-214-233-1311 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1002') | md5('BETH')    | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1002') | md5('BETH')    | Beth          | 17-214-233-1322 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1003') | md5('CHARLEY') | Charley       | 17-214-233-1313 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1003') | md5('CHARLEY') | Charley       | 17-214-233-1323 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('JENNA')   | Jenna         | 17-214-233-1214 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('JENNA')   | Jenna         | 17-214-233-1224 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('JENNA')   | Jenna         | 17-214-233-1234 | 2019-01-03     | 2019-01-03 | *      |
#      | md5('1010') | md5('JENNA')   | Jenna         | 17-214-233-1244 | 2019-01-03     | 2019-01-03 | *      |