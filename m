From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 0/4] ARM: dts: exynos3250: Add UART2 and MMC2 dt node with
 related clocks
Date: Mon, 17 Aug 2015 09:36:03 +0900
Message-ID: <55D12C73.6090101@samsung.com>
References: <1439264784-30322-1-git-send-email-cw00.choi@samsung.com>
 <CAJKOXPfvGypFymHzXDMEA295Copi0sjpMG9oKmJ+a_BQoK+SNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58800 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752897AbbHQAgH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Aug 2015 20:36:07 -0400
In-reply-to: <CAJKOXPfvGypFymHzXDMEA295Copi0sjpMG9oKmJ+a_BQoK+SNw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com, kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 08/17/2015 09:33 AM, Krzysztof Kozlowski wrote:
> 2015-08-11 12:46 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
>> This patch add the UART2 / MMC2 devicetree node for Exynos3250 SoC and add
>> the related clocks (mux, divider, gate) of UART2 / MMC2 device.
> 
> What is the benefit of adding them? Why they are needed?

UART2 /MMC2 are used on Exynos3250-based ARTIK-5 board[1].
[1] https://www.artik.io/hardware/artik-5

Thanks,
Chanwoo Choi

> 
> Best regards,
> Krzysztof
> 
> 
>>
>> Chanwoo Choi (4):
>>   clk: samsung: exynos3250: Add UART2 clock
>>   clk: samsung: exynos3250: Add MMC2 clock
>>   ARM: dts: Add UART2 dt node for Exynos3250 SoC
>>   ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
>>
>>  arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 42 +++++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/exynos3250.dtsi         | 25 ++++++++++++++++++
>>  drivers/clk/samsung/clk-exynos3250.c      | 15 +++++++++++
>>  include/dt-bindings/clock/exynos3250.h    | 11 +++++++-
>>  4 files changed, 92 insertions(+), 1 deletion(-)
>>
>> --
>> 1.8.5.5
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
