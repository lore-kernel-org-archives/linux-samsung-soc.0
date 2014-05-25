From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Fix kernel panic when unplugging CPU1 on
 4210
Date: Mon, 26 May 2014 04:51:49 +0900
Message-ID: <538249D5.3040503@samsung.com>
References: <537FBE42.7050608@gmail.com> <1400952255-13750-1-git-send-email-daniel.lezcano@linaro.org> <5380D77C.2020104@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:58485 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751170AbaEYTwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 May 2014 15:52:10 -0400
Received: by mail-pa0-f44.google.com with SMTP id ld10so6594985pab.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 May 2014 12:52:10 -0700 (PDT)
In-Reply-To: <5380D77C.2020104@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, linux-samsung-soc@vger.kernel.org, rjw@rjwysocki.net, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, arnd.bergmann@linaro.org, sachin.kamat@linaro.org, heiko@sntech.de

On 05/25/14 02:31, Daniel Lezcano wrote:
> On 05/24/2014 07:24 PM, Daniel Lezcano wrote:
>> A look at the code reveals use of S5P_VA_SYSRAM macro, in case of
>> certain SoC
>> revisions, which is not valid any longer, after SYSRAM started to be
>> mapped
>> dynamically. The new dynamic mapping is stored in sysram_base_addr
>> variable,
>> which is declared static in platsmp.c
>>
>> This fix makes sysram_base_addr non-static, declared it in common.h
>> and used
>> in pm.c instead of S5P_VA_SYSRAM.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Suggested-by: Tomasz Figa <t.figa@samsung.com>
>
> Hi Kukjin,
>
> with this fix I confirm cpuidle is working well with the AFTR state on
> the exynos 4210.
>
Thanks a lot.

I've applied this fix on top of cpuidle-exynos branch.

- Kukjin
