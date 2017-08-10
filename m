From: Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] drm/bridge/sii8620: add external connector handle
Date: Thu, 10 Aug 2017 15:25:28 +0200
Message-ID: <1502371530-32260-1-git-send-email-m.purski@samsung.com>
References: <CGME20170810132549eucas1p29ada94088da5d7d395e95aded77b906f@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi everyone, 

These patches add external connector handling to sii8620 driver.

The first patch documents the extcon binding and add extcon handling 
to the driver. The second adds support for this in exynos5433-tm2-common.dtsi.

All comments are welcome.

Regards,
Maciej Purski

Patch summary:

Maciej Purski (2):
  drm/bridge/sii8620: add external connector handle
  arm64: dts: exynos: add extcon phandle

 .../bindings/display/bridge/sil-sii8620.txt        |  4 ++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               | 83 +++++++++++++++++++++-
 3 files changed, 86 insertions(+), 2 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
