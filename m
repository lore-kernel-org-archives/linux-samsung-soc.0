From: Linus Walleij <linus.ml.walleij@gmail.com>
Subject: Re: [GIT PULL] Samsung devel-dma ops for v3.6
Date: Mon, 23 Jul 2012 16:36:17 +0200
Message-ID: <CAKnu2Mqf+_JwaZbpfPCJ1go1iTkPb3VLRwj=pFjcr1Apu0O8fA@mail.gmail.com>
References: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com>
	<201207101242.41867.arnd@arndb.de>
	<0e1301cd5f34$008fe1e0$01afa5a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:39072 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753504Ab2GWOgR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jul 2012 10:36:17 -0400
Received: by pbbrp8 with SMTP id rp8so10973647pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jul 2012 07:36:17 -0700 (PDT)
In-Reply-To: <0e1301cd5f34$008fe1e0$01afa5a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Ben Dooks <ben@simtec.co.uk>, linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, w.sang@pengutronix.de, Grant Likely <grant.likely@secretlab.ca>, Kyoungil Kim <ki0351.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

2012/7/11 Kukjin Kim <kgene.kim@samsung.com>:

> Yeah, let me explain the status for Samsung SoCs' DMA. There are 3 different
> DMA IPs, samsung specific s3c24xx dma, pl080 and pl330. As you know, pl330
> already moved in drivers/dma for using common DMA engine and Alim is
> re-working on pl080
> (http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10954.html
> ) and let me check its progress. But s3c24xx dma is not ready yet.

I'm going to poke again on this. I think a bunch of changes to the PL080
driver from Russell is going upstream this merge window and the S3C patch
series need to be rebased onto that, but it should be pretty straight-forward.

Can we please have something moving the S3C over to dmaengine *early*
next kernel cycle?

Yours,
Linus Walleij
