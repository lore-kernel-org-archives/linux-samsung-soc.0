From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v5 1/7] ARM: S5PV210: Allow to probe EVT revision number.
Date: Mon, 2 Aug 2010 21:37:59 +0900
Message-ID: <AANLkTik0uD40j7kBEyv8VGOMPR5o-pKRZ1chmRwSb_Wr@mail.gmail.com>
References: <1280399145-22761-1-git-send-email-myungjoo.ham@samsung.com>
	<1280399145-22761-2-git-send-email-myungjoo.ham@samsung.com>
	<018001cb31ea$158c84f0$40a58ed0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60948 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753003Ab0HBMiA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 08:38:00 -0400
Received: by iwn7 with SMTP id 7so4144639iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Aug 2010 05:38:00 -0700 (PDT)
In-Reply-To: <018001cb31ea$158c84f0$40a58ed0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Mon, Aug 2, 2010 at 11:26 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> Early products of S5PV210, EVT0, had several errata that require
>> kernel to avoid using some parts/instructions of the CPU or to
>> add protection instructions. There are products with such early
>> production CPUs; thus, we want to distinguish them in kernel.
>> This patch is to distinguish such products.
>>
>> Include <mach/hardware.h> and call s5pv210_revision().
>>
>> For example,
>>
>> =C2=A0 =C2=A0 =C2=A0 if (s5pv210_revision(EVT0)) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ... execute code ta=
rgeted only to EVT0 ...
>> =C2=A0 =C2=A0 =C2=A0 } else {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ... execute normal =
code ...
>> =C2=A0 =C2=A0 =C2=A0 }
>>
>> Call set_s5pv210_revision(EVTx) when the EVT revision number can be
>> identified. We have EVT0, EVT1, and EVT1-Fused avaialble right now a=
nd
>> only EVT1-Fused has the unique revision number at chipid (PRO_ID
>> register). A function, get_s5pv210_revision_chipid(), returns EVT
>> revision number if the revision is identified by the chipid; otherwi=
se,
>> the function returns EVT_UNKNOWN. When EVT cannot be identified with
>> chipid, it can be identified at board support file
>> (arch/arm/mach-s5pv210/mach-*.c), not at the cpu file
>> (arch/arm/mach-s5pv210/cpu.c).
>>
>> For Aquila machine. (mach-aquila.c)
>>
>> Part of Aquila machines have the early production CPUs that require
>> to address errata issues. Note that we don't do this for GONI machin=
es
>> because they have never used early production CPUs with errata. Besi=
des,
>> please note that there are other boards that use such early produces
>> other than Aquila. However, those boards/machines are not registered=
 at
