From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 02/10] rtc: max77686: Use ARRAY_SIZE() instead of current array length
Date: Thu, 21 Jan 2016 17:23:25 -0300
Message-ID: <1453407813-14646-3-git-send-email-javier@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

It is better to use the ARRAY_SIZE() macro instead of the array length
to avoid bugs if the array is later changed and the length not updated.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes in v2:
- Add Krzysztof Kozlowski's Reviewed-by tag to patch #2.

 drivers/rtc/rtc-max77686.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6653c3d11b66..98fabdb308b9 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -406,7 +406,8 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 
 	info->rtc_24hr_mode = 1;
 
-	ret = regmap_bulk_write(info->max77686->rtc_regmap, MAX77686_RTC_CONTROLM, data, 2);
+	ret = regmap_bulk_write(info->max77686->rtc_regmap,
+				MAX77686_RTC_CONTROLM, data, ARRAY_SIZE(data));
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write controlm reg(%d)\n",
 				__func__, ret);
-- 
2.5.0
