From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/7] regulator: max77693: Constify regulator_ops
Date: Mon, 13 Mar 2017 13:55:07 +0900
Message-ID: <58C6262B.2020000@samsung.com>
References: <20170311190124.11512-1-krzk@kernel.org>
 <CGME20170311190145epcas1p3659851873074ec6c2a388363faa02ddf@epcas1p3.samsung.com>
 <20170311190124.11512-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59208 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750772AbdCMEzL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 00:55:11 -0400
In-reply-to: <20170311190124.11512-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi,

On 2017년 03월 12일 04:01, Krzysztof Kozlowski wrote:
> Static struct regulator_ops is not modified so can be made const for
> code safeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/regulator/max77693-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/max77693-regulator.c b/drivers/regulator/max77693-regulator.c
> index 3fce67982682..e7000e777292 100644
> --- a/drivers/regulator/max77693-regulator.c
> +++ b/drivers/regulator/max77693-regulator.c
> @@ -150,7 +150,7 @@ static const struct regulator_ops max77693_safeout_ops = {
>  	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
>  };
>  
> -static struct regulator_ops max77693_charger_ops = {
> +static const struct regulator_ops max77693_charger_ops = {
>  	.is_enabled		= regulator_is_enabled_regmap,
>  	.enable			= regulator_enable_regmap,
>  	.disable		= regulator_disable_regmap,
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
