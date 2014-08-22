From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 0/2] Fix Exynos peach USB on kernels with USB Gadget support
Date: Fri, 22 Aug 2014 22:56:59 +0200
Message-ID: <1408741021-17759-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:44186 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751591AbaHVVEb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Aug 2014 17:04:31 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

When building a kernel with support for both USB host and USB Gadget support on
the dwc3 controller on the Exynos5 soc will go into USB OTG mode unless
otherwise specified in the dtb, which is unhelpful for boards hooked up to run
as USB host.

First patch in this set explicitely set the dual-role mode for the dwc3
controller on Peach pi and Peach pit boards to host mode. Second patch enables
gadget mode in the default exynos config to more easily catch/trigger issues
like these.

I suspect other boards base using exynos5420/5800 might need the similar fixes
(Arndale Octa and Samsung SMDK5420) to their dts files, so would be great if
folks with those board could verify this.

Sjoerd Simons (2):
  ARM: dts: exynos: Explicitly set dr_mode on peach-pit and peach-pi
  ARM: exynos_defconfig: enable USB gadget support

 arch/arm/boot/dts/exynos5420-peach-pit.dts | 8 ++++++++
 arch/arm/boot/dts/exynos5420.dtsi          | 4 ++--
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 8 ++++++++
 arch/arm/configs/exynos_defconfig          | 1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.1.0
