From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v3 0/4] ASoc: samsung: update s3c24xx to dmaengine and common clk framework
Date: Mon, 23 Jun 2014 23:24:03 +0300
Message-ID: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:38835 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756529AbaFWU0o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:26:44 -0400
Received: by mail-wg0-f51.google.com with SMTP id x12so6915163wgg.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:26:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

This series updates s3c24{xx,12}-i2s driver to use newer DMA and CLK APIs.

v2: use hardcoded dma channel number
v3: rebase onto v3.16-rc1, add common clk framework-related changes

Vasily Khoruzhick (4):
  ASoC: samsung: s3c24{xx,12}-i2s: port to use generic dmaengine API
  ASoC: samsung: drop support for legacy S3C24XX DMA API
  ASoC: samsung: s3c2412-i2s: Move to
    clk_prepare_enable/clk_disable_unprepare
  ASoC: samsung: s3c24xx-i2s: Move to
    clk_prepare_enable/clk_disable_unprepare

 sound/soc/samsung/Kconfig       |  12 +-
 sound/soc/samsung/Makefile      |   2 -
 sound/soc/samsung/dma.c         | 454 ----------------------------------------
 sound/soc/samsung/dmaengine.c   |   3 +
 sound/soc/samsung/s3c-i2s-v2.c  |  17 +-
 sound/soc/samsung/s3c2412-i2s.c |  51 +++--
 sound/soc/samsung/s3c24xx-i2s.c |  62 +++---
 7 files changed, 61 insertions(+), 540 deletions(-)
 delete mode 100644 sound/soc/samsung/dma.c

-- 
2.0.0
