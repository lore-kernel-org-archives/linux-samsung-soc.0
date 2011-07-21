From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Thu, 21 Jul 2011 10:30:11 +0530
Message-ID: <CABb+yY05U0Q58F93TEZ8xt727e6YAxwxZT2HbeTTV6nVcg5DQw@mail.gmail.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
	<1311158773-30314-3-git-send-email-boojin.kim@samsung.com>
	<CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
	<000101cc475c$9b5bcdb0$d2136910$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:48919 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704Ab1GUFAN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 01:00:13 -0400
Received: by fxd18 with SMTP id 18so2885706fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2011 22:00:12 -0700 (PDT)
In-Reply-To: <000101cc475c$9b5bcdb0$d2136910$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>

On Thu, Jul 21, 2011 at 9:43 AM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:

>> > - =C2=A0 =C2=A0 =C2=A0 pl330_tasklet((unsigned long) pch);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list_splice_tai=
l_init(&list, &pdmac->desc_pool);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irq=
restore(&pch->lock, flags);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 case DMA_SLAVE_CONFIG:
>> Please protect this section too using spin_lock.
> Why is spin_lock need here?
> This code just sets configuration data into own channel structure.
It does seem unncessary, but the configuration that is set here is read
in other parts of the driver. However unlikely but there is theoretical
possibility of race here - one shouldn't count upon goodness of client =
drivers.

>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (slave_confi=
g->direction =3D=3D DMA_TO_DEVICE) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (slave_config->dst_addr)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->fifo_addr =3D slave_config=
->dst_addr;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (slave_config->dst_addr_width)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->burst_sz =3D __ffs(slave_c=
onfig-
>> >dst_addr_width);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (slav=
e_config->direction =3D=3D DMA_FROM_DEVICE) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (slave_config->src_addr)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->fifo_addr =3D slave_config=
->src_addr;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (slave_config->src_addr_width)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peri->burst_sz =3D __ffs(slave_c=
onfig-
>> >src_addr_width);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> PL330 has fixed channels to peripherals.
>> So FIFO addresses(burst_sz too?) should already be set via platform =
data.
>> Client drivers shouldn't bother.
>
> First, DMA machine code should know the FIFO address of all client dr=
ivers to
> set via platform data.
> In this case, Problem is that the definition of FIFO address is almos=
t
> declared to the header file of client driver.
> For example, sound\soc\samsung\regs-i2s-v2.h only has the definition =
of fifo
> address as following.
>
> #define S3C2412_IISTXD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x10)
> #define S3C2412_IISRXD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(0x14)
>
> These definitions should be referred to DMA machine code to set fifo =
address
> through platform data.
> I think it's not good method.
Crap!
Client drivers don't conjure up the fifo address - if not hardcoded the=
y
are gotten via platform_data already.


> And, SLAVE_CONFIG command exist to pass slave configuration data from=
 client
> driver to DMA driver.
> So, I think that it's proper to pass fifo address through SLAVE_CONFI=
G
> command.
If it's still not clear, read the para above definition of 'struct
dma_slave_config'
in include/linux/dmaengine.h

>
> Second, 'burst_sz' isn't fixed value. Namely, Client driver changes '=
burst_sz'
> according to its usecase.
> For example, I2S driver sets 'burst_sz' to 4 in case of stereo
> playback/recording. But in case of mono playback/recording, It change=
s
> 'burst_sz' to 2.
> So, Client driver should use SLAVE_CONFIG command to set 'burst_sz' b=
ecause
> it's not fixed value.
>
Yeah yeah, ok, that's why I put that with a ? in bracket.
I just don't remember testing with fixed burst_sz with pl330.
