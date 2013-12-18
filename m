From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Wed, 18 Dec 2013 19:43:06 +0100
Message-ID: <CA+Ln22F9nA-NECJjmnPqw6x1rWzJW0Mff4_1z+7XLCBv0JGNvg@mail.gmail.com>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
	<085901cedf91$4b24d4c0$e16e7e40$@org>
	<CAL1wa8fnu-xUu3SZ+e1SMB0ci5n8wenDgbr4L9TGS+NH8qpS2w@mail.gmail.com>
	<CAK9yfHyRu3WSkQOZKYMgsaWKcvVfNySptQhd91kX2eAdd-A+2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:40104 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754930Ab3LRSnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:43:08 -0500
In-Reply-To: <CAK9yfHyRu3WSkQOZKYMgsaWKcvVfNySptQhd91kX2eAdd-A+2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Leela Krishna Amudala <leelakrishna.a@gmail.com>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hi Sachin,

2013/11/13 Sachin Kamat <sachin.kamat@linaro.org>:
> Hi Leela,
>
> Thanks for the detailed explanation.
>
> On 12 November 2013 17:20, Leela Krishna Amudala
> <leelakrishna.a@gmail.com> wrote:
>> Hi Sachin,
>>
>> On Tue, Nov 12, 2013 at 3:53 PM, Kukjin Kim <kgene@kernel.org> wrote:
>>> Sachin Kamat wrote:
>>>>
>>>
>>> Following is more clear?
>>>
>>> "ARM: dts: Add missing GPIO entries for sd_bus_width4 in exynos5420-pinctrl"
>>>
>>>> Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.
>>>>
>>
>> This is not a missing stuff, I did this purposefully.
>> Myself and Doug anderson discussed on this and the objective of doing this is to
>> eliminate the gpio pin configuration multiple times.
>>
>> Please see the below explanation
>>
>> The current code in main line kernel shows like
>>                sd0_bus1: sd0-bus-width1 {
>>                        samsung,pins = "gpc0-3";
>>                  };
>>
>>                sd0_bus4: sd0-bus-width4 {
>>                        samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
>>                };
>>
>>                sd0_bus8: sd0-bus-width8 {
>>                        samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
>>                };
>>
>> and lets mmc wants to use 8 bit width then node should be like below
>>
>> dwmmc0@12200000 {
>>                 [snip]
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
>>
>> Here it will configure all the 8 pins ("gpc0-3", "gpc0-4", "gpc0-5",
>> "gpc0-6", "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3")
>>
>>                 slot@0 {
>>                         reg = <0>;
>>                         bus-width = <8>;
>>                 };
>>         };
>>
>> Similarly for using 1 bit width the property value should be like below
>>                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1>;
>>
>> and if other mmc wants to use 4 bit width the property value should be
>> like below
>>                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4>;
>>
>> But with the changes you made and if one mmc wants to use 1 bit width
>> and other wants to use 4 bit width
>> the pin "gpc0-3" will be configured twice which is wrong.
>
> I think this is the case with current code too.
>
> From your above example, for 2 slots:
> For 1 bit width: pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1>;
> "gpc0-3"
>
> For 4 bit width: pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4>;
> "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6"

No, this way you will have gpc0-3 in two groups - sd0_bus1 and sd0_bus4,
which probably won't even work as the pinctrl subsystem probably doesn't
allow claiming one pin twice.

>
>
>> So, I strongly feel it is better to change the existing mmc node
>> instead of changing the "sd0_bus" entries
>
> I think this is already taken care of in the mmc nodes.
> For slot with bus-width of 8,
> pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;
>
> Similarly for slot with bus width of 4,
> pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;

This is inconsistent:
- for 1-bit bus you would have to specify just sdX_bus1,
- for 4-bit just sdX_bus4, but
- for 8-bit you need to specify both sdX_bus4 and sdX_bus8.

The change Leela mentioned was about making this consistent,
so you need to always specify all possible working widths on
given board.

Other Exynos SoCs should be changed to use the same
convention as well.

Best regards,
Tomasz
