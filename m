From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and SMDKV310
Date: Sun, 21 Oct 2012 18:25:19 +0200
Message-ID: <16890730.oeOgcP5xf2@flatron>
References: <1349701968-6675-1-git-send-email-t.figa@samsung.com> <1587144.mixS1B3zoJ@amdc1227> <10e401cdaae0$a17d44b0$e477ce10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:41934 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932303Ab2JUQZQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Oct 2012 12:25:16 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so1599998wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Oct 2012 09:25:14 -0700 (PDT)
In-Reply-To: <10e401cdaae0$a17d44b0$e477ce10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com

Hi Kgene,

On Monday 15 of October 2012 23:23:22 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > Hi Kgene,
> > 
> > On Monday 08 of October 2012 15:12:48 Tomasz Figa wrote:
> > > This patch adds status override of serial nodes to enable used
> > > serial
> > > ports on Origen and SMDKV310 board.
> > > 
> > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > ---
> > > 
> > >  arch/arm/boot/dts/exynos4210-origen.dts   | 16 ++++++++++++++++
> > >  arch/arm/boot/dts/exynos4210-smdkv310.dts | 16 ++++++++++++++++
> > >  2 files changed, 32 insertions(+)
> > 
> > I think you missed this patch when applying Exynos dts reorganization
> > patches. It is needed to enable serial ports on Origen and SMDKV310
> 
> boards.
> 
> > Could you apply it as well?
> 
> Oops, yeah. I will apply.

I saw that you applied this patch to your next/dt-samsung branch, thanks.

However I think this should be considered a fix, because without it serial 
console on Origen and SMDKV310 will be broken.

Best regards,
Tomasz Figa
