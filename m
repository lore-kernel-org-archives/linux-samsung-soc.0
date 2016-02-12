From: Chanho Park <parkch98@gmail.com>
Subject: [PATCH 0/2] Support exynos5420-fimd
Date: Fri, 12 Feb 2016 22:31:38 +0900
Message-ID: <1455283900-6913-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34979 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752583AbcBLNct (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Feb 2016 08:32:49 -0500
Received: by mail-pa0-f65.google.com with SMTP id fl4so3822997pad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Feb 2016 05:32:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Chanho Park <chanho61.park@samsung.com>

This patchset introduces exynos5420-fimd compatible to support
a mic-bypass option from display path. Since exynos5420, the
option has been introduced and controlled by system register.
The option is only available for exynos5420/exynos5422 and 5800,
we need to add the new exynos5420-fimd compatible.

Chanho Park (2):
  drm/exynos: add exynos5420 support for fimd
  ARM: dts: add exynos5420-fimd compatible

 .../bindings/display/exynos/samsung-fimd.txt       |  3 ++-
 arch/arm/boot/dts/exynos5420.dtsi                  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           | 31 +++++++++++++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

-- 
2.5.0
