From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH v2 0/6] Add S/PDIF common driver for Samsung SoCs
Date: Tue, 12 Oct 2010 20:19:59 +0900
Message-ID: <1286882399-27595-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36273 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754263Ab0JLLZy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Oct 2010 07:25:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Hi,

This patch-set is a 2nd version for new S/PDIF common driver that supports
S/PDIF PCM audio on S5PC100, S5PC110 and S5PV210.

This patch-set is based on two different branches that :-
 o ARM patches are based on Kukjin Kim's git branch 'for-next'
   (commit id - 64dcc6aef86593e478cf297a8508e55b54cceaf8)
 o ASoC patches are based on Mark Brown's git branch 'for-next'
   (commit id - fe3e2e7ff2da41bd7a985c4c206e05a95ebe7a6b)

This patch-set updates followings from the 1st submit :-
 o Add EPLL enable and get_rate function as common EPLL function
 o Add EPLL rate change warning
 o Fix S/PDIF's audio clock divider set dynamically at CPU driver
 o Move S/PDIF specific register macros and structure into CPU driver

This patch-set contains followings :-
 o To Kukjin Kim and Ben Dooks,
  - [PATCH v2 1/6] ARM: S5P: Reduce duplicated EPLL control codes
  - [PATCH v2 2/6] ARM: S5PV210: Fix wrong EPLL rate getting on setup clocks
  - [PATCH v2 3/6] ARM: S5PV210: Add EPLL clock operations
  - [PATCH v2 4/6] ARM: S5P: Add EPLL rate change warning
 o To Jassi Brar, Mark Brown and Liam Girdwood,
  - [PATCH v2 5/6] ASoC: SAMSUNG: Add S/PDIF CPU driver
  - [PATCH v2 6/6] ASoC: SAMSUNG: Add Machine driver for S/PDIF PCM audio


Best Regards,
Claude(Seungwhan Youn)
