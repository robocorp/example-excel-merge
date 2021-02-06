*** Settings ***
Library  RPA.Robocloud.Items
Library  PandasUtils.py

*** Keyword ***
Search Repeated Speeding
    [Arguments]    ${First Date}    ${Second Date}    ${Result}
    Read Excel    Day 1 Traffic    input/${First Date}_traffic-data.xlsx
    Filter By Column Greater Than    Day 1 Traffic    Speed    80
    
    Read Excel    Day 2 Traffic    input/${Second Date}_traffic-data.xlsx
    Filter By Column Greater Than    Day 2 Traffic    Speed    80
    
    Merge By Column    Day 1 Traffic    Day 2 Traffic    ${Result}    License plate

*** Tasks ***
Get License Plates For Repeated Speeding
    Search Repeated Speeding    2021-01-01    2021-01-02    Tickets
    Write Excel    Tickets    output/tickets.xlsx

    ${Tickets}=    Get Data As Dict    Tickets
    Set work item variable    tickets    ${Tickets}
    Save work item


