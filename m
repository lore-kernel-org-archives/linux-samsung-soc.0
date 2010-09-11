From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 4/6] ARM: S5PV210: Enable USB HSOTG gadget build
Date: Sat, 11 Sep 2010 15:12:42 +0900
Message-ID: <AANLkTinyMxy4Oj3HvaHd=+YwSy18wN10PfeA4pvXzk4F@mail.gmail.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
	<1284103403-10696-5-git-send-email-m.szyprowski@samsung.com>
	<000a01cb50d3$90004750$b000d5f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:61278 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751669Ab0IKGMo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Sep 2010 02:12:44 -0400
Received: by wwb13 with SMTP id 13so261181wwb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Sep 2010 23:12:42 -0700 (PDT)
In-Reply-To: <000a01cb50d3$90004750$b000d5f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, nala.la@samsung.com, kyungmin.park@samsung.com

Hi Kgene,

Actually IMHO these basic devices connected at AP are done by System
LSI. Anyway I hope you or your team implement SMDK board support fully
first. Now SMDK board is just placeholder and not much features.

My request is that these are supported on mainline at least.
1. Basic AP peripherals support. RTC, timer, and so on.
2. Suspend & wakeup,
3. clock & power gating.

I think these features are SoC specific and it's under
arch/arm/mach-samsung-soc. So no need to communicate with other
subsystem. just implement it and verified at your side.

I hope use the mainline kernel for our board.

Thank you,
Kyungmin Park

On Fri, Sep 10, 2010 at 7:33 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Marek Szyprowski wrote:
>>
>> Add the necessary definitions and mapping information to enable the
>> s3c-hsotg gadget to build.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A05 +++++
>> =A0arch/arm/mach-s5pv210/include/mach/map.h =A0 =A0 =A0| =A0 =A06 ++=
++++
>> =A0arch/arm/mach-s5pv210/include/mach/regs-sys.h | =A0 19
>> +++++++++++++++++++
>> =A03 files changed, 30 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5pv210/include/mach/regs-sys.h
>>
>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu=
=2Ec
>> index c551ab1..6183b55 100644
>> --- a/arch/arm/mach-s5pv210/cpu.c
>> +++ b/arch/arm/mach-s5pv210/cpu.c
>> @@ -84,6 +84,11 @@ static struct map_desc s5pv210_iodesc[] __initdat=
a =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(S5PV210_PA_SROMC),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S3C_VA_USB_HSPHY,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D__phys_to_p=
fn(S3C_PA_USB_HSPHY),
>
> It's better to use S5PV210_PA_HSPHY directly without re-mapping.
> Because don't need S3C_PA_USB_HSPHY except here.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 }
>> =A0};
>>
>> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv210/include/mach/map.h
>> index bd9afd5..724a428 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> @@ -73,6 +73,9 @@
>>
>> =A0#define S5PV210_PA_HSMMC(x) =A0(0xEB000000 + ((x) * 0x100000))
>>
>> +#define S5PV210_PA_HSOTG =A0 =A0 (0xEC000000)
>> +#define S5PV210_PA_HSPHY =A0 =A0 (0xEC100000)
>> +
>> =A0#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000000)
>> =A0#define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2100000)
>> =A0#define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2200000)
>> @@ -111,6 +114,9 @@
>> =A0#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
>> =A0#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
>> =A0#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>> +#define S3C_PA_USB_HSOTG =A0 =A0 S5PV210_PA_HSOTG
>
> IMHO, would be better if we could define S3C_PA_XXX first than S5P_PA=
_XXX.
>
>> +#define S3C_PA_USB_HSPHY =A0 =A0 S5PV210_PA_HSPHY
>
> As I said, no need re-mapping to S3C_PA_USB_HSPHY.
>
>> +#define S3C_VA_USB_HSPHY =A0 =A0 S3C_ADDR(0x02000000)
>>
> How about moving definition of VA_ to plat/map-s5p.h or plat/map-base=
=2Eh?
> Yeah, I know in the case of s3c64xx, same address mapping is in mach/=
map.h.
>
>> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_ADC
>> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PV210_PA_CFCON
>> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-sys.h
> b/arch/arm/mach-
>> s5pv210/include/mach/regs-sys.h
>> new file mode 100644
>> index 0000000..26691d3
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/include/mach/regs-sys.h
>> @@ -0,0 +1,19 @@
>> +/* arch/arm/mach-s5pv210/include/mach/regs-sys.h
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * S5PV210 - System registers definitions
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>> +*/
>> +
>> +#define S5PV210_USB_PHY_CON =A0(S3C_VA_SYS + 0xE80C)
>> +#define S5PV210_USB_PHY0_EN =A0(1 << 0)
>> +#define S5PV210_USB_PHY1_EN =A0(1 << 1)
>> +
>> +/* compatibility defines for s3c-hsotg driver */
>> +#define S3C64XX_OTHERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_USB_PHY_=
CON
>> +#define S3C64XX_OTHERS_USBMASK =A0 =A0 =A0 S5PV210_USB_PHY0_EN
>> --
>
> Others, ok.
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
