From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/6] ARM: dts: exynos: Interrupt for USB DWC3-1 differs
 between Exynos5420 and 5410
Date: Tue, 31 May 2016 21:26:43 +0200
Message-ID: <CAJKOXPf204zCUaWm48TbGhPiehpxjQ6F-F-tc+ZtYOesmoaPww@mail.gmail.com>
References: <1464719945-3417-1-git-send-email-krzk@kernel.org>
	<1464719945-3417-3-git-send-email-krzk@kernel.org>
	<fca224e1-af8c-5540-d47a-9f05e494b2c4@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <fca224e1-af8c-5540-d47a-9f05e494b2c4@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, May 31, 2016 at 9:01 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Krzysztof,
>
> On 05/31/2016 02:39 PM, Krzysztof Kozlowski wrote:
>> On Exynos5410 the SPI interrupt for second USB DWC3 (called DRD: Dual
>> Role Device) is different - 200 instead of 73.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  arch/arm/boot/dts/exynos5410.dtsi | 4 ++++
>>  arch/arm/boot/dts/exynos5420.dtsi | 4 ++++
>>  arch/arm/boot/dts/exynos54xx.dtsi | 1 -
>>  3 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
>> index a937d9bdad90..994d16a44fe4 100644
>> --- a/arch/arm/boot/dts/exynos5410.dtsi
>> +++ b/arch/arm/boot/dts/exynos5410.dtsi
>> @@ -267,6 +267,10 @@
>>       clock-names = "usbdrd30";
>>  };
>>
>> +&usbdrd_dwc3_1 {
>> +     interrupts = <0 200 0>;
>
> Please use GIC_SPI from <dt-bindings/interrupt-controller/arm-gic.h> instead 0.
>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Sure, thanks for feedback.

Krzysztof
