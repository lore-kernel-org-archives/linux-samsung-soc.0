From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr
 for secure mode
Date: Wed, 25 Jun 2014 13:54:02 +0200
Message-ID: <53AAB85A.7060804@suse.de>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org> <5388CBB9.1050003@suse.de> <CAK5sBcETe20PWRV+z5Gb=hQNk13wE0PbmcvEmC9TM6nD2mi=ew@mail.gmail.com> <03f301cf906a$ab25d470$01717d50$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37547 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754459AbaFYLyH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:54:07 -0400
In-Reply-To: <03f301cf906a$ab25d470$01717d50$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Tushar Behera' <tushar.behera@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sachin Kamat' <spk.linux@gmail.com>

Am 25.06.2014 13:43, schrieb Kukjin Kim:
> Sachin Kamat wrote:
>>
>> On Fri, May 30, 2014 at 11:49 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>> Am 28.05.2014 06:13, schrieb Sachin Kamat:
>>>> Almost all Exynos-series of SoCs that run in secure mode don't nee=
d
>>>> additional offset for every CPU, with Exynos4412 being the only
>>>> exception.
>>>>
>>>> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>>>>
>>>> While at it, fix the coding style (space around *).
>>>>
>>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>>> ---
>>>>  arch/arm/mach-exynos/firmware.c |    9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> Fixes ODROID-XU (Exynos5410) as well - thought it had been a prereq=
 to
>>> applying the 5410 patches...
>>>
>>> Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>

=46WIW meanwhile I also successfully tested it on 5420 based Arndale Oc=
ta.

I can also check on 5250 based Spring, now that it's working, if that
helps build confidence in the patch.

Cheers,
Andreas

>> Kukjin, this patch is required to bring up 4 A15 cores on some 5410
>> and 5420 based
>> boards. Can you please queue this up for the upcoming rc as fixes?
>=20
> Sure, I will take this into fixes.
>=20
> Thanks,
> Kukjin

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
