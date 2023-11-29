#!/bin/bash

PAYLOAD=$(cat <<EOF
{
  "metadata": {
    "configurationVersions": [
      6
    ],
    "clusterVersion": "1.257.0.20221125-212251"
  },
  "dashboardMetadata": {
    "name": "$3 $4 - Release: $6",
    "shared": true,
    "owner": "dynatraceone@dynatrace.com",
    "preset": true,
    "popularity": 2,
    "hasConsistentColors": false
  },
  "tiles": [
    {
      "name": "Problems",
      "tileType": "OPEN_PROBLEMS",
      "configured": true,
      "bounds": {
        "top": 76,
        "left": 0,
        "width": 152,
        "height": 152
      },
      "tileFilter": {}
    },
    {
      "name": "Infrastructure Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 38,
        "width": 266,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Application Host",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 0,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service health",
      "tileType": "SERVICES",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 304,
        "width": 342,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "SERVICE",
        "customName": "Service health",
        "defaultName": "Service health",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "SERVICE": {
            "AUTO_TAGS": [
              "$7:$3"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Service health",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 304,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Response Time SLI",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 0,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Failed Requests SLI",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 342,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database host health",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 646,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB response time",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 0,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB Failed requests",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 342,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database health",
      "tileType": "DATABASES_OVERVIEW",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 646,
        "width": 342,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "DATABASE",
        "customName": "Database health",
        "defaultName": "Database health",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "DATABASE": {
            "NAME": [
              "test"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "",
      "tileType": "APPLICATIONS",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 988,
        "width": 342,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "APPLICATION",
        "customName": "",
        "defaultName": "Monitored Web  applications",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "APPLICATION": {
            "APPLICATION_STATUS": [
              "0"
            ],
            "APPLICATION_TYPE": [
              "0"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Environment Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 0,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "",
      "tileType": "HOSTS",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 0,
        "width": 304,
        "height": 152
      },
      "tileFilter": {},
      "filterConfig": {
        "type": "HOST",
        "customName": "Hosts",
        "defaultName": "Hosts",
        "chartConfig": {
          "legendShown": true,
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "HOST": {
            "AUTO_TAGS": [
              "JenkinsInstance"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 0,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgd2lkdGg9IjUxMiIgZmlsbD0iIzQ1NDY0NiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTQyOC42MDggMjI4LjU2MmMxMC42NTkgMCAxOS4zOTItOC43MiAxOS4zOTItMTkuMzg3VjgzLjM5NUM0NDggNzIuNzE1IDQzOS4yNjcgNjQgNDI4LjYwOCA2NEgzMDIuODI1Yy0xMC42NjMgMC0xOS4zOTIgOC43MTYtMTkuMzkyIDE5LjM5NXYyNC45OTdoLTU0Ljg2NlY4My4zOTVjMC0xMC42OC04LjcyNS0xOS4zOTUtMTkuMzkyLTE5LjM5NUg4My4zOTJDNzIuNzMzIDY0IDY0IDcyLjcxNiA2NCA4My4zOTV2MTI1Ljc4YzAgMTAuNjY3IDguNzMzIDE5LjM4NyAxOS4zOTIgMTkuMzg3SDEwOC40djU0Ljg2Mkg4My4zOTJDNzIuNzMzIDI4My40MjQgNjQgMjkyLjE1IDY0IDMwMi44MjV2MTI1Ljc3MUM2NCA0MzkuMjc1IDcyLjczMyA0NDggODMuMzkyIDQ0OGgxMjUuNzgzYzEwLjY2NyAwIDE5LjM5Mi04LjcyNiAxOS4zOTItMTkuNDA0di0yNS4wMDRoNTQuODY2djI1LjAwNGMwIDEwLjY3OSA4LjczIDE5LjQwNCAxOS4zOTIgMTkuNDA0aDEyNS43ODNjMTAuNjU4IDAgMTkuMzkyLTguNzI2IDE5LjM5Mi0xOS40MDR2LTEyNS43N2MwLTEwLjY3Ni04LjczNC0xOS40MDItMTkuMzkyLTE5LjQwMkg0MDMuNnYtNTQuODYyaDI1LjAwOHptLTIzMy44MTIgMTE4LjA3bC03LjQ3NSAxMi45NWMtMjkuNjk2LTIxLjM3NC00OS4wNTgtNTYuMjEyLTQ5LjA1OC05NS41OTggMC02NS4wMjYgNTIuNzEyLTExNy43MzQgMTE3Ljc0LTExNy43MzQgMTMuMjk3IDAgMjYuMDY0IDIuMjMzIDM3Ljk4OSA2LjNsLTcuODU5IDEzLjA3NWExMDIuOTI4IDEwMi45MjggMCAwMC0zMC4xMy00LjQ5NmMtNTYuODA3IDAtMTAyLjg1MyA0Ni4wNTQtMTAyLjg1MyAxMDIuODU1IDAgMzMuODc0IDE2LjM3OSA2My45MTIgNDEuNjQ2IDgyLjY0OXpNMjUxLjIgMjIzLjc1bC0zMi45NyA1NC44NjZjLTEuNzYzLTQuNTQ1LTIuNzY4LTkuNDc0LTIuNzY4LTE0LjYzMiAwLTIwLjc2IDE1LjYxNy0zNy44NTEgMzUuNzM4LTQwLjIzNHptMTYuNjUgNzlsMjEuMzk2LTYxLjkzM2E0MC4zMSA0MC4zMSAwIDAxNy4yOTUgMjMuMTY3YzAgMTguMjY2LTEyLjA4NyAzMy42OTUtMjguNjkxIDM4Ljc2NnptLTE4LjI2MiAxOS42MzdsLTM1LjE0Ni0xNi40MDQgOTUuOTkyLTE1OS43MzMtNjAuODQ2IDE3Ni4xMzd6bTc1LjA5NiAzNy4xOTZsLTcuNDc2LTEyLjk1YzI1LjI2Ny0xOC43MzcgNDEuNjUtNDguNzc1IDQxLjY1LTgyLjY1IDAtMzYuNDg0LTE5LjAxMi02OC40OTUtNDcuNjQ2LTg2Ljc2M2w0Ljk4LTE0LjQyYzM0LjQ1NCAyMC41NDIgNTcuNTQxIDU4LjE1NCA1Ny41NDEgMTAxLjE4NCAwIDM5LjM4Ni0xOS4zNTggNzQuMjI0LTQ5LjA1IDk1LjU5OXoiPjwvcGF0aD48L3N2Zz4="
    },
    {
      "name": "Service Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 342,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 304,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgd2lkdGg9IjUxMiIgZmlsbD0iIzUyNmNmZiIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTQyNi4yNSAyNzYuNTI3Yy44MDEtNi43MzUgMS4yNjctMTMuNTcgMS4yNjctMjAuNTI3IDAtOS44NjYtLjg4NC0xOS41MjMtMi40ODItMjguOTM1bDIxLjA3NS0xNi43NWExOTQuNDE0IDE5NC40MTQgMCAwMC0yOC41LTY0LjM3N2wtMjYuOTc3IDMuODczYTE3Mi40ODYgMTcyLjQ4NiAwIDAwLTM1LjU2Ni0zMy43NzZsMy4wNzUtMjYuNzgzQzMzOC40NCA3Ny4xNiAzMTYuNDM1IDY4LjUgMjkyLjkzNyA2NGwtMTYuNDAyIDIxLjc1Yy02LjczNS0uODA2LTEzLjU4My0xLjI2Ny0yMC41MzUtMS4yNjctOS44NyAwLTE5LjUyMy44NzctMjguOTM1IDIuNDc4bC0xNi43NC0yMS4wODZhMTk0Ljg3NSAxOTQuODc1IDAgMDAtNjMuOTgzIDI4LjIyM2wzLjc4OCAyNy4wMTVhMTcyLjQwNyAxNzIuNDA3IDAgMDAtMzQuMTAzIDM1LjgzbC0yNi43ODItMy4wNjZBMTk0LjA0MyAxOTQuMDQzIDAgMDA2NCAyMTkuMDY3bDIxLjc1IDE2LjQxN2MtLjgwMiA2LjcyNy0xLjI2NyAxMy41NjgtMS4yNjcgMjAuNTE2IDAgOS43MTMuODQ3IDE5LjIyNyAyLjQgMjguNDkybC0yMS4xMiAxNi42NjljNS41MzUgMjMuNCAxNS4yMjQgNDUuMTg0IDI4LjMyNyA2NC41bDI3LjAyMy0zLjc4NGExNzIuNDQ4IDE3Mi40NDggMCAwMDM1LjgxMiAzNC4wOTJsLTMuMDY3IDI2Ljc4M2MxOS42OTQgMTIuMDkzIDQxLjcgMjAuNzQ4IDY1LjIwNSAyNS4yNDhsMTYuNDE3LTIxLjc0NmM2LjczNS44MDIgMTMuNTY3IDEuMjY3IDIwLjUyIDEuMjY3IDkuODYzIDAgMTkuNTIyLS44ODEgMjguOTM0LTIuNDgybDE2LjczMyAyMS4wODZhMTk0LjY4MyAxOTQuNjgzIDAgMDA2My45NzUtMjguMjE1bC0zLjc4LTI3LjAxOGExNzIuMzAyIDE3Mi4zMDIgMCAwMDM0LjA4OC0zNS44MDJsMjYuNzg5IDMuMDcxQTE5NC41NjQgMTk0LjU2NCAwIDAwNDQ4IDI5Mi45MzhsLTIxLjc1LTE2LjQxem0tMTA0LjM3OCAxOS44MzFsLTEwLjYyNy0xLjIxNmE2OC4wOCA2OC4wOCAwIDAxLTEzLjQzMiAxNC4xMDRsMS41IDEwLjcxOGE3Ni45MTQgNzYuOTE0IDAgMDEtMjUuMjc2IDExLjE0OWwtNi42NTMtOC4zODJjLTMuNzA0LjYyNy03LjQ5OSAxLjAzMi0xMS4zODQgMS4wMzItMi43NDUgMC01LjQzLS4yMTUtOC4wODQtLjUzbC02LjUxMSA4LjYyMmE3Ni43MjcgNzYuNzI3IDAgMDEtMjUuNzYzLTkuOTc4bDEuMjE2LTEwLjYyYTY4LjE4IDY4LjE4IDAgMDEtMTQuMTA4LTEzLjQzNGwtMTAuNzE3IDEuNWE3Ni45NzcgNzYuOTc3IDAgMDEtMTEuMTktMjUuNDg0bDguNC02LjYyNmMtLjYwOS0zLjY1Ny0xLjAwNS03LjM4NC0xLjAwNS0xMS4yMTMgMC0yLjczNy4yMDktNS40MjcuNTI1LTguMDgxbC04LjYxOC02LjUxYTc2LjgyNyA3Ni44MjcgMCAwMTkuOTc1LTI1Ljc1MWwxMC42MTkgMS4yMTVhNjguMTYyIDY4LjE2MiAwIDAxMTMuNDQtMTQuMTIzbC0xLjUtMTAuNzFhNzcuMDU4IDc3LjA1OCAwIDAxMjUuMjc2LTExLjE0OGw2LjY1MyA4LjM3N2MzLjcxMi0uNjI3IDcuNS0xLjAyNyAxMS4zOTItMS4wMjcgMi43MzggMCA1LjQzOC4yMDIgOC4wOTIuNTI1bDYuNDk1LTguNjE5YTc2LjgzOCA3Ni44MzggMCAwMTI1Ljc2MyA5Ljk4bC0xLjIxNSAxMC42MmE2OC4wOTEgNjguMDkxIDAgMDExNC4wMSAxMy4zMDhsMTAuNzAyLTEuNTM3YTc2LjgxIDc2LjgxIDAgMDExMS4yNTggMjUuNDMzbC04LjM3OSA2LjY1OWMuNjMyIDMuNzE2IDEuMDI5IDcuNSAxLjAyOSAxMS4zOSAwIDIuNzQ0LS4yMSA1LjQzMy0uNTI1IDguMDg0bDguNjE4IDYuNTFhNzYuODIgNzYuODIgMCAwMS05Ljk3NiAyNS43NjN6Ij48L3BhdGg+PC9zdmc+"
    },
    {
      "name": "Service Level Indicators",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 38,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 0,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTYiPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NiIgeT0iMjM2IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjIzNyIgeD0iMTE0MCI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIyMzciIHg9IjExNDAiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMjM3IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDAgLTIzNikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjNzNCRTI4IiBkPSJNMTE5MC4wMSAyNjcuMSAxMTkwLjAxIDI3MS4xQzExODkuMzEgMjcxLjEgMTE4OC43MSAyNzEgMTE4OC4wMSAyNzEgMTE4Ny4zNCAyNzAuOTgzIDExODYuNjcgMjcxLjAxNyAxMTg2LjAxIDI3MS4xTDExODYuMDEgMjY3LjFDMTE4Mi4yNCAyNjcuMjg1IDExNzguNTMgMjY4LjA2MSAxMTc1LjAxIDI2OS40TDExNzYuNTEgMjczQzExNzUuMjEgMjczLjUgMTE3NC4wMSAyNzQgMTE3Mi44MSAyNzQuNkwxMTcxLjMxIDI3MC45QzExNjkuNDUgMjcxLjgxIDExNjcuNjggMjcyLjg4MSAxMTY2LjAxIDI3NC4xTDExNjEuNzEgMjY5LjhDMTE2OS4yOCAyNjQuMDggMTE3OC41MSAyNjAuOTkgMTE4OC4wMSAyNjEgMTIxMi4zMSAyNjEgMTIzMi4wMSAyODAuNjk5IDEyMzIuMDEgMzA1TDEyMzIuMDEgMzA5IDEyMjYuMDEgMzA5IDEyMjYuMDEgMzA1QzEyMjUuOTkgMzAwLjk5MiAxMjI1LjM1IDI5Ny4wMSAxMjI0LjExIDI5My4yTDEyMjAuNDEgMjk0LjdDMTIyMC4wMSAyOTMuNCAxMjE5LjUxIDI5Mi4yIDEyMTkuMDEgMjkxTDEyMjIuNzEgMjg5LjVDMTIyMS4yIDI4Ni4xMTEgMTIxOS4xNyAyODIuOTc0IDEyMTYuNzEgMjgwLjJMMTIxMy45MSAyODNDMTIxMy4wMiAyODEuOTg1IDEyMTIuMDkgMjgxLjAxNyAxMjExLjExIDI4MC4xTDEyMTMuOTEgMjc3LjNDMTIxMS4xNiAyNzQuNzQ0IDEyMDguMDYgMjcyLjU4OSAxMjA0LjcxIDI3MC45TDEyMDMuMjEgMjc0LjZDMTIwMi4wMSAyNzQgMTIwMC44MSAyNzMuNSAxMTk5LjUxIDI3M0wxMjAxLjAxIDI2OS4zQzExOTcuNDggMjY3Ljk5NCAxMTkzLjc3IDI2Ny4yNTIgMTE5MC4wMSAyNjcuMVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iIzczQkUyOCIgZD0iTTExNTEuOTEgMjc5LjggMTE1Ni4yMSAyODQuMUMxMTU1LjEgMjg1Ljc4OSAxMTU0LjEzIDI4Ny41NjEgMTE1My4zMSAyODkuNEwxMTU3LjAxIDI5MUMxMTU2LjUxIDI5Mi4yIDExNTYuMDEgMjkzLjUgMTE1NS42MSAyOTQuN0wxMTUxLjkxIDI5My4yQzExNTAuNjYgMjk3LjAxIDExNTAuMDIgMzAwLjk5MiAxMTUwLjAxIDMwNUwxMTUwLjAxIDMwOSAxMTQ0LjAxIDMwOSAxMTQ0LjAxIDMwNUMxMTQzLjk5IDI5NS45ODcgMTE0Ni43NCAyODcuMTg4IDExNTEuOTEgMjc5LjhaIj48L3BhdGg+PHBhdGggZmlsbC1vcGFjaXR5PSIxIiBmaWxsLXJ1bGU9Im5vbnplcm8iIGZpbGw9IiM3M0JFMjgiIGQ9Ik0xMTkwLjgxIDMwMy4yQzExOTEuMDEgMzAzLjMgMTE5MS4xMSAzMDMuNSAxMTkxLjMxIDMwMy43IDExOTIuNzUgMzA1LjQwOCAxMTkyLjUzIDMwNy45NjEgMTE5MC44MiAzMDkuNDAxIDExODkuMTEgMzEwLjg0MiAxMTg2LjU2IDMxMC42MjUgMTE4NS4xMiAzMDguOTE3IDExODUuMTIgMzA4LjkxMSAxMTg1LjExIDMwOC45MDYgMTE4NS4xMSAzMDguOUwxMTU0LjAxIDI3MloiPjwvcGF0aD48L2c+PC9nPjwvZz48L2c+PC9zdmc+"
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 722,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1h"
      },
      "assignedEntities": [
        "$8"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=10;customTitle=Service Response Time SLO;"
    },
    {
      "name": "Service Level Objective",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 760,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 608,
        "left": 722,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTciPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NyIgeT0iMzEyIiB4PSIxMTQ0Ij48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjMxMyIgeD0iMTE0NSI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIzMTMiIHg9IjExNDUiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMzEzIiB4PSIxMTQ1Ij48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDQgLTMxMikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIyMy41IDMzMC41IDEyMjIuNSAzMjEuNSAxMjExLjUgMzMyLjUgMTIxMi4xIDMzNy43IDExOTYuMSAzNTMuN0MxMTk0LjcgMzUzIDExOTMuMSAzNTIuNSAxMTkxLjQgMzUyLjUgMTE4NS45IDM1Mi41IDExODEuNCAzNTcgMTE4MS40IDM2Mi41IDExODEuNCAzNjggMTE4NS45IDM3Mi41IDExOTEuNCAzNzIuNSAxMTk2LjkgMzcyLjUgMTIwMS40IDM2OCAxMjAxLjQgMzYyLjUgMTIwMS40IDM2MC44IDEyMDEgMzU5LjMgMTIwMC4zIDM1Ny45TDEyMTYuMyAzNDEuOSAxMjIxLjUgMzQyLjUgMTIzMi41IDMzMS41IDEyMjMuNSAzMzAuNVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iI0ZGNDU2MSIgZD0iTTEyMjQuMyAzNDUuMyAxMjIzIDM0Ni43IDEyMjEuMSAzNDYuNSAxMjE5IDM0Ni4yQzEyMjEuOCAzNTEgMTIyMy41IDM1Ni41IDEyMjMuNSAzNjIuNSAxMjIzLjUgMzgwLjEgMTIwOS4xIDM5NC41IDExOTEuNSAzOTQuNSAxMTczLjkgMzk0LjUgMTE1OS41IDM4MC4xIDExNTkuNSAzNjIuNSAxMTU5LjUgMzQ0LjkgMTE3My45IDMzMC41IDExOTEuNSAzMzAuNSAxMTk3LjQgMzMwLjUgMTIwMyAzMzIuMSAxMjA3LjggMzM1TDEyMDcuNiAzMzMgMTIwNy4zIDMzMSAxMjA4LjcgMzI5LjYgMTIwOS40IDMyOC45QzEyMDQgMzI2LjEgMTE5OCAzMjQuNSAxMTkxLjUgMzI0LjUgMTE3MC41IDMyNC41IDExNTMuNSAzNDEuNSAxMTUzLjUgMzYyLjUgMTE1My41IDM4My41IDExNzAuNSA0MDAuNSAxMTkxLjUgNDAwLjUgMTIxMi41IDQwMC41IDEyMjkuNSAzODMuNSAxMjI5LjUgMzYyLjUgMTIyOS41IDM1NiAxMjI3LjkgMzUwIDEyMjUgMzQ0LjdMMTIyNC4zIDM0NS4zWiI+PC9wYXRoPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIwOC4yIDM1NS43QzEyMDkuMSAzNTcuOCAxMjA5LjUgMzYwLjEgMTIwOS41IDM2Mi41IDEyMDkuNSAzNzIuNCAxMjAxLjQgMzgwLjUgMTE5MS41IDM4MC41IDExODEuNiAzODAuNSAxMTczLjUgMzcyLjQgMTE3My41IDM2Mi41IDExNzMuNSAzNTIuNiAxMTgxLjYgMzQ0LjUgMTE5MS41IDM0NC41IDExOTMuOSAzNDQuNSAxMTk2LjIgMzQ1IDExOTguMyAzNDUuOEwxMjAyLjggMzQxLjNDMTE5OS40IDMzOS41IDExOTUuNiAzMzguNSAxMTkxLjUgMzM4LjUgMTE3OC4zIDMzOC41IDExNjcuNSAzNDkuMyAxMTY3LjUgMzYyLjUgMTE2Ny41IDM3NS43IDExNzguMyAzODYuNSAxMTkxLjUgMzg2LjUgMTIwNC43IDM4Ni41IDEyMTUuNSAzNzUuNyAxMjE1LjUgMzYyLjUgMTIxNS41IDM1OC40IDEyMTQuNSAzNTQuNiAxMjEyLjcgMzUxLjJMMTIwOC4yIDM1NS43WiI+PC9wYXRoPjwvZz48L2c+PC9nPjwvZz48L3N2Zz4="
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 1064,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1d"
      },
      "assignedEntities": [
        "$9"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=1;customTitle=Service Failure SLO;"
    },
    {
      "name": "Response Time SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 722,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Failed Requests SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 1064,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 684,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 646,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgd2lkdGg9IjUxMiIgZmlsbD0iIzE0YThmNSIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTI1NS45OTQgNjRjLTkzLjAxMyAwLTE2OC40MTIgMjUuNjQtMTY4LjQxMiA1Ny4yNnYyNjkuNDhjMCAzMS42MzMgNzUuNCA1Ny4yNiAxNjguNDEyIDU3LjI2IDkzLjAzOCAwIDE2OC40MjQtMjUuNjI3IDE2OC40MjQtNTcuMjZWMTIxLjI2YzAtMzEuNjItNzUuMzg2LTU3LjI2LTE2OC40MjQtNTcuMjZ6bTAgMzAuMDM4YzY5LjYxMyAwIDEyNi4wMzQgMTIuNTA0IDEyNi4wMzQgMjcuOTE0IDAgMTUuNDItNTYuNDIxIDI3LjkyLTEyNi4wMzQgMjcuOTItNjkuNTkyIDAtMTI2LjAyMy0xMi41LTEyNi4wMjMtMjcuOTIgMC0xNS40MSA1Ni40MzEtMjcuOTE0IDEyNi4wMjMtMjcuOTE0em0xMjguODQgMjY5LjU2NmMwIDI0LjE5NS01Ny42NyAzOS45NzEtMTI4Ljg0IDM5Ljk3MS03MS4xNTggMC0xMjguODI3LTE1Ljc3Ni0xMjguODI3LTM5Ljk3VjE2NC4yODdjMjguNDgzIDEzLjc2MyA3NS41NjQgMjIuNzY2IDEyOC44MjcgMjIuNzY2IDUzLjI5OCAwIDEwMC4zNTYtOS4wMDMgMTI4Ljg0LTIyLjc2NnYxOTkuMzE2eiI+PC9wYXRoPjwvc3ZnPg=="
    },
    {
      "name": "Application Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 1026,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 988,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgd2lkdGg9IjUxMiIgZmlsbD0iI2E5NzJjYyIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTM1NS45ODMgODRIMTU1Ljk5Nkw3OS4yNTUgMjE2aDM2Ljk4bDU4LjE1NS0xMDAuMDNoMTYzLjIwMkw0MTkuMDE4IDI1NmwtODEuNDI2IDE0MC4wM0gxNzQuMzlMMTE2LjIzNCAyOTZsNTguNjMyLS4wNDYgMzAuMjU2LTUxLjg4NCA0NC4yOTggMTA4LjY1OSA0NS42MzMtNzcuNzE0IDEyLjYzMyAyMC40ODFoNjAuMjk0di0zMi4wNjhoLTQxLjk0NmwtMjYuNjU3LTU2LjM3MS00Mi43OCA3My4yMzEtNDYuMTEyLTEwOC4wODMtNTMuNjk2IDkxLjY4SDQ0djMyLjA3M2wzNS4yNTUuMDQyIDc2Ljc0MSAxMzJoMTk5Ljk4N0w0NTYgMjU2eiI+PC9wYXRoPjwvc3ZnPg=="
    },
    {
      "name": "Application Layer",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 988,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 912,
        "left": 722,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1h"
      },
      "assignedEntities": [
        "${10}"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=1;customTitle=Database Response Time SLO;"
    },
    {
      "name": "Database Service Level Objective",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 760,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 912,
        "left": 1064,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1d"
      },
      "assignedEntities": [
        "${11}"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=10;customTitle=Database Failure SLO;"
    },
    {
      "name": "DB Response Time SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 722,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB Failed Requests SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1064,
        "left": 1064,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 722,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTciPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NyIgeT0iMzEyIiB4PSIxMTQ0Ij48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjMxMyIgeD0iMTE0NSI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIzMTMiIHg9IjExNDUiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMzEzIiB4PSIxMTQ1Ij48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDQgLTMxMikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIyMy41IDMzMC41IDEyMjIuNSAzMjEuNSAxMjExLjUgMzMyLjUgMTIxMi4xIDMzNy43IDExOTYuMSAzNTMuN0MxMTk0LjcgMzUzIDExOTMuMSAzNTIuNSAxMTkxLjQgMzUyLjUgMTE4NS45IDM1Mi41IDExODEuNCAzNTcgMTE4MS40IDM2Mi41IDExODEuNCAzNjggMTE4NS45IDM3Mi41IDExOTEuNCAzNzIuNSAxMTk2LjkgMzcyLjUgMTIwMS40IDM2OCAxMjAxLjQgMzYyLjUgMTIwMS40IDM2MC44IDEyMDEgMzU5LjMgMTIwMC4zIDM1Ny45TDEyMTYuMyAzNDEuOSAxMjIxLjUgMzQyLjUgMTIzMi41IDMzMS41IDEyMjMuNSAzMzAuNVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iI0ZGNDU2MSIgZD0iTTEyMjQuMyAzNDUuMyAxMjIzIDM0Ni43IDEyMjEuMSAzNDYuNSAxMjE5IDM0Ni4yQzEyMjEuOCAzNTEgMTIyMy41IDM1Ni41IDEyMjMuNSAzNjIuNSAxMjIzLjUgMzgwLjEgMTIwOS4xIDM5NC41IDExOTEuNSAzOTQuNSAxMTczLjkgMzk0LjUgMTE1OS41IDM4MC4xIDExNTkuNSAzNjIuNSAxMTU5LjUgMzQ0LjkgMTE3My45IDMzMC41IDExOTEuNSAzMzAuNSAxMTk3LjQgMzMwLjUgMTIwMyAzMzIuMSAxMjA3LjggMzM1TDEyMDcuNiAzMzMgMTIwNy4zIDMzMSAxMjA4LjcgMzI5LjYgMTIwOS40IDMyOC45QzEyMDQgMzI2LjEgMTE5OCAzMjQuNSAxMTkxLjUgMzI0LjUgMTE3MC41IDMyNC41IDExNTMuNSAzNDEuNSAxMTUzLjUgMzYyLjUgMTE1My41IDM4My41IDExNzAuNSA0MDAuNSAxMTkxLjUgNDAwLjUgMTIxMi41IDQwMC41IDEyMjkuNSAzODMuNSAxMjI5LjUgMzYyLjUgMTIyOS41IDM1NiAxMjI3LjkgMzUwIDEyMjUgMzQ0LjdMMTIyNC4zIDM0NS4zWiI+PC9wYXRoPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIwOC4yIDM1NS43QzEyMDkuMSAzNTcuOCAxMjA5LjUgMzYwLjEgMTIwOS41IDM2Mi41IDEyMDkuNSAzNzIuNCAxMjAxLjQgMzgwLjUgMTE5MS41IDM4MC41IDExODEuNiAzODAuNSAxMTczLjUgMzcyLjQgMTE3My41IDM2Mi41IDExNzMuNSAzNTIuNiAxMTgxLjYgMzQ0LjUgMTE5MS41IDM0NC41IDExOTMuOSAzNDQuNSAxMTk2LjIgMzQ1IDExOTguMyAzNDUuOEwxMjAyLjggMzQxLjNDMTE5OS40IDMzOS41IDExOTUuNiAzMzguNSAxMTkxLjUgMzM4LjUgMTE3OC4zIDMzOC41IDExNjcuNSAzNDkuMyAxMTY3LjUgMzYyLjUgMTE2Ny41IDM3NS43IDExNzguMyAzODYuNSAxMTkxLjUgMzg2LjUgMTIwNC43IDM4Ni41IDEyMTUuNSAzNzUuNyAxMjE1LjUgMzYyLjUgMTIxNS41IDM1OC40IDEyMTQuNSAzNTQuNiAxMjEyLjcgMzUxLjJMMTIwOC4yIDM1NS43WiI+PC9wYXRoPjwvZz48L2c+PC9nPjwvZz48L3N2Zz4="
    },
    {
      "name": "Apdex Rating",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1368,
        "left": 0,
        "width": 304,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB Failed requests",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1368,
        "left": 342,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Database Service Level Indicators",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 38,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 874,
        "left": 0,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTYiPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NiIgeT0iMjM2IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjIzNyIgeD0iMTE0MCI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIyMzciIHg9IjExNDAiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMjM3IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDAgLTIzNikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjNzNCRTI4IiBkPSJNMTE5MC4wMSAyNjcuMSAxMTkwLjAxIDI3MS4xQzExODkuMzEgMjcxLjEgMTE4OC43MSAyNzEgMTE4OC4wMSAyNzEgMTE4Ny4zNCAyNzAuOTgzIDExODYuNjcgMjcxLjAxNyAxMTg2LjAxIDI3MS4xTDExODYuMDEgMjY3LjFDMTE4Mi4yNCAyNjcuMjg1IDExNzguNTMgMjY4LjA2MSAxMTc1LjAxIDI2OS40TDExNzYuNTEgMjczQzExNzUuMjEgMjczLjUgMTE3NC4wMSAyNzQgMTE3Mi44MSAyNzQuNkwxMTcxLjMxIDI3MC45QzExNjkuNDUgMjcxLjgxIDExNjcuNjggMjcyLjg4MSAxMTY2LjAxIDI3NC4xTDExNjEuNzEgMjY5LjhDMTE2OS4yOCAyNjQuMDggMTE3OC41MSAyNjAuOTkgMTE4OC4wMSAyNjEgMTIxMi4zMSAyNjEgMTIzMi4wMSAyODAuNjk5IDEyMzIuMDEgMzA1TDEyMzIuMDEgMzA5IDEyMjYuMDEgMzA5IDEyMjYuMDEgMzA1QzEyMjUuOTkgMzAwLjk5MiAxMjI1LjM1IDI5Ny4wMSAxMjI0LjExIDI5My4yTDEyMjAuNDEgMjk0LjdDMTIyMC4wMSAyOTMuNCAxMjE5LjUxIDI5Mi4yIDEyMTkuMDEgMjkxTDEyMjIuNzEgMjg5LjVDMTIyMS4yIDI4Ni4xMTEgMTIxOS4xNyAyODIuOTc0IDEyMTYuNzEgMjgwLjJMMTIxMy45MSAyODNDMTIxMy4wMiAyODEuOTg1IDEyMTIuMDkgMjgxLjAxNyAxMjExLjExIDI4MC4xTDEyMTMuOTEgMjc3LjNDMTIxMS4xNiAyNzQuNzQ0IDEyMDguMDYgMjcyLjU4OSAxMjA0LjcxIDI3MC45TDEyMDMuMjEgMjc0LjZDMTIwMi4wMSAyNzQgMTIwMC44MSAyNzMuNSAxMTk5LjUxIDI3M0wxMjAxLjAxIDI2OS4zQzExOTcuNDggMjY3Ljk5NCAxMTkzLjc3IDI2Ny4yNTIgMTE5MC4wMSAyNjcuMVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iIzczQkUyOCIgZD0iTTExNTEuOTEgMjc5LjggMTE1Ni4yMSAyODQuMUMxMTU1LjEgMjg1Ljc4OSAxMTU0LjEzIDI4Ny41NjEgMTE1My4zMSAyODkuNEwxMTU3LjAxIDI5MUMxMTU2LjUxIDI5Mi4yIDExNTYuMDEgMjkzLjUgMTE1NS42MSAyOTQuN0wxMTUxLjkxIDI5My4yQzExNTAuNjYgMjk3LjAxIDExNTAuMDIgMzAwLjk5MiAxMTUwLjAxIDMwNUwxMTUwLjAxIDMwOSAxMTQ0LjAxIDMwOSAxMTQ0LjAxIDMwNUMxMTQzLjk5IDI5NS45ODcgMTE0Ni43NCAyODcuMTg4IDExNTEuOTEgMjc5LjhaIj48L3BhdGg+PHBhdGggZmlsbC1vcGFjaXR5PSIxIiBmaWxsLXJ1bGU9Im5vbnplcm8iIGZpbGw9IiM3M0JFMjgiIGQ9Ik0xMTkwLjgxIDMwMy4yQzExOTEuMDEgMzAzLjMgMTE5MS4xMSAzMDMuNSAxMTkxLjMxIDMwMy43IDExOTIuNzUgMzA1LjQwOCAxMTkyLjUzIDMwNy45NjEgMTE5MC44MiAzMDkuNDAxIDExODkuMTEgMzEwLjg0MiAxMTg2LjU2IDMxMC42MjUgMTE4NS4xMiAzMDguOTE3IDExODUuMTIgMzA4LjkxMSAxMTg1LjExIDMwOC45MDYgMTE4NS4xMSAzMDguOUwxMTU0LjAxIDI3MloiPjwvcGF0aD48L2c+PC9nPjwvZz48L2c+PC9zdmc+"
    },
    {
      "name": "Application Service Level Indicators",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 38,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 0,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTYiPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NiIgeT0iMjM2IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjIzNyIgeD0iMTE0MCI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIyMzciIHg9IjExNDAiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMjM3IiB4PSIxMTQwIj48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDAgLTIzNikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjNzNCRTI4IiBkPSJNMTE5MC4wMSAyNjcuMSAxMTkwLjAxIDI3MS4xQzExODkuMzEgMjcxLjEgMTE4OC43MSAyNzEgMTE4OC4wMSAyNzEgMTE4Ny4zNCAyNzAuOTgzIDExODYuNjcgMjcxLjAxNyAxMTg2LjAxIDI3MS4xTDExODYuMDEgMjY3LjFDMTE4Mi4yNCAyNjcuMjg1IDExNzguNTMgMjY4LjA2MSAxMTc1LjAxIDI2OS40TDExNzYuNTEgMjczQzExNzUuMjEgMjczLjUgMTE3NC4wMSAyNzQgMTE3Mi44MSAyNzQuNkwxMTcxLjMxIDI3MC45QzExNjkuNDUgMjcxLjgxIDExNjcuNjggMjcyLjg4MSAxMTY2LjAxIDI3NC4xTDExNjEuNzEgMjY5LjhDMTE2OS4yOCAyNjQuMDggMTE3OC41MSAyNjAuOTkgMTE4OC4wMSAyNjEgMTIxMi4zMSAyNjEgMTIzMi4wMSAyODAuNjk5IDEyMzIuMDEgMzA1TDEyMzIuMDEgMzA5IDEyMjYuMDEgMzA5IDEyMjYuMDEgMzA1QzEyMjUuOTkgMzAwLjk5MiAxMjI1LjM1IDI5Ny4wMSAxMjI0LjExIDI5My4yTDEyMjAuNDEgMjk0LjdDMTIyMC4wMSAyOTMuNCAxMjE5LjUxIDI5Mi4yIDEyMTkuMDEgMjkxTDEyMjIuNzEgMjg5LjVDMTIyMS4yIDI4Ni4xMTEgMTIxOS4xNyAyODIuOTc0IDEyMTYuNzEgMjgwLjJMMTIxMy45MSAyODNDMTIxMy4wMiAyODEuOTg1IDEyMTIuMDkgMjgxLjAxNyAxMjExLjExIDI4MC4xTDEyMTMuOTEgMjc3LjNDMTIxMS4xNiAyNzQuNzQ0IDEyMDguMDYgMjcyLjU4OSAxMjA0LjcxIDI3MC45TDEyMDMuMjEgMjc0LjZDMTIwMi4wMSAyNzQgMTIwMC44MSAyNzMuNSAxMTk5LjUxIDI3M0wxMjAxLjAxIDI2OS4zQzExOTcuNDggMjY3Ljk5NCAxMTkzLjc3IDI2Ny4yNTIgMTE5MC4wMSAyNjcuMVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iIzczQkUyOCIgZD0iTTExNTEuOTEgMjc5LjggMTE1Ni4yMSAyODQuMUMxMTU1LjEgMjg1Ljc4OSAxMTU0LjEzIDI4Ny41NjEgMTE1My4zMSAyODkuNEwxMTU3LjAxIDI5MUMxMTU2LjUxIDI5Mi4yIDExNTYuMDEgMjkzLjUgMTE1NS42MSAyOTQuN0wxMTUxLjkxIDI5My4yQzExNTAuNjYgMjk3LjAxIDExNTAuMDIgMzAwLjk5MiAxMTUwLjAxIDMwNUwxMTUwLjAxIDMwOSAxMTQ0LjAxIDMwOSAxMTQ0LjAxIDMwNUMxMTQzLjk5IDI5NS45ODcgMTE0Ni43NCAyODcuMTg4IDExNTEuOTEgMjc5LjhaIj48L3BhdGg+PHBhdGggZmlsbC1vcGFjaXR5PSIxIiBmaWxsLXJ1bGU9Im5vbnplcm8iIGZpbGw9IiM3M0JFMjgiIGQ9Ik0xMTkwLjgxIDMwMy4yQzExOTEuMDEgMzAzLjMgMTE5MS4xMSAzMDMuNSAxMTkxLjMxIDMwMy43IDExOTIuNzUgMzA1LjQwOCAxMTkyLjUzIDMwNy45NjEgMTE5MC44MiAzMDkuNDAxIDExODkuMTEgMzEwLjg0MiAxMTg2LjU2IDMxMC42MjUgMTE4NS4xMiAzMDguOTE3IDExODUuMTIgMzA4LjkxMSAxMTg1LjExIDMwOC45MDYgMTE4NS4xMSAzMDguOUwxMTU0LjAxIDI3MloiPjwvcGF0aD48L2c+PC9nPjwvZz48L2c+PC9zdmc+"
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 722,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1d"
      },
      "assignedEntities": [
        "${12}"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=10;customTitle=Application Performance SLO;"
    },
    {
      "name": "Application Service Level Objective",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 760,
        "width": 646,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Service-level objective",
      "tileType": "SLO",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 1064,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-1d"
      },
      "assignedEntities": [
        "${13}"
      ],
      "metric": "METRICS=true;LEGEND=false;PROBLEMS=false;decimals=10;customTitle=Application Failure SLO;"
    },
    {
      "name": "DB Response Time SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1368,
        "left": 722,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "DB Failed Requests SLO",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 1368,
        "left": 1064,
        "width": 342,
        "height": 38
      },
      "tileFilter": {}
    },
    {
      "name": "Image",
      "tileType": "IMAGE",
      "configured": true,
      "bounds": {
        "top": 1178,
        "left": 722,
        "width": 38,
        "height": 38
      },
      "tileFilter": {},
      "image": "data:image/svg+xml;base64,PHN2ZyBvdmVyZmxvdz0iaGlkZGVuIiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9Ijk3IiB3aWR0aD0iOTciPjxkZWZzPjxjbGlwUGF0aCBpZD0iY2xpcDAiPjxyZWN0IGhlaWdodD0iOTciIHdpZHRoPSI5NyIgeT0iMzEyIiB4PSIxMTQ0Ij48L3JlY3Q+PC9jbGlwUGF0aD48Y2xpcFBhdGggaWQ9ImNsaXAxIj48cmVjdCBoZWlnaHQ9Ijk2IiB3aWR0aD0iOTYiIHk9IjMxMyIgeD0iMTE0NSI+PC9yZWN0PjwvY2xpcFBhdGg+PGNsaXBQYXRoIGlkPSJjbGlwMiI+PHJlY3QgaGVpZ2h0PSI5NiIgd2lkdGg9Ijk2IiB5PSIzMTMiIHg9IjExNDUiPjwvcmVjdD48L2NsaXBQYXRoPjxjbGlwUGF0aCBpZD0iY2xpcDMiPjxyZWN0IGhlaWdodD0iOTYiIHdpZHRoPSI5NiIgeT0iMzEzIiB4PSIxMTQ1Ij48L3JlY3Q+PC9jbGlwUGF0aD48L2RlZnM+PGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTExNDQgLTMxMikiIGNsaXAtcGF0aD0idXJsKCNjbGlwMCkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMSkiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMikiPjxnIGNsaXAtcGF0aD0idXJsKCNjbGlwMykiPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIyMy41IDMzMC41IDEyMjIuNSAzMjEuNSAxMjExLjUgMzMyLjUgMTIxMi4xIDMzNy43IDExOTYuMSAzNTMuN0MxMTk0LjcgMzUzIDExOTMuMSAzNTIuNSAxMTkxLjQgMzUyLjUgMTE4NS45IDM1Mi41IDExODEuNCAzNTcgMTE4MS40IDM2Mi41IDExODEuNCAzNjggMTE4NS45IDM3Mi41IDExOTEuNCAzNzIuNSAxMTk2LjkgMzcyLjUgMTIwMS40IDM2OCAxMjAxLjQgMzYyLjUgMTIwMS40IDM2MC44IDEyMDEgMzU5LjMgMTIwMC4zIDM1Ny45TDEyMTYuMyAzNDEuOSAxMjIxLjUgMzQyLjUgMTIzMi41IDMzMS41IDEyMjMuNSAzMzAuNVoiPjwvcGF0aD48cGF0aCBmaWxsLW9wYWNpdHk9IjEiIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0iI0ZGNDU2MSIgZD0iTTEyMjQuMyAzNDUuMyAxMjIzIDM0Ni43IDEyMjEuMSAzNDYuNSAxMjE5IDM0Ni4yQzEyMjEuOCAzNTEgMTIyMy41IDM1Ni41IDEyMjMuNSAzNjIuNSAxMjIzLjUgMzgwLjEgMTIwOS4xIDM5NC41IDExOTEuNSAzOTQuNSAxMTczLjkgMzk0LjUgMTE1OS41IDM4MC4xIDExNTkuNSAzNjIuNSAxMTU5LjUgMzQ0LjkgMTE3My45IDMzMC41IDExOTEuNSAzMzAuNSAxMTk3LjQgMzMwLjUgMTIwMyAzMzIuMSAxMjA3LjggMzM1TDEyMDcuNiAzMzMgMTIwNy4zIDMzMSAxMjA4LjcgMzI5LjYgMTIwOS40IDMyOC45QzEyMDQgMzI2LjEgMTE5OCAzMjQuNSAxMTkxLjUgMzI0LjUgMTE3MC41IDMyNC41IDExNTMuNSAzNDEuNSAxMTUzLjUgMzYyLjUgMTE1My41IDM4My41IDExNzAuNSA0MDAuNSAxMTkxLjUgNDAwLjUgMTIxMi41IDQwMC41IDEyMjkuNSAzODMuNSAxMjI5LjUgMzYyLjUgMTIyOS41IDM1NiAxMjI3LjkgMzUwIDEyMjUgMzQ0LjdMMTIyNC4zIDM0NS4zWiI+PC9wYXRoPjxwYXRoIGZpbGwtb3BhY2l0eT0iMSIgZmlsbC1ydWxlPSJub256ZXJvIiBmaWxsPSIjRkY0NTYxIiBkPSJNMTIwOC4yIDM1NS43QzEyMDkuMSAzNTcuOCAxMjA5LjUgMzYwLjEgMTIwOS41IDM2Mi41IDEyMDkuNSAzNzIuNCAxMjAxLjQgMzgwLjUgMTE5MS41IDM4MC41IDExODEuNiAzODAuNSAxMTczLjUgMzcyLjQgMTE3My41IDM2Mi41IDExNzMuNSAzNTIuNiAxMTgxLjYgMzQ0LjUgMTE5MS41IDM0NC41IDExOTMuOSAzNDQuNSAxMTk2LjIgMzQ1IDExOTguMyAzNDUuOEwxMjAyLjggMzQxLjNDMTE5OS40IDMzOS41IDExOTUuNiAzMzguNSAxMTkxLjUgMzM4LjUgMTE3OC4zIDMzOC41IDExNjcuNSAzNDkuMyAxMTY3LjUgMzYyLjUgMTE2Ny41IDM3NS43IDExNzguMyAzODYuNSAxMTkxLjUgMzg2LjUgMTIwNC43IDM4Ni41IDEyMTUuNSAzNzUuNyAxMjE1LjUgMzYyLjUgMTIxNS41IDM1OC40IDEyMTQuNSAzNTQuNiAxMjEyLjcgMzUxLjJMMTIwOC4yIDM1NS43WiI+PC9wYXRoPjwvZz48L2c+PC9nPjwvZz48L3N2Zz4="
    },
    {
      "name": "Backend-service response time",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 0,
        "width": 342,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.response.time",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "TAG",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "$7:$3",
                    "evaluator": "IN"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "MilliSecond",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE",
              "alias": "SLI - Response Time"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "displayName": "",
            "visible": true
          },
          "yAxes": [
            {
              "displayName": "",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "A"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 0,
                "color": "#7dc540"
              },
              {
                "value": 4,
                "color": "#f5d30f"
              },
              {
                "value": 5,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:service.response.time:filter(and(or(in(\"dt.entity.service\",entitySelector(\"type(service),tag(~\"$7:$3~\")\"))))):splitBy():avg:auto:sort(value(avg,descending)):limit(100)):limit(100):names"
      ]
    },
    {
      "name": "Database response time",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 912,
        "left": 0,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-2h"
      },
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.response.time",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "NAME",
                "filterOperator": "OR",
                "entityAttribute": "entityName",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "test",
                    "evaluator": "IN",
                    "matchExactly": false
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "MilliSecond",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "displayName": "",
            "visible": true
          },
          "yAxes": [
            {
              "displayName": "",
              "visible": true,
              "min": "AUTO",
              "max": "AUTO",
              "position": "LEFT",
              "queryIds": [
                "A"
              ],
              "defaultAxis": true
            }
          ]
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 0,
                "color": "#7dc540"
              },
              {
                "value": 48,
                "color": "#f5d30f"
              },
              {
                "value": 100,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:service.response.time:filter(and(or(in(\"dt.entity.service\",entitySelector(\"type(service),entityName(~\"test~\")\"))))):splitBy():avg:auto:sort(value(avg,descending)):limit(100)):limit(100):names"
      ]
    },
    {
      "name": "Database failed requests",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 912,
        "left": 342,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-2h"
      },
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.errors.total.rate",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "NAME",
                "filterOperator": "OR",
                "entityAttribute": "entityName",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "test",
                    "evaluator": "IN",
                    "matchExactly": false
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "properties": {
              "color": "DEFAULT"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 3,
                "color": "#7dc540"
              },
              {
                "value": 1,
                "color": "#f5d30f"
              },
              {
                "value": 4,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:service.errors.total.rate:filter(and(or(in(\"dt.entity.service\",entitySelector(\"type(service),entityName(~\"test~\")\"))))):splitBy():avg:auto:sort(value(avg,descending)):limit(100)):limit(100):names"
      ]
    },
    {
      "name": "Apdex",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 0,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-7d to now"
      },
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:apps.web.apdex.userType",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.application"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "nestedFilters": [],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "TURQUOISE",
              "seriesType": "LINE"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 0.8,
                "color": "#7dc540"
              },
              {
                "value": 0.5,
                "color": "#f5d30f"
              },
              {
                "value": 0,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": true
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": ""
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:apps.web.apdex.userType:splitBy():sort(value(auto,descending)):limit(100)):limit(100):names"
      ]
    },
    {
      "name": "Errors",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 1216,
        "left": 342,
        "width": 342,
        "height": 152
      },
      "tileFilter": {
        "timeframe": "-7d to now"
      },
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:apps.web.countOfErrors",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.application"
          ],
          "filterBy": {
            "nestedFilters": [],
            "criteria": []
          },
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": true
        },
        "rules": [
          {
            "matcher": "A:",
            "unitTransform": "auto",
            "valueFormat": "auto",
            "properties": {
              "color": "DEFAULT",
              "seriesType": "LINE",
              "alias": "JS errors"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": true,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 0,
                "color": "#7dc540"
              },
              {
                "value": 3,
                "color": "#f5d30f"
              },
              {
                "value": 5,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:apps.web.countOfErrors:splitBy():sort(value(auto,descending)):limit(20)):limit(100):names",
        "resolution=null&(builtin:apps.web.countOfErrors:splitBy():sort(value(auto,descending)):limit(20))"
      ]
    },
    {
      "name": "Backend-service failed requests",
      "tileType": "DATA_EXPLORER",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 342,
        "width": 342,
        "height": 152
      },
      "tileFilter": {},
      "customName": "Data explorer results",
      "queries": [
        {
          "id": "A",
          "metric": "builtin:service.errors.total.rate",
          "spaceAggregation": "AVG",
          "timeAggregation": "DEFAULT",
          "splitBy": [
            "dt.entity.service"
          ],
          "sortBy": "DESC",
          "filterBy": {
            "filterOperator": "AND",
            "nestedFilters": [
              {
                "filter": "dt.entity.service",
                "filterType": "TAG",
                "filterOperator": "OR",
                "nestedFilters": [],
                "criteria": [
                  {
                    "value": "$7:$3",
                    "evaluator": "IN"
                  }
                ]
              }
            ],
            "criteria": []
          },
          "limit": 100,
          "enabled": true
        }
      ],
      "visualConfig": {
        "type": "SINGLE_VALUE",
        "global": {
          "hideLegend": false
        },
        "rules": [
          {
            "matcher": "A:",
            "properties": {
              "color": "DEFAULT"
            },
            "seriesOverrides": []
          }
        ],
        "axes": {
          "xAxis": {
            "visible": true
          },
          "yAxes": []
        },
        "heatmapSettings": {
          "yAxis": "VALUE"
        },
        "singleValueSettings": {
          "showTrend": false,
          "showSparkLine": false,
          "linkTileColorToThreshold": true
        },
        "thresholds": [
          {
            "axisTarget": "LEFT",
            "rules": [
              {
                "value": 3,
                "color": "#7dc540"
              },
              {
                "value": 4,
                "color": "#f5d30f"
              },
              {
                "value": 5,
                "color": "#dc172a"
              }
            ],
            "queryId": "",
            "visible": true
          }
        ],
        "tableSettings": {
          "isThresholdBackgroundAppliedToCell": false
        },
        "graphChartSettings": {
          "connectNulls": false
        },
        "honeycombSettings": {
          "showHive": true,
          "showLegend": true,
          "showLabels": false
        }
      },
      "queriesSettings": {
        "resolution": "1m"
      },
      "metricExpressions": [
        "resolution=Inf&(builtin:service.errors.total.rate:filter(and(or(in(\"dt.entity.service\",entitySelector(\"type(service),tag(~\"$7:$3~\")\"))))):splitBy():avg:auto:sort(value(avg,descending)):limit(100)):limit(100):names"
      ]
    }
  ]
}
EOF
)
echo $PAYLOAD
curl -H "Content-Type: application/json" -H "Authorization: Api-Token $2" -X POST -d "${PAYLOAD}" $1/api/config/v1/dashboards
