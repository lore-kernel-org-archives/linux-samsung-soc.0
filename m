From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: Add driver to control CLKOUT line on
 Exynos SoCs
Date: Thu, 22 May 2014 12:30:42 +0200
Message-ID: <537DD1D2.9010107@samsung.com>
References: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
 <1400604211-9447-4-git-send-email-t.figa@samsung.com>
 <537D7CF4.6050305@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47073 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753774AbaEVKas (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 06:30:48 -0400
In-reply-to: <537D7CF4.6050305@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>

On 22.05.2014 06:28, Tushar Behera wrote:
> On 05/20/2014 10:13 PM, Tomasz Figa wrote:
>> This patch introduces a driver that handles configuration of CLKOUT pin
>> of Exynos SoCs that can be used to output certain clocks from inside of
>> the SoC to a dedicated output pin.
>>
>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>  .../devicetree/bindings/arm/samsung/pmu.txt        |  30 ++++
>>  drivers/clk/samsung/Makefile                       |   1 +
>>  drivers/clk/samsung/clk-exynos-clkout.c            | 153 +++++++++++++++++++++
>>  3 files changed, 184 insertions(+)
>>  create mode 100644 drivers/clk/samsung/clk-exynos-clkout.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> index b562634..5ed94a9 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> @@ -11,8 +11,38 @@ Properties:
>>  
>>   - reg : offset and length of the register set.
>>  
>> + - #clock-cells : must be <1>, since PMU requires once cell as clock specifier.
> 
> s/once/one
> 
>> +		The single specifier cell is used as index to list of clocks
>> +		provided by PMU, which is currently:
>> +			0 : SoC clock output (CLKOUT pin)
> 
> Will it make more sense if we add a macro for this clock number that
> would be referred in the device tree files?

Right now, with just one clock, it doesn't make sense, but if further
clocks show up with newer SoCs, then macros will have to be added.

Best regards,
Tomasz
