From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 Resend 1/2] ARM: EXYNOS: Update secondary boot addr
 for secure mode
Date: Fri, 30 May 2014 20:19:37 +0200
Message-ID: <5388CBB9.1050003@suse.de>
References: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40499 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932473AbaE3STj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:19:39 -0400
In-Reply-To: <1401250382-24046-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tushar.behera@linaro.org, tomasz.figa@gmail.com

Am 28.05.2014 06:13, schrieb Sachin Kamat:
> Almost all Exynos-series of SoCs that run in secure mode don't need
> additional offset for every CPU, with Exynos4412 being the only
> exception.
>=20
> Tested on Origen-Quad (Exynos4412) and Arndale-Octa (Exynos5420).
>=20
> While at it, fix the coding style (space around *).
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/firmware.c |    9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

=46ixes ODROID-XU (Exynos5410) as well - thought it had been a prereq t=
o
applying the 5410 patches...

Tested-by: Andreas F=E4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
