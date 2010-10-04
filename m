From: Seungwhan Youn <sw.youn@samsung.com>
Subject: [PATCH 0/10] Add S/PDIF common driver for Samsung SoCs
Date: Mon,  4 Oct 2010 20:25:50 +0900
Message-ID: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58148 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754076Ab0JDLrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 07:47:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Hi,

This patch-set is for new S/PDIF common driver that supports S/PDIF
PCM audio on S5PC100, S5PC110 and S5PV210.

This patch-set is based on two different branches that :-
 o ASoC patches are based on Mark Brown's git branch 'for-next'
   (commit id - 135e44aaa47c22b66c8d2acb54da1106a6c17598)
 o ARM patches are based on Kukjin Kim's git branch 'for-next'
   (commit id - a9d09cac7485062c599ee8f341bb0c5ccc2cc9d6)

Based on these patches S/PDIF driver supports followings :-
 o Playback supports {32, 44.1, 48 and 96}kHz sampling rates.
 o Playback supports 16-bit Little-endian PCM format.

This patch-set contains followings :-
 o To Kukjin Kim and Ben Dooks,
  - [PATCH 1/10] ARM: S5PC100: Add S/PDIF platform device
  - [PATCH 2/10] ARM: S5PC100: Modify SCLK_AUDIO{0,1,2} clock as
    sysclks
  - [PATCH 3/10] ARM: S5PC100: Add SCLK_SPDIF clock
  - [PATCH 4/10] ARM: S5PV210: Add S/PDIF platform device
  - [PATCH 5/10] ARM: S5PV210: Add SCLK_SPDIF clock
  - [PATCH 6/10] ARM: S5PV210: Add audio clocks as sysclk
  - [PATCH 7/10] ARM: S5PV210: Fix wrong EPLL rate getting on
    setup clocks
  - [PATCH 8/10] ARM: S5PV210: Add EPLL clock operations
 o To Jassi Brar, Mark Brown and Liam Girdwood,
  - [PATCH 9/10] ASoC: SAMSUNG: Add S/PDIF CPU driver
  - [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for S/PDIF PCM audio


Best Regards,
Claude(Seungwhan Youn)
