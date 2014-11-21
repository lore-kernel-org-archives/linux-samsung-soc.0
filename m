From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2/5] Samsung 2nd round of cleanup for v3.19
Date: Fri, 21 Nov 2014 23:15:43 +0900
Message-ID: <546F490F.1020601@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:39412 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755426AbaKUOPr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:15:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 13cfa6c4f7facfc690ba9e99ec382c151fddaced:

  ARM: EXYNOS: Fix CPU idle clock down after CPU off (2014-10-21
00:06:22 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-cleanup-2

for you to fetch changes up to 9c50b2a98cf0ca70480b70a4490a87177519094c:

  ARM: EXYNOS: Remove unused static iomapping (2014-11-13 11:42:59 +0900)

----------------------------------------------------------------
Samsung 2nd cleanup for v3.19

- remove unused static iomapping for exynos SoCs
  : remove unused static iomapping from exynos4/5_iodesc table,
    and related macros from mach/map.h and plat/map-s5p.h.

----------------------------------------------------------------
Pankaj Dubey (1):
      ARM: EXYNOS: Remove unused static iomapping

 arch/arm/mach-exynos/exynos.c                | 50
----------------------------
 arch/arm/mach-exynos/include/mach/map.h      | 23 -------------
 arch/arm/plat-samsung/include/plat/map-s5p.h | 21 ------------
 3 files changed, 94 deletions(-)
