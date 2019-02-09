From: Wen Yang <yellowriver2010@hotmail.com>
Subject: [PATCH 3/4] media: s5p-cec: fix possible object reference leak
Date: Sat, 9 Feb 2019 02:54:18 +0000
Message-ID: <HK0PR02MB36340E1F3B235BEB13AAE491B26A0@HK0PR02MB3634.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Wen Yang <yellowriver2010@hotmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

The call to of_parse_phandle() returns a node pointer with refcount
incremented thus it must be explicitly decremented here after the last
usage.
The of_find_device_by_node() takes a reference to the underlying device
structure, we also should release that reference.
This patch fixes those two issues.

Fixes: a93d429b51fb ("[media] s5p-cec: add cec-notifier support, move out of staging")
Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
---
 drivers/media/platform/s5p-cec/s5p_cec.c | 38 ++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
index 8837e26..4af47ce 100644
--- a/drivers/media/platform/s5p-cec/s5p_cec.c
+++ b/drivers/media/platform/s5p-cec/s5p_cec.c
@@ -192,47 +192,64 @@ static int s5p_cec_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	hdmi_dev = of_find_device_by_node(np);
-	if (hdmi_dev == NULL)
+	if (hdmi_dev == NULL) {
+		of_node_put(np);
 		return -EPROBE_DEFER;
+	}
 
+	of_node_put(np);
 	cec = devm_kzalloc(&pdev->dev, sizeof(*cec), GFP_KERNEL);
-	if (!cec)
+	if (!cec) {
+		put_device(&hdmi_dev->dev);
 		return -ENOMEM;
+	}
 
 	cec->dev = dev;
 
 	cec->irq = platform_get_irq(pdev, 0);
-	if (cec->irq < 0)
+	if (cec->irq < 0) {
+		put_device(&hdmi_dev->dev);
 		return cec->irq;
+	}
 
 	ret = devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_handler,
 		s5p_cec_irq_handler_thread, 0, pdev->name, cec);
-	if (ret)
+	if (ret) {
+		put_device(&hdmi_dev->dev);
 		return ret;
+	}
 
 	cec->clk = devm_clk_get(dev, "hdmicec");
-	if (IS_ERR(cec->clk))
+	if (IS_ERR(cec->clk)) {
+		put_device(&hdmi_dev->dev);
 		return PTR_ERR(cec->clk);
+	}
 
 	cec->pmu = syscon_regmap_lookup_by_phandle(dev->of_node,
 						 "samsung,syscon-phandle");
-	if (IS_ERR(cec->pmu))
+	if (IS_ERR(cec->pmu)) {
+		put_device(&hdmi_dev->dev);
 		return -EPROBE_DEFER;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	cec->reg = devm_ioremap_resource(dev, res);
-	if (IS_ERR(cec->reg))
+	if (IS_ERR(cec->reg)) {
+		put_device(&hdmi_dev->dev);
 		return PTR_ERR(cec->reg);
+	}
 
 	cec->notifier = cec_notifier_get(&hdmi_dev->dev);
-	if (cec->notifier == NULL)
+	if (cec->notifier == NULL) {
+		put_device(&hdmi_dev->dev);
 		return -ENOMEM;
+	}
 
 	cec->adap = cec_allocate_adapter(&s5p_cec_adap_ops, cec, CEC_NAME,
 		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1);
 	ret = PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
-		return ret;
+		goto err_put_notifier;
 
 	ret = cec_register_adapter(cec->adap, &pdev->dev);
 	if (ret)
@@ -248,6 +265,9 @@ static int s5p_cec_probe(struct platform_device *pdev)
 
 err_delete_adapter:
 	cec_delete_adapter(cec->adap);
+err_put_notifier:
+	cec_notifier_put(cec->notifier);
+	dev_err(&pdev->dev, "CEC controller registration failed\n");
 	return ret;
 }
 
-- 
2.7.4
