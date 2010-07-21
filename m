From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH 3/3] rtc: rtc-s3c: Add BCD register initialization codes
Date: Wed, 21 Jul 2010 18:42:20 +0400
Message-ID: <4C47074C.703@ru.mvista.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com> <1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:49667 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758659Ab0GUOnT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Jul 2010 10:43:19 -0400
Received: by ewy23 with SMTP id 23so2292496ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 07:43:17 -0700 (PDT)
In-Reply-To: <1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, Taekgyun Ko <taeggyun.ko@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it

Hello.

Kukjin Kim wrote:

> From: Taekgyun Ko <taeggyun.ko@samsung.com>

> RTC needs to be initialized when BCD registers have invalid value.

> Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
[...]
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 2040017..e96e109 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -536,10 +536,20 @@ static int __devinit s3c_rtc_probe(struct platform_device *pdev)
>  
>  	s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
>  
> -	if (s3c_rtc_cpu_type == TYPE_S3C64XX)
> +	if (s3c_rtc_cpu_type == TYPE_S3C64XX) {
>  		rtc->max_user_freq = 32768;
> -	else
> +
> +		/* Check RTC Time */
> +
> +		for (i = S3C2410_RTCSEC; i <= S3C2410_RTCYEAR; i += 0x4) {
> +			tmp = readb(s3c_rtc_base + i);
> +
> +			if (((tmp & 0xf) > 0x9) || (((tmp >> 4) & 0xf) > 0x9))

   There is no need to have parens around > operations.

WBR, Sergei
