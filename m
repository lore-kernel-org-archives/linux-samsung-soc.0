From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH V5 5/5] ARM: exynos: Enable l2 configuration through
 device tree
Date: Thu, 5 Jan 2012 11:56:44 +0530
Message-ID: <CAK44p206AS_F_2JJx2CXfzQmFZVPYhAUTSA9GgofTovg7v294A@mail.gmail.com>
References: <1325737525-12869-1-git-send-email-amit.kachhap@linaro.org>
	<1325737525-12869-6-git-send-email-amit.kachhap@linaro.org>
	<CAOesGMjb5no9o0kwiVm87XM8Q5QsMWdXhAypCmJMi7npy1fnSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f53.google.com ([209.85.216.53]:58229 "EHLO
	mail-qw0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab2AEG0p convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Jan 2012 01:26:45 -0500
Received: by qadb15 with SMTP id b15so172891qad.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jan 2012 22:26:45 -0800 (PST)
In-Reply-To: <CAOesGMjb5no9o0kwiVm87XM8Q5QsMWdXhAypCmJMi7npy1fnSA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 5 January 2012 10:06, Olof Johansson <olof@lixom.net> wrote:
> On Wed, Jan 4, 2012 at 8:25 PM, Amit Daniel Kachhap
> <amit.kachhap@linaro.org> wrote:
>> This patch enables calling generic l2 setup functions if device tree=
 is used.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/common.c | =A0 14 ++++++++++++--
>> =A01 files changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/co=
mmon.c
>> index f8bb808..e91b92d 100644
>> --- a/arch/arm/mach-exynos/common.c
>> +++ b/arch/arm/mach-exynos/common.c
>> @@ -47,6 +47,8 @@
>> =A0#include <plat/regs-serial.h>
>>
>> =A0#include "common.h"
>> +#define L2_AUX_VAL 0x7C470001
>> +#define L2_AUX_MASK 0xC200ffff
>>
>> =A0static const char name_exynos4210[] =3D "EXYNOS4210";
>> =A0static const char name_exynos4212[] =3D "EXYNOS4212";
>> @@ -453,6 +455,15 @@ core_initcall(exynos4_core_init);
>> =A0#ifdef CONFIG_CACHE_L2X0
>> =A0static int __init exynos4_l2x0_cache_init(void)
>> =A0{
>> +#ifdef CONFIG_OF
>> + =A0 =A0 =A0 int ret;
>> + =A0 =A0 =A0 ret =3D l2x0_of_init(L2_AUX_VAL, L2_AUX_MASK);
>> + =A0 =A0 =A0 if (!ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 l2x0_regs_phys =3D virt_to_phys(&l2x0_=
saved_regs);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clean_dcache_area(&l2x0_regs_phys, siz=
eof(unsigned long));
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> + =A0 =A0 =A0 }
>> +#endif
>
> No need for ifdef here, if CONFIG_OF is off, then there's a static
> inline version of l2x_of_init() that will return -ENODEV.

Will accept your suggestion. Thanks

>
>
> -Olof
