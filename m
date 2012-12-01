From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/2] ASoC: Samsung: Remove platform device support
Date: Sat, 01 Dec 2012 15:37:25 +0530
Message-ID: <1354356447-16784-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21539 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab2LAKDg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Dec 2012 05:03:36 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEC00J2MJWIP350@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 01 Dec 2012 19:03:34 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEC00MJCJXROT30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 01 Dec 2012 19:03:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org, kgene.kim@samsung.com

Samsung audio DMA device and machine device were getting registered as
platform devices with out having any real H/W peripherials associated
with them. With device tree support we can't add these platform devices
in the machine file. So Added basic device tree based look up for the
machine device.

The sole purpose of DMA platform device is to call the
"snd_soc_register_platform". So removed the pdev support in the DMA device
and each Samsung DAI now registers the ASoC 'platform' itself.

Padmavathi Venna (2):
  ASoC: Samsung: WM8994: Add basic device tree support for machine file
  ASoC: Samsung: Do not register samsung audio dma device as pdev

 sound/soc/samsung/dma.c         |   24 ++++++------------------
 sound/soc/samsung/dma.h         |    3 +++
 sound/soc/samsung/i2s.c         |    3 +++
 sound/soc/samsung/smdk_wm8994.c |   30 ++++++++++++++++++++++++++++--
 4 files changed, 40 insertions(+), 20 deletions(-)

-- 
1.7.4.4
