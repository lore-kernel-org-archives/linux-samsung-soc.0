From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/3] Add WM8580 PCM Machine driver for Samsung SoCs
Date: Thu,  7 Apr 2011 09:31:07 +0900
Message-ID: <1302136270-28776-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48470 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757012Ab1DGBEa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Apr 2011 21:04:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

This patchset is for WM8580 pcm machine driver that supports
PCM audio on SMDKC110, SMDKV210, SMDK6450, SMDK6440.
and It is tested on SMDKC110, SMDKV210, SMDKV6450.

Based on these patches WM8580 pcm machine driver supports followings:
 o Playback supports 8kHz sampling rates.
 o Capture supports 8kHz sampling rates.

This patchset contains followings 

 o To Kukjin Kim and Ben Dooks,
[PATCH 1/3] ARM: S5PV210: Add PCM audio support for WM8580
[PATCH 2/3] ARM: S5P64X0: Add PCM audio support for WM8580

 o To Jassi Brar, Mark Brown and Liam Girdwood,
[PATCH 3/3] ASoC: SAMSUNG: Add WM8580 PCM Machine driver 

This patch-set is based on 2.6.39-rc1
and WM8580 machine driver is originated by Seungwhan Youn.

Best Regards,
SB Kim (Sangbeom Kim)
