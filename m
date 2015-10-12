From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm: dts: Fix audio card detection on peach boards
Date: Mon, 12 Oct 2015 17:44:27 +0530
Message-ID: <561BA423.6050009@samsung.com>
References: <1444631169-19468-1-git-send-email-alim.akhtar@samsung.com>
 <561B578E.1050308@samsung.com> <561B7AFF.1080707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <561B7AFF.1080707@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org, devicetree@vger.kernel.org, dianders@chromium.org, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 10/12/2015 02:48 PM, Sylwester Nawrocki wrote:
> On 12/10/15 08:47, Krzysztof Kozlowski wrote:
>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> index 8f4d76c..525a93a 100644
>>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>>> @@ -1056,5 +1056,10 @@
>>>>   	timeout-sec = <32>;
>>>>   };
>>>>
>>>> +&pmu_system_controller {
>>
>> Please put the node in alphabetical order.
>>
>>>> +	assigned-clocks = <&pmu_system_controller 0>;
>>>> +	assigned-clock-parents =  <&clock CLK_FIN_PLL>;
>>
>> I might be missing something here but isn't the first clock of
>> pmu_system_controller already a CLK_FIN_PLL? So you are reparenting the
>> FIN_PLL to FIN_PLL?
>
> No, it's not, the first PMU consumer clock is indeed CLK_FIN_PLL,
> but pmu_system_controller is also a clock provider.  The first output
> clock of pmu_system_controller is CLKOUT, it's a composite mux and
> gate clock (registered in drivers/clk/samsung /clk-exynos-clkout.c).
> So  the above dts change is selecting an external oscillator input of
> the CLKOUT mux, i.e. it will route 24 MHz clock signal from the external
> oscillator to the CLKOUT output pin, to which audio CODEC is connected
> on peach-pit AFAICS.
>
Thanks for your explanation, indeed master clock of codec is
connected to XCLKOUT on peach boards.
Will send v2 addressing Kezysztof's other comments.

Regards,
Alim
