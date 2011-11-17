From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 6/6] ARM: S3C64XX: Modified according to SPI consolidation work.
Date: Thu, 17 Nov 2011 07:11:08 +0530
Message-ID: <CAAgF-Bdt0zuGNLGq8D=-26v_8WZi6Ley=iCG7j-N03G9k+3WKw@mail.gmail.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
	<1320410634-10788-7-git-send-email-padma.v@samsung.com>
	<20111104105710.GA12134@opensource.wolfsonmicro.com>
	<CAAgF-Bcj3vm50YOU4Sq4cGrOE8EHixjOuFrQq-MR6FVLf7Dekg@mail.gmail.com>
	<003401cca365$74c25920$5e470b60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:63309 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755212Ab1KQBlK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Nov 2011 20:41:10 -0500
Received: by wwe5 with SMTP id 5so1879991wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2011 17:41:09 -0800 (PST)
In-Reply-To: <003401cca365$74c25920$5e470b60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Padmavathi Venna <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux@arm.linux.org.uk, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

Hi Kukjin,

On Tue, Nov 15, 2011 at 12:39 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> padma venkat wrote:
>
>> Hi Mark,
>> On Fri, Nov 4, 2011 at 4:27 PM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
>> On Fri, Nov 04, 2011 at 08:43:54AM -0400, Padmavathi Venna wrote:
>>
>> > +#ifdef CONFIG_S3C64XX_DEV_SPI0
>> > +static struct s3c64xx_spi_info crag6410_spi0_pdata __initdata =3D=
 {
>> > + =A0 =A0 .cfg_gpio =A0 =A0 =A0 =3D s3c64xx_spi0_cfg_gpio,
>> > + =A0 =A0 .fifo_lvl_mask =A0=3D 0x7f,
>> > + =A0 =A0 .rx_lvl_offset =A0=3D 13,
>> > + =A0 =A0 .tx_st_done =A0 =A0 =3D 21,
>> > +};
>> > +#endif
>> It seems like a step backwards to have all this stuff in the individ=
ual
>> machines - most of this (everything except cfg_gpio pretty much) is =
a
>> property of the SoC silicon so should be somewhere central for the S=
oC.
>> I Will=A0move this stuff to SPI setup files and resend the patches.
>> Thanks
>> Padma
>
> Hi Padma,
>
> Please send text-typed e-mail when you reply :)
Okey.
>
> And I agree with Mark, how was going on?
I will send the patches by tomorrow.
Thanks&Regards
Padma
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
