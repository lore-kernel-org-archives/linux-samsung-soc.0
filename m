From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v6 5/7] ARM: S5PV210: Access for DMCx registers
Date: Tue, 10 Aug 2010 14:29:54 +0900
Message-ID: <AANLkTi=OXSrNvakQ49QhdcB_RmdWTHZw7gFARSpyryRi@mail.gmail.com>
References: <1280829866-26001-1-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-3-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-4-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-5-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-6-git-send-email-myungjoo.ham@samsung.com>
	<001901cb33c6$b05542f0$10ffc8d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42009 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751513Ab0HJF3z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Aug 2010 01:29:55 -0400
Received: by iwn33 with SMTP id 33so4198672iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2010 22:29:55 -0700 (PDT)
In-Reply-To: <001901cb33c6$b05542f0$10ffc8d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Wed, Aug 4, 2010 at 8:17 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> MyungJoo Ham wrote:
>>
>> =C2=A0 =C2=A0 =C2=A0 The CPUFREQ driver requires an access to DMCx r=
egisters. We
>> define physical addresses and mapping between physical and virtual
>> addresses of DMCx registers.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv210/cpu.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 12 +++++++++++-
>> =C2=A0arch/arm/mach-s5pv210/include/mach/map.h | =C2=A0 =C2=A04 ++++
>> =C2=A02 files changed, 15 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu=
=2Ec
>> index 74d4c08..2066695 100644
>> --- a/arch/arm/mach-s5pv210/cpu.c
>> +++ b/arch/arm/mach-s5pv210/cpu.c
>> @@ -60,7 +60,17 @@ static struct map_desc s5pv210_iodesc[] __initdat=
a =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5PV210_PA_SROMC),
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D SZ_4K,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D MT_DEVICE,
>> - =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D (unsigned long)S5P_VA_DMC0,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5PV210_PA_DMC0),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D SZ_4K,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D MT_DEVICE,
>> + =C2=A0 =C2=A0 }, {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .virtual =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D (unsigned long)S5P_VA_DMC1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pfn =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D __phys_to_pfn(S5PV210_PA_DMC1),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .length =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D SZ_4K,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D MT_DEVICE,
>> + =C2=A0 =C2=A0 },
>> =C2=A0};
>>
>> =C2=A0static void s5pv210_idle(void)
>> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mac=
h-
>> s5pv210/include/mach/map.h
>> index 17687f0..daf6456 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/map.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
>> @@ -108,4 +108,8 @@
>> =C2=A0#define SAMSUNG_PA_ADC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 S5PV210_PA_ADC
>> =C2=A0#define SAMSUNG_PA_KEYPAD =C2=A0 =C2=A0S5PV210_PA_KEYPAD
>>
>> +/* DMC */
>
> No need an obvious comment like above...
>
>> +#define S5PV210_PA_DMC0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(0xF0000000)
>> +#define S5PV210_PA_DMC1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(0xF1400000)
>
> As I said, if you need adding new definition into the mach/map.h, ple=
ase
> keep the address order like others.
> It can help to us for easily reading...


Umm.. where would be the in-order place for these two? The order of
addresses is already mixed up in this file and wherever these two go,
it cannot be "in-order". If we are going to reorder things in this
file, it should be done separately.

>
>> +
>> =C2=A0#endif /* __ASM_ARCH_MAP_H */
>> --
>
> And as I commented, to merge your 4th(previous, just adding VA) and 5=
th
> patch to one is better...just for adding DMC map IO.

Ok, will be done at v7.

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
>

ps. Anyway, sorry for the late reply, I've been away for a while.

--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
