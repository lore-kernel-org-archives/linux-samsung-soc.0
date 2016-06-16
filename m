From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 5/5] ARM: config: Get rid of config COMMON_CLK_MAX77802
Date: Thu, 16 Jun 2016 09:06:29 -0400
Message-ID: <ef0359c5-ecf2-cd31-4dd8-ed4f169c22be@osg.samsung.com>
References: <1466000018-16784-1-git-send-email-ldewangan@nvidia.com>
 <1466000018-16784-6-git-send-email-ldewangan@nvidia.com>
 <3fa0a098-3b28-9baa-8950-a944cce86b65@osg.samsung.com>
 <57629AB9.2090506@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:37792 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753992AbcFPNGo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 09:06:44 -0400
In-Reply-To: <57629AB9.2090506@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, mturquette@baylibre.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>

Hello Krzysztof,

On 06/16/2016 08:25 AM, Krzysztof Kozlowski wrote:
> On 06/15/2016 05:39 PM, Javier Martinez Canillas wrote:
>> Hello Laxman,
>>
>> On 06/15/2016 10:13 AM, Laxman Dewangan wrote:
>>> The clock driver used by Maxim PMIC MAX77802 is clk-max77686
>>> which can be enabled with config CONFIG_COMMON_CLK_MAX77686.
>>>
>>> Hence the config CONFIG_COMMON_CLK_MAX77802 is not required.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>>> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> CC: Javier Martinez Canillas <javier@dowhile0.org>
>>> ---
>>>  arch/arm/configs/exynos_defconfig   | 1 -
>>>  arch/arm/configs/multi_v7_defconfig | 1 -
>>
>> Please split these two changes in separate patches, there are just
>> cleanups needed after 1/5 and they can be picked separately.
> 
> Not entirely separately. If we do not want to loose max77802 clocks on
> defconfigs, then it should go with the same tree or after driver get
> merged. I prefer the latter, similar case to 1898994229f8 ("ARM:
> multi_v7_defconfig: Switch max77693 to module").
>

Agreed. Your latter example is what I tried to say (that can be picked
as cleanups separately once 1/5 hits mainline). I just didn't express
clearly.
 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