>> the /linux/arch/arm/tools/mach-types, yet; thus, we have omitted the=
m
>> in this patch.
>>
>> For Goni machine. (mach-goni.c)
>>
>> It's either EVT1 or EVT1-Fused; thus, it can be identified by
>> get_s5pv210_revision_chipid() function.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> --
>> v5:
>> =C2=A0 =C2=A0 =C2=A0 - rename revision check function.
>> =C2=A0 =C2=A0 =C2=A0 - revise revision check functions so that it do=
es not access
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 board-related information.
>> =C2=A0 =C2=A0 =C2=A0 - chipid is used to identify EVT revision.
>> =C2=A0 =C2=A0 =C2=A0 - added "s5pv210_revision_or_later()" function
>> ---
>> =C2=A0arch/arm/mach-s5pv210/cpu.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 29
>> +++++++++++++++++++++++++
>> =C2=A0arch/arm/mach-s5pv210/include/mach/hardware.h | =C2=A0 19 ++++=
+++++++++++-
>> =C2=A0arch/arm/mach-s5pv210/mach-aquila.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 14 ++++++++++++
>> =C2=A0arch/arm/mach-s5pv210/mach-goni.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A08 +++++++
>> =C2=A04 files changed, 69 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu=
=2Ec
>> index 94c632b..77bf37d 100644
>> --- a/arch/arm/mach-s5pv210/cpu.c
>> +++ b/arch/arm/mach-s5pv210/cpu.c
>> @@ -24,9 +24,11 @@
>> =C2=A0#include <asm/mach/map.h>
>> =C2=A0#include <asm/mach/irq.h>
>>
>> +#include <asm/mach-types.h>
>> =C2=A0#include <asm/proc-fns.h>
>> =C2=A0#include <mach/map.h>
>> =C2=A0#include <mach/regs-clock.h>
>> +#include <mach/hardware.h>
>>
>> =C2=A0#include <plat/cpu.h>
>> =C2=A0#include <plat/devs.h>
>> @@ -128,6 +130,33 @@ static struct sys_device s5pv210_sysdev =3D {
>> =C2=A0 =C2=A0 =C2=A0 .cls =C2=A0 =C2=A0=3D &s5pv210_sysclass,
>> =C2=A0};
>>
>> +static enum s5pv210_revision s5pv210_evt_number =3D EVT_UNKNOWN;
>> +
>> +bool s5pv210_revision(enum s5pv210_revision rev)
>> +{
>> + =C2=A0 =C2=A0 return rev =3D=3D s5pv210_evt_number;
>> +}
>> +
>> +bool s5pv210_revision_or_later(enum s5pv210_revision rev)
>> +{
>> + =C2=A0 =C2=A0 return rev >=3D s5pv210_evt_number;
>> +}
>> +
>> +void set_s5pv210_revision(enum s5pv210_revision rev)
>> +{
>> + =C2=A0 =C2=A0 s5pv210_evt_number =3D rev;
>> +}
>> +
>> +enum s5pv210_revision get_s5pv210_revision_chipid(void)
>> +{
>> + =C2=A0 =C2=A0 unsigned int reg =3D __raw_readl(S5P_VA_CHIPID);
>> +
>> + =C2=A0 =C2=A0 if ((reg & 0xf0) =3D=3D 0x20)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EVT1_FUSED;
>> +
>> + =C2=A0 =C2=A0 return EVT_UNKNOWN;
>> +}
>> +
>> =C2=A0static int __init s5pv210_core_init(void)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 return sysdev_class_register(&s5pv210_sysclass)=
;
>> diff --git a/arch/arm/mach-s5pv210/include/mach/hardware.h
> b/arch/arm/mach-
>> s5pv210/include/mach/hardware.h
>> index fada7a3..c1702d6 100644
>> --- a/arch/arm/mach-s5pv210/include/mach/hardware.h
>> +++ b/arch/arm/mach-s5pv210/include/mach/hardware.h
>> @@ -13,6 +13,23 @@
>> =C2=A0#ifndef __ASM_ARCH_HARDWARE_H
>> =C2=A0#define __ASM_ARCH_HARDWARE_H __FILE__
>>
>> -/* currently nothing here, placeholder */
>> +enum s5pv210_revision { EVT_UNKNOWN =3D 0,
>> + =C2=A0 =C2=A0 EVT0,
>> + =C2=A0 =C2=A0 EVT1,
>> + =C2=A0 =C2=A0 EVT1_FUSED };
>
> Do we really need checking of 'EVT1_FUSED' in kernel?

Um.. so far, we don't have cases that require FUSED mode separated. I
have added EVT1_FUSED for "future-use". However, it appears that
EVT1_FUSED is not going to affect the kernel-level codes and I think
we may get rid of it for the efficiency.

