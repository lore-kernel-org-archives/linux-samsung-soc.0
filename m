From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3 7/7] ARM: S5PV210: Initial CPUFREQ Support
Date: Tue, 20 Jul 2010 16:00:10 +0900
Message-ID: <AANLkTincP954dBuRIN8KwiQPo1CDkykRKv1vIMFYcnyo@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-3-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-5-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-6-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-7-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-8-git-send-email-myungjoo.ham@samsung.com>
	<006301cb27a3$bd8d55e0$38a801a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:40295 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753248Ab0GTHAR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 03:00:17 -0400
Received: by iwn7 with SMTP id 7so5481648iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jul 2010 00:00:16 -0700 (PDT)
In-Reply-To: <006301cb27a3$bd8d55e0$38a801a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Tue, Jul 20, 2010 at 9:37 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> S5PV210 CPUFREQ Support.
>>
>> This CPUFREQ may work without PMIC's DVS support. However, it is not
>> as effective without DVS support as supposed. AVS is not supported i=
n
>> this version.
>>
>> Note that CLK_SRC of some clocks including ARMCLK, G3D, G2D, MFC,
>> and ONEDRAM are modified directly without updating clksrc_src
>> representations of the clocks. =C2=A0Because CPUFREQ reverts the CLK=
_SRC
>> to the supposed values, this does not affect the consistency as long=
 as
>> there are no other modules that modifies clock sources of ARMCLK, G3=
D,
>> G2D, MFC, and ONEDRAM (and only CPUFREQ should have the control). As
>> soon as clock framework is settled, we may update source clocks
>> (.parent field) of those clocks accordingly later.
>>
> As you know memory composition such as mDDR, (mDDR, OneDRAM), DDR2 an=
d so on
> differs in MCP type of each S5PC110, and single type of S5PV210.
> So basically, this code can available only for some S5PC110 MCP types=
=2E..only
> some machines.
> It means can occur problem on some boards...if you use ARCH dependenc=
y
> configuration...
> And need to add comment about tested boards.

Although selecting "ARCH_HAS_CPUFREQ" does not make choosing
ARCH_S5PV210 depend on CPUFREQ as it does NOT turn on CPUFREQ
automatically or forcibly, do you think we need to block being able to
turn on CPUFREQ if it is not one of the test boards?

However, in the next patch version, I'm going to use the memory clock
setting values set before initializing cpufreq so that we have no
compatibility issues on memory configurations.

>
>>

(snip)

>> +
>> +# CPUFREQ (DVFS)
>
> No need above comment.

should be fixed.

>
>> +obj-$(CONFIG_CPU_FREQ) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D cpufreq-s5pv210.o
>
> As I said, should be having machine dependency configuration...

going to remove memory-configuration dependency...

>
>> diff --git a/arch/arm/mach-s5pv210/cpufreq-s5pv210.c b/arch/arm/mach=
-
>> s5pv210/cpufreq-s5pv210.c
>> new file mode 100644
>> index 0000000..38de3ac
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/cpufreq-s5pv210.c
>
> 'cpufreq.c' is enough.

fine.

>
>> @@ -0,0 +1,766 @@
>> +/* =C2=A0linux/arch/arm/plat-s5pc11x/s5pc11x-cpufreq.c
>
> Please correct above comment.

sure.

>
>> + *

(snip)

>> +#ifdef CONFIG_S5PC110_EVT0_WORKAROUND
>
> As I said, please don't add EVT0 code in here.
>

Um.. then, what you want to do is to branch to the WORKAROUND codes in
run-time (based on the board-specific setting), not in compile-time?

(snip)

>> +#if defined(CONFIG_S5PC110_H_TYPE)
>
> Where is S5PC110_H_TYPE?
> Please don't add not available code in here.

will remove every H_TYPE.

>

(snip)

>> + =C2=A0 =C2=A0 mpu_clk =3D clk_get(NULL, MPU_CLK);
>
> Just use 'armclk' instead of MPU_CLK definition...
>

Yes.

(snip)

>> +
>> +#ifndef _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_
>> +#define _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_
>
> How about __ASM_ARCH_CPU_FREQ_H ?

=46ine.

>
>> +
>> +#include <linux/cpufreq.h>
>> +
>> +#ifdef CONFIG_CPU_S5PV210
>
> Do we really need above #ifdef?

Not really. I'll remove it.

>
>> +
>> +#define USE_FREQ_TABLE
>> +
>> +#define KHZ_T =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1000
>
> Already said about that.
>
>> +
>> +#define MPU_CLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 "armclk"
>
> Already said about that...
>
>> +
>> +enum perf_level {
>> + =C2=A0 =C2=A0 L0 =3D 0,
>> + =C2=A0 =C2=A0 L1,
>> + =C2=A0 =C2=A0 L2,
>> + =C2=A0 =C2=A0 L3,
>> + =C2=A0 =C2=A0 L4,
>> +};
>> +
>> +/* APLL,HCLK_MSYS,PCLK_MSYS mask value */
>> +#define CLK_DIV0_MASK =C2=A0 ((0x7<<0)|(0x7<<8)|(0x7<<12))
>
> Here is right?

=46ound that it's no more needed. I'll get rid of it.

>
>> +
>> +#ifdef CONFIG_PM
>> +#define SLEEP_FREQ =C2=A0 =C2=A0 =C2=A0(800 * 1000) /* Use 800MHz w=
hen entering sleep */
>> +
>> +/* additional symantics for "relation" in cpufreq with pm */
>> +#define DISABLE_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x10
>> +#define ENABLE_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
20
>> +#define MASK_FURTHER_CPUFREQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x30
>> +/* With 0x00(NOCHANGE), it depends on the previous "further" status=
 */
>> +
>> +#endif
>> +
>> +
>
> 1 empty line is enough...
>
>> +#endif /* CONFIG_CPU_S5PV210 */
>> +#endif /* _ARCH_ARM_MACH_S5PV210_INCLUDE_MACH_CPU_FREQ_H_ */
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



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
