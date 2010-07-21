From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3 3/7] ARM: S5P: Added default pll values for APLL
	800/1000MHz
Date: Wed, 21 Jul 2010 10:28:11 +0900
Message-ID: <AANLkTilnj1-2HqIkgMAsheaSck-OSfoFmNqg2BVO2vnA@mail.gmail.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-3-git-send-email-myungjoo.ham@samsung.com>
	<1279517483-22751-4-git-send-email-myungjoo.ham@samsung.com>
	<4C464154.1010709@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54172 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761771Ab0GUB2S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jul 2010 21:28:18 -0400
Received: by iwn7 with SMTP id 7so6280552iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Jul 2010 18:28:12 -0700 (PDT)
In-Reply-To: <4C464154.1010709@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Wed, Jul 21, 2010 at 9:37 AM, Ben Dooks <ben@simtec.co.uk> wrote:
> On 07/19/10 06:31, MyungJoo Ham wrote:
>>
>> CPUFREQ of S5PV210 uses different APLL settings and we provide
>> such values for CPUFREQ at pll.h. We have been using differently
>> between EVT0 and EVT1 machines. Although this version of kernel
>> assumes that the CPU is EVT1, users may use code for EVT0 later.
>>
>> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
>> ARMCLK, APLL should be 800MHz.
>>
>> Signed-off-by: MyungJoo Ham<myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>> ---
>> =C2=A0arch/arm/plat-s5p/include/plat/pll.h | =C2=A0 =C2=A08 ++++++++
>> =C2=A01 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
>> b/arch/arm/plat-s5p/include/plat/pll.h
>> index 7db3227..679e0d3 100644
>> --- a/arch/arm/plat-s5p/include/plat/pll.h
>> +++ b/arch/arm/plat-s5p/include/plat/pll.h
>> @@ -21,6 +21,14 @@
>>
>> =C2=A0#include<asm/div64.h>
>>
>> +#ifdef CONFIG_S5PC110_EVT0_WORKAROUND
>> +#define PLL45XX_APLL_VAL_1000 =C2=A0((1<< =C2=A031) | (0xfa<<16) | =
(0x6<<8) |
>> (0x1))
>> +#define PLL45XX_APLL_VAL_800 =C2=A0 ((1<< =C2=A031) | (0xc8<<16) | =
(0x6<<8) |
>> (0x1))
>> +#else
>> +#define PLL45XX_APLL_VAL_1000 =C2=A0((1<< =C2=A031) | (125<<16) | (=
3<<8) | (1))
>> +#define PLL45XX_APLL_VAL_800 =C2=A0 ((1<< =C2=A031) | (100<<16) | (=
3<<8) | (1))
>> +#endif
>> +
>> =C2=A0enum pll45xx_type_t {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_4500,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pll_4502,
>
> yuck. can we detect EVT0 and have these as variables that get
> set depending on detection?
>

I'm considering to use a variable, "cpu_revision" defined at cpu.c.

Unfortunately, this cpu revision or EVT number CANNOT be read directly
from the CPU (EVT0 vs 1 is not in PRO_ID register), but can be read
from board information, which is going to make it look a bit ugly.
However, I believe this would look better than using #ifdef.


--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