>
>> +
>> +extern bool s5pv210_revision(enum s5pv210_revision);
>> +extern bool s5pv210_revision_or_later(enum s5pv210_revision);
>> +extern void set_s5pv210_revision(enum s5pv210_revision);
>> +
>> +/*
>> + * get_s5pv210_revision_chipid returns s5pv210_revision if the
>> + * EVT revision can be determined by the chipid(PRO_ID) register.
>> + * However, note that only EVT1-FUSED can be identified from it and
>> + * it cannot distinguish between EVT0 and EVT1. In such case, it
>> + * returns EVT_UNKNOWN. In such case use set_s5pv210_revision() to
>> + * set the revision number manually.
>> + */
>> +extern enum s5pv210_revision get_s5pv210_revision_chipid(void);
>>
>> =C2=A0#endif /* __ASM_ARCH_HARDWARE_H */
>> diff --git a/arch/arm/mach-s5pv210/mach-aquila.c
> b/arch/arm/mach-s5pv210/mach-
>> aquila.c
>> index 46d5c7e..25f45d1 100644
>> --- a/arch/arm/mach-s5pv210/mach-aquila.c
>> +++ b/arch/arm/mach-s5pv210/mach-aquila.c
>> @@ -30,6 +30,7 @@
>> =C2=A0#include <mach/regs-clock.h>
>> =C2=A0#include <mach/regs-fb.h>
>> =C2=A0#include <mach/gpio.h>
>> +#include <mach/hardware.h>
>>
>> =C2=A0#include <plat/gpio-cfg.h>
>> =C2=A0#include <plat/regs-serial.h>
>> @@ -536,6 +537,19 @@ static void __init aquila_map_io(void)
>>
>> =C2=A0static void __init aquila_machine_init(void)
>> =C2=A0{
>> + =C2=A0 =C2=A0 enum s5pv210_revision cpurev =3D get_s5pv210_revisio=
n_chipid();
>> +
>> + =C2=A0 =C2=A0 /* CPU Revision (EVTx) */
>> + =C2=A0 =C2=A0 if (cpurev =3D=3D EVT_UNKNOWN) {
>
> If don't need 'EVT1_FUSED', maybe just need to check system_rev.
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpurev =3D EVT1;
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (system_rev & 0x0800)=
 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((system_rev & 0xF) < 8)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpurev =3D EVT0;
>
> ...
>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (system_rev & =
0x2000)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cpurev =3D EVT0;
>
> ...
>
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 set_s5pv210_revision(cpurev);
>> +
>> =C2=A0 =C2=A0 =C2=A0 /* PMIC */
>> =C2=A0 =C2=A0 =C2=A0 aquila_pmic_init();
>> =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(AP_I2C_GPIO_PMIC_BUS_4,
>> i2c_gpio_pmic_devs,
>> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-
>> goni.c
>> index 380d2ae..25a26ed 100644
>> --- a/arch/arm/mach-s5pv210/mach-goni.c
>> +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> @@ -32,6 +32,7 @@
>> =C2=A0#include <mach/regs-clock.h>
>> =C2=A0#include <mach/regs-fb.h>
>> =C2=A0#include <mach/gpio.h>
>> +#include <mach/hardware.h>
>>
>> =C2=A0#include <plat/gpio-cfg.h>
>> =C2=A0#include <plat/regs-serial.h>
>> @@ -520,6 +521,13 @@ static void __init goni_map_io(void)
>>
>> =C2=A0static void __init goni_machine_init(void)
>> =C2=A0{
>> + =C2=A0 =C2=A0 enum s5pv210_revision cpurev =3D get_s5pv210_revisio=
n_chipid();
>> +
>> + =C2=A0 =C2=A0 /* CPU Revision (EVTx) */
>> + =C2=A0 =C2=A0 if (cpurev =3D=3D EVT_UNKNOWN)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpurev =3D EVT1;
>
> is it available only EVT1 on GONI?
>
>> + =C2=A0 =C2=A0 set_s5pv210_revision(cpurev);
>> +
>> =C2=A0 =C2=A0 =C2=A0 /* PMIC */
>> =C2=A0 =C2=A0 =C2=A0 goni_pmic_init();
>> =C2=A0 =C2=A0 =C2=A0 i2c_register_board_info(AP_I2C_GPIO_PMIC_BUS_4,
>> i2c_gpio_pmic_devs,
>> --
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
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
