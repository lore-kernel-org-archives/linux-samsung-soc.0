From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: Enable HDMI audio on Snow Chromebook
Date: Fri, 09 Mar 2018 16:09:47 +0100
Message-ID: <7be21210-edc4-bfa7-6e77-ee23fae141da@samsung.com>
References: <CGME20180308162609epcas1p45458c1671c38b389e047f17804690eb9@epcas1p4.samsung.com>
        <20180307172711.15697-4-s.nawrocki@samsung.com>
        <20180308162559.391-1-s.nawrocki@samsung.com>
        <CAJKOXPemC09mmjt9AKa9Qfhy14=CdUampi3=x957=NNEzq7LqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJKOXPemC09mmjt9AKa9Qfhy14=CdUampi3=x957=NNEzq7LqQ@mail.gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/09/2018 02:01 PM, Krzysztof Kozlowski wrote:
>> diff --git a/arch/arm/boot/dts/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> index bdf59dd3654b..932a00cfd716 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/clock/maxim,max77686.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/sound/samsung-i2s.h>
>>  #include "exynos5250.dtsi"
>>
>>  / {
>> @@ -523,6 +524,9 @@
>>  };
>>
>>  &i2s0 {
>> +       assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
>> +       assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
>> +       #clock-cells = <1>;
>
> Shouldn't this be property of exynos5250.dtsi? Along with clock-output-names?

Hmm, it should be safe to move it there. By specifying this property or not
we can control whether the I2S clocks are exposed or not. If we move it to 
exynos5250.dtsi the clocks we always be exposed. But should be the right thing
to do anyway. I will post v3.

Of course we recently made the clock-output-names property deprecated, it will
not bee needed any more. It was there just to ensure the clk names are unique.

-- 
Regards,
Sylwester
