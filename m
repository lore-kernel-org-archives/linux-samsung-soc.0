From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 6/6] ARM: S3C64XX: Modified according to SPI consolidation
 work.
Date: Tue, 15 Nov 2011 16:09:03 +0900
Message-ID: <003401cca365$74c25920$5e470b60$%kim@samsung.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
 <1320410634-10788-7-git-send-email-padma.v@samsung.com>
 <20111104105710.GA12134@opensource.wolfsonmicro.com>
 <CAAgF-Bcj3vm50YOU4Sq4cGrOE8EHixjOuFrQq-MR6FVLf7Dekg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15369 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab1KOHJE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:09:04 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUO004Y9X3VNL20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:09:03 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUO00ICCX73MA80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:09:03 +0900 (KST)
In-reply-to: <CAAgF-Bcj3vm50YOU4Sq4cGrOE8EHixjOuFrQq-MR6FVLf7Dekg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'padma venkat' <padma.kvr@gmail.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux@arm.linux.org.uk, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

padma venkat wrote:

> Hi Mark,
> On Fri, Nov 4, 2011 at 4:27 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Nov 04, 2011 at 08:43:54AM -0400, Padmavathi Venna wrote:
>
> > +#ifdef CONFIG_S3C64XX_DEV_SPI0
> > +static struct s3c64xx_spi_info crag6410_spi0_pdata __initdata =3D =
{
> > + =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s3c64xx_spi0_cfg_gpio,
> > + =A0 =A0 .fifo_lvl_mask =A0=3D 0x7f,
> > + =A0 =A0 .rx_lvl_offset =A0=3D 13,
> > + =A0 =A0 .tx_st_done =A0 =A0 =3D 21,
> > +};
> > +#endif
> It seems like a step backwards to have all this stuff in the individu=
al
> machines - most of this (everything except cfg_gpio pretty much) is a
> property of the SoC silicon so should be somewhere central for the So=
C.
> I Will=A0move this stuff to SPI setup files and resend the patches.
> Thanks
> Padma

Hi Padma,

Please send text-typed e-mail when you reply :)

And I agree with Mark, how was going on?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
