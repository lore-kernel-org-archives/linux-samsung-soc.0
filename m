From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V3 00/13] To use DMA generic APIs for Samsung DMA
Date: Mon, 18 Jul 2011 17:06:22 +0530
Message-ID: <CABb+yY2SBevnQ4U3qeGe63G6dHi64cjCYoN296r8uPyjgYn-NA@mail.gmail.com>
References: <1310798666-7659-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:55408 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756425Ab1GRLgY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 07:36:24 -0400
Received: by eye22 with SMTP id 22so1233475eye.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2011 04:36:23 -0700 (PDT)
In-Reply-To: <1310798666-7659-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@stericsson.com>

On Sat, Jul 16, 2011 at 12:14 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> Following is diagram of this changes
>
> +--------------------------------------------------------------------=
-+
> | Each drivers which uses DMA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +--------------------------------------------------------------------=
-+
> | S3C DMA API (such as s3c2410_dma_xxxx) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|
> +-------------------------------+------------------------------------=
-+
> | DMA driver for S3C24XX =C2=A0 =C2=A0 =C2=A0 =C2=A0| S3C PL330 DMA A=
PI driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | PL080 DMA driver for S3C64XX =C2=A0| (arch/arm/plat-samsung/s3c-pl3=
30.c) |
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +----------------------------------=
---+
> | (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (removing S3C DMA AP=
I for PL330)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \/
> +--------------------------------------------------------------------=
-+
> | Each drivers which uses DMA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> | S3C DMA API(s3c2410_dma_xxx) =C2=A0| DMA generic API for PL330 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
> | DMA driver for S3C24XX =C2=A0 =C2=A0 =C2=A0 =C2=A0| PL330 DMA API d=
river =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | PL080 DMA driver for S3C64XX =C2=A0| (drivers/dma/pl330.c) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +----------------------------------=
---+
> | (arch/arm/plat-s3c24xx/dma.c) | Common DMA core driver =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|
> | (arch/arm/mach-s3c64xx/dma.c) | (arch/arm/common/pl330.c) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |
> +-------------------------------+------------------------------------=
-+
>

Please share what drivers and use-cases have been tested with the patch=
set.

> [PATCH V3 02/13] DMA: PL330: Update PL330 DMA API driver
> This patch updates following 3 items.
>    1. Removes unneccessary code.
>    2. Add AMBA, PL330 configuration
>    3. Change the meaning of 'peri_id' variable
>       from PL330 event number to specific dma id by user.
Please separate this patch in to at least 2 parts and explain _why_
you do what you do.

Ex, the following two snippets looks obviously wrong to me.
Though I doubt any better changelog can justify that, but atleast that
will help me take it seriously. This is also why I ask for test-report.

@@ -19,7 +19,7 @@ struct dma_pl330_peri {
         * Peri_Req i/f of the DMAC that is
         * peripheral could be reached from.
         */
-       u8 peri_id; /* {0, 31} */
+       u8 peri_id; /* specific dma id */

@@ -455,7 +455,7 @@ static struct dma_pl330_desc
*pl330_get_desc(struct dma_pl330_chan *pch)
        async_tx_ack(&desc->txd);

        desc->req.rqtype =3D peri->rqtype;
-       desc->req.peri =3D peri->peri_id;
+       desc->req.peri =3D pch->chan.chan_id;

Please don't only add to changelogs, but also re-think about the above
two changes. Hint: Read the structure definitions header file and how t=
hey
are used in the pl330 core driver.

Since the other patches would be affected by what you do here, I am not
reviewing them until I have either justification or revert of these.

> [PATCH V3 03/13] DMA: PL330: Add DMA capabilities
Please don't be conservative with number of patches - segregate indepen=
dent
changes in independent patches or you make my life miserable :(

Thnx
-jassi
