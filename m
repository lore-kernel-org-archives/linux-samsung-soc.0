From: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] ARM: multi_v7_defconfig: Enable OHCI on Exynos
Date: Sun, 17 May 2015 17:09:50 +0900
Message-ID: <1431850195-9558-9-git-send-email-k.kozlowski.k@gmail.com>
References: <1431850195-9558-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431850195-9558-1-git-send-email-k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Enable the USB OHCI driver for Exynos SoCs: S5PV210, Exynos4 family,
Exynos5250, Exynos5440 and Exynos542x/5800 family.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6ee2c24dfbc7..b3573c01f34c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -456,6 +456,7 @@ CONFIG_USB_ISP1760_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_STI=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_EXYNOS=y
 CONFIG_USB_R8A66597_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
