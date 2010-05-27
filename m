From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] RTC: s3c: Initialize driver data before using it
Date: Thu, 27 May 2010 14:51:56 -0700
Message-ID: <20100527145156.f6270ae7.akpm@linux-foundation.org>
References: <cover.1274994983.git.mcuelenaere@gmail.com>
	<4BFEE40D.4030807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:56007 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932535Ab0E0Vwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 17:52:37 -0400
In-Reply-To: <4BFEE40D.4030807@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, a.zummo@towertech.it, p_gortmaker@yahoo.com, Jiri.Pinkava@vscht.cz

On Thu, 27 May 2010 23:28:45 +0200
Maurus Cuelenaere <mcuelenaere@gmail.com> wrote:

> s3c_rtc_setfreq() uses the platform driver data to derive struct rtc_device,
> so make sure drvdata is set _before_ s3c_rtc_setfreq() is called.
> 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  drivers/rtc/rtc-s3c.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index e5972b2..6adebf3 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -495,8 +495,6 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
>   	pr_debug("s3c2410_rtc: RTCCON=%02x\n",
>  		 readb(s3c_rtc_base + S3C2410_RTCCON));
>  
> -	s3c_rtc_setfreq(&pdev->dev, 1);
> -
>  	device_init_wakeup(&pdev->dev, 1);
>  
>  	/* register RTC and exit */
> @@ -518,6 +516,9 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
>  	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
>  
>  	platform_set_drvdata(pdev, rtc);
> +
> +	s3c_rtc_setfreq(&pdev->dev, 1);
> +
>  	return 0;
>  
>   err_nortc:

This one I tagged for a -stable backport.
