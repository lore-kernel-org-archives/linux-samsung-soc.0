From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for
 secure mode
Date: Fri, 13 Jun 2014 21:55:36 +0530
Message-ID: <CAK5sBcE9XoRKWoQbas1CcvuYNAnfnXUGBO-CA=TdQTkF61OjOQ@mail.gmail.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
	<5388CBB9.1050003@suse.de>
	<5388D129.6000706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:63146 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751433AbaFMQZi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 12:25:38 -0400
Received: by mail-la0-f41.google.com with SMTP id hz20so1629223lab.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2014 09:25:36 -0700 (PDT)
In-Reply-To: <5388D129.6000706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, tushar.behera@linaro.org, tomasz.figa@gmail.com, Arnd Bergmann <arnd@arndb.de>

Kukjin,

On Sat, May 31, 2014 at 12:12 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> On 05/31/14 03:19, Andreas F=C3=A4rber wrote:
>>
>> Am 28.05.2014 06:13, schrieb Sachin Kamat:
>>>
>>> Almost all Exynos-series of SoCs that run in secure mode don't need
>>> additional offset for every CPU, with Exynos4412 being the only
>>> exception.
>>>
>>> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>>>
>>> While at it, fix the coding style (space around *).
>>>
>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>>> ---
>>>   arch/arm/mach-exynos/firmware.c |    9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>>
>> Fixes ODROID-XU (Exynos5410) as well - thought it had been a prereq =
to
>> applying the 5410 patches...
>>
>> Tested-by: Andreas F=C3=A4rber<afaerber@suse.de>
>>
> Andreas, thanks for your test :-)
>
> Sachin, How about exynos4210, 5250, 5260 and 5440?...
> I need to check again, honestly I don't remember all of Exynos SoCs'
> different things ;-) Then will apply into fixes for 3.16.

ping..

 --
Regards,
Sachin.
