From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] rtc: s5m: De-inline large functions to save space
Date: Tue, 16 Feb 2016 11:04:42 +0900
Message-ID: <1455588282-7251-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: Denys Vlasenko <vda.linux@googlemail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Few functions were marked inline even though they were relatively large
and sometimes used in multiple places. De-inline them to let the
compiler decide whether optimization makes sense. This fixes inline_hunt
report:
drivers/rtc/rtc-s5m.c: Deinline s5m8767_rtc_set_alarm_reg, save 704 bytes
drivers/rtc/rtc-s5m.c: Deinline s5m8767_wait_for_udr_update, save 192 bytes

Reported-by: Denys Vlasenko <vda.linux@googlemail.com>
Cc: Denys Vlasenko <vda.linux@googlemail.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/rtc/rtc-s5m.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 7407d7394bb4..0477678d968f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -216,7 +216,7 @@ static int s5m8767_tm_to_data(struct rtc_time *tm, u8 *data)
  * Read RTC_UDR_CON register and wait till UDR field is cleared.
  * This indicates that time/alarm update ended.
  */
-static inline int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
+static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 {
 	int ret, retry = UDR_READ_RETRY_CNT;
 	unsigned int data;
@@ -231,7 +231,7 @@ static inline int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static inline int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
+static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 		struct rtc_wkalrm *alarm)
 {
 	int ret;
@@ -264,7 +264,7 @@ static inline int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 	return 0;
 }
 
-static inline int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
+static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
 	unsigned int data;
@@ -288,7 +288,7 @@ static inline int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static inline int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
+static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
 	unsigned int data;
-- 
2.5.0
