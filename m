From: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: Add USB node for exynos3250 SoC boards
Date: Tue, 23 Dec 2014 21:46:28 +0900
Message-ID: <1419338792-22853-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds USB device node and phy for exynos3250 SoC.
And enables for rinato and monk boards.

Jaewon Kim (4):
  ARM: dts: Add exynos_usbphy node for exynos3250
  ARM: dts: Add hsotg node for exynos3250
  ARM: dts: Enable USB node for exynos3250-rinato
  ARM: dts: Enable USB node for exynos3250-monk

 arch/arm/boot/dts/exynos3250-monk.dts   |   10 ++++++++++
 arch/arm/boot/dts/exynos3250-rinato.dts |   10 ++++++++++
 arch/arm/boot/dts/exynos3250.dtsi       |   22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
