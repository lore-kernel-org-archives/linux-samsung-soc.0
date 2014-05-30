From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr
 for secure mode
Date: Fri, 30 May 2014 20:47:02 +0200
Message-ID: <5388D226.7000706@gmail.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org> <5388CBB9.1050003@suse.de> <5388D129.6000706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:58417 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754324AbaE3SrS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:47:18 -0400
Received: by mail-we0-f170.google.com with SMTP id u57so2510950wes.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:47:17 -0700 (PDT)
In-Reply-To: <5388D129.6000706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-15?Q?Andreas_F=E4rbe?= =?ISO-8859-15?Q?r?= <afaerber@suse.de>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tushar.behera@linaro.org

On 30.05.2014 20:42, Kukjin Kim wrote:
> On 05/31/14 03:19, Andreas F=E4rber wrote:
>> Am 28.05.2014 06:13, schrieb Sachin Kamat:
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
>> Fixes ODROID-XU (Exynos5410) as well - thought it had been a prereq =
to
>> applying the 5410 patches...
>>
>> Tested-by: Andreas F=E4rber<afaerber@suse.de>
>>
> Andreas, thanks for your test :-)
>=20
> Sachin, How about exynos4210, 5250, 5260 and 5440?...
> I need to check again, honestly I don't remember all of Exynos SoCs'
> different things ;-) Then will apply into fixes for 3.16.

Exynos4210 doesn't use secure firmware, at least on any board supported
in mainline. Not sure about those Exynos5 models, but the only boards
supported in mainline with firmware node in DT are based on Exynos4412
or Exynos5410.

Best regards,
Tomasz
