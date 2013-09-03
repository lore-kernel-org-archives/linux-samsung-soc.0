From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Fix gpio pin of lcd_en node for exynos4210
Date: Tue, 3 Sep 2013 14:17:46 +0530
Message-ID: <CAHbNUh37pzeP24c2tqHE2BbNr1Eq=vc-OWb_gshwc2qnd0q3qw@mail.gmail.com>
References: <001c01cea84b$5decd9e0$19c68da0$%han@samsung.com>
	<CAHbNUh0A7j95zePFL8b9nLvJNV0fJX4nmRq6rFrjk5Dd+Ba2pw@mail.gmail.com>
	<002401cea877$e7453490$b5cf9db0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:37685 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932371Ab3ICIrr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 04:47:47 -0400
Received: by mail-oa0-f53.google.com with SMTP id k18so6209955oag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 01:47:46 -0700 (PDT)
In-Reply-To: <002401cea877$e7453490$b5cf9db0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On 3 September 2013 13:03, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, September 03, 2013 3:52 PM, Tushar Behera wrote:
>> On 3 September 2013 07:44, Jingoo Han <jg1.han@samsung.com> wrote:
>> > According to datasheet, 'lcd_en' node should use gpf0-2,
>> > instead of gpe3-4. gpe3-4 is used for MDM_DATA[4]; thus,
>> > it should be fixed.
>> >
>> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
>> > ---
>> >  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |    2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> > index a7c2128..da5dd8d 100644
>> > --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> > +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
>> > @@ -374,7 +374,7 @@
>> >                 };
>> >
>> >                 lcd_en: lcd-en {
>> > -                       samsung,pins = "gpe3-4";
>> > +                       samsung,pins = "gpf0-2";
>> >                         samsung,pin-function = <2>;
>> >                         samsung,pin-pud = <0>;
>> >                         samsung,pin-drv = <0>;
>>
>> With this change, the LCD display stops working on Origen board.
>
> The smdkv310 board worked properly.
> gpe3-4 seems to be necessary for Origen board.
> Can you describe why gpe3-4 is necessary for Origen board?
>

Without setting this pin, LCD panel doesn't power up. It is quite
possible that this is Origen specific. In that case, how do you
suggest to implement this for Origen board?

> According to the datasheet, pin-function of gpe3-4 is defined
> as MDM_DATA[4]. So, the node name 'lcd_en' is wrong or confusing.
>
>>
>> gpf0-{0,1,2,3} are defined under lcd_clk.
>
> Then will you test the following on Origen board?
>
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -293,7 +293,7 @@
>         };
>
>         fimd@11c00000 {
> -               pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
> +               pinctrl-0 = <&lcd_clk &lcd_data24 &pwm0_out>;
>

No, this doesn't work on Origen.

-- 
Tushar Behera
