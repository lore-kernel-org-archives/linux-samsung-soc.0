From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH 0/4] Modify configures to support Samsung ASoC dependancyless
Date: Fri, 24 Dec 2010 15:26:05 +0900
Message-ID: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:43283 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765Ab0LXGsG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Dec 2010 01:48:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Hi,

These patches modify configuration to make audio support configurations on
platform(or arch) from sound/soc/samsung. This prevents that audio config
consider which board(or arch) can(or should) support ASoC audio driver, and
also prevents audio config dependancy on future Samsung SoCs.


These patches are modify below features:-
 o Add audio configurations on plat(or arch).
 o Modify audio configuration depends on plat(or arch) selection on ASoC.

This patch-set is based on two different branches that :-
 o ARM patches are based on Kukjin Kim's git branch 'for-next'
   (commit id - 30fb9a94ec22435add3d2ea2d1b01c1a5ad6164c)
 o ASoC patches are based on Mark Brown's git branch 'for-next'
   (commit id - 722bc28384accb67c0bfbbe1914fd82d4d0c996a)

This patch-set contains followings :-
 o To Kukjin Kim, Ben Dooks and Russell King,
  - [PATCH 1/4] ARM: Kconfig: Add audio support dependency
  - [PATCH 2/4] ARM: SAMSUNG: Add SMDK audio configuration
 o To Jassi Brar, Mark Brown and Liam Girdwood,
  - [PATCH 3/4] ASoC: SAMSUNG: Modify to indepedant depends on configuration
  - [PATCH 4/4] ASoC: SAMSUNG: Apply modifications for SMDK audio configuations


Marry X-mas,
Claude(Seungwhan Youn)
