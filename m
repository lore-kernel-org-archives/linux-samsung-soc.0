From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr
 for secure mode
Date: Sat, 31 May 2014 03:42:49 +0900
Message-ID: <5388D129.6000706@samsung.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org> <5388CBB9.1050003@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:63052 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbaE3Smy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:42:54 -0400
Received: by mail-pb0-f52.google.com with SMTP id rr13so2020914pbb.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:42:54 -0700 (PDT)
In-Reply-To: <5388CBB9.1050003@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tushar.behera@linaro.org, tomasz.figa@gmail.com

On 05/31/14 03:19, Andreas F=E4rber wrote:
> Am 28.05.2014 06:13, schrieb Sachin Kamat:
>> Almost all Exynos-series of SoCs that run in secure mode don't need
>> additional offset for every CPU, with Exynos4412 being the only
>> exception.
>>
>> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>>
>> While at it, fix the coding style (space around *).
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/mach-exynos/firmware.c |    9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> Fixes ODROID-XU (Exynos5410) as well - thought it had been a prereq t=
o
> applying the 5410 patches...
>
> Tested-by: Andreas F=E4rber<afaerber@suse.de>
>
Andreas, thanks for your test :-)

Sachin, How about exynos4210, 5250, 5260 and 5440?...
I need to check again, honestly I don't remember all of Exynos SoCs'=20
different things ;-) Then will apply into fixes for 3.16.

Thanks,
Kukjin
