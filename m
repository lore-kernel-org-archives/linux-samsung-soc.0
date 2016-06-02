From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add watchdog amd Security SubSystem
 to Exynos5410
Date: Thu, 2 Jun 2016 09:27:28 -0400
Message-ID: <057fb9e8-002a-0aac-a36d-ef074ab2111e@osg.samsung.com>
References: <1464774351-23604-1-git-send-email-k.kozlowski@samsung.com>
 <1464774351-23604-3-git-send-email-k.kozlowski@samsung.com>
 <f7e99aad-f773-27c6-d554-ba30bc54b5f7@osg.samsung.com>
 <574FCFB2.1080607@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <574FCFB2.1080607@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 06/02/2016 02:18 AM, Krzysztof Kozlowski wrote:
> On 06/01/2016 05:16 PM, Javier Martinez Canillas wrote:

[snip]

>>>  
>>> +&watchdog {
>>> +	clocks = <&clock CLK_WDT>;
>>> +	clock-names = "watchdog";
>>> +	samsung,syscon-phandle = <&pmu_system_controller>;
>>> +};
>>> +
>>
>> Since you used the same ID than Exynos5420 for the SSS and WDT clocks,
>> I wonder if the clock and clock-names shouldn't be just defined in the
>> shared exynos54xx.dtsi as is the case for the interrupts that are also
>> the same?
>>
>> The patch looks good to me though, so whatever you decide:
>>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Thanks for review and comments.
> 
> The 'clock' property cannot be moved - there is no clock phandle and the
> clock IDs are not included in 54xx.
>

You are right, I missed that. Thanks a lot for the clarification.

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
