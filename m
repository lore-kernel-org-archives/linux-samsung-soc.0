From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr for
 secure mode
Date: Wed, 25 Jun 2014 20:43:22 +0900
Message-ID: <03f301cf906a$ab25d470$01717d50$@samsung.com>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
 <5388CBB9.1050003@suse.de>
 <CAK5sBcETe20PWRV+z5Gb=hQNk13wE0PbmcvEmC9TM6nD2mi=ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13326 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754459AbaFYLnY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:43:24 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Q00L4E38BQE70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 20:43:23 +0900 (KST)
In-reply-to: <CAK5sBcETe20PWRV+z5Gb=hQNk13wE0PbmcvEmC9TM6nD2mi=ew@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 'Tushar Behera' <tushar.behera@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sachin Kamat' <spk.linux@gmail.com>, =?utf-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>

Sachin Kamat wrote:
>=20
> On Fri, May 30, 2014 at 11:49 PM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
> > Am 28.05.2014 06:13, schrieb Sachin Kamat:
> >> Almost all Exynos-series of SoCs that run in secure mode don't nee=
d
> >> additional offset for every CPU, with Exynos4412 being the only
> >> exception.
> >>
> >> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
> >>
> >> While at it, fix the coding style (space around *).
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> >> ---
> >>  arch/arm/mach-exynos/firmware.c |    9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > Fixes ODROID-XU (Exynos5410) as well - thought it had been a prereq=
 to
> > applying the 5410 patches...
> >
> > Tested-by: Andreas F=C3=A4rber <afaerber@suse.de>
> >
>=20
> Kukjin, this patch is required to bring up 4 A15 cores on some 5410
> and 5420 based
> boards. Can you please queue this up for the upcoming rc as fixes?

Sure, I will take this into fixes.

Thanks,
Kukjin
