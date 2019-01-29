From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] mfd: sec-core: Return gracefully instead of BUG() if device cannot match
Date: Tue, 29 Jan 2019 12:25:53 +0100
Message-ID: <1548761153-28114-2-git-send-email-krzk@kernel.org>
References: <1548761153-28114-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548761153-28114-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Replace impossible BUG() in probe with a proper return.  This can be
triggered only in case of a clear bug (e.g. adding broken half-support
for new S2MPSXX flavor) but BUG() is discouraged and the boot process
can actually try to continue.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/sec-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index c3bb53f79e63..2c2f48b24eeb 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -474,8 +474,9 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		num_sec_devs = ARRAY_SIZE(s2mpu02_devs);
 		break;
 	default:
-		/* If this happens the probe function is problem */
-		BUG();
+		dev_err(&i2c->dev, "Unsupported device type (%lu)\n",
+			sec_pmic->device_type);
+		return -ENODEV;
 	}
 	ret = devm_mfd_add_devices(sec_pmic->dev, -1, sec_devs, num_sec_devs,
 				   NULL, 0, NULL);
-- 
2.7.4
