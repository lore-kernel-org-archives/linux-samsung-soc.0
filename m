From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/4] Add support for Exynos clock output configuration
Date: Tue, 08 Jul 2014 16:04:17 +0200
Message-ID: <53BBFA61.1030602@samsung.com>
References: <1403626107-12073-1-git-send-email-t.figa@samsung.com>
 <026001cf9061$5fef9d00$1fced700$@samsung.com>
 <20140703001452.7440.8476@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64628 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751610AbaGHOEw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:04:52 -0400
In-reply-to: <20140703001452.7440.8476@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Mark Brown' <broonie@kernel.org>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Daniel Drake' <drake@endlessm.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>

On 03.07.2014 02:14, Mike Turquette wrote:
> Quoting Kukjin Kim (2014-06-25 03:36:51)
>> Tomasz Figa wrote:
>>>
>> Hi Tomasz,
>>
>>> On all Exynos SoCs there is a dedicated CLKOUT pin that allows many of
>>> internal SoC clocks to be output from the SoC. The hardware structure
>>
>> Yeah, because the CLKOUT pin is used for measure of the clock for debug on all
>> of exynos SoCs commonly.
>>
>>> of CLKOUT related clocks looks as follows:
>>>
>>>       CMU     |---> clock0 ---------> |       PMU     |
>>>               |                       |               |
>>>     several   |---> clock1 ---------> |       mux     |
>>>     muxes     |                       |       +       |---> CLKOUT
>>>     dividers  |       ...             |       gate    |
>>>     and gates |                       |               |
>>>               |---> clockN ---------> |               |
>>>
>>> Since the block responsible for handling the pin is PMU, not CMU,
>>> a separate driver, that binds to PMU node is required and acquires
>>> all input clocks by standard DT clock look-up. This way we don't need
>>> any cross-IP block drivers and cross-driver register sharing or
>>> nodes for fake devices.
>>>
>> BTW, upcoming exynos5 SoCs have two muxs for CLKOUT and each mux is controlled
>> by CMU and PMU, so
>>
>> The mux1 for CLKOUT in CMU is used to decide which clock in each sub-domain
>> will be out and the mux2 in PMU is used to decide which sub-domain will be out
>> via CLKOUT. So I want you to consider of all of exynos SoCs including upcoming
>> SoCs.
> 
> clkout for debug is very useful indeed. For SoCs with high speed clocks
> that I have worked with, I have often observed that the clkout logic
> introduces buffers or dividers. This is needed so that you can get a
> (relatively) clean clock signal on your oscilloscope. Otherwise that
> 2GHz ARM clk is just going to be noise ;-)
> 
> These divider values can modeled in the clk framework. Do you know if
> you have such stuff on your chip?

I believe this is what I have already implemented in my series.

The final CLKOUT mux and gates are implemented by separate driver,
because they reside in another IP block, while per-domain CLKOUT
dividers along with muxes and gates are registered by normal SoC clock
driver, because they are part of the clock controller. See patch 2/4
adding the whole hierarchy for Exynos4 SoCs.

I don't have boards to test CLKOUT on Exynos5 SoCs, so they are up to
interested people.

Best regards,
Tomasz
