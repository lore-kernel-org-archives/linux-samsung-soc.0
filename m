From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/4] devfreq: exynos: generalize PPMU code
Date: Fri, 21 Mar 2014 18:31:42 +0100
Message-ID: <1395423106-30458-1-git-send-email-b.zolnierkie@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18611 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754369AbaCURcE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Mar 2014 13:32:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cw00.choi@samsung.com, myungjoo.ham@samsung.com
Cc: kyungmin.park@samsung.com, rafael.j.wysocki@intel.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com

Hi,

This patch series generalizes PPMU support for Exynos devfreq
drivers.

It is based on top of "devfreq: exynos: Fix minor issue and code
clean to remove legacy method" patch series from Chanwoo Choi
(https://lkml.org/lkml/2014/3/19/713).

Please note that the patches were only compile tested because
Exynos devfreq drivers don't work yet in the upstream kernels
(FWIW these changes were briefly tested with the internal tree
which has working devfreq drivers).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics


Bartlomiej Zolnierkiewicz (3):
  devfreq: exynos4: introduce struct busfreq_ppmu_data
  devfreq: exynos5: introduce struct busfreq_ppmu_data
  devfreq: exynos: make more PPMU code common

Chanwoo Choi (1):
  devfreq: exynos4: use common PPMU code

 drivers/devfreq/exynos/Makefile      |   2 +-
 drivers/devfreq/exynos/exynos4_bus.c | 176 +++++++++--------------------------
 drivers/devfreq/exynos/exynos5_bus.c |  94 +++++--------------
 drivers/devfreq/exynos/exynos_ppmu.c |  60 ++++++++++++
 drivers/devfreq/exynos/exynos_ppmu.h |   8 ++
 5 files changed, 135 insertions(+), 205 deletions(-)

-- 
1.8.2.3
