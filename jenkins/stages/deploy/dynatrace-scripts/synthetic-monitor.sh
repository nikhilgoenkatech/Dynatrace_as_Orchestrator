#!/bin/bash

PAYLOAD=$(cat <<EOF
{
  "name": "$1 $2-$3",
  "frequencyMin": 0,
  "enabled": true,
  "type": "BROWSER",
  "createdFrom": "GUI",
  "script": {
    "type": "clickpath",
    "version": "1.0",
    "configuration": {
      "device": {
        "deviceName": "Desktop",
        "orientation": "landscape"
      },
      "chromiumStartupFlags": {
        "disable-web-security": false
      }
    },
    "events": [
      {
        "type": "navigate",
        "wait": {
          "waitFor": "page_complete"
        },
        "description": "Loading of \"http://${PUBLIC_IP}:$4\"",
        "url": "http://${PUBLIC_IP}:$4"
      },
      {
        "type": "click",
        "description": "click on \"Login\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "a:contains(\"Login\")"
            },
            {
              "type": "css",
              "value": ".btn:eq(0)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div:nth-child(2) div p:nth-child(5) a"
            },
            {
              "type": "css",
              "value": "body div.container-fluid div.jumbotron p.lead a.btn:eq(0)"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "keystrokes",
        "description": "keystrokes on \"id_username\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "#id_username"
            },
            {
              "type": "css",
              "value": "input[type=\"text\"][name=\"email\"]"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div:nth-child(2) div div form div:nth-child(2) div:nth-child(2) div input:nth-child(2)"
            },
            {
              "type": "css",
              "value": "#id_username"
            }
          ]
        },
        "simulateBlurEvent": true,
        "textValue": "guestuser1@mybank.com",
        "masked": false
      },
      {
        "type": "keystrokes",
        "description": "keystrokes on \"Password:\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "#password"
            },
            {
              "type": "css",
              "value": "input[type=\"password\"][name=\"password\"]"
            },
            {
              "type": "css",
              "value": ".form-control"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div:nth-child(2) div div:nth-child(2) div:nth-child(2) div input:nth-child(2)"
            },
            {
              "type": "css",
              "value": "#password"
            }
          ]
        },
        "simulateBlurEvent": true,
        "textValue": "U2FsdGVkX19M6bloalXign7QvZc/XuQwc3pqyNI5Quk=",
        "masked": true,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "click",
        "description": "click on \"Pay Bills\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "a:contains(\"Pay Bills\")"
            },
            {
              "type": "css",
              "value": "div:contains(\"Funds Transfer\"):eq(6)"
            },
            {
              "type": "css",
              "value": ".btn:eq(1)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div:nth-child(3) div div div div:nth-child(2) div:nth-child(3) div a"
            },
            {
              "type": "css",
              "value": "body div.container-fluid div.jumbotron div.container div.row div.col-md-12 div.wrapper div.centered a.btn:eq(0)"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "keystrokes",
        "description": "keystrokes on \"Amount\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "#amount"
            },
            {
              "type": "css",
              "value": "input[type=\"text\"][name=\"amount\"]"
            },
            {
              "type": "css",
              "value": ".form-control"
            },
            {
              "type": "css",
              "value": "html body:nth-child(12) div:nth-child(3) form div div div:nth-child(2) div:nth-child(2) div div:nth-child(2) input:nth-child(2)"
            },
            {
              "type": "css",
              "value": "#amount"
            }
          ]
        },
        "simulateBlurEvent": true,
        "textValue": "10",
        "masked": false
      },
      {
        "type": "click",
        "description": "click on \"WITHDRAW\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "button[type=\"submit\"]"
            },
            {
              "type": "css",
              "value": "button:contains(\"WITHDRAW\")"
            },
            {
              "type": "css",
              "value": ".btn:eq(1)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(12) div:nth-child(3) form div div div:nth-child(3) div:nth-child(2) button"
            },
            {
              "type": "css",
              "value": "body div.container-fluid form div.jumbotron div.container div.row div.col-md-6 button.btn"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "click",
        "description": "click on \"Funds Transfer\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "a:contains(\"Funds Transfer\")"
            },
            {
              "type": "css",
              "value": "div:contains(\"Funds Transfer\"):eq(6)"
            },
            {
              "type": "css",
              "value": ".btn:eq(2)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div:nth-child(3) div div div div:nth-child(2) div:nth-child(3) div a:nth-child(3)"
            },
            {
              "type": "css",
              "value": "body div.container-fluid div.jumbotron div.container div.row div.col-md-12 div.wrapper div.centered a.btn:eq(1)"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "keystrokes",
        "description": "keystrokes on \"Amount\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "#amount"
            },
            {
              "type": "css",
              "value": "input[type=\"text\"][name=\"amount\"]"
            },
            {
              "type": "css",
              "value": ".form-control"
            },
            {
              "type": "css",
              "value": "html body:nth-child(12) div:nth-child(3) form div div div:nth-child(2) div:nth-child(2) div div:nth-child(2) input:nth-child(2)"
            },
            {
              "type": "css",
              "value": "#amount"
            }
          ]
        },
        "simulateBlurEvent": true,
        "textValue": "2",
        "masked": false
      },
      {
        "type": "click",
        "description": "click on \"DEPOSIT\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "button[type=\"submit\"]"
            },
            {
              "type": "css",
              "value": "button:contains(\"DEPOSIT\")"
            },
            {
              "type": "css",
              "value": ".btn:eq(1)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(12) div:nth-child(3) form div div div:nth-child(3) div:nth-child(2) button"
            },
            {
              "type": "css",
              "value": "body div.container-fluid form div.jumbotron div.container div.row div.col-md-6 button.btn"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      },
      {
        "type": "click",
        "description": "click on \"Logout\"",
        "target": {
          "locators": [
            {
              "type": "css",
              "value": "a:contains(\"Logout\")"
            },
            {
              "type": "css",
              "value": "div:contains(\"Welcome User-1 !!\")"
            },
            {
              "type": "css",
              "value": ".btn:eq(0)"
            },
            {
              "type": "css",
              "value": "html body:nth-child(8) div a:nth-child(2)"
            },
            {
              "type": "css",
              "value": "body div a.btn:eq(0)"
            }
          ]
        },
        "button": 0,
        "wait": {
          "waitFor": "page_complete"
        }
      }
    ]
  },
  "locations": [
    "GEOLOCATION-2FD31C834DE4D601"
  ],
  "anomalyDetection": {
    "outageHandling": {
      "globalOutage": true,
      "globalOutagePolicy": {
        "consecutiveRuns": 1
      },
      "localOutage": false,
      "localOutagePolicy": {
        "affectedLocations": null,
        "consecutiveRuns": null
      },
      "retryOnError": true
    },
    "loadingTimeThresholds": {
      "enabled": true,
      "thresholds": []
    }
  },
  "tags": [
   "$1-$3"
  ],
  "managementZones": [],
  "automaticallyAssignedApps": [],
  "manuallyAssignedApps": [],
  "keyPerformanceMetrics": {
    "loadActionKpm": "VISUALLY_COMPLETE",
    "xhrActionKpm": "VISUALLY_COMPLETE"
  },
  "events": []
}
EOF
)
echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token ${DT_TOKEN}" -X POST -d "${PAYLOAD}" ${DT_URL}/api/v1/synthetic/monitors
