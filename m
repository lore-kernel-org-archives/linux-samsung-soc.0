From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] rtc: rtc-s3c: Remove one superfluous rtc_valid_tm() check
Date: Fri, 03 Apr 2015 08:44:44 +0900
Message-ID: <551DD46C.6030207@samsung.com>
References: <1427985116-20314-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12674 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbbDBXor (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 19:44:47 -0400
In-reply-to: <1427985116-20314-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 04/02/2015 11:31 PM, Krzysztof Kozlowski wrote:
> The s3c_rtc_gettime() returns already result of rtc_valid_tm() on
> obtained time so get rid of another call to rtc_valid_tm().
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 1d3a4c58fec4..a0f832362199 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -497,9 +497,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  	device_init_wakeup(&pdev->dev, 1);
>  
>  	/* Check RTC Time */
> -	s3c_rtc_gettime(&pdev->dev, &rtc_tm);
> -
> -	if (rtc_valid_tm(&rtc_tm)) {
> +	if (s3c_rtc_gettime(&pdev->dev, &rtc_tm)) {
>  		rtc_tm.tm_year	= 100;
>  		rtc_tm.tm_mon	= 0;
>  		rtc_tm.tm_mday	= 1;
> 

s3c_rtc_gettime() return the value of rtc_valid_tm(). Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
