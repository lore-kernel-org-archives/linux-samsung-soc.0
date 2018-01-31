From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] USB: dwc3: get extcon device by OF graph bindings
Date: Wed, 31 Jan 2018 16:57:16 +0100
Message-ID: <20180131155718.5237-1-a.hajda@samsung.com>
References: <CGME20180131155733eucas1p1ef79b72abaa9f9b4fb38e41b2afa8e24@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41191 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbeAaP5h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 10:57:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi,

This small patchset tries to address issue with broken DT extcon property
in case of USB controller - DWC3. It exposes similar problem as in proposed
USB connector bindings[1] - extcon device is required by devices not always
connected directly to extcon device. Here we have:
DWC3 -> USB-PHY -> MUIC -> USB-connector
                               ^
MHL-bridge---------------------^

More details and proposition of generic solution in first patch 

[1]: https://marc.info/?i=20180131134435.12216-1-a.hajda%40samsung.com

Regards
Andrzej


Andrzej Hajda (2):
  USB: dwc3: get extcon device by OF graph bindings
  arm64: dts: exynos: add OF graph between USB-PHY and MUIC

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 18 +++++++++-
 drivers/usb/dwc3/drd.c                             | 41 +++++++++++++++-------
 2 files changed, 45 insertions(+), 14 deletions(-)

-- 
2.15.1
