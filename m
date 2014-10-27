From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 2/4] regulator: max77686: Store opmode non-shifted
Date: Mon, 27 Oct 2014 14:37:18 +0100
Message-ID: <544E4A8E.3060803@collabora.co.uk>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com> <1414411911-5539-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:57339 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752812AbaJ0Nh0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 09:37:26 -0400
In-Reply-To: <1414411911-5539-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hello Krzysztof,

On 10/27/2014 01:11 PM, Krzysztof Kozlowski wrote:
> Introduce simple helper for calculating the shift for OPMODE field in
> registers. This allows storing the current value of opmode in
> non-shifted form and simplifies a little set_suspend_disable and enable
> functions. Additionally this will allow adding support LDOs to the
> existing set_suspend_disable function.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/regulator/max77686.c | 49 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

>  
>  static int max77686_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
> @@ -495,7 +513,8 @@ static int max77686_pmic_probe(struct platform_device *pdev)
>  		config.init_data = pdata->regulators[i].initdata;
>  		config.of_node = pdata->regulators[i].of_node;
>  
> -		max77686->opmode[i] = regulators[i].enable_mask;
> +		max77686->opmode[i] = regulators[i].enable_mask >>
> +						max77686_get_opmode_shift(i);

I don't think it has to be done in your patch but as a follow-up it would be
good to change this to:

		max77686->opmode[i] = MAX77686_NORMAL;

since that is really what this code is trying to do AFAIU. This just happens
to work because the value of MAX77686_OPMODE_MASK (0x3) is also "Output ON in
Normal Mode" but the code is not correct IMHO.

Or even better, the regulator mode should be read from the hw registers instead
of setting always to normal. That is what the max77802 driver does for example.

Best regards,
Javier
