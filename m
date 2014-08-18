From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/5] drm/exynos: support Exynos3250 SoC
Date: Mon, 18 Aug 2014 17:21:28 +0900
Message-ID: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series adds of_device_id and relevant device nodes
for Exynos3250 SoC support.

Inki Dae (5):
  drm/exynos: mipi-dsi: add Exynos3 SoC support
  drm/exynos: fimd: add Exynos3 SoC support
  ARM: dts: add fimd device node to exynos3250.dsti
  ARM: dts: add mipi_phy device node to exynos3240.dtsi
  ARM: dts: add mipi dsi device node to exynos3250.dtsi

 .../devicetree/bindings/video/exynos_dsim.txt      |    1 +
 .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
 arch/arm/boot/dts/exynos3250.dtsi                  |   33 ++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |    8 +++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   10 ++++++
 5 files changed, 53 insertions(+)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
