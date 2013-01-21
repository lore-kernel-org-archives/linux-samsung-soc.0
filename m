From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device
 list
Date: Mon, 21 Jan 2013 12:21:41 +0530
Message-ID: <50FCE57D.9030200@linaro.org>
References: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com> <1793091.ko9ZbaznTT@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:57559 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667Ab3AUGvs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 01:51:48 -0500
Received: by mail-pa0-f43.google.com with SMTP id fb10so3220455pad.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Jan 2013 22:51:47 -0800 (PST)
In-Reply-To: <1793091.ko9ZbaznTT@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.m@samsung.com>

On 01/19/2013 04:10 PM, Tomasz Figa wrote:
> Hi Kukjin,
> 
> The commit message is a bit confusing, because it says that something is 
> being added, while in fact the whole node is being removed.
> 
> Shouldn't it rather say something like:
> ARM: dts: exynos5440-ssdk5440: Remove disabled status from watchdog node
> 

Rather, should we not be following a consistent approach for both
EXYNSO4 and EXYNOS5.

In EXYNOS4, the default state of the nodes is 'disabled' and they are
enabled in the board-specific files whereas it is exactly the opposite
in case of EXYNOS5.

> Best regards,
> Tomasz Figa
> 
> On Friday 18 of January 2013 21:00:51 Kukjin Kim wrote:
>> From: Giridhar Maruthy <giridhar.m@samsung.com>
>>
>> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5440-ssdk5440.dts |    4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>> b/arch/arm/boot/dts/exynos5440-ssdk5440.dts index 81e2c96..5239d75
>> 100644
>> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>> @@ -36,10 +36,6 @@
>>  		status = "disabled";
>>  	};
>>
>> -	watchdog {
>> -		status = "disabled";
>> -	};
>> -
>>  	rtc {
>>  		status = "disabled";
>>  	};
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Tushar Behera
