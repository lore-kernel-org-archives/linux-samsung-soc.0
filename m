From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] pinctrl: exynos: ack level-triggered interrupts before
 unmasking
Date: Fri, 14 Jun 2013 08:13:05 +0900
Message-ID: <15e401ce688b$8fadadb0$af090910$%kim@samsung.com>
References: <1371058399-31933-1-git-send-email-dianders@chromium.org>
 <150901ce682e$1c3fca50$54bf5ef0$%kim@samsung.com>
 <CAD=FV=U9V-rgjcCusCvgw-SeUH-kDbozr_T-i1DcaXNXv48vxw@mail.gmail.com>
 <4661065.SXhmWQNl5M@flatron>
 <CAD=FV=Ukdpt4vMCZNySvKpHz6yGCP5X-LLAc1XdOAEAM8rr1fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44647 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab3FMXNI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 19:13:08 -0400
In-reply-to: <CAD=FV=Ukdpt4vMCZNySvKpHz6yGCP5X-LLAc1XdOAEAM8rr1fw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Linus Walleij' <linus.walleij@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Simon Glass' <sjg@chromium.org>, 'Luigi Semenzato' <semenzato@chromium.org>, 'Ilho Lee' <ilho215.lee@samsung.com>, =?UTF-8?B?J+q5gOydgOq4sCc=?= <eunki_kim@samsung.com>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Doug Anderson wrote:
>=20
> Tomasz,
>=20
> On Thu, Jun 13, 2013 at 9:42 AM, Tomasz Figa <tomasz.figa@gmail.com> =
wrote:
> >> > BTW, probably we need a similar fixing in the mach-exynos/common=
=2Ec
> >> > file
> >> > before pinct=EA=B8=B0 for distro...
> >>
> >> Is anyone using the functions in mach-exynos/common.c file anymore=
?  I
> >> thought that non-dt exynos support was going away and then we coul=
d
> >> just delete a whole lot of code from that file.
> >
> > I think Kukjin meant stable kernels that support Exynos boards usin=
g
> board
> > files and without pinctrl. Would make sense to have them fixed as w=
ell,
> I
> > guess.
>
Yes, correct. Thanks, Tomasz.

> Ah, makes sense.  Kukjin: do you know of someone who needs this
> (someone who is picking up linux-stable updates for exynos)?  I don't
> think it's important for ChromeOS for this particular patch.  If
> there's someone who needs this to officially land on linux-stable I'd
> be happy to review their backport of this patch.
>=20
As you know, developing something like Android, Tizen use the stable ke=
rnel (long-term? I'm not sure) and there was a problem about this issue=
=2E So I mean, would be fixed for the stable kernel.

Thanks,
- Kukjin
