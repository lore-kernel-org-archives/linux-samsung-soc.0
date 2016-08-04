From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/7] ASoC: samsung: DMA parameters handling cleanup
Date: Thu, 04 Aug 2016 11:30:25 +0200
Message-ID: <1470303032-14582-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54978 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932532AbcHDJbb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 05:31:31 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBD014VDP3FUR40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 18:30:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The motivation for this series is to remove the s3c_dma_params
data structure and use struct snd_dmaengine_dai_dma_data instead,
which removes some kind of indirection and makes the code easier
to follow.

Sylwester Nawrocki (7):
  ASoC: samsung: Drop usage of struct s3c_dma_params from i2s.c
  ASoC: samsung: Drop usage of struct s3c_dma_params from s3c24xx-i2s.c
  ASoC: samsung: Drop usage of struct s3c_dma_params from s3c2412-i2s.c
  ASoC: samsung: Drop usage of struct s3c_dma_params from ac97.c
  ASoC: samsung: Drop usage of struct s3c_dma_params from spdif.c
  ASoC: samsung: Drop usage of of struct s3c_dma_params from pcm.c
  ASoC: samsung: Remove unused now unused struct s3c_dma_params

 sound/soc/samsung/ac97.c           | 28 +++++++++++-----------
 sound/soc/samsung/dma.h            | 20 +++-------------
 sound/soc/samsung/dmaengine.c      | 31 ------------------------
 sound/soc/samsung/i2s.c            | 48 +++++++++++++++++++-------------------
 sound/soc/samsung/idma.c           |  1 -
 sound/soc/samsung/pcm.c            | 26 ++++++++++-----------
 sound/soc/samsung/s3c-i2s-v2.c     |  3 +--
 sound/soc/samsung/s3c-i2s-v2.h     |  4 ++--
 sound/soc/samsung/s3c2412-i2s.c    | 24 +++++++++----------
 sound/soc/samsung/s3c24xx-i2s.c    | 24 +++++++++----------
 sound/soc/samsung/smdk_wm8580pcm.c |  1 -
 sound/soc/samsung/smdk_wm8994pcm.c |  1 -
 sound/soc/samsung/spdif.c          | 12 +++++-----
 13 files changed, 86 insertions(+), 137 deletions(-)

--
1.9.1
