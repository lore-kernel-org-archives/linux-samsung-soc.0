From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2 0/3] Add support for the S6E3HF2 panel on TM2e board
Date: Mon, 17 Apr 2017 15:02:11 +0900
Message-ID: <1492408934-22096-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170417060217epcas1p167d86ba0e12d461efbab67b0014fa1d2@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40869 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932577AbdDQGCU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Apr 2017 02:02:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Hi all,

First, thanks for Andrzej review.

The purpose of this patch is add support for s6e3hf2 AMOLED panel on
the TM2e board. The panel has 1600x2560 resolution in 5.65" physical
panel in the TM2e device.

The s6e3hf2 panel(5.65") is simliar to the previous s6e3ha2 panel(5.7"),
but resolution and some command message are different. So it can be
distinguished as a compatiblitiy string.

Best regards,
Hoegeun

Changes for V2:
- Add new compatible string to "samsung,s6e3ha2.txt binding with comments.
- Fix the panel name from s6e3ha2-e to s6e3hf2

Hoegeun Kwon (3):
  dt-bindings: Add support for samsung s6e3hf2 panel
  drm/panel: s6e3ha2: Add support for s6e3hf2 panel on TM2e board
  arm64: dts: exynos: Add support for s6e3hf2 panel device on TM2e board

 .../bindings/display/panel/samsung,s6e3ha2.txt     |  5 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 12 ++++
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      | 64 +++++++++++++++++++---
 3 files changed, 73 insertions(+), 8 deletions(-)

-- 
1.9.1
