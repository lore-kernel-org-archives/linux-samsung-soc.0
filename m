From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFT v3 05/14] regulator: max77802: Don't ignore return value of
 current opmode
Date: Thu, 30 Oct 2014 12:20:44 +0100
Message-ID: <1414668053-31370-6-git-send-email-k.kozlowski@samsung.com>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The return value of regmap_read() of current opmode for regulator was
silently ignored and whatever happened to be in 'val' variable was used
as new opmode. This could lead to using bogus opmode.

Don't ignore what regmap_read() returns. If it fails just fall back to
normal opmode.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/max77802.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/max77802.c b/drivers/regulator/max77802.c
index b9958d927297..60daca2028e9 100644
--- a/drivers/regulator/max77802.c
+++ b/drivers/regulator/max77802.c
@@ -606,7 +606,13 @@ static int max77802_pmic_probe(struct platform_device *pdev)
 		config.of_node = pdata->regulators[i].of_node;
 
 		ret = regmap_read(iodev->regmap, regulators[i].enable_reg, &val);
-		val = val >> shift & MAX77802_OPMODE_MASK;
+		if (ret < 0) {
+			dev_warn(&pdev->dev,
+				"cannot read current mode for %d\n", i);
+			val = MAX77802_OPMODE_NORMAL;
+		} else {
+			val = val >> shift & MAX77802_OPMODE_MASK;
+		}
 
 		/*
 		 * If the regulator is disabled and the system warm rebooted,
-- 
1.9.1
