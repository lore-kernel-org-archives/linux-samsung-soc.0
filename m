From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v6 5/7] ARM: S5PV210: Access for DMCx registers
Date: Wed, 4 Aug 2010 22:36:21 +0900
Message-ID: <AANLkTinrOPuQUn63gh1owfEgYBRZ8J=COVkPBp_VtBm4@mail.gmail.com>
References: <1280829866-26001-1-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-3-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-4-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-5-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-6-git-send-email-myungjoo.ham@samsung.com>
	<001901cb33c6$b05542f0$10ffc8d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:51443 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932656Ab0HDNgV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Aug 2010 09:36:21 -0400
Received: by pxi14 with SMTP id 14so1976049pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Aug 2010 06:36:21 -0700 (PDT)
In-Reply-To: <001901cb33c6$b05542f0$10ffc8d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Aug 4, 2010 at 8:17 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> MyungJoo Ham wrote:
>>
>> =A0 =A0 =A0 The CPUFREQ driver requires an access to DMCx registers.=
 We
>> define physical addresses and mapping between physical and virtual
>> addresses of DMCx registers.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 12 +=
++++++++++-
>> =A0arch/arm/mach-s5pv210/include/mach/map.h | =A0 =A04 ++++
>> =A02 files changed, 15 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu=
=2Ec
>> index 74d4c08..2066695 100644
>> --- a/arch/arm/mach-s5pv210/cpu.c
>> +++ b/arch/arm/mach-s5pv210/cpu.c
>> @@ -60,7 +60,17 @@ static struct map_desc s5pv210_iodesc[] __initdat=
a =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(S5PV210_PA_SROMC),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> - =A0 =A0 }
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_DMC0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_to_=
pfn(S5PV210_PA_DMC0),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_DMC1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_to_=
pfn(S5PV210_PA_DMC1),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> + =A0 =A0 },
>> =A0};
>>
>> =A0static void s5pv210_idle(void)
>> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv210/include/mach/map.h
>> index 17687f0..daf6456 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> @@ -108,4 +108,8 @@
>> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_ADC
>> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0S5PV210_PA_KEYPAD
>>
>> +/* DMC */
>
> No need an obvious comment like above...
>
>> +#define S5PV210_PA_DMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF0000000)
>> +#define S5PV210_PA_DMC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF1400000)
>
> As I said, if you need adding new definition into the mach/map.h, ple=
ase
> keep the address order like others.
> It can help to us for easily reading...

Good, good, good,

I'm really appreciate it if the same rules apply to LSI internal trees.
I hope you check it LSI codes also.

Thank you,
Kyungmin Park

>
>> +
>> =A0#endif /* __ASM_ARCH_MAP_H */
>> --
>
> And as I commented, to merge your 4th(previous, just adding VA) and 5=
th
> patch to one is better...just for adding DMC map IO.
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
