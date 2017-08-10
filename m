From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 0/2] add Silicon Image SiI9234 driver
Date: Thu, 10 Aug 2017 15:20:42 +0200
Message-ID: <1502371244-31908-1-git-send-email-m.purski@samsung.com>
References: <CGME20170810132056eucas1p16365b59eb9c4dad15f07b161ff2fb907@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37083 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752168AbdHJNU7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2017 09:20:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, krzk@kernel.org, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Hi everyone,

These patches are a continuation of work by Tomasz Stanislawski on sii9324 driver, which was described
in th following letter:
https://lists.freedesktop.org/archives/dri-devel/2014-April/057481.html

The main differences from the previous code are:
* driver moved to /gpu/drm/bridge/ and integrated with drm/bridge subsystem
* added filtering-out unsupported display modes
* changed gpio interface to up-to-date
* changed interrupt handling
* improve code style
* add hdmi and sii9324 to exynos4412-trats2 device tree

All comments are welcome.

Regards,
Maciej Purski


Patch summary:

Maciej Purski (2):
  drm/bridge: add Silicon Image SiI9234 driver
  ARM: dts: exynos: Add HDMI and Sil9234 to Trats2 board

 .../devicetree/bindings/display/bridge/sii9234.txt |   20 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |   93 ++
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/sii9234.c                   | 1019 ++++++++++++++++++++
 5 files changed, 1141 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/sii9234.txt
 create mode 100644 drivers/gpu/drm/bridge/sii9234.c

-- 
2.7.4
