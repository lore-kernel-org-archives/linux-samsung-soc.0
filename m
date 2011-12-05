From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/2] arm: exynos: allow platform-lcd driver to control lcd
 regulator source on origen
Date: Mon, 5 Dec 2011 19:14:50 +0900
Message-ID: <CAH9JG2XfNqCtxhfqiikuZKbvZnc2tZ2vGJ0FZuL=JcQirYJXTA@mail.gmail.com>
References: <1323075148-29356-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:62049 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755444Ab1LEKOv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Dec 2011 05:14:51 -0500
Received: by ggnr5 with SMTP id r5so4822535ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2011 02:14:50 -0800 (PST)
In-Reply-To: <1323075148-29356-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, rpurdie@rpsys.net, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, patches@linaro.org, jhkim@insignal.co.kr, inderpal.singh@linaro.org, tushar.behera@linaro.org

On 12/5/11, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> The buck7 regulator of max8997 pmic which provides the power source to lcd
> panel
> and the lvds transmitter is allowed to be controlled by the platform-lcd
> driver.
> It is not required to apply the voltage source by default. Also, the voltage
> range for buck7 regulator is modified as the per the values in the
> datasheet.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/mach-origen.c |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-origen.c
> b/arch/arm/mach-exynos/mach-origen.c
> index f56d027..5456254 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -126,7 +126,7 @@ static struct regulator_consumer_supply __initdata
> buck3_consumer[] = {
>  	REGULATOR_SUPPLY("vdd_g3d", "mali_drm"), /* G3D */
>  };
>  static struct regulator_consumer_supply __initdata buck7_consumer[] = {
> -	REGULATOR_SUPPLY("vcc", "platform-lcd"), /* LCD */
> +	REGULATOR_SUPPLY("vcc_lcd", "platform-lcd.0"), /* LCD */
>  };
>
>  static struct regulator_init_data __initdata max8997_ldo1_data = {
> @@ -379,11 +379,11 @@ static struct regulator_init_data __initdata
> max8997_buck5_data = {
>  static struct regulator_init_data __initdata max8997_buck7_data = {
>  	.constraints	= {
>  		.name		= "VDD_LCD_3.3V",
> -		.min_uV		= 3300000,
> -		.max_uV		= 3300000,
> +		.min_uV		= 750000,
> +		.max_uV		= 3900000,
It can support the voltage change at buck itself, but in board it's
fixed. I'm not sure it's correct usage at board file.

I think original code is better to understand and use it as name, it's
fixed v3.3 voltage.

Thank you,
Kyungmin Park
>  		.boot_on	= 1,
> -		.apply_uV	= 1,
> -		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
> +		.valid_ops_mask	= REGULATOR_CHANGE_STATUS |
> +					REGULATOR_CHANGE_VOLTAGE,
>  		.state_mem	= {
>  			.disabled	= 1
>  		},
> @@ -562,6 +562,8 @@ static void lcd_hv070wsa_set_power(struct plat_lcd_data
> *pd, unsigned int power)
>
>  static struct plat_lcd_data origen_lcd_hv070wsa_data = {
>  	.set_power = lcd_hv070wsa_set_power,
> +	.min_uV		= 3300000,
> +	.max_uV		= 3300000,
>  };
>
>  static struct platform_device origen_lcd_hv070wsa = {
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
