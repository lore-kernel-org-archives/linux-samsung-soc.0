From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V5 18/20] ARM: exynos: cpuidle: Pass the AFTR callback
 to the platform_data
Date: Fri, 09 May 2014 22:10:14 +0900
Message-ID: <536CD3B6.7060108@samsung.com>
References: <1397212815-16068-1-git-send-email-daniel.lezcano@linaro.org> <1397212815-16068-19-git-send-email-daniel.lezcano@linaro.org> <201405091256.54755.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:58252 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbaEINKT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 09:10:19 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb1so4374821pad.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 May 2014 06:10:19 -0700 (PDT)
In-Reply-To: <201405091256.54755.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, Daniel Lezcano <daniel.lezcano@linaro.org>, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org

On 05/09/14 19:56, Arnd Bergmann wrote:
> On Friday 11 April 2014, Daniel Lezcano wrote:
>> No more dependency on the arch code. The platform_data field is used to set the
>> PM callback as the other cpuidle drivers.
>>
>> Signed-off-by: Daniel Lezcano<daniel.lezcano@linaro.org>
>> Reviewed-by: Viresh Kumar<viresh.kumar@linaro.org>
>> Reviewed-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
>
> This has just shown up in linux-next and broken randconfig builds.
>
Hi Arnd,

Hmm...I just reverted this series in for-next of samsung tree and will 
hold on until solving the randconfig build breakage. I need to look at 
this again and think about your suggestion...

Thanks,
Kukjin
