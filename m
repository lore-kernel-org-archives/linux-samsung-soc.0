From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/7] regulator: max1586: Constify regulator_ops
Date: Mon, 13 Mar 2017 14:00:06 +0900
Message-ID: <58C62756.2000800@samsung.com>
References: <CGME20170311190141epcas2p2721283aa79819ca89f11815414ae5b4a@epcas2p2.samsung.com>
 <20170311190124.11512-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42307 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750756AbdCMFLL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 01:11:11 -0400
In-reply-to: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Dear all,

All patches in this series looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi

On 2017년 03월 12일 04:01, Krzysztof Kozlowski wrote:
> Static struct regulator_ops is not modified so can be made const for
> code safeness.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/regulator/max1586.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/max1586.c b/drivers/regulator/max1586.c
> index 2c1228d5796a..6779c2b53674 100644
> --- a/drivers/regulator/max1586.c
> +++ b/drivers/regulator/max1586.c
> @@ -126,14 +126,14 @@ static int max1586_v6_set_voltage_sel(struct regulator_dev *rdev,
>   * The Maxim 1586 controls V3 and V6 voltages, but offers no way of reading back
>   * the set up value.
>   */
> -static struct regulator_ops max1586_v3_ops = {
> +static const struct regulator_ops max1586_v3_ops = {
>  	.get_voltage_sel = max1586_v3_get_voltage_sel,
>  	.set_voltage_sel = max1586_v3_set_voltage_sel,
>  	.list_voltage = regulator_list_voltage_linear,
>  	.map_voltage = regulator_map_voltage_linear,
>  };
>  
> -static struct regulator_ops max1586_v6_ops = {
> +static const struct regulator_ops max1586_v6_ops = {
>  	.get_voltage_sel = max1586_v6_get_voltage_sel,
>  	.set_voltage_sel = max1586_v6_set_voltage_sel,
>  	.list_voltage = regulator_list_voltage_table,
> 
