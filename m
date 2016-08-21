From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: exynos: Add dts file for Exynos5433-based
 TM2 board
Date: Sun, 21 Aug 2016 16:46:42 +0900
Message-ID: <CAGTfZH0kqwJhZBh_trnK4JstpkVdyHSr6frvdVq4Z=Pxzzp0Ww@mail.gmail.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471329328-26842-2-git-send-email-cw00.choi@samsung.com> <0aba7694-e5fc-47be-dce6-06f64fb3759d@samsung.com>
Reply-To: chanwoo@kernel.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0aba7694-e5fc-47be-dce6-06f64fb3759d@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, krzk@kernel.org, "jh80.chung@samsung.com" <jh80.chung@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, jy0922.shim@samsung.com, "inki.dae@samsung.com" <inki.dae@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, "ideal.song@samsung.com" <ideal.song@samsung.com>, ingi2.kim@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

2016-08-20 2:05 GMT+09:00 Sylwester Nawrocki <s.nawrocki@samsung.com>:
> On 08/16/2016 08:35 AM, Chanwoo Choi wrote:
>> &spi_1 {
>> +     cs-gpios = <&gpd6 3 GPIO_ACTIVE_HIGH>;
>> +     status = "okay";
>> +
>> +     wm5110: wm5110-codec@0 {
>> +             compatible = "wlf,wm5110";
>> +             reg = <0x0>;
>> +             spi-max-frequency = <20000000>;
>> +             interrupt-parent = <&gpa0>;
>> +             interrupts = <4 0 0>;
>> +             clocks = <&xxti>, <&s2mps13_osc 2>;
>
> The first clock needs to be CLKOUT, i.e.
>
>         clocks = <&pmu_system_controller 0>, <&s2mps13_osc 2>;
>

OK.

-- 
Best Regards,
Chanwoo Choi
