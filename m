From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: exynos: ack level-triggered interrupts before unmasking
Date: Thu, 13 Jun 2013 18:42:17 +0200
Message-ID: <4661065.SXhmWQNl5M@flatron>
References: <1371058399-31933-1-git-send-email-dianders@chromium.org> <150901ce682e$1c3fca50$54bf5ef0$%kim@samsung.com> <CAD=FV=U9V-rgjcCusCvgw-SeUH-kDbozr_T-i1DcaXNXv48vxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49]:54853 "EHLO
	mail-ee0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754633Ab3FMQmU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 12:42:20 -0400
In-Reply-To: <CAD=FV=U9V-rgjcCusCvgw-SeUH-kDbozr_T-i1DcaXNXv48vxw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Glass <sjg@chromium.org>, Luigi Semenzato <semenzato@chromium.org>, Ilho Lee <ilho215.lee@samsung.com>, =?utf-8?B?6rmA7J2A6riw?= <eunki_kim@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thursday 13 of June 2013 09:38:33 Doug Anderson wrote:
> Kukjin,
>=20
> On Thu, Jun 13, 2013 at 5:04 AM, Kukjin Kim <kgene.kim@samsung.com>=20
wrote:
> > Doug Anderson wrote:
> >> A level-triggered interrupt should be acked after the interrupt li=
ne
> >> becomes inactive and before it is unmasked, or else another interr=
upt
> >> will be immediately triggered.  Acking before or after calling the
> >> handler is not enough.
> >>=20
> >> Signed-off-by: Luigi Semenzato <semenzato@chromium.org>
> >> Signed-off-by: Doug Anderson <dianders@chromium.org>
> >=20
> > BTW, probably we need a similar fixing in the mach-exynos/common.c
> > file
> > before pinct=EA=B8=B0 for distro...
>=20
> Is anyone using the functions in mach-exynos/common.c file anymore?  =
I
> thought that non-dt exynos support was going away and then we could
> just delete a whole lot of code from that file.

I think Kukjin meant stable kernels that support Exynos boards using bo=
ard=20
files and without pinctrl. Would make sense to have them fixed as well,=
 I=20
guess.

Best regards,
Tomasz

>=20
> -Doug
