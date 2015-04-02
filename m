From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] rtc: rtc-s3c: Fix failed first read of RTC time
Date: Fri, 03 Apr 2015 08:58:02 +0900
Message-ID: <551DD78A.1000502@samsung.com>
References: <1427972459-6480-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21976 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344AbbDBX6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 19:58:05 -0400
In-reply-to: <1427972459-6480-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 04/02/2015 08:00 PM, Krzysztof Kozlowski wrote:
> Initialize the device time (if it is wrong) before registering RTC
> device to fix following error message during rtc-s3c probe:
> 
> [    2.215414] rtc (null): read_time: fail to read
> [    2.216322] s3c-rtc 10070000.rtc: rtc core: registered s3c as rtc1
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 5e162eaad277..1d3a4c58fec4 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -496,6 +496,22 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  
>  	device_init_wakeup(&pdev->dev, 1);
>  
> +	/* Check RTC Time */
> +	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
> +
> +	if (rtc_valid_tm(&rtc_tm)) {
> +		rtc_tm.tm_year	= 100;
> +		rtc_tm.tm_mon	= 0;
> +		rtc_tm.tm_mday	= 1;
> +		rtc_tm.tm_hour	= 0;
> +		rtc_tm.tm_min	= 0;
> +		rtc_tm.tm_sec	= 0;
> +
> +		s3c_rtc_settime(&pdev->dev, &rtc_tm);
> +
> +		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
> +	}
> +
>  	/* register RTC and exit */
>  	info->rtc = devm_rtc_device_register(&pdev->dev, "s3c", &s3c_rtcops,
>  				  THIS_MODULE);
> @@ -519,22 +535,6 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  		goto err_nortc;
>  	}
>  
> -	/* Check RTC Time */
> -	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
> -
> -	if (rtc_valid_tm(&rtc_tm)) {
> -		rtc_tm.tm_year	= 100;
> -		rtc_tm.tm_mon	= 0;
> -		rtc_tm.tm_mday	= 1;
> -		rtc_tm.tm_hour	= 0;
> -		rtc_tm.tm_min	= 0;
> -		rtc_tm.tm_sec	= 0;
> -
> -		s3c_rtc_settime(&pdev->dev, &rtc_tm);
> -
> -		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
> -	}
> -
>  	if (info->data->select_tick_clk)
>  		info->data->select_tick_clk(info);
>  
> 

When registering RTC device by using devm_rtc_device_register(),
rtc_device_register() read the time as following. Looks good to me.

	devm_rtc_device_register()
	  rtc_device_register()
	    __rtc_read_alarm()
	      rtc_read_time()
	        __rtc_read_time()

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
