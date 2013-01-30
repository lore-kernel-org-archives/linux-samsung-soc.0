From: Alexey Galakhov <agalakhov@gmail.com>
Subject: S3C2440 DMA broken
Date: Wed, 30 Jan 2013 19:10:13 +0600
Message-ID: <51091BB5.2000400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:58130 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753841Ab3A3NKW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 08:10:22 -0500
Received: by mail-lb0-f173.google.com with SMTP id gf7so2115385lbb.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 05:10:20 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Hello,

I found that audio on S3C2440 was broken since commit 344b4c4 (ASoC:
Samsung: Update DMA interface). Each audio buffer is played multiple times.

An investigation of the issue has shown that it is caused by incorrect
buffer length passed to s3c2410_dma_enqueue() in the s3c_dma_prepare()
function (file arch/arm/plat-samsung/s3c-dma-ops.c). To be more precise:

int len = (param->cap == DMA_CYCLIC) ? param->period : param->len;

The buffer length is set in sound/soc/samsung/dma.c like that:

dma_info.period = prtd->dma_period;
dma_info.len = prtd->dma_period*limit;

So the "limit" multiplier is used twice. To prove it, I changed the line
in s3c-dma-ops.c to the following:

int len = /*(param->cap == DMA_CYCLIC)*/1 ? param->period : param->len;

and the audio was played correctly.

What is the intended behavior of s3c_dma_prepare()? Where shoild the
length to be fixed - in s3c_dma_prepare() or in dma.c ?

Regards,
--
Alex
