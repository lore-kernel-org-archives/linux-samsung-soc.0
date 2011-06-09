From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 0/4] Adding idma driver for samsung SoCs
Date: Thu,  9 Jun 2011 17:09:06 +0900
Message-ID: <1307606950-8310-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58716 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754784Ab1FIITF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jun 2011 04:19:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, ben-linux@fluff.org


I2S in samsung audio subsytem has a small internal dma(idma).
IDMA can be used in low power audio mode and I2S0 secondary fifo
data tranfer.
In this patchsets, idma driver is added.
This patch is tested on SMDKV310, Nexus-s(S5PC110) with
lakkyung jung (lakkyung.jung@samsung.com)

This patchset contains followings

 o To Jassi Brar, Mark Brown and Liam Girdwood,
[PATCH 1/4] ASoC: SAMSUNG: Modify I2S driver to support idma
[PATCH 2/4] ASoC: SAMSUNG: Add I2S0 internal dma driver
[PATCH 3/4] ASoC: SAMSUNG: Change platform driver for SMDKs

 o To Kukjin Kim and Ben Dooks,
[PATCH 4/4] ARM: SAMSUNG: Add platform device for idma

Best Regards,
SB Kim
