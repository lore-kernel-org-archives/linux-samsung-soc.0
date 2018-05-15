From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 0/2] USB: dwc3: get extcon device by OF graph bindings
Date: Tue, 15 May 2018 14:12:37 +0200
Message-ID: <20180515121239.18192-1-a.hajda@samsung.com>
References: <CGME20180515121250eucas1p115e0ee3cefb47faacbd4e4583b11f6e8@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This small patchset tries to address issue with broken DT extcon property
in case of USB controller - DWC3. It exposes similar problem as in proposed
USB connector bindings[1] - extcon device is required by devices not always
connected directly to extcon device. Here we have:
DWC3 -> USB-PHY -> MUIC -> USB-connector
                               ^
MHL-bridge---------------------^

More details and proposition of generic solution in first patch 

v2:
- rebased on latest linux-next,
- since recently dwc3 fallbacks to ID detection using internal OTG block if
  extcon property is not present, added code allowing to fallback to OTG
  block also in case of graph is not present

[1]: https://marc.info/?i=20180131134435.12216-1-a.hajda%40samsung.com

Regards
Andrzej


Andrzej Hajda (2):
  USB: dwc3: get extcon device by OF graph bindings
  arm64: dts: exynos: add OF graph between USB-PHY and MUIC

 .../dts/exynos/exynos5433-tm2-common.dtsi     | 19 ++++++++++-
 drivers/usb/dwc3/drd.c                        | 34 +++++++++++++++----
 2 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.17.0
