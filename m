From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v2 0/3] Power-domain clk handling
Date: Mon, 26 May 2014 17:26:21 +0530
Message-ID: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54445 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751546AbaEZL6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 07:58:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com, mark.rutland@arm.com, pawel.moll@arm.com, swarren@wwwdotorg.org, prathyush.k@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com, joshi@samsung.com, Shaik Ameer Basha <shaik.ameer@samsung.com>

This patchset enables the clk handling in power domain for
working as per the recommended power domain on / off sequence for
exynos5 SoCs. I have posted an RFC for the same [1] and didnt get any
review comments / objections. So I am dropping the RFC tag and
posting the patch along with the required clk and dt support.

[1] https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg30479.html

Rebased on Kukjin Kim's linux-samsung.git, for-next branch
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git:for-next

Changes since v1:
Addressed review comments from Tomasz Figa.
	- http://www.spinics.net/lists/linux-samsung-soc/msg31625.html
	- http://www.spinics.net/lists/linux-samsung-soc/msg31626.html

Arun Kumar K (2):
  clk: exynos5420: Add IDs for clocks used in PD mfc
  ARM: dts: Add clock property for mfc_pd in 5420

Prathyush K (1):
  ARM: EXYNOS: Add support for clock handling in power domain

 .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |    3 +
 arch/arm/mach-exynos/pm_domains.c                  |   59 +++++++++++++++++++-
 drivers/clk/samsung/clk-exynos5420.c               |    6 +-
 include/dt-bindings/clock/exynos5420.h             |    2 +
 5 files changed, 87 insertions(+), 3 deletions(-)

-- 
1.7.9.5
