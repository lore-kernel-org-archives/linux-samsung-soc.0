From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: Add nodes for mmc, i2c, rtc, watchdog
 on Exynos7
Date: Wed, 22 Oct 2014 19:28:31 +0530
Message-ID: <CAM4voan-tvmJkmHt+F06_HUVKxK1G68Nw=v8sOEf7z10EPdjzw@mail.gmail.com>
References: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
	<1413870237-1821-7-git-send-email-a.kesavan@samsung.com>
	<CAGOxZ50=1ebU=8r6S_4rbL=82zb3asFTGEjkzNrJPjTkjEGfXg@mail.gmail.com>
	<544666EF.9000606@gmail.com>
	<CAGOxZ51UG3XrJ_-TPr+O9BWj0Q_xj+M2VSPOragM8Y5zf0zCVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:57630 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752325AbaJVN6c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Oct 2014 09:58:32 -0400
In-Reply-To: <CAGOxZ51UG3XrJ_-TPr+O9BWj0Q_xj+M2VSPOragM8Y5zf0zCVg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, robh <robh@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "catalin.marinas" <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Alim and Tomasz,

Thanks for the review.

On Wed, Oct 22, 2014 at 3:05 AM, Alim Akhtar <alim.akhtar@gmail.com> wrote:
> Hi Tomasz,
>
> On Tue, Oct 21, 2014 at 7:30 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> On 21.10.2014 15:52, Alim Akhtar wrote:
>>>> +&mmc_0 {
>>>> +       status = "okay";
>>>> +       num-slots = <1>;
>>>> +       broken-cd;
>>>> +       caps2-mmc-hs200-1_8v;
>>> Please use mmc_hs200-1_8v instead.
>>
>> I guess you mean "mmc-hs200-1_8v" (with a hyphen between mmc and hs200).
>>
> Yes, right, that was a typo. Thanks.

Will modify it to "mmc-hs200-1_8v".

>>>> +       supports-highspeed;
>>> As per synopsys-dw-mshc DT binding documentation, supports-highspeed
>>> property is deprecated, so please use common DT binding for this,
>>> which is "cap-mmc-highspeed".
>>>> +       non-removable;
>>>> +       card-detect-delay = <200>;
>>>> +       clock-frequency = <800000000>;
>>>> +       samsung,dw-mshc-ciu-div = <3>;
>>>> +       samsung,dw-mshc-sdr-timing = <0 4>;
>>>> +       samsung,dw-mshc-ddr-timing = <0 2>;
>>>> +       pinctrl-names = "default";
>>>> +       pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_qrdy &sd0_bus1 &sd0_bus4 &sd0_bus8>;
>>>> +       bus-width = <8>;
>>>> +};
>>>> +
>>>> +&mmc_2 {
>>>> +       status = "okay";
>>>> +       num-slots = <1>;
>>>> +       supports-highspeed;
>>> Here also common DT binding please "cap-sd-highspeed"
>>
>> Above you suggest "cap-mmc-highspeed" to replace the same deprecated
>> property, but here "cap-sd-highspeed". What is the rationale behind
>> using only one particular new property and not both for both controllers?
>>
> Well, on this particular board dw_mmc channels are dedicated to use
> only one kind of card. e.g. mmc_0 is for eMMC and which is
> non-removable and mmc_2 is for SD cards. Although controller supports
> both the properties on all channel on this SoC.

Will use "cap-sd/mmc-highspeed" instead of "supports-highspeed".

Regards,
Abhilash
>
>> Best regards,
>> Tomasz
>
>
>
> --
> Regards,
> Alim
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
