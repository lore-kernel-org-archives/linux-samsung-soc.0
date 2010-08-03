From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 3/8] ARM: Samsung: Add platform definitions and helpers
	for FIMC driver
Date: Tue, 3 Aug 2010 10:12:05 +0900
Message-ID: <AANLkTimTVmrFTWrFH5gSnutSDhckU6akYtFwsARgJnK4@mail.gmail.com>
References: <1279902083-21250-4-git-send-email-s.nawrocki@samsung.com>
	<1280750229-15732-1-git-send-email-m.szyprowski@samsung.com>
	<00e101cb329e$a50ceb60$ef26c220$%kim@samsung.com>
	<AANLkTimJcQccG-H_661bPSz-sQ+L=GYNLd2A3W02wUUP@mail.gmail.com>
	<00e501cb32a5$5775ed50$0661c7f0$%kim@samsung.com>
	<AANLkTinuDaOKe1cMTCC+kmZg0dg2y75szDPQaa93gWbn@mail.gmail.com>
	<00e801cb32a7$fffae0f0$fff0a2d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:33438 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752215Ab0HCBMI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 21:12:08 -0400
Received: by wyb39 with SMTP id 39so3880166wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2010 18:12:06 -0700 (PDT)
In-Reply-To: <00e801cb32a7$fffae0f0$fff0a2d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com, p.osciak@samsung.com, ben-linux@fluff.org

On Tue, Aug 3, 2010 at 10:05 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Kyungmin Park wrote:
>>
>> On Tue, Aug 3, 2010 at 9:46 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> > Kyungmin Park wrote:
>> >>
>> >> On Tue, Aug 3, 2010 at 8:58 AM, Kukjin Kim <kgene.kim@samsung.com=
>
> wrote:
>> >> > Marek Szyprowski wrote:
>> >> >>
>> >> >> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >> >>
>> >> >> FIMC (CAMIF) device is a camera interface embedded in S3C/S5P
> Samsung
>> >> >> SOC series. It supports ITU-R BT.601/656 and MIPI-CSI2 standar=
ds,
>> >> >> memory to memory operations, color conversion, resizing and
> rotation.
>> >> >>
>> >> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> >> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> >> >> ---
>> >> >>
>> >> >> This is patch is a v3 version rebased onto latest kgene/for-ne=
xt
> tree.
>> >> >> New entries in map.h files has been sorted by the physicall ad=
dress.
>> >> >>
>> >> > Thanks for your addressing.
>> >> >
>> >> >> I'm resending this patch on behalf of Sylwester who is on holi=
days
> this
>> >> >> week.
>> >> >>
>> >> >> Best regards
>> >> >> --
>> >> >> Marek Szyprowski
>> >> >> Samsung Poland R&D Center
>> >> >> ---
>
> (snip)
>
>> >> >>
>> >> >> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h
> b/arch/arm/mach-
>> >> >> s5pc100/include/mach/map.h
>> >> >> index c018697..3abe7f5 100644
>> >> >> --- a/arch/arm/mach-s5pc100/include/mach/map.h
>> >> >> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
>> >> >> @@ -99,6 +99,10 @@
>> >> >>
>> >> >> =A0#define S5PC100_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xEE0=
00000)
>> >> >>
>> >> >> +#define S5PC100_PA_FIMC0 =A0 =A0 (0xEE200000)
>> >> >> +#define S5PC100_PA_FIMC1 =A0 =A0 (0xEE300000)
>> >> >> +#define S5PC100_PA_FIMC2 =A0 =A0 (0xEE400000)
>> >> >> +
>> >> >> =A0#define S5PC100_PA_I2S0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000=
000)
>> >> >> =A0#define S5PC100_PA_I2S1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2100=
000)
>> >> >> =A0#define S5PC100_PA_I2S2 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2200=
000)
>> >> >> @@ -143,6 +147,9 @@
>> >> >> =A0#define S3C_PA_ONENAND_BUF =A0 S5PC100_PA_ONENAND_BUF
>> >> >> =A0#define S3C_SZ_ONENAND_BUF =A0 S5PC100_SZ_ONENAND_BUF
>> >> >> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
>> >> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
>> >> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
>> >> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
>> >> >>
>> >> >> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_=
PA_TSADC
>> >> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
>> >> >> diff --git a/arch/arm/mach-s5pv210/cpu.c
> b/arch/arm/mach-s5pv210/cpu.c
>
> (snip)
>
>> >> >> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h
> b/arch/arm/mach-
>> >> >> s5pv210/include/mach/map.h
>> >> >> index 986b285..6a07e55 100644
>> >> >> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> >> >> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> >> >> @@ -65,6 +65,10 @@
>> >> >>
>> >> >> =A0#define S5PV210_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF80=
00000)
>> >> >>
>> >> >> +#define S5PV210_PA_FIMC0 =A0 =A0 (0xFB200000)
>> >> >> +#define S5PV210_PA_FIMC1 =A0 =A0 (0xFB300000)
>> >> >> +#define S5PV210_PA_FIMC2 =A0 =A0 (0xFB400000)
>> >> >> +
>> >> >> =A0#define S5PV210_PA_HSMMC(x) =A0(0xEB000000 + ((x) * 0x10000=
0))
>> >> >>
>> >> >> =A0#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF2000=
000)
>> >> >> @@ -114,4 +118,8 @@
>> >> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PV210_PA_CFCON
>> >> >> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0S5PV210_PA_KEYPAD
>> >> >>
>> >> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
>> >> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
>> >> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>> >> >
>> >> > To use one style is better for reading, merge conflict handling=
 and
> so
>> > on...
>> >> > The style means to add S5P_PA_XXX after S3C_PA_XXX with C100 ca=
se or
>> to
>> >> > modify above C100 case like this.
>> >>
>> >> Use the same conversion as previous one. are you okay?
>> >>
>> >> #define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 (0xF2000000)
>> >> #define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC0
>> >>
>> >> #define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 (0xF2100000)
>> >> #define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC1
>> >>
>> >> #define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 (0xF2200000)
>> >> #define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC2
>> >>
>> >> #define S5PV210_PA_VIC3 =A0 =A0 =A0 =A0 (0xF2300000)
>> >> #define S5P_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC3
>> >>
>> >> #define S5PV210_PA_SDRAM =A0 =A0 =A0 =A0(0x30000000)
>> >> #define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_SDRAM
>> >>
>> > No.
>> >
>> > Did you see above C100?
>> >
>> > --- C100
>> >
>> > =A0#define S3C_PA_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_O=
NENAND_BUF
>> > =A0#define S3C_SZ_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_SZ_O=
NENAND_BUF
>> > =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
>> > +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
>> > +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
>> > +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
>> >
>> > =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_T=
SADC
>> > =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
>> >
>> > --- V210
>> >
>> > =A0#define SAMSUNG_PA_CFCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA=
_CFCON
>> > =A0#define SAMSUNG_PA_KEYPAD =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA=
_KEYPAD
>> >
>> > +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
>> > +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
>> > +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
>> >
>> > I mean it's just ordering.
>>
>> Yes I also mean it don't separate the related definitions. so place
>> adjacent as the the previous.
>>
> No...maybe you misunderstood...hmm :-(
> Please add in map.h of V210 like following.

Then please also apply the same rules at existing definitions.

>
> @@ -110,6 +110,10 @@
> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_RTC
> =A0#define S3C_PA_WDT =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_WATCHDOG
>
> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
> +
> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 S5PV210_PA_ADC
> =A0#define SAMSUNG_PA_CFCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_CF=
CON
> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_KE=
YPAD
>
> (snip)
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
