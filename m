From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3] max8925_power: Use "IS_ENABLED(CONFIG_OF)" for DT code.
Date: Tue, 28 Jan 2014 12:51:05 +0100
Message-ID: <52E799A9.8080502@samsung.com>
References: <1390847829-8379-1-git-send-email-badarkhe.manish@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18631 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753845AbaA1LvZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jan 2014 06:51:25 -0500
In-reply-to: <1390847829-8379-1-git-send-email-badarkhe.manish@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Manish Badarkhe <badarkhe.manish@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org

Hi,

On 27.01.2014 19:37, Manish Badarkhe wrote:
> Instead of "#ifdef CONFIG_OF" use "IS_ENABLED(CONFIG_OF)"
> option for DT code to avoid if-deffery in code.
>
> Signed-off-by: Manish Badarkhe <badarkhe.manish@gmail.com>
> ---
> :100644 100644 b4513f2... 3e54476... M	drivers/power/max8925_power.c
>   drivers/power/max8925_power.c |   17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/power/max8925_power.c b/drivers/power/max8925_power.c
> index b4513f2..3e54476 100644
> --- a/drivers/power/max8925_power.c
> +++ b/drivers/power/max8925_power.c
> @@ -427,7 +427,6 @@ static int max8925_deinit_charger(struct max8925_power_info *info)
>   	return 0;
>   }
>
> -#ifdef CONFIG_OF
>   static struct max8925_power_pdata *
>   max8925_power_dt_init(struct platform_device *pdev)
>   {
> @@ -440,9 +439,6 @@ max8925_power_dt_init(struct platform_device *pdev)
>   	int no_insert_detect;
>   	struct max8925_power_pdata *pdata;
>
> -	if (!nproot)
> -		return pdev->dev.platform_data;
> -
>   	np = of_find_node_by_name(nproot, "charger");
>   	if (!np) {
>   		dev_err(&pdev->dev, "failed to find charger node\n");
> @@ -468,13 +464,6 @@ max8925_power_dt_init(struct platform_device *pdev)
>
>   	return pdata;
>   }
> -#else
> -static struct max8925_power_pdata *
> -max8925_power_dt_init(struct platform_device *pdev)
> -{
> -	return pdev->dev.platform_data;
> -}
> -#endif
>
>   static int max8925_power_probe(struct platform_device *pdev)
>   {
> @@ -483,7 +472,11 @@ static int max8925_power_probe(struct platform_device *pdev)
>   	struct max8925_power_info *info;
>   	int ret;
>
> -	pdata = max8925_power_dt_init(pdev);
> +	pdata = dev_get_platdata(&pdev->dev);
> +
> +	if (!pdata && chip->dev->of_node)

Shouldn't IS_ENABLED(CONFIG_OF) also be checked here to let the compiler 
throw max8925_power_dt_init() away if the condition always evaluates to 
false?

Best regards,
Tomasz
