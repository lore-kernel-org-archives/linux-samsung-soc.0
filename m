From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] usb: host: ehci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
Date: Sat,  7 Jan 2017 10:41:40 +0200
Message-ID: <20170107084141.3731-1-krzk@kernel.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Returning from for_each_available_child_of_node() loop requires cleaning
up node refcount.  Error paths lacked it so for example in case of
deferred probe, the refcount of phy node was left increased.

Fixes: 6d40500ac9b6 ("usb: ehci/ohci-exynos: Fix of_node_put() for child when getting PHYs")
Signed-off-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/usb/host/ehci-exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
index 42e5b66353ef..7a603f66a9bc 100644
--- a/drivers/usb/host/ehci-exynos.c
+++ b/drivers/usb/host/ehci-exynos.c
@@ -77,10 +77,12 @@ static int exynos_ehci_get_phy(struct device *dev,
 		if (IS_ERR(phy)) {
 			ret = PTR_ERR(phy);
 			if (ret == -EPROBE_DEFER) {
+				of_node_put(child);
 				return ret;
 			} else if (ret != -ENOSYS && ret != -ENODEV) {
 				dev_err(dev,
 					"Error retrieving usb2 phy: %d\n", ret);
+				of_node_put(child);
 				return ret;
 			}
 		}
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
