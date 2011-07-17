From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/2] mmc: sdhci-s3c: add device tree probe support
Date: Sun, 17 Jul 2011 10:21:15 +0530
Message-ID: <1310878275-1422-3-git-send-email-thomas.abraham@linaro.org>
References: <1310878275-1422-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1310878275-1422-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-mmc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree probe support for sdhci-s3c driver. Few of the platform
data elements are parsed from the device tree node and their values are
copied into the platform data stored in the private data of the driver.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mmc/samsung-sdhci.txt      |   39 ++++++++++++++++++++
 drivers/mmc/host/sdhci-s3c.c                       |   37 +++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/samsung-sdhci.txt

diff --git a/Documentation/devicetree/bindings/mmc/samsung-sdhci.txt b/Documentation/devicetree/bindings/mmc/samsung-sdhci.txt
new file mode 100644
index 0000000..19e10a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/samsung-sdhci.txt
@@ -0,0 +1,39 @@
+* Samsung's SDHCI controller
+
+The Samsung's SDHCI controller is used for interfacing with SD/MMC cards.
+
+Required properties:
+  - compatible : should be "samsung,s3c6410-sdhci"
+
+  - reg : physical base address of the controller and length of memory mapped
+    region.
+
+  - interrupts : interrupt number to the cpu.
+
+  - samsung,sdhci-cd-type: specifies the card detection method to be used.
+    The possible values for this property are
+      (a) 0, internal card detection (sdhci cd pad connected to card slot)
+      (b) 1, external card detection (using a external callback)
+      (c) 2, using a external gpio as card detect line.
+      (d) 3, card detection is not available or broken.
+      (e) 4, for cards that are permanently wired to host.
+
+Optional properties
+  - samsung,sdhci-bus-width: specifies the maximum width of the mmc bus. The
+    value of this property could be 1, 4 or 8. If this property is not
+    specified, the default bus width is selected as 1.
+
+  - samsung,sdhci-clkdiv-external: specifies that the sdhci controller does
+    not include a internal divider to divide the input clock. This property
+    should be used for exynos4 based platforms.
+
+Example:
+
+	sdhci@12530000 {
+		compatible = "samsung,s3c6410-sdhci";
+		reg = <0x12530000 0x1000>;
+		interrupts = <362>;
+		samsung,sdhci-bus-width = <4>;
+		samsung,sdhci-cd-type = <0>;
+		samsung,sdhci-clkdiv-external;
+	};
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index bb159cc..efa37d0 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -19,6 +19,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/of.h>
 
 #include <linux/mmc/host.h>
 
@@ -373,6 +374,28 @@ static void sdhci_s3c_setup_card_detect_gpio(struct sdhci_s3c *sc)
 	}
 }
 
+#ifdef CONFIG_OF
+static void sdhci_s3c_parse_dt(struct device_node *node,
+				struct s3c_sdhci_platdata *pdata)
+{
+	/* if the bus-width property is not specified, assume width as 1 */
+	if (of_property_read_u32(node, "samsung,sdhci-bus-width",
+			&pdata->max_width))
+		pdata->max_width = 1;
+
+	of_property_read_u32(node, "samsung,sdhci-cd-type", &pdata->cd_type);
+	pdata->clk_type =
+		(of_get_property(node, "samsung,sdhci-clkdiv-external", NULL)) ?
+			S3C_SDHCI_CLK_DIV_EXTERNAL : S3C_SDHCI_CLK_DIV_INTERNAL;
+}
+#else
+static void sdhci_s3c_parse_dt(struct device_node *node,
+				struct s3c_sdhci_platdata *pdata)
+{
+	return;
+}
+#endif
+
 static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 {
 	struct s3c_sdhci_platdata *pdata;
@@ -474,6 +497,9 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
 		goto err_req_regs;
 	}
 
+	if (pdev->dev.of_node)
+		sdhci_s3c_parse_dt(pdev->dev.of_node, pdata);
+
 	/* Ensure we have minimal gpio selected CMD/CLK/Detect */
 	if (pdata->cfg_gpio)
 		pdata->cfg_gpio(pdev, pdata->max_width);
@@ -628,6 +654,16 @@ static int sdhci_s3c_resume(struct platform_device *dev)
 #define sdhci_s3c_resume NULL
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id s3c_sdhci_match[] = {
+	{ .compatible = "samsung,s3c6410-sdhci", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, s3c_sdhci_match);
+#else
+#define s3c_sdhci_match NULL
+#endif
+
 static struct platform_driver sdhci_s3c_driver = {
 	.probe		= sdhci_s3c_probe,
 	.remove		= __devexit_p(sdhci_s3c_remove),
@@ -636,6 +672,7 @@ static struct platform_driver sdhci_s3c_driver = {
 	.driver		= {
 		.owner	= THIS_MODULE,
 		.name	= "s3c-sdhci",
+		.of_match_table	= s3c_sdhci_match,
 	},
 };
 
-- 
1.7.1
