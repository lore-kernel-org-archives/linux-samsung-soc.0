From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH 08/11] arm: dts: exynos: Add parents and
 #interconnect-cells to Exynos4412
Date: Mon, 29 Jul 2019 10:20:44 +0900
Message-ID: <64416ab4-855e-2bb6-199c-64086663a29f@samsung.com>
References: <CGME20190723122027eucas1p24b1d76e3139f7cc52614d7613ff9ba98@eucas1p2.samsung.com>
        <20190723122016.30279-1-a.swigon@partner.samsung.com>
        <20190723122016.30279-9-a.swigon@partner.samsung.com>
        <CAGTfZH1_Qk+vNa_AJW_8OA8MJbnZa3yCTLLRs2w23bNTm72gyQ@mail.gmail.com>
        <cc4c48c3-06a5-c58f-20de-0aa18ae8667e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cc4c48c3-06a5-c58f-20de-0aa18ae8667e@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, cwchoi00@gmail.com, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, inki.dae@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 7. 26. 오후 9:02, Marek Szyprowski wrote:
> Hi
> 
> On 2019-07-25 15:13, Chanwoo Choi wrote:
>> 2019년 7월 24일 (수) 오전 8:07, Artur Świgoń <a.swigon@partner.samsung.com>님이 작성:
>>> This patch adds two fields tp the Exynos4412 DTS:
>>>    - parent: to declare connections between nodes that are not in a
>>>      parent-child relation in devfreq;
>>>    - #interconnect-cells: required by the interconnect framework.
>>>
>>> Please note that #interconnect-cells is always zero and node IDs are not
>>> hardcoded anywhere.
>>>
>>> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
>>>   arch/arm/boot/dts/exynos4412.dtsi               | 9 +++++++++
>>>   2 files changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> index ea55f377d17c..bdd61ae86103 100644
>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> @@ -106,6 +106,7 @@
>>>   &bus_leftbus {
>>>          devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
>>>          vdd-supply = <&buck3_reg>;
>>> +       parent = <&bus_dmc>;
>> It is wrong. 'bus_leftbus' has not any h/w dependency of 'bus_dmc'
>> and 'bus_leftbus' is not child of 'bus_dmc'.
>>
>> Even it there are some PMQoS requirement between them,
>> it it not proper to tie both 'bus_leftbus' and 'bus_dmc'.
> 
> There is strict dependency between them. DMC bus running at frequency 
> lower than left (or right) bus really doesn't make much sense, because 
> it will limit the left bus performance. This dependency should be 
> modeled somehow.

I misunderstood new 'parent' prototype as the existing 'devfreq' property.
I didn't understand why use the 'devfreq' property because 'bus_dmc' and
'bus_leftbus' don't share the power line. Please ignore my previous comment.

Basically, I agree that it is necessary to support the QoS requirement
between buses or if possible, between bus and gpu.

To support the interconnect between bus_dmc, bus_leftbus and bus_display,
it used the either 'devfreq' or 'parent' properties to connect them.

In order to catch the meaning of 'devfreq' and 'parent' properties,
If possible, it would be separate the usage role of between 'devfreq'
or 'parent' properties. Because it is possible to connect the 'buses'
with only using 'parent' property if all buses in the path uses
the devfreq governors except for 'passive' governor.

- If 'devfreq' property is used between buses,
  it indicates that there are requirement of shading of power line.
- If 'parent' property is used between buses,
  it indicates that there are requirement of interconnect connection.

> 
>>>          status = "okay";
>>>   };
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
>>> index d20db2dfe8e2..a70a671acacd 100644
>>> --- a/arch/arm/boot/dts/exynos4412.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412.dtsi
>>> @@ -390,6 +390,7 @@
>>>                          clocks = <&clock CLK_DIV_DMC>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_dmc_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -398,6 +399,7 @@
>>>                          clocks = <&clock CLK_DIV_ACP>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_acp_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -406,6 +408,7 @@
>>>                          clocks = <&clock CLK_DIV_C2C>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_dmc_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -459,6 +462,7 @@
>>>                          clocks = <&clock CLK_DIV_GDL>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_leftbus_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -467,6 +471,7 @@
>>>                          clocks = <&clock CLK_DIV_GDR>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_leftbus_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -475,6 +480,7 @@
>>>                          clocks = <&clock CLK_ACLK160>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_display_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -483,6 +489,7 @@
>>>                          clocks = <&clock CLK_ACLK133>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_fsys_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -491,6 +498,7 @@
>>>                          clocks = <&clock CLK_ACLK100>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_peri_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> @@ -499,6 +507,7 @@
>>>                          clocks = <&clock CLK_SCLK_MFC>;
>>>                          clock-names = "bus";
>>>                          operating-points-v2 = <&bus_leftbus_opp_table>;
>>> +                       #interconnect-cells = <0>;
>>>                          status = "disabled";
>>>                  };
>>>
>>> --
>>> 2.17.1
>>>
>>
> Best regards
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
