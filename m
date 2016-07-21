From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/2] ASoC: samsung: Deferred probing support fixes
Date: Thu, 21 Jul 2016 20:03:48 +0200
Message-ID: <1469124230-8583-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51638 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884AbcGUSEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 14:04:05 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAO00LG6FG4QU30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Jul 2016 03:04:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, k.kozlowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch series is an attempt to fix sound card initialization isssues
observed in Odroid XU3 board after conversion of the AUDSS clock controller
driver to proper loadable module.  Related patch can be found here:
https://patchwork.kernel.org/patch/9221051, it's also already in -next.

It would be good to have these two patches merged in 4.8-rc cycle so as
to avoid regressions on on boards using ADMA. The sound breakage happens
only when ADMA is used, as ADMA gets apb_pclk clock from the AUDSS clock
controller.  Previously the clock controller was initialized early in
core_initcall which ensured the ADMA PL330 driver initialization before
the I2S probe.

Probably as a followup the SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME could
be dropped and it's usage replaced with struct snd_dmaengine_pcm_config
::dma_names, I didn't want to make too invasive changes for a bug fix patch
and don't have the older s3c non-dt boards for testing.

Sylwester Nawrocki (2):
  ASoC: samsung: Fix error paths in the I2S driver's probe()
  ASoC: samsung: Specify DMA channels through struct
    snd_dmaengine_pcm_config

 sound/soc/samsung/ac97.c        |  3 ++-
 sound/soc/samsung/dma.h         |  9 ++++++---
 sound/soc/samsung/dmaengine.c   | 31 ++++++++++++++++++++-----------
 sound/soc/samsung/i2s.c         | 28 ++++++++++++++++++++++------
 sound/soc/samsung/pcm.c         |  3 ++-
 sound/soc/samsung/s3c2412-i2s.c |  3 ++-
 sound/soc/samsung/s3c24xx-i2s.c |  3 ++-
 sound/soc/samsung/spdif.c       |  3 ++-
 8 files changed, 58 insertions(+), 25 deletions(-)

--
1.9.1
