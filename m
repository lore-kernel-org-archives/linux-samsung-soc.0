From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for
 secure mode
Date: Sat, 5 Jul 2014 20:23:25 +0530
Message-ID: <CAK5sBcFfd0oe_87j7NcskK9opGQYA0uYA5WyqfHMnp-O0xCJqw@mail.gmail.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
	<5388CBB9.1050003@suse.de>
	<CAK5sBcETe20PWRV+z5Gb=hQNk13wE0PbmcvEmC9TM6nD2mi=ew@mail.gmail.com>
	<03f301cf906a$ab25d470$01717d50$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:60887 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751559AbaGEOx1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Jul 2014 10:53:27 -0400
Received: by mail-la0-f53.google.com with SMTP id b8so1753944lan.26
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Jul 2014 07:53:25 -0700 (PDT)
In-Reply-To: <03f301cf906a$ab25d470$01717d50$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>

On Wed, Jun 25, 2014 at 5:13 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Sachin Kamat wrote:
>>
>> On Fri, May 30, 2014 at 11:49 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>> > Am 28.05.2014 06:13, schrieb Sachin Kamat:
>> >> Almost all Exynos-series of SoCs that run in secure mode don't ne=
ed
>> >> additional offset for every CPU, with Exynos4412 being the only
>> >> exception.
>> >>
>> >> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>> >>
>> >> While at it, fix the coding style (space around *).
>> >>
>> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> >> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>> >> ---
>> >>  arch/arm/mach-exynos/firmware.c |    9 +++++++--
>> >>  1 file changed, 7 insertions(+), 2 deletions(-)
>> >
>> > Fixes ODROID-XU (Exynos5410) as well - thought it had been a prere=
q to
>> > applying the 5410 patches...
>> >
>> > Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
>> >
>>
>> Kukjin, this patch is required to bring up 4 A15 cores on some 5410
>> and 5420 based
>> boards. Can you please queue this up for the upcoming rc as fixes?
>
> Sure, I will take this into fixes.

Kukjin,

I don't see this patch in your fixes-2 branch yet.


>
> Thanks,
> Kukjin
>

Regards,
Sachin.
