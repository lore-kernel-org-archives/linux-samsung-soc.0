From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 03/10] rtc: max77686: Use usleep_range() instead of
 msleep()
Date: Fri, 22 Jan 2016 15:11:09 +0530
Message-ID: <56A1F935.2040904@nvidia.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com> <1453407813-14646-4-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:10230 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502AbcAVJvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jan 2016 04:51:54 -0500
In-Reply-To: <1453407813-14646-4-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org


On Friday 22 January 2016 01:53 AM, Javier Martinez Canillas wrote:
>   	RTC_SEC = 0,
> @@ -130,7 +130,8 @@ static int max77686_rtc_update(struct max77686_rtc_info *info,
>   				__func__, ret, data);
>   	else {
>   		/* Minimum 16ms delay required before RTC update. */
> -		msleep(MAX77686_RTC_UPDATE_DELAY);
> +		usleep_range(MAX77686_RTC_UPDATE_DELAY,
> +			     MAX77686_RTC_UPDATE_DELAY * 2);
>   	}
>

Instead of making usleep_range(16000, 32000), can we make small range as
usleep_range(16000, 17000)?

I am using as usleep_range(16000, 16000) always.
