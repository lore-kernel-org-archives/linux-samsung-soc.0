From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: Fix sysreg node name in exynos4.dtsi
Date: Mon, 2 Dec 2013 09:51:34 +0530
Message-ID: <CAK9yfHxdbuNxb9xJfjPC7SjHHgGyOvfb72bMxOyd5bPT=BioDA@mail.gmail.com>
References: <1383632302-23535-1-git-send-email-sachin.kamat@linaro.org>
	<086301cedf93$a9f6bf70$fde43e50$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:43389 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752702Ab3LBEVi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Dec 2013 23:21:38 -0500
Received: by mail-ob0-f181.google.com with SMTP id uy5so11972903obc.26
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Dec 2013 20:21:38 -0800 (PST)
In-Reply-To: <086301cedf93$a9f6bf70$fde43e50$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 12 November 2013 16:10, Kukjin Kim <kgene@kernel.org> wrote:
> Sachin Kamat wrote:
>>
>> Fix the name as per DT node naming convention.
>> - rename the node to syscon which is a more generic name.
>> - append the register value to the node name.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>> Changes since v2:
>> None.
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index cb0f70cc552b..b7378154c0a1 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -99,7 +99,7 @@
>>               reg = <0x10440000 0x1000>;
>>       };
>>
>> -     sys_reg: sysreg {
>> +     sys_reg: syscon@10010000 {
>>               compatible = "samsung,exynos4-sysreg", "syscon";
>>               reg = <0x10010000 0x400>;
>>       };
>> --
>> 1.7.9.5
>
> Looks good to me, thanks for this patch and reviews from Sylwester and
> Tomasz.
>
> Applied.

Kukjin,

I don't see these patches in your tree yet. Please check.


-- 
With warm regards,
Sachin
