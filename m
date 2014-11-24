From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 0/3] ARM: dts: add the support of Exynos3250-based Monk board
Date: Mon, 24 Nov 2014 19:57:47 +0900
Message-ID: <1416826670-29438-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22552 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbaKXK5y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 05:57:54 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: jh80.chung@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, yj44.cho@samsung.com, geunsik.lim@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patchset adds the support of Exynos3250-based Monk board and Exynos-based
boards compatible string and description to remove build warning. Also, this
patchset includes a patch which remove unused dt node for command line in
Exynos3250-based Rinato dts file.

Changes from v2:
- Include new patches by Chanwoo Choi with following patch[1]
  [1] http://www.spinics.net/lists/arm-kernel/msg368443.html

Changes from v1:
- Fix minor issue

Chanwoo Choi (2):
  ARM: exynos: Add Exynos-based boards compatible string and description
  ARM: dts: Remove unused command line from Exynos3250-based Rinato board

Youngjun Cho (1):
  ARM: dts: add board dts file for Exynos3250-based Monk board

 .../devicetree/bindings/arm/samsung-boards.txt     |  19 +-
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/exynos3250-monk.dts              | 579 +++++++++++++++++++++
 arch/arm/boot/dts/exynos3250-rinato.dts            |   4 -
 4 files changed, 595 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-monk.dts

-- 
1.8.5.5
