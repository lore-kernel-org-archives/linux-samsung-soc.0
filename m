From: kgene@kernel.org
Subject: RE: [PATCH 1/1] ARM: S3C24XX: Move rtc-core.h from plat to mach
Date: Thu, 23 Jan 2014 10:24:38 +0900
Message-ID: <023701cf17d9$e1f7f6e0$a5e7e4a0$@kernel.org>
References: <1388400008-9113-1-git-send-email-sachin.kamat@linaro.org>
 <2677599.hxjB7meQWY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34135 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751276AbaAWBYj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jan 2014 20:24:39 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZT0013YYL2WQ20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jan 2014 10:24:38 +0900 (KST)
In-reply-to: <2677599.hxjB7meQWY@phil>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Heiko St=FCbner wrote:
>=20
> Am Montag, 30. Dezember 2013, 16:10:08 schrieb Sachin Kamat:
> > plat/rtc-core.h is only referenced from mach-s3c24xx. Hence
> > move it there to de-populate the plat directory. While at it
> > also do some cleanup of the header file.
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > Cc: Heiko Stuebner <heiko@sntech.de>
>=20
> late, but as the patch is not merged yet:
>=20
> Acked-by: Heiko Stuebner <heiko@sntech.de>
>=20
Applied into cleanup, thanks.

- Kukjin

> > ---
> >  .../plat =3D> mach-s3c24xx/include/mach}/rtc-core.h  |   13 ++++++=
-------
> >  arch/arm/mach-s3c24xx/s3c2416.c                    |    2 +-
> >  arch/arm/mach-s3c24xx/s3c2443.c                    |    2 +-
> >  3 files changed, 8 insertions(+), 9 deletions(-)
> >  rename arch/arm/{plat-samsung/include/plat =3D>
> > mach-s3c24xx/include/mach}/rtc-core.h (69%)
