From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 01/14] mfd: max77686/802: Map regulator driver to its own
 of_node
Date: Thu, 30 Oct 2014 12:20:40 +0100
Message-ID: <1414668053-31370-2-git-send-email-k.kozlowski@samsung.com>
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

Add of_compatible fields for max77686 and max77802 regulator drivers.
The driver's node should be the same as voltage-regulators node. This
simplifies parsing of regulators init data from DTS.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/max77686.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 929795eae9fc..9e1046bdef90 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -38,13 +38,19 @@
 #define I2C_ADDR_RTC	(0x0C >> 1)
 
 static const struct mfd_cell max77686_devs[] = {
-	{ .name = "max77686-pmic", },
+	{
+		.name = "max77686-pmic",
+		.of_compatible = "maxim,max77686-pmic",
+	},
 	{ .name = "max77686-rtc", },
 	{ .name = "max77686-clk", },
 };
 
 static const struct mfd_cell max77802_devs[] = {
-	{ .name = "max77802-pmic", },
+	{
+		.name = "max77802-pmic",
+		.of_compatible = "maxim,max77802-pmic",
+	},
 	{ .name = "max77802-clk", },
 	{ .name = "max77802-rtc", },
 };
-- 
1.9.1
