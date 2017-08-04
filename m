From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Add HDMI and Sil9234 to Trats2 board
Date: Fri, 4 Aug 2017 08:44:08 +0200
Message-ID: <CAJKOXPdooPEOFHzvuiwkKjy6pqOZKZY-nPhXLpg8za9M_4N9ag@mail.gmail.com>
References: <1501746323-5254-1-git-send-email-m.purski@samsung.com>
 <CGME20170803074541eucas1p2b054d4853a98819fc42f19f7cae7f419@eucas1p2.samsung.com>
 <1501746323-5254-3-git-send-email-m.purski@samsung.com> <20170803192000.trgfndzj4b3bnisc@kozik-lap>
 <aa50cb82-29be-acfc-32b4-7f2a64266d8a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751269AbdHDGoJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Aug 2017 02:44:09 -0400
In-Reply-To: <aa50cb82-29be-acfc-32b4-7f2a64266d8a@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maciej Purski <m.purski@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>

On Fri, Aug 4, 2017 at 8:32 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
>
> On 2017-08-03 21:20, Krzysztof Kozlowski wrote:
>>
>> On Thu, Aug 03, 2017 at 09:45:23AM +0200, Maciej Purski wrote:
>>>
>>> This patch adds HDMI and Sil9234 MHL converter to Trats2 board.
>>
>> Just "Add HDMI...", without this patch.
>>
>> Except few minor nitpicks below, looks good. After fixing I will take it
>> once bindings got accepted.
>>
>>> Based on previous work by:
>>> Tomasz Stanislawski <t.stanislaws@samsung.com>
>>>
>>> Signed-off-by: Maciej Purski <m.purski@samsung.com>
>>> ---
>>>   arch/arm/boot/dts/exynos4412-trats2.dts | 93 +++++++++++++++++++++++++++++++++
>>>   1 file changed, 93 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
>>> index 35e9b94..39940f6 100644
>>> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
>>> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
>>> @@ -97,6 +97,16 @@
>>>                         gpio = <&gpj0 5 GPIO_ACTIVE_HIGH>;
>>>                         enable-active-high;
>>>                 };
>>> +
>>> +               vsil: voltage-regulator-vsil {
>>> +                       compatible = "regulator-fixed";
>>> +                       regulator-name = "HDMI_5V";
>>> +                       regulator-min-microvolt = <5000000>;
>>> +                       regulator-max-microvolt = <5000000>;
>>> +                       gpio = <&gpl0 4 GPIO_ACTIVE_HIGH>;
>>> +                       enable-active-high;
>>> +                       vin-supply = <&buck7_reg>;
>>
>> I think the supply is V_BAT, not buck7.
>
>
> Well, according to the the schematic, VSIL is derived from VCC_SUB_2.0V
> (buck7) by the RP114K121D-TR chip, which is controlled by gpl0-4 (HDMI_EN)
> pin.
> The only thing that has to be fixed is the voltage value for that regulator.
> VSIL is 1.2V and regulator-name should be adjusted too. The HDMI_V5 name
> and voltage value seems to be copy/paste error done long time ago...
>

OK, thanks for explanation.

(...)

>>
>> Could you describe more what is on i2c_5 and i2c_8? Is it relevant to
>> this patch?
>
>
> Yes. i2c_5 is used for HDMI DDC and i2c_8 is used for HDMI_PHY. None of
> the other exynos*.dts, which enable HDMI has any comment on them...

Actually now I see that this information can be get from the source
(see i2c_8 in exyos4.dtsi and here i2c_5 is used in hdmi node as ddc).
Still it would be nice to see this information for example in commit
message.

Best regards,
Krzysztof

>
>
>>> +
>>>   &i2c_7 {
>>>         samsung,i2c-sda-delay = <100>;
>>>         samsung,i2c-slave-addr = <0x10>;
>>> @@ -894,12 +962,20 @@
>>>         };
>>>   };
>>>   +&i2c_8 {
>>> +       status = "okay";
>>> +};
>>> +
>>>   &i2s0 {
>>>         pinctrl-0 = <&i2s0_bus>;
>>>         pinctrl-names = "default";
>>>         status = "okay";
>>>   };
>>>   +&mixer {
>>> +       status = "okay";
>>> +};
>>> +
>>>   &mshc_0 {
>>>         num-slots = <1>;
>>>         broken-cd;
>>> @@ -926,6 +1002,18 @@
>>>         pinctrl-names = "default";
>>>         pinctrl-0 = <&sleep0>;
>>>   +     mhl_int: mhl-int {
>>> +               samsung,pins = "gpf3-5";
>>> +               samsung,pin-pud = <0>;
>>
>> Please use defines from dt-bindings/pinctrl/samsung.h
>>
>>> +       };
>>> +
>>> +       i2c_mhl_bus: i2c-mhl-bus {
>>> +               samsung,pins = "gpf0-4", "gpf0-6";
>>> +               samsung,pin-function = <2>;
>>> +               samsung,pin-pud = <1>;
>>> +               samsung,pin-drv = <0>;
>>
>> The same.
>>
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
