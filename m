From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Fix gpio pin of lcd_en node for exynos4210
Date: Tue, 3 Sep 2013 12:22:07 +0530
Message-ID: <CAHbNUh0A7j95zePFL8b9nLvJNV0fJX4nmRq6rFrjk5Dd+Ba2pw@mail.gmail.com>
References: <001c01cea84b$5decd9e0$19c68da0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:52363 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753749Ab3ICGwH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 02:52:07 -0400
Received: by mail-ob0-f177.google.com with SMTP id f8so5328730obp.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2013 23:52:07 -0700 (PDT)
In-Reply-To: <001c01cea84b$5decd9e0$19c68da0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On 3 September 2013 07:44, Jingoo Han <jg1.han@samsung.com> wrote:
> According to datasheet, 'lcd_en' node should use gpf0-2,
> instead of gpe3-4. gpe3-4 is used for MDM_DATA[4]; thus,
> it should be fixed.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> index a7c2128..da5dd8d 100644
> --- a/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos4210-pinctrl.dtsi
> @@ -374,7 +374,7 @@
>                 };
>
>                 lcd_en: lcd-en {
> -                       samsung,pins = "gpe3-4";
> +                       samsung,pins = "gpf0-2";
>                         samsung,pin-function = <2>;
>                         samsung,pin-pud = <0>;
>                         samsung,pin-drv = <0>;

With this change, the LCD display stops working on Origen board.

gpf0-{0,1,2,3} are defined under lcd_clk.

-- 
Tushar Behera
