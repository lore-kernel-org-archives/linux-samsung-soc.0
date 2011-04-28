From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 0/2] Add WM8994 PCM Machine driver for Exynos4210
Date: Thu, 28 Apr 2011 10:32:50 +0900
Message-ID: <1303954372-18565-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39865 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688Ab1D1CJL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 22:09:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hi,

This is 2nd patchset for WM8994 pcm machine driver that supports
PCM audio on SMDKV310, SMDKC210 and test is done.

This is minor change version.
AS jassi comment, I added new pcm structure for quirk handling.
And added Liam's acked.

Based on these patches WM8994 pcm machine driver supports followings:
 o Playback supports 8kHz sampling rates.
 o Capture supports 8kHz sampling rates.

This patchset contains followings 

 o To Kukjin Kim and Ben Dooks,
[PATCH 1/2] ARM: EXYNOS4: Add PCM audio support for WM8994

 o To Jassi Brar, Mark Brown and Liam Girdwood,
[PATCH 2/2] ASoC: SAMSUNG: Add WM8580 PCM Machine driver 

Best Regards,
SB Kim (Sangbeom Kim)
