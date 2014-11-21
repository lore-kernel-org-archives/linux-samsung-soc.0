From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 1/5] Samsung non-critical fixes for v3.19
Date: Fri, 21 Nov 2014 23:15:26 +0900
Message-ID: <546F48FE.3000601@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:39380 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755426AbaKUOPb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:15:31 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

  Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-v3.19

for you to fetch changes up to d4c6c6cf8b42d3e516703c8dc48714fed31859b8:

  ARM: EXYNOS: fix typo in static struct name
"exynos5_list_diable_wfi_wfe" (2014-11-07 08:30:33 +0900)

----------------------------------------------------------------
Samsung non-critical-fixes for v3.19

- fix typo in static struct name "exynos5_list_diable_wfi_wfe"
  : it should be "exynos5_list_disable_wfi_wfe"

----------------------------------------------------------------
Pankaj Dubey (1):
      ARM: EXYNOS: fix typo in static struct name
"exynos5_list_diable_wfi_wfe"

 arch/arm/mach-exynos/pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
