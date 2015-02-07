From: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] drm/exynos: use syscon framework to enable mipi phy
Date: Sat, 07 Feb 2015 20:53:04 +0900
Message-ID: <1423309988-11793-1-git-send-email-inki.dae@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series makes syscon framework to be used
instead of phy framework.

For this, I adds syscon support to mipi dsi driver and
the relevant device tree properties to each dtsi files,
Exynos4, Exynos3250 and Exynos5420.

Inki Dae (4):
  drm/exynos: dsim: fix to control mipi phy register
  ARM: dts: exynos4: use pmureg device node to enable mipi phy
  ARM: dts: exynos3250: use pmureg device node to enable mipi phy
  ARM: dts: exynos5420: use pmureg device node to enable mipi phy

 .../devicetree/bindings/video/exynos_dsim.txt      |    9 ++--
 arch/arm/boot/dts/exynos3250.dtsi                  |    3 +-
 arch/arm/boot/dts/exynos4.dtsi                     |    3 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   54 ++++++++++++++++++--
 5 files changed, 59 insertions(+), 13 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
