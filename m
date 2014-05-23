From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 0/3] Exynos multi-platform support
Date: Sat, 24 May 2014 04:48:32 +0900
Message-ID: <537FA610.6050609@samsung.com>
References: <1400858369-14357-1-git-send-email-sachin.kamat@linaro.org> <201405232117.12348.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:59088 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750872AbaEWTsi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 15:48:38 -0400
Received: by mail-pa0-f51.google.com with SMTP id kq14so4510529pab.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 12:48:37 -0700 (PDT)
In-Reply-To: <201405232117.12348.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/24/14 04:17, Arnd Bergmann wrote:
> On Friday 23 May 2014, Sachin Kamat wrote:
>> The patches in this series were earlier sent as part of other
>> series. Now that the other patches have been merged, re-sending
>> these after rebasing them on linux-next (20140523).
>> Tested on Exynos4210, 4412, 5250 and 5420 based boards.
>>
>> A particular change in this series is the removal of single platform
>> support for Exynos as suggested by Arnd and Olof (patch 2/3). With
>> this change certain features (drivers) which are not yet multi-platform
>> aware like cpufreq, devfreq and DRM based gscaler will not be available
>> now.
>
>
> Acked-by: Arnd Bergmann<arnd@arndb.de>

Yes, it's time to move on exynos multiplatform and we can't wait for 
more perfect something. Anyway if any problems, let's fix them after 
this. Will apply this whole series.

Thanks,
Kukjin
