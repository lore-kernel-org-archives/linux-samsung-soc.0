From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] i2c: s3c2410: fix indentation for better readability
Date: Mon, 25 Apr 2016 10:55:07 +0200
Message-ID: <571DDB6B.6000704@samsung.com>
References: <1461533338-17479-1-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50300 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753966AbcDYIzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 04:55:13 -0400
In-reply-to: <1461533338-17479-1-git-send-email-wsa@the-dreams.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org

On 04/24/2016 11:28 PM, Wolfram Sang wrote:
> smatch rightfully says:
> 
> drivers/i2c/busses/i2c-s3c2410.c:1217 s3c24xx_i2c_probe() warn: inconsistent indenting
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Hi,

You could just apply this one:
i2c: s3c2410: Cleanup indentation and comment style
https://lkml.org/lkml/2016/4/20/163

I fixed this in that patch. Its trivial so it does not have to be a
separate patch.

Best regards,
Krzysztof

> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 1bc756313cb8e4..315c88ea1fa153 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1214,8 +1214,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> -	ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
> -				dev_name(&pdev->dev), i2c);
> +		ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
> +				       dev_name(&pdev->dev), i2c);
>  
>  		if (ret != 0) {
>  			dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
> 
