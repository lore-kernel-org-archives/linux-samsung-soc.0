From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH V2 0/4] Add Samsung internal dma driver support
Date: Wed, 15 Jun 2011 17:43:23 +0900
Message-ID: <1308127407-22458-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34624 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753059Ab1FOItw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 04:49:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com

I2S in samsung audio subsytem has a small internal dma(idma).
IDMA can be used in low power audio mode and I2S0 secondary fifo
data tranfer.
In this patchsets, idma driver is added.
Original code is made by jassi brar on SMDKV210
After idma driver merge, I will submit low power audio support
with idma driver and samsung dsp driver.

Changes since v1:
1. Change idma_new by new pcm_new api
2. Add handling different idma address
3. As jassi comments, Modify the idma driver

This patchset contains followings

 o To Jassi Brar, Mark Brown and Liam Girdwood,
[PATCH V2 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
[PATCH V2 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver

 o To Kukjin Kim
[PATCH V2 3/4] ARM: SAMSUNG: Add platform device for idma
[PATCH V2 4/4] ARM: SAMSUNG: Add IRQ_I2S0 definition

Thanks
SB Kim
