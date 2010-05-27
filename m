From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 2/2] RTC: s3c: Initialize s3c_rtc_cpu_type before using
 it
Date: Thu, 27 May 2010 23:55:01 +0200
Message-ID: <4BFEEA35.80300@gmail.com>
References: <cover.1274994983.git.mcuelenaere@gmail.com>	<4BFEE40F.8010400@gmail.com> <20100527145259.74101157.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.27]:55187 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932535Ab0E0VzH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 May 2010 17:55:07 -0400
Received: by ey-out-2122.google.com with SMTP id d26so35212eyd.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2010 14:55:06 -0700 (PDT)
In-Reply-To: <20100527145259.74101157.akpm@linux-foundation.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, a.zummo@towertech.it, p_gortmaker@yahoo.com, Jiri.Pinkava@vscht.cz

Op 27-05-10 23:52, Andrew Morton schreef:
> On Thu, 27 May 2010 23:28:47 +0200
> Maurus Cuelenaere <mcuelenaere@gmail.com> wrote:
>
>   
>> Make sure s3c_rtc_cpu_type is initialised _before_ it's used in an if() check.
>>
>> This was probably caused due to a merge mistake.
>>     
> Nope, I went back to your original email:
>
> @@ -471,7 +509,12 @@ static int __devinit s3c_rtc_probe(struct
> platform_device *pdev)
>                 goto err_nortc;
>         }
>
> -       rtc->max_user_freq = 128;
> +       if (s3c_rtc_cpu_type == TYPE_S3C64XX)
> +               rtc->max_user_freq = 32768;
> +       else
> +               rtc->max_user_freq = 128;
> +
> +       s3c_rtc_cpu_type = platform_get_device_id(pdev)->driver_data;
>   

Hmm, odd. Ok, I apologize for this (obvious) mistake then.

-- 
Maurus Cuelenaere
