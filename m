From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCHv2 1/5] rtc: s3c: Define s3c_rtc structure to remove global
 variables.
Date: Mon, 25 Aug 2014 09:57:33 +0900
Message-ID: <53FA89FD.1030004@samsung.com>
References: <y@samsung.com> <1407808871-6046-1-git-send-email-y@samsung.com>
 <1407808871-6046-2-git-send-email-y@samsung.com>
 <20140822134204.1fa5be7aeb76a50b45ccc5f5@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51998 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917AbaHYA5o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Aug 2014 20:57:44 -0400
In-reply-to: <20140822134204.1fa5be7aeb76a50b45ccc5f5@linux-foundation.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: a.zummo@towertech.it, kgene.kim@samsung.com, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Dear Andrew, 

On 08/23/2014 05:42 AM, Andrew Morton wrote:
> On Tue, 12 Aug 2014 11:01:07 +0900 y@samsung.com wrote:
> 
>> This patch define s3c_rtc structure including necessary variables for S3C RTC
>> device instead of global variables. This patch improves the readability by
>> removing global variables.
> 
> Below is the v1->v2 delta.
> 
> Why were all those tests of info->base added?  Can it really be zero? 
> I don't see how.

If some functions (e.g., s3c_rtc_settime) accesses the rtc register
by using info->base before the initialization of info->base in s3c_rtc_probe,
I thought that null pointer error would happen.

But, I missed one point which info->base might have the garbate data instead of NULL.
I'll add the initialization code for info->base.
	info->base = NULL;

If you don't agree it, I'll drop this code checking the state of info->base on next patchset(v3).

Best Regads,
Chanwoo Choi

> 
> --- a/drivers/rtc/rtc-s3c.c~rtc-s3c-define-s3c_rtc-structure-to-remove-global-variables-v2
> +++ a/drivers/rtc/rtc-s3c.c
> @@ -121,6 +121,9 @@ static int s3c_rtc_setaie(struct device
>  	struct s3c_rtc *info = dev_get_drvdata(dev);
>  	unsigned int tmp;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	dev_dbg(info->dev, "%s: aie=%d\n", __func__, enabled);
>  
>  	clk_enable(info->rtc_clk);
> @@ -180,6 +183,9 @@ static int s3c_rtc_gettime(struct device
>  	struct s3c_rtc *info = dev_get_drvdata(dev);
>  	unsigned int have_retried = 0;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	clk_enable(info->rtc_clk);
>   retry_get_time:
>  	rtc_tm->tm_min  = readb(info->base + S3C2410_RTCMIN);
> @@ -224,6 +230,9 @@ static int s3c_rtc_settime(struct device
>  	struct s3c_rtc *info = dev_get_drvdata(dev);
>  	int year = tm->tm_year - 100;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	dev_dbg(dev, "set time %04d.%02d.%02d %02d:%02d:%02d\n",
>  		 1900 + tm->tm_year, tm->tm_mon, tm->tm_mday,
>  		 tm->tm_hour, tm->tm_min, tm->tm_sec);
> @@ -255,6 +264,9 @@ static int s3c_rtc_getalarm(struct devic
>  	struct rtc_time *alm_tm = &alrm->time;
>  	unsigned int alm_en;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	clk_enable(info->rtc_clk);
>  	alm_tm->tm_sec  = readb(info->base + S3C2410_ALMSEC);
>  	alm_tm->tm_min  = readb(info->base + S3C2410_ALMMIN);
> @@ -317,6 +329,9 @@ static int s3c_rtc_setalarm(struct devic
>  	struct rtc_time *tm = &alrm->time;
>  	unsigned int alrm_en;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	clk_enable(info->rtc_clk);
>  	dev_dbg(dev, "s3c_rtc_setalarm: %d, %04d.%02d.%02d %02d:%02d:%02d\n",
>  		 alrm->enabled,
> @@ -357,6 +372,9 @@ static int s3c_rtc_proc(struct device *d
>  	struct s3c_rtc *info = dev_get_drvdata(dev);
>  	unsigned int ticnt;
>  
> +	if (!info->base)
> +		return -EINVAL;
> +
>  	clk_enable(info->rtc_clk);
>  	if (info->cpu_type == TYPE_S3C64XX) {
>  		ticnt = readw(info->base + S3C2410_RTCCON);
> @@ -548,7 +566,7 @@ static int s3c_rtc_probe(struct platform
>  		rtc_tm.tm_min	= 0;
>  		rtc_tm.tm_sec	= 0;
>  
> -		s3c_rtc_settime(NULL, &rtc_tm);
> +		s3c_rtc_settime(&pdev->dev, &rtc_tm);
>  
>  		dev_warn(&pdev->dev, "warning: invalid RTC value so initializing it\n");
>  	}
> _
> 
> 
