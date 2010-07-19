From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] USB: s3c-hsotg: add support for clock gating
Date: Mon, 19 Jul 2010 16:01:42 +0200
Message-ID: <1279548102-32390-4-git-send-email-m.szyprowski@samsung.com>
References: <1279548102-32390-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1279548102-32390-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support for clock gating of the HS/OTG block. On S5PV210
otg gating clock is initally disabled so the driver needs to get and
enable it before it can access its registers.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/gadget/s3c-hsotg.c |   20 +++++++++++++++++---
 1 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
index 258ca01..521ebed 100644
--- a/drivers/usb/gadget/s3c-hsotg.c
+++ b/drivers/usb/gadget/s3c-hsotg.c
@@ -152,6 +152,7 @@ struct s3c_hsotg {
 	void __iomem		*regs;
 	struct resource		*regs_res;
 	int			irq;
+	struct clk		*clk;
 
 	unsigned int		dedicated_fifos:1;
 
@@ -3258,13 +3259,20 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 	hsotg->dev = dev;
 	hsotg->plat = plat;
 
+	hsotg->clk = clk_get(&pdev->dev, "otg");
+	if (IS_ERR(hsotg->clk)) {
+		dev_err(dev, "cannot get otg clock\n");
+		ret = -EINVAL;
+		goto err_mem;
+	}
+
 	platform_set_drvdata(pdev, hsotg);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "cannot find register resource 0\n");
 		ret = -EINVAL;
-		goto err_mem;
+		goto err_clk;
 	}
 
 	hsotg->regs_res = request_mem_region(res->start, resource_size(res),
@@ -3272,7 +3280,7 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 	if (!hsotg->regs_res) {
 		dev_err(dev, "cannot reserve registers\n");
 		ret = -ENOENT;
-		goto err_mem;
+		goto err_clk;
 	}
 
 	hsotg->regs = ioremap(res->start, resource_size(res));
@@ -3325,6 +3333,8 @@ static int __devinit s3c_hsotg_probe(struct platform_device *pdev)
 
 	/* reset the system */
 
+	clk_enable(hsotg->clk);
+
 	s3c_hsotg_gate(pdev, true);
 
 	s3c_hsotg_otgreset(hsotg);
@@ -3348,7 +3358,8 @@ err_regs:
 err_regs_res:
 	release_resource(hsotg->regs_res);
 	kfree(hsotg->regs_res);
