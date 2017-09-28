From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC PATCH 0/4] dt-bindings: add bindings for USB physical
 connector
Date: Thu, 28 Sep 2017 15:07:26 +0200
Message-ID: <20170928130730.8747-1-a.hajda@samsung.com>
References: <CGME20170928130734eucas1p299c0e8135df3fb0484d72452cbd2ee47@eucas1p2.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset introduces USB connector bindings, together with working example.
I have added comments in relevant patches to describe possible issues.

Regards
Andrzej


Andrzej Hajda (3):
  dt-bindings: add bindings for USB physical connector
  arm64: dts: exynos: add micro-USB connector node to TM2 platforms
  extcon: add possibility to get extcon device by of node

Maciej Purski (1):
  drm/bridge/sii8620: use micro-USB cable detection logic to detect MHL

 .../bindings/connector/usb-connector.txt           | 49 +++++++++++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 47 ++++++++++-
 drivers/extcon/extcon.c                            | 44 +++++++---
 drivers/gpu/drm/bridge/sil-sii8620.c               | 98 +++++++++++++++++++++-
 include/linux/extcon.h                             |  6 ++
 5 files changed, 228 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/usb-connector.txt

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
