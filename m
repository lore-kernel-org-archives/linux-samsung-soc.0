From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add missing GPIO entries for sd_bus in
Date: Wed, 13 Nov 2013 10:08:32 +0530
Message-ID: <CAK9yfHyRu3WSkQOZKYMgsaWKcvVfNySptQhd91kX2eAdd-A+2Q@mail.gmail.com>
References: <1382700168-12527-1-git-send-email-sachin.kamat@linaro.org>
	<085901cedf91$4b24d4c0$e16e7e40$@org>
	<CAL1wa8fnu-xUu3SZ+e1SMB0ci5n8wenDgbr4L9TGS+NH8qpS2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:42605 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757705Ab3KMEid (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 23:38:33 -0500
Received: by mail-ob0-f174.google.com with SMTP id uy5so4959364obc.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Nov 2013 20:38:32 -0800 (PST)
In-Reply-To: <CAL1wa8fnu-xUu3SZ+e1SMB0ci5n8wenDgbr4L9TGS+NH8qpS2w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <leelakrishna.a@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tushar Behera <tushar.behera@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hi Leela,

Thanks for the detailed explanation.

On 12 November 2013 17:20, Leela Krishna Amudala
<leelakrishna.a@gmail.com> wrote:
> Hi Sachin,
>
> On Tue, Nov 12, 2013 at 3:53 PM, Kukjin Kim <kgene@kernel.org> wrote:
>> Sachin Kamat wrote:
>>>
>>
>> Following is more clear?
>>
>> "ARM: dts: Add missing GPIO entries for sd_bus_width4 in exynos5420-pinctrl"
>>
>>> Adds missing GPIO entries for sd_bus nodes in exynos5420-pinctrl.
>>>
>
> This is not a missing stuff, I did this purposefully.
> Myself and Doug anderson discussed on this and the objective of doing this is to
> eliminate the gpio pin configuration multiple times.
>
> Please see the below explanation
>
> The current code in main line kernel shows like
>                sd0_bus1: sd0-bus-width1 {
>                        samsung,pins = "gpc0-3";
>                  };
>
>                sd0_bus4: sd0-bus-width4 {
>                        samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
>                };
>
>                sd0_bus8: sd0-bus-width8 {
>                        samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
>                };
>
> and lets mmc wants to use 8 bit width then node should be like below
>
> dwmmc0@12200000 {
>                 [snip]
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;
>
> Here it will configure all the 8 pins ("gpc0-3", "gpc0-4", "gpc0-5",
> "gpc0-6", "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3")
>
>                 slot@0 {
>                         reg = <0>;
>                         bus-width = <8>;
>                 };
>         };
>
> Similarly for using 1 bit width the property value should be like below
>                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1>;
>
> and if other mmc wants to use 4 bit width the property value should be
> like below
>                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4>;
>
> But with the changes you made and if one mmc wants to use 1 bit width
> and other wants to use 4 bit width
> the pin "gpc0-3" will be configured twice which is wrong.

I think this is the case with current code too.

>From your above example, for 2 slots:
For 1 bit width: pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1>;
"gpc0-3"

For 4 bit width: pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4>;
"gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6"


> So, I strongly feel it is better to change the existing mmc node
> instead of changing the "sd0_bus" entries

I think this is already taken care of in the mmc nodes.
For slot with bus-width of 8,
pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;

Similarly for slot with bus width of 4,
pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;

Do you still see the problem here?

-- 
With warm regards,
Sachin
