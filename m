From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Wed, 7 Sep 2016 10:08:35 +0200
Message-ID: <f0c14647-a21c-0c20-3fdd-4323cefc1469@osg.samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com>
 <CGME20160826183044epcas1p1335170a5e46d0432d97c415de293e8ac@epcas1p1.samsung.com>
 <0a6dffe0-8508-724e-c831-d14c32f8cd64@osg.samsung.com>
 <57C96297.1080704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57C96297.1080704@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, chanwoo@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Chanwoo,

On 09/02/2016 01:29 PM, Chanwoo Choi wrote:
> Hi Javier,
> 
> On 2016년 08월 27일 03:30, Javier Martinez Canillas wrote:
>> Hello Chanwoo,
>>

[snip]

>>> +
>>
>> I see that most of the following regulators are marked as always-on
>> but I wonder if this is really needed. For example some of them are
>> looked up by consumer devices.
>>
>> [snip]
>>
>>> +			};
>>> +
>>> +			ldo3_reg: LDO3 {
>>> +				regulator-name = "VDD1_E_1.8V_AP";
>>> +				regulator-min-microvolt = <1800000>;
>>> +				regulator-max-microvolt = <1800000>;
>>> +				regulator-always-on;
>>> +			};
>>
>> This is used by both the ADC and the TMU so I guess it should be safe
>> to not mark it as always-on (unless is used by other critical IP block
>> not described in the DT).
> 
> This regulator should be always ON state.
> This regulator provides the voltage to ALIVE domain of Exynos5433.
>

Ok, that's what I wanted to know since I don't have a schematics of this board.

Maybe add a comment explaining why should be always-on for all regulators that
need it?

[snip]

>>
>>> +
>>> +			buck2_reg: BUCK2 {
>>> +				regulator-name = "VDD_EGL_1.0V_AP";
>>
>> I wonder if this shouldn't be "VDD_ATL_1.0V_AP" or something since
>> the big cluster isn't called Eagle like in arm32 Exynos but Atlas?
> 
> I used the regulator's name according to TM2's schematic.
> As I knew, Eagle means the big cores.
>

I see, as I mentioned I don't have a TM2 schematic, but the Exynos5433 SoC
manual doesn't refer the big and LITTLE cores as Eagle and King Fisher but
as Atlas and Apollo.

In any case, I think that makes sense to match what is in the schematic so
I agree with you to use whatever is there regardless if matches the manual
or not.

>>
>>> +				regulator-min-microvolt = <900000>;
>>> +				regulator-max-microvolt = <1300000>;
>>> +				regulator-always-on;
>>> +				regulator-state-mem {
>>> +					regulator-off-in-suspend;
>>> +				};
>>> +			};
>>> +
>>> +			buck3_reg: BUCK3 {
>>> +				regulator-name = "VDD_KFC_1.0V_AP";
>>
>> Same, maybe using "VDD_APL_1.0V_AP" since the big cluster is Apollo?
> 
> ditto.
> The KFC (King Fisher) means the little cores.
>
>>
>>> +				regulator-min-microvolt = <800000>;
>>> +				regulator-max-microvolt = <1200000>;
>>> +				regulator-always-on;
>>> +				regulator-state-mem {
>>> +					regulator-off-in-suspend;
>>> +				};
>>> +			};
>>> +
>>
>> Used by the big and LITTLE clusters respectively, although for these two
>> I'm not that sure if it would be safe to remove the always-on property.
> 
>>
>> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> Thanks for your review.
> 
>>
>> [0]: http://www.spinics.net/lists/arm-kernel/msg419747.html
>>
>> Best regards,
>>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
