From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] usb: ehci-s5p: use clk_prepare_enable and clk_disable_unprepare
Date: Wed,  3 Oct 2012 08:40:42 +0900
Message-ID: <1349221242-2771-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
calls as required by common clock framework.

Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/usb/host/ehci-s5p.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
index 85b74be..abc178d 100644
--- a/drivers/usb/host/ehci-s5p.c
+++ b/drivers/usb/host/ehci-s5p.c
@@ -136,7 +136,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 		goto fail_clk;
 	}
 
-	err = clk_enable(s5p_ehci->clk);
+	err = clk_prepare_enable(s5p_ehci->clk);
 	if (err)
 		goto fail_clk;
 
@@ -183,7 +183,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
 	return 0;
 
 fail_io:
-	clk_disable(s5p_ehci->clk);
+	clk_disable_unprepare(s5p_ehci->clk);
 fail_clk:
 	usb_put_hcd(hcd);
 	return err;
@@ -200,7 +200,7 @@ static int __devexit s5p_ehci_remove(struct platform_device *pdev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
 
-	clk_disable(s5p_ehci->clk);
+	clk_disable_unprepare(s5p_ehci->clk);
 
 	usb_put_hcd(hcd);
 
@@ -231,7 +231,7 @@ static int s5p_ehci_suspend(struct device *dev)
 	if (pdata && pdata->phy_exit)
 		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
 
-	clk_disable(s5p_ehci->clk);
+	clk_disable_unprepare(s5p_ehci->clk);
 
 	return rc;
 }
@@ -243,7 +243,7 @@ static int s5p_ehci_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
 
-	clk_enable(s5p_ehci->clk);
+	clk_prepare_enable(s5p_ehci->clk);
 
 	if (pdata && pdata->phy_init)
 		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
