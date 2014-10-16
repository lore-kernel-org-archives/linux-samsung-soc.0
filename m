From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 4/9] usb: dwc2/gadget: disable phy before turning off power
 regulators
Date: Thu, 16 Oct 2014 14:58:00 +0200
Message-ID: <1413464285-24172-5-git-send-email-m.szyprowski@samsung.com>
References: <1413464285-24172-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1413464285-24172-1-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch fixes probe function to match the pattern used elsewhere in
the driver, where power regulators are turned off as the last element in
the device shutdown procedure.

Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/dwc2/gadget.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 37fda4c03397..178a6ea5eef8 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3573,6 +3573,7 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		s3c_hsotg_initep(hsotg, &hsotg->eps[epnum], epnum);
 
 	/* disable power and clock */
+	s3c_hsotg_phy_disable(hsotg);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(hsotg->supplies),
 				    hsotg->supplies);
@@ -3581,8 +3582,6 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
 		goto err_ep_mem;
 	}
 
-	s3c_hsotg_phy_disable(hsotg);
