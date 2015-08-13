From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] rtc: s5m: fix to update ctrl register
Date: Thu, 13 Aug 2015 17:49:24 +0900
Message-ID: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, sbkim73@samsung.com, k.kozlowski@samsung.com, jy0922.shim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

According to datasheet, the S2MPS13X and S2MPS14X should update write
buffer via setting WUDR bit to high after ctrl register is updated.

If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
tools/testing/selftests/timers/rtctest.c test program and hour format is
used to 12 hour mode in Odroid-XU3 board.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: <stable@vger.kernel.org>
---
 drivers/rtc/rtc-s5m.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 8c70d78..03828bb 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -635,6 +635,18 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	case S2MPS13X:
 		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
 		ret = regmap_write(info->regmap, info->regs->ctrl, data[0]);
+		if (ret < 0)
+			break;
+
+		ret = regmap_update_bits(info->regmap,
+				info->regs->rtc_udr_update,
+				info->regs->rtc_udr_mask,
+				info->regs->rtc_udr_mask);
+		if (ret < 0)
+			break;
+
+		ret = s5m8767_wait_for_udr_update(info);
+
 		break;
 
 	default:
-- 
1.9.1
