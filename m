From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/3] drm/exynos: dp: consider port node outbound for panel
Date: Thu, 03 Dec 2015 18:30:07 +0900
Message-ID: <1449135010-8111-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54381 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757678AbbLCJaN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Dec 2015 04:30:13 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, k.kozlowski@samsung.com, javier@osg.samsung.com, Inki Dae <inki.dae@samsung.com>

This patch series considers a port node outbound for panel device node,
including dt binding for it. And also it fixes a wrong error type.

P.s.,
I already posted relevant patch series[1] before but missed dt binding.
So please, ignore the patch series - I couldn't search the patch series
on google.com so couldn't link it.

Thanks,
Inki Dae

[1] [PATCH 0/2] drm/exynos: dp: add of_graph dt binding for panel device

Inki Dae (3):
  drm/exynos: dp: add of_graph dt binding support for panel
  drm/exynos: dp: fix wrong return type
  dt-bindings: exynos-dp: update ports node binding for panel

 .../bindings/display/exynos/exynos_dp.txt          | 28 ++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_dp_core.c            | 27 ++++++++++++++++++---
 2 files changed, 48 insertions(+), 7 deletions(-)

-- 
1.9.1
