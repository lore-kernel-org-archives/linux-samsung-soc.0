From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 27/27] ARM: dts: exynos: Add RTC and I2C to Exynos5410
Date: Wed, 11 May 2016 14:54:18 +0200
Message-ID: <57332B7A.5070909@kernel.org>
References: <1462910970-1812-1-git-send-email-krzk@kernel.org>
 <1462910970-1812-28-git-send-email-krzk@kernel.org>
 <b1f47282-f70e-4354-9146-9b4b27ba1726@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:32628 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923AbcEKMyX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 08:54:23 -0400
In-reply-to: <b1f47282-f70e-4354-9146-9b4b27ba1726@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>

On 05/11/2016 02:44 PM, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 05/10/2016 04:09 PM, Krzysztof Kozlowski wrote:
>> Configure Exynos5410-specific properties of RTC, I2C and HSI2C nodes.
>> This still does not enable them on the board level though.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  arch/arm/boot/dts/exynos5410.dtsi | 66 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
>> index dd4d6d752865..ae64cb0a8efd 100644
>> --- a/arch/arm/boot/dts/exynos5410.dtsi
>> +++ b/arch/arm/boot/dts/exynos5410.dtsi
>> @@ -114,6 +114,9 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		/* i2c_0-3 are defined in exynos5.dtsi */
>> +		/* hsi2c_4-7 are defined in exynos5xx.dtsi */
>> +
> 
> I don't think these comments are needed. For each DTS, there are usually a lot of
> nodes defined in higher levels of the DT hierarchy but isn't common to mention it.
> 
> Specially since the mentioned nodes are referenced here by their labels so it is
> implicit that are defined in one of the included DTSI (or dtc will fail to build).

Okay, if it does not make sense to you then I'll remove them.

Thanks for review!
Krzysztof
