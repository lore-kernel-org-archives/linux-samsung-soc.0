From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/3] drivers: clk: add samsung common clock config option
Date: Mon, 10 Mar 2014 17:24:11 +0900
Message-ID: <531D76AB.2030401@samsung.com>
References: <1393392247-6247-1-git-send-email-pankaj.dubey@samsung.com>
 <1393392247-6247-2-git-send-email-pankaj.dubey@samsung.com>
 <531D0718.8000305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17162 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751873AbaCJIHq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 04:07:46 -0400
In-reply-to: <531D0718.8000305@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

Hi Tomasz,

On 03/10/2014 09:28 AM, Tomasz Figa wrote:
> Hi Pankaj,
>
> On 26.02.2014 06:24, Pankaj Dubey wrote:
>> add samsung common clock config option and let ARCH_EXYNOS or 
>> ARCH_S3CXXXX
>> select this if they want to use samsung common clock infrastructure.
>>
>> CC: Mike Turquette <mturquette@linaro.org>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   drivers/clk/Kconfig  |   10 ++++++++++
>>   drivers/clk/Makefile |    2 +-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 7641965..d93a325 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -23,6 +23,16 @@ config COMMON_CLK
>>   menu "Common Clock Framework"
>>       depends on COMMON_CLK
>>
>> +config COMMON_CLK_SAMSUNG
>> +    bool "Clock driver for Samsung SoCs"
>> +    depends on ARCH_S3C64XX || ARCH_S3C24XX || ARCH_EXYNOS || ARM64
>> +    ---help---
>> +          Supports clocking on Exynos SoCs:
>> +      - Exynos5250, Exynos5420 board.
>> +      - Exynos4 boards.
>> +      - S3C2412, S3C2416, S3C2466 boards.
>> +      - S3C64XX boards.
>
> I don't think listing the platforms here explicitly is a good idea, as 
> this option shouldn't generally be user-visible (related platforms 
> would not work without this option enabled) and adding support for 
> every new SoC would require changing the help string.
>
> I wonder if we really need this to be user-visible. What about moving 
> it out of this menu, making the symbol select COMMON_CLK and let the 
> platforms just select COMMON_CLK_SAMSUNG alone?
>
> Best regards,
> Tomasz
>

Thanks for review. I agree your point. In that case how about adding 
"drivers/clk/samsung/Kconfig" as below:

+config COMMON_CLK_SAMSUNG
+    bool
+    select COMMON_CLK
+
+config S3C2412_COMMON_CLK //These macros are introduced by Heiko's 
clock patches for S3C24XX SoC
+    bool
+    select COMMON_CLK_SAMSUNG
+
+config S3C2443_COMMON_CLK
+    bool
+    select COMMON_CLK_SAMSUNG

In this way we can get rid of clock related config options from 
"arch/arm/mach-s3c24xx/Kconfig" and in future
if any other old SoC such as S5P clocks getting converted to use common 
clock, they can add related config here rather
than arch/mach-xxx/Kconfig if required. Thus we can keep all common 
clock config option for Samsung SoC at one place.
All Exynos SOC can select only COMMON_CLK_SAMSUNG to use Samsung common 
clock infrastructure.

-- 
Best Regards,
Pankaj Dubey
