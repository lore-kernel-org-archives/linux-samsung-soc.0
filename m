From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 1/3] ARM: dts: add pinctrl support to Exynos5420
Date: Fri, 14 Jun 2013 17:51:42 +0530
Message-ID: <CAL1wa8cWSiwW0uUNDhoagYZaOoBo2QJyp3D+pn1rHKFqC_5-tQ@mail.gmail.com>
References: <1371048688-9089-1-git-send-email-l.krishna@samsung.com>
 <1371048688-9089-2-git-send-email-l.krishna@samsung.com> <1531737.EaJZJjF9GR@flatron>
 <CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f44.google.com ([209.85.212.44]:53563 "EHLO
	mail-vb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752471Ab3FNMWD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 08:22:03 -0400
Received: by mail-vb0-f44.google.com with SMTP id e15so374202vbg.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2013 05:22:02 -0700 (PDT)
In-Reply-To: <CAD=FV=VhmCVzy-ahhhE-5ZF-cvXktchnAuaiRAG8A-KUj+azbw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Doug,

On Thu, Jun 13, 2013 at 2:50 AM, Doug Anderson <dianders@chromium.org> wrote:
> Tomasz,
>
> On Wed, Jun 12, 2013 at 1:58 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>> +     pinctrl@13400000 {
>>> +             gpy7: gpy7 {
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>
>> According to patch 2/3, this bank doesn't support interrupts, as it's
>> defined using EINTN macro. Which variant is correct?
>
> As far as I know the GPY registers don't support interrupts, so this
> should be removed.  Nice catch!
>
>>> +             sd0_bus1: sd0-bus-width1 {
>>> +                     samsung,pins = "gpc0-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_bus4: sd0-bus-width4 {
>>> +                     samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
>> "gpc0-6";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>> +
>>> +             sd0_bus8: sd0-bus-width8 {
>>> +                     samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2",
>> "gpc3-3";
>>> +                     samsung,pin-function = <2>;
>>> +                     samsung,pin-pud = <3>;
>>> +                     samsung,pin-drv = <3>;
>>> +             };
>>
>>
>> It seems like there is some inconsequence here, because sd0_bus4 setting
>> includes pins of sd0_bus1, while sd0_bus8 doesn't include pins of
>> sd0_bus4.
>>
>> I think it should be defined either first or second way, not mixed, but I
>> don't have any strong preference over any of them.
>>
>> CCing some people to hopefully get some more opinion on this.
>
> Yeah, I brought this up on 5250, but somehow it looks like it landed
> without getting changed.  I agree it should be one way or the other.
>
>

Here the GPIO pins added for sd0_bus1, sd0_bus4 and sd0_bus8 are correct
Please look at the below example dwmmc node configured for 8bit bus width

dwmmc0@12200000 {
                /*...*/
                pinctrl-names = "default";
                pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus4 &sd0_bus8>;

                slot@0 {
                        reg = <0>;
                        bus-width = <8>;
                };
        };

In the above node we are specifying "&sd0_bus4 &sd0_bus8" in pinctrl-0
Pinctrl driver will configure the respective gpio pins given in
sd0_bus4 and sd0_bus8 nodes.
(which are "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6", "gpc3-0", "gpc3-1",
"gpc3-2", "gpc3-3")

But if we make gpio entries for sd0_bus1, sd0_bus4 and sd0_bus8 like below

               sd0_bus1: sd0-bus-width1 {
                        samsung,pins = "gpc0-3";
                        /*...*/
                };

                sd0_bus4: sd0-bus-width4 {
                        samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
                        /*...*/
                };

                sd0_bus8: sd0-bus-width8 {
                        samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
                        /*...*/
                };

we have to make entries like below for dwmmc node to configure 8bit bus width.
pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus1 &sd0_bus4 &sd0_bus8>;

or if we choose like below

                sd0_bus1: sd0-bus-width1 {
                        samsung,pins = "gpc0-3";
                        /*...*/
                };

                sd0_bus4: sd0-bus-width4 {
                        samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5", "gpc0-6";
                        /*...*/
                };

                sd0_bus8: sd0-bus-width8 {
                        samsung,pins = "gpc0-3", "gpc0-4", "gpc0-5",
"gpc0-6", "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
                        /*...*/
                };

Then specifying pinctrl-0 = <&sd0_clk &sd0_cmd &sd0_bus8>; is enough

Because all the other boards have the similar kind of nodes specified
in their DT files, I followed the same convention.

Best Wishes,
Leela Krishna Amudala.

> Feel free to add my Reviewed-by.  The differences between the code you
> sent up and our ToT are:
> * You properly set the i2c4 drive strength to 0 to match all others.
> * You don't yet have the HDMI hot plug detect IRQ defined.  ...but
> that looks slightly wrong in our tree anyway and can be added later.
>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
>
> -Doug
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
