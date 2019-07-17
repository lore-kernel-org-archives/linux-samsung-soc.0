From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v1 37/50] ARM: dts: exynos: change parent and rate of
 bus_fsys in Exynos5422
Date: Wed, 17 Jul 2019 12:38:58 +0200
Message-ID: <2fe2e840-f4b2-773b-7d92-4ffb8502d4e6@partner.samsung.com>
References: <CGME20190715124504eucas1p1afe0da2c6ac3a8b45d85017a77ba9edf@eucas1p1.samsung.com>
        <20190715124417.4787-1-l.luba@partner.samsung.com>
        <20190715124417.4787-38-l.luba@partner.samsung.com>
        <CAJKOXPfrGgAczQ-=1aE453RpJ9BN10ZDmFcrEMPkNyF6GcGtNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfrGgAczQ-=1aE453RpJ9BN10ZDmFcrEMPkNyF6GcGtNA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org



On 7/17/19 12:25 PM, Krzysztof Kozlowski wrote:
> On Mon, 15 Jul 2019 at 14:45, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> The FSYS bus OPP table has been aligned to the new parent rate. This patch
>> sets the proper parent and picks the init frequency before the devfreq
>> governor starts working. It sets also parent rate (DPLL to 1200MHz).
> 
> 1. I see what the patch is doing, but please write why you are doing
> this. What problem are you solving here?
> 2. Commit title is wrong - it is not Exynos 5422 but Odroid XU3/XU4
> family of boards.
OK, I will rewrite it when during the work on squashing the patches.
> 
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> index d460041f716c..6a82dd175b8a 100644
>> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
>> @@ -72,6 +72,11 @@
>>
>>   &bus_fsys {
>>          devfreq = <&bus_wcore>;
>> +       assigned-clocks = <&clock CLK_MOUT_ACLK200_FSYS>,
>> +                         <&clock CLK_DOUT_ACLK200_FSYS>,
>> +                         <&clock CLK_FOUT_DPLL>;
>> +       assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>;
>> +       assigned-clock-rates = <0>, <240000000>,<1200000000>;
> 
> Here and in all other patches:
> I am not entirely sure that this should be here. It looks like
> property of the SoC. Do we expect that buses will be configured to
> different clock rates between different boards? Since the OPP tables
> are shared (they are property of the SoC, not board) then I would
> assume that default frequency is shared as well.
These clocks they all relay on some bootloader configuration. It depends
which version of the bootloader you have, then you might get different
default configuration in the clocks. The pattern of changing the parent
or even rate is known in the DT files (or I am missing something).
When you grep for it, you get 168 hits (38 for exynos*):
git grep -n "assigned-clock-rates" ./arch/arm/boot/dts/ | wc -l

Regards,
Lukasz

> 
> Best regards,
> Krzysztof
> 
> 
