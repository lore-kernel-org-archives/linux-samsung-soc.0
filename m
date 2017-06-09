From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 0/3] Add support for the s6e63j0x03 panel on Rinato board
Date: Fri, 09 Jun 2017 13:59:11 +0900
Message-ID: <1496984354-5271-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170609045937epcas5p2120f6388b74fa73ea6ed835f7741f61e@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49908 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbdFIE7m (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 00:59:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, inki.dae@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi all,

The purpose of this patch is add support for s6e63j0x03 AMOLED panel
on the rinato board(Samsung Galaxy Gear 2).

The first and second patches are Add the binding document and panel
driver. The third patch is remove the unnecessary properties in the
rinato dts.

Best regards,
Hoegeun

Hoegeun Kwon (3):
  dt-bindings: Add support for samsung s6e63j0x03 panel binding
  drm/panel: Add support for s6e63j0x03 panel driver
  ARM: dts: exynos: Remove the display-timing and delay from rinato dts

 .../bindings/display/panel/samsung,s6e63j0x03.txt  |  24 +
 arch/arm/boot/dts/exynos3250-rinato.dts            |  22 -
 drivers/gpu/drm/panel/Kconfig                      |   7 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   | 491 +++++++++++++++++++++
 5 files changed, 523 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63j0x03.txt
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c

-- 
1.9.1
