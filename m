From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/6] usb: phy: samsung: Select common driver part implicitly
Date: Thu, 16 May 2013 11:57:06 +0200
Message-ID: <1368698231-24268-2-git-send-email-t.figa@samsung.com>
References: <1368698231-24268-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1368698231-24268-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Since phy-samsung-usb library can be used only by phy-samsung-usb2 and
phy-samsung-usb3 drivers, there is no need to give explicit control over
its Kconfig symbol.

This patch makes CONFIG_SAMSUNG_USBPHY symbol hidden and selected
implicitly by CONFIG_SAMSUNG_USB2PHY and CONFIG_SAMSUNG_USB3PHY.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 371d0e7..a2b9e18 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -86,7 +86,7 @@ config OMAP_USB3
 	  on/off the PHY.
 
 config SAMSUNG_USBPHY
-	tristate "Samsung USB PHY Driver"
+	tristate
 	help
 	  Enable this to support Samsung USB phy helper driver for Samsung SoCs.
 	  This driver provides common interface to interact, for Samsung USB 2.0 PHY
-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
