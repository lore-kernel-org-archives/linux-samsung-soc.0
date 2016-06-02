From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: Add watchdog amd Security SubSystem
 to Exynos5410
Date: Thu, 02 Jun 2016 08:18:26 +0200
Message-ID: <574FCFB2.1080607@samsung.com>
References: <1464774351-23604-1-git-send-email-k.kozlowski@samsung.com>
 <1464774351-23604-3-git-send-email-k.kozlowski@samsung.com>
 <f7e99aad-f773-27c6-d554-ba30bc54b5f7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40313 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824AbcFBGSc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 02:18:32 -0400
In-reply-to: <f7e99aad-f773-27c6-d554-ba30bc54b5f7@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 06/01/2016 05:16 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 06/01/2016 05:45 AM, Krzysztof Kozlowski wrote:
>> Move watchdog and Security SubSystem nodes from exynos5420.dtsi to file
>> shared with Exynos5410 and configure the clocks on the latter.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> ---
> 
> [snip]
> 
>>  
>> +&sss {
>> +	clocks = <&clock CLK_SSS>;
>> +	clock-names = "secss";
>> +};
>> +
> 
> [snip]
> 
>>  
>> +&watchdog {
>> +	clocks = <&clock CLK_WDT>;
>> +	clock-names = "watchdog";
>> +	samsung,syscon-phandle = <&pmu_system_controller>;
>> +};
>> +
> 
> Since you used the same ID than Exynos5420 for the SSS and WDT clocks,
> I wonder if the clock and clock-names shouldn't be just defined in the
> shared exynos54xx.dtsi as is the case for the interrupts that are also
> the same?
> 
> The patch looks good to me though, so whatever you decide:
> 
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Thanks for review and comments.

The 'clock' property cannot be moved - there is no clock phandle and the
clock IDs are not included in 54xx.

Best regards,
Krzysztof
