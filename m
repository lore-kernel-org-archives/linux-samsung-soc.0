From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: Re: [PATCH 2/3] ARM: exynos5420: dt: add clock entries to watchdog node
Date: Wed, 24 Jul 2013 16:14:12 +0530
Message-ID: <CAL1wa8cmCjZr2C5tdFchuX-ZPQ9ewKJH04fBQEWKfTwf+dVS5w@mail.gmail.com>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <1374658699-3961-3-git-send-email-l.krishna@samsung.com> <CAK9yfHwFZunKudPLQsukLt0w4SNSovTWYzy8jRD+u040Pk48dw@mail.gmail.com>
 <1478852.betFXmR41G@amdc1227> <CAK9yfHy8FY6gaKoU+v5UVOO1TRor7-TMpqPKXyN3gfvy0vXYVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f42.google.com ([209.85.212.42]:59677 "EHLO
	mail-vb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820Ab3GXKod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 06:44:33 -0400
Received: by mail-vb0-f42.google.com with SMTP id i3so6272985vbh.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 03:44:33 -0700 (PDT)
In-Reply-To: <CAK9yfHy8FY6gaKoU+v5UVOO1TRor7-TMpqPKXyN3gfvy0vXYVA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Jingoo Han <jg1.han@samsung.com>

Hi Sachin,

On Wed, Jul 24, 2013 at 3:31 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Tomasz,
>
> On 24 July 2013 15:24, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Sachin,
>>
>> On Wednesday 24 of July 2013 15:18:26 Sachin Kamat wrote:
>>> Hi Leela,
>>>
>>> On 24 July 2013 15:08, Leela Krishna Amudala <l.krishna@samsung.com>
>> wrote:
>>> > This patch adds clock entries to watchdog node for exynos5420
>>> > as per the common clock framework of exynos5420
>>> >
>>> > Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> > Reviewed-by: Doug Anderson <dianders@chromium.org>
>>> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>>> > ---
>>> >
>>> >  arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
>>> >  1 file changed, 6 insertions(+)
>>> >
>>> > diff --git a/arch/arm/boot/dts/exynos5420.dtsi
>>> > b/arch/arm/boot/dts/exynos5420.dtsi index 8c54c4b..e1d2d20 100644
>>> > --- a/arch/arm/boot/dts/exynos5420.dtsi
>>> > +++ b/arch/arm/boot/dts/exynos5420.dtsi
>>> > @@ -145,4 +145,10 @@
>>> >
>>> >                 clocks = <&clock 260>, <&clock 131>;
>>> >                 clock-names = "uart", "clk_uart_baud0";
>>> >
>>> >         };
>>> >
>>> > +
>>> > +       watchdog {
>>> > +               clocks = <&clock 316>;
>>> > +               clock-names = "watchdog";
>>> > +               status = "okay";
>>>
>>> Generally you do "okay" in specific board dts files.
>>
>> Not necessarily. The status property should be set to okay whenever the
>> device represented by such node can already work with given set of
>> information (properties).
>>
>> Given the fact that watchdog driver does not require any board specific
>> information, it can be instantiated regardless of the board.
>
> Yes you are right. But I was thinking of keeping this (enabling) as an
> option at the board level.
> We do this for some of the other IPs too where even though we have all
> the properties we keep them disabled.
>

Watchdog does not require any board specific information so I kept it
in 5420.dtsi file.

Best wishes,
Leela Krishna.

> --
> With warm regards,
> Sachin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
