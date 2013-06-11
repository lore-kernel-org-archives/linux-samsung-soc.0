From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu reg
 control
Date: Tue, 11 Jun 2013 12:47:51 +0530
Message-ID: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47412 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798Ab3FKGyL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 02:54:11 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO7005IAV69MUM0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 15:54:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Previously, hdmiphy is added as a dummy clock in clock file for
exynos SoCs. Enable/Disable to this clock, actually toggles the power
control bit in PMU, instead of controlling the clock gate.

This RFC adds the support to parse hdmiphy control node which is a child
node to hdmi, and map the pmu register to toggle the power control bit.

This is based on drm-next branch in Inki Dae's tree.

Rahul Sharma (2):
  drm/exynos: replace dummy hdmiphy clock with pmu register control
  ARM/dts: add hdmiphy power control pmu register to hdmi dt node

 arch/arm/boot/dts/exynos5250.dtsi    |    6 +++
 drivers/gpu/drm/exynos/exynos_hdmi.c |   69 ++++++++++++++++++++++++++++++----
 drivers/gpu/drm/exynos/regs-hdmi.h   |    4 ++
 3 files changed, 71 insertions(+), 8 deletions(-)

-- 
1.7.10.4
