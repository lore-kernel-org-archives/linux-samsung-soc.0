From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/3] ARM: dts: Add display DT changes for snow,
 peach_pit and peach_pi
Date: Sat, 26 Jul 2014 01:14:21 +0530
Message-ID: <1406317464-7525-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44940 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934189AbaGYTr3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jul 2014 15:47:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on dt-samsung branch of Kukjin's samsung repository at:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

Add DT changes needed for bridge chips, panels and backlight on snow,
peach_pit and peach_pi.

To test these patches, you need the latest version of bridge chip series:
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34667.html

Ajay Kumar (3):
  [PATCH 1/3] ARM: dts: Add DT changes for display on snow
  [PATCH 2/3] ARM: dts: Add DT changes for display on peach_pit
  [PATCH 3/3] ARM: dts: Add DT changes for display on peach_pi

 arch/arm/boot/dts/exynos5250-snow.dts      |   40 +++++++++++++++-------------
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   36 +++++++++++++------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |   27 +++++++------------
 3 files changed, 50 insertions(+), 53 deletions(-)

-- 
1.7.9.5
