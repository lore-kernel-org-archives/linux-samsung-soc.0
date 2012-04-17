From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 07/12] ARM: Exynos5: Modify the GIC physical address for
 static io-mapping
Date: Tue, 17 Apr 2012 13:49:09 +0530
Message-ID: <CAJuYYwT9_qqJMM6hpaFwve9L6Pjtq23WTWR3QwVzs+jtLdfOkw@mail.gmail.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
	<1334641595-25301-8-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2Wxz3a5O-a-MfnPZph6HjdSSpVzzhkbCcsZQRaXebWZBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:45859 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755015Ab2DQITK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 04:19:10 -0400
Received: by vcqp1 with SMTP id p1so3896178vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 01:19:09 -0700 (PDT)
In-Reply-To: <CAH9JG2Wxz3a5O-a-MfnPZph6HjdSSpVzzhkbCcsZQRaXebWZBQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org

On 17 April 2012 12:01, Kyungmin Park <kmpark@infradead.org> wrote:
> Hi,
>
> On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> From: Changhwan Youn <chaos.youn@samsung.com>
>>
>> Adapt to changes in GIC physical address in rev1 of Exynos5.
>
> Does it different from rev0 and rev1? and does it support the rev1 on=
ly?

The physical base address of CPU and distributor portions of GIC are
different on Rev0 and Rev1.0. This patch series overrides Rev0 and
hence the mainline will support only Rev1.0. If the support for Rev0
should also be maintained (if there are users of it), then I can
maintain the support for Rev0 also.

Thanks,
Thomas.

>
> Thank you,
> Kyungmin Park
>>
>> Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos/common.c =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++--
>> =A0arch/arm/mach-exynos/include/mach/map.h | =A0 =A04 ++--
>> =A02 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/co=
mmon.c
>> index 35ac675..457d031 100644
>> --- a/arch/arm/mach-exynos/common.c
>> +++ b/arch/arm/mach-exynos/common.c
>> @@ -265,12 +265,12 @@ static struct map_desc exynos5_iodesc[] __init=
data =3D {
>> =A0 =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lo=
ng)S5P_VA_GIC_CPU,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(EXYNOS5_PA_GIC_CPU),
>> - =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_8K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lo=
ng)S5P_VA_GIC_DIST,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(EXYNOS5_PA_GIC_DIST),
>> - =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 },
>> =A0};
>> diff --git a/arch/arm/mach-exynos/include/mach/map.h
>> b/arch/arm/mach-exynos/include/mach/map.h
>> index 0e2292d..648d59b 100644
>> --- a/arch/arm/mach-exynos/include/mach/map.h
>> +++ b/arch/arm/mach-exynos/include/mach/map.h
>> @@ -78,8 +78,8 @@
>>
>> =A0#define EXYNOS4_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 0x10480000
>> =A0#define EXYNOS4_PA_GIC_DIST =A0 =A0 =A0 =A0 =A00x10490000
>> -#define EXYNOS5_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 0x10480000
>> -#define EXYNOS5_PA_GIC_DIST =A0 =A0 =A0 =A0 =A00x10490000
>> +#define EXYNOS5_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 0x10482000
>> +#define EXYNOS5_PA_GIC_DIST =A0 =A0 =A0 =A0 =A00x10481000
>>
>> =A0#define EXYNOS4_PA_COREPERI =A0 =A0 =A0 =A0 =A00x10500000
>> =A0#define EXYNOS4_PA_TWD =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 0x10500600
>> --
>> 1.6.6.rc2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
