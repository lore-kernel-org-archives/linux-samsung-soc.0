From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v3 6/6] ARM: dts: exynos4: Add missing unit-address of
 sysreg node
Date: Wed, 18 Dec 2013 19:36:14 +0100
Message-ID: <CA+Ln22Eia=m7EgifE+szALwfzKntsKJOizoCZereV4GWQhBonw@mail.gmail.com>
References: <1386864738-19829-1-git-send-email-t.figa@samsung.com>
	<1386864738-19829-7-git-send-email-t.figa@samsung.com>
	<52B1E838.4030304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:60999 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753427Ab3LRSgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:36:15 -0500
In-Reply-To: <52B1E838.4030304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>

Hi Kukjin,

2013/12/18 Kukjin Kim <kgene.kim@samsung.com>:
> On 12/13/13 01:12, Tomasz Figa wrote:
>>
>> The node contains reg property, so unit-address suffix should be present
>> in its name.
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>> Acked-by: Kyungmin Park<kyungmin.park@samsung.com>
>> Reviewed-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi
>> b/arch/arm/boot/dts/exynos4.dtsi
>> index 4fed2ad..ee173fe 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -99,7 +99,7 @@
>>                 reg =<0x10440000 0x1000>;
>>         };
>>
>> -       sys_reg: sysreg {
>> +       sys_reg: sysreg@10010000 {
>>                 compatible = "samsung,exynos4-sysreg", "syscon";
>>                 reg =<0x10010000 0x400>;
>>         };
>
>
> Tomasz, I already Sachin's patch for similar changing of sys_reg property
> with your reviewed tag.
>
> ARM: dts: Fix sysreg node name in exynos4.dtsi
>
> I've applied whole this series except this one.
> If any problems, please kindly let me know.

Oh, I checked if this isn't already fixed when posting this series and
I couldn't
find any related patch. I guess it was posted quite a while ago.

Anyway, it's fine for me, thanks.

Best regards,
Tomasz
