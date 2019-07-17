From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v1 43/50] ARM: dts: exynos: add bus_isp in Exynos5422
Date: Wed, 17 Jul 2019 12:12:08 +0200
Message-ID: <c3c2ed20-fe6b-b395-001f-7319c72741ce@partner.samsung.com>
References: <CGME20190715124509eucas1p1f2e44af951158fbef1a245467956ef93@eucas1p1.samsung.com>
        <20190715124417.4787-1-l.luba@partner.samsung.com>
        <20190715124417.4787-44-l.luba@partner.samsung.com>
        <CAJKOXPcsH9YRzLOA1P5xc0Y3Zqh9+5o0RSxP-JcYOVEm7eO0Sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcsH9YRzLOA1P5xc0Y3Zqh9+5o0RSxP-JcYOVEm7eO0Sw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


On 7/17/19 12:02 PM, Krzysztof Kozlowski wrote:
> On Mon, 15 Jul 2019 at 14:45, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> Add bus_isp which changes ACLK400_ISP clock speed according to the bus
>> documentation in the documentation. The bus_isp OPP table has been
>> aligned to the new parent rate.
> 
> Title and msg needs fixing.
> 
> Please squash it with patch 18.
You are right, it needs to be squashed. As I mentioned earlier Barek
suggested offline to make 'atomic modifications' of OPPs and PLL/clocks
rates for all affected children in the clock tree.

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
>> This patch sets the proper parent and
>> picks the init frequency before the devfreq governor starts working.
>> It sets also parent rate (DPLL to 1200MHz).
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> index 990fe03fce75..852cb3dd495d 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> @@ -166,6 +166,18 @@
>>          status = "okay";
>>   };
>>
>> +&bus_isp {
>> +       devfreq = <&bus_wcore>;
>> +       assigned-clocks = <&clock CLK_MOUT_ACLK400_ISP>,
>> +                         <&clock CLK_MOUT_SW_ACLK400_ISP>,
>> +                         <&clock CLK_DOUT_ACLK400_ISP>,
>> +                         <&clock CLK_FOUT_DPLL>;
>> +       assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>,
>> +                                <&clock CLK_DOUT_ACLK400_ISP>;
>> +       assigned-clock-rates = <0>, <0>, <400000000>, <1200000000>;
>> +       status = "okay";
>> +};
>> +
>>   &cpu0 {
>>          cpu-supply = <&buck6_reg>;
>>   };
>> --
>> 2.17.1
>>
> 
> 
