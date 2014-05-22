From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning
Date: Thu, 22 May 2014 08:59:22 +0530
Message-ID: <537D6F12.7000201@linaro.org>
References: <1399282008-9738-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHyFEb3hchLLndfqW1xOHD59d_bsFMA4k5MLJ8Hgpx7Ekw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:54761 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726AbaEVD32 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 23:29:28 -0400
Received: by mail-pa0-f42.google.com with SMTP id rd3so2047261pab.29
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 20:29:27 -0700 (PDT)
In-Reply-To: <CAK9yfHyFEb3hchLLndfqW1xOHD59d_bsFMA4k5MLJ8Hgpx7Ekw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh@kernel.org>

On 05/21/2014 04:56 PM, Sachin Kamat wrote:
> On 5 May 2014 14:56, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> of_get_flat_dt_prop return type is now const.
>> Fixes the following compilation warning introduced by commit 9d0c4df=
edd96
>> ("of/fdt: update of_get_flat_dt_prop in prep for libfdt")
>>
>> arch/arm/mach-exynos/exynos.c:259:6: warning:
>> assignment discards =91const=92 qualifier from pointer target type [=
enabled by default]
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>
>> ---

Change looks good.

Reviewed-by: Tushar Behera <tushar.behera@linaro.org>

>> Based on linux-next (20140505)
>> ---
>>  arch/arm/mach-exynos/exynos.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/ex=
ynos.c
>> index 77293d39dfc9..f356c67a1fa9 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -249,7 +249,7 @@ static int __init exynos_fdt_map_chipid(unsigned=
 long node, const char *uname,
>>                                         int depth, void *data)
>>  {
>>         struct map_desc iodesc;
>> -       __be32 *reg;
>> +       const __be32 *reg;
>>         int len;
>>
>>         if (!of_flat_dt_is_compatible(node, "samsung,exynos4210-chip=
id") &&
>> --
>> 1.7.9.5
>>
>=20
> Ping. This warning is still seen in latest linux-next.
>=20


--=20
Tushar Behera
