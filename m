From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/2] i2c: s3c2410: Check clk_prepare_enable() return value
Date: Wed, 20 Apr 2016 11:02:11 +0200
Message-ID: <57174593.90307@samsung.com>
References: <1461096641-19788-1-git-send-email-javier@osg.samsung.com>
 <1461096641-19788-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17730 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752966AbcDTJCQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Apr 2016 05:02:16 -0400
In-reply-to: <1461096641-19788-2-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 04/19/2016 10:10 PM, Javier Martinez Canillas wrote:
> The clk_prepare_enable() function can fail so check the return
> value and propagate the error in case of a failure.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
>  drivers/i2c/busses/i2c-s3c2410.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 4b873fe9a75b..cb40a3af46e7 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1196,7 +1196,12 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  
>  	/* initialise the i2c controller */
>  
> -	clk_prepare_enable(i2c->clk);
> +	ret = clk_prepare_enable(i2c->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "I2C clock enable failed (%d)\n", ret);

Just: "I2C clock enable failed\n"
The probe error code will be printed anyway.

Best regards,
Krzysztof
