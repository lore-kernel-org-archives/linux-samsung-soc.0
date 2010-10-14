From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH V2 1/2] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Thu, 14 Oct 2010 14:29:33 +0900
Message-ID: <AANLkTimKNBfDpz_3E4z6MHV7V1Ht9Yobf6qbGMxyWWAy@mail.gmail.com>
References: <1286868876-3748-1-git-send-email-sbkim73@samsung.com>
	<1286868876-3748-2-git-send-email-sbkim73@samsung.com>
	<006601cb6b60$0a0e4190$1e2ac4b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52035 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513Ab0JNF3f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 01:29:35 -0400
Received: by wyb28 with SMTP id 28so1773193wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2010 22:29:34 -0700 (PDT)
In-Reply-To: <006601cb6b60$0a0e4190$1e2ac4b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

On Thu, Oct 14, 2010 at 2:24 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Sangbeom Kim wrote:
>>
>> From: Jongpill Lee <boyko.lee@samsung.com>
>>
>> This patch adds initial map for GPIO2 and GPIO3.
>> S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
>>
>> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
>> ---
>> Changes since v1:
>> - Rebased on latest for-next from Kukjin Kim's git tree
>> - Added S5P_VA_GPIO1 according to S5PV310_PA_GPIO1
>>
>> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 12 +=
++++++++++-
>> =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A03 +++
>> =A02 files changed, 14 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu=
=2Ec
>> index 3345cf6..ffed262 100644
>> --- a/arch/arm/mach-s5pv310/cpu.c
>> +++ b/arch/arm/mach-s5pv310/cpu.c
>> @@ -57,11 +57,21 @@ static struct map_desc s5pv310_iodesc[] __initda=
ta =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 }, {
>> - =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_GPIO,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_GPIO1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(S5PV310_PA_GPIO1),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> =A0 =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_GPIO2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_to_=
pfn(S5PV310_PA_GPIO2),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned long=
)S5P_VA_GPIO3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_to_=
pfn(S5PV310_PA_GPIO3),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_256K,
Why 256K?
>> + =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE,
>> + =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lo=
ng)S5P_VA_DMC0,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(S5PV310_PA_DMC0),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_4K,
>> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/pla=
t-
>> s5p/include/plat/map-s5p.h
>> index ec96a19..fef353d 100644
>> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
>> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
>> @@ -16,6 +16,9 @@
>> =A0#define S5P_VA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x0=
2000000)
>> =A0#define S5P_VA_CMU =A0 =A0 =A0 =A0 =A0 S3C_ADDR(0x02100000)
>> =A0#define S5P_VA_GPIO =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x02200000)
>> +#define S5P_VA_GPIO1 =A0 =A0 =A0 =A0 S5P_VA_GPIO
>> +#define S5P_VA_GPIO2 =A0 =A0 =A0 =A0 S3C_ADDR(0x02240000)
>> +#define S5P_VA_GPIO3 =A0 =A0 =A0 =A0 S3C_ADDR(0x02280000)
>>
>> =A0#define S5P_VA_SYSRAM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x0=
2400000)
>> =A0#define S5P_VA_DMC0 =A0 =A0 =A0 =A0 =A0S3C_ADDR(0x02440000)
>> --
>
> Looks ok to me...will apply.
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
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
