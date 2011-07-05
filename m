From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 7/7] ASoC: Samsung: Update DMA interface
Date: Tue, 5 Jul 2011 16:45:30 +0900
Message-ID: <CA+s+8rf3oBFe7TcEnWqh1L51FuN59uU0F=RTgargOFGJN+f7XA@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-8-git-send-email-kgene.kim@samsung.com>
	<20110704170259.GC28726@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:38780 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754095Ab1GEHpc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:45:32 -0400
Received: by wwe5 with SMTP id 5so5658305wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 00:45:30 -0700 (PDT)
In-Reply-To: <20110704170259.GC28726@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Boojin Kim <boojin.kim@samsung.com>

> Two questions here:
>
> - It looks like a lot of this code can be shared between all the driv=
ers
> =C2=A0using the dmaengine API. =C2=A0Is there any reason not to facto=
r it out?
> - Should this not be adding a new driver for dmaengine based Samsung
> =C2=A0CPUs? =C2=A0The ifdefs are very big.

I think that dma code looks very similar to current one, so how about
using platform_resource setting for dma type and make some inline
functions to cover these differences? We already have platform driver
for dma in arch/arm and dev-audio.c.
