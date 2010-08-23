From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Mon, 23 Aug 2010 11:01:46 +0900
Message-ID: <AANLkTi=gnAthBXd0oyNzMySKt2Cv4C57kc2kM1LnCvAt@mail.gmail.com>
References: <1282307628-5254-1-git-send-email-kgene.kim@samsung.com>
	<1282307628-5254-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTimBMaVaZTEXG2HDYf1F98kYnRfWDn_BnT=pL85U@mail.gmail.com>
	<005401cb4258$bc135550$3439fff0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37318 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab0HWCBr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 22:01:47 -0400
Received: by wwd20 with SMTP id 20so501449wwd.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Aug 2010 19:01:46 -0700 (PDT)
In-Reply-To: <005401cb4258$bc135550$3439fff0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>

On Mon, Aug 23, 2010 at 9:18 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kyungmin Park wrote:
>>
>> NAK.
>>
> I don't know why I need your ack for this...if any opinions, just com=
ments
> is enough.

Okay I said in other word, I can't agree this patch.

>
>> This approach don't make a common GPIO framework. I already send the
>> common GPIO framework which send the base address to GPIO framework
>> and handle it regradless GPIO is one or three.
>>
> I don't think that your that RFC GPIO patch is common GPIO framework.
>
>>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-August/022=
513.htm
> l
>>
>> With this patch, we can use the common GPIO framework and remove the
>> VA_GPIO dependency.
>>
> Why do you think your patch is common?

In another patch, you just write the driver strength with
readl/writel. even though gpiolib already has interface,
s5p_gpio_set_drvstr

and how to you implement the gpio_to_irq at both GPIO and EINT?

The "common" means GPIO related function should use the gpiolib
functions only. No direct access.

If your patch match these criteria then I'll ack your patch.

All
>
>> Thank you,
>> Kyungmin Park
>>
>> On Fri, Aug 20, 2010 at 9:33 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Jongpill Lee <boyko.lee@samsung.com>
>> >
>> > This patch adds initial map for GPIO2 and GPIO3.
>> > S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
>> >
>> > Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10=
 ++++++++++
>> > =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A02 ++
>> > =A02 files changed, 12 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/c=
pu.c
>> > index 196c9f1..db4f55a 100644
>> > --- a/arch/arm/mach-s5pv310/cpu.c
>> > +++ b/arch/arm/mach-s5pv310/cpu.c
>> > @@ -45,6 +45,16 @@ static struct map_desc s5pv310_iodesc[] __initd=
ata =3D
> {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __p=
hys_to_pfn(S5PV310_PA_L2CC),
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DE=
VICE,
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigne=
d long)S5P_VA_GPIO2,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __ph=
ys_to_pfn(S5PV310_PA_GPIO2),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEV=
ICE,
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigne=
d long)S5P_VA_GPIO3,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __ph=
ys_to_pfn(S5PV310_PA_GPIO3),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_256K,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEV=
ICE,
>> > =A0 =A0 =A0 =A0},
>> > =A0};
>> >
>> > diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/p=
lat-
>> s5p/include/plat/map-s5p.h
>> > index 54e9fb9..bc52595 100644
>> > --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
>> > +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
>> > @@ -15,6 +15,8 @@
>> >
>> > =A0#define S5P_VA_CHIPID =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00700000)
>> > =A0#define S5P_VA_GPIO =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x00500000)
>> > +#define S5P_VA_GPIO2 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00510000)
>> > +#define S5P_VA_GPIO3 =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x00520000)
>> > =A0#define S5P_VA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR=
(0x01200000)
>> > =A0#define S5P_VA_SROMC =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x01100000)
>> >
>> > --
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
