From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/3] mfd: ChromeOS EC Kconfig dependency cleanup
Date: Mon, 10 Aug 2015 17:10:09 +0100
Message-ID: <20150810161009.GG12631@x1>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv=kG=pSprUdoscAFgCF=S5CccvHO0mP+tjnumNeEjsVckg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34921 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105AbbHJQKP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Aug 2015 12:10:15 -0400
Received: by wicne3 with SMTP id ne3so28263010wic.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Aug 2015 09:10:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CABxcv=kG=pSprUdoscAFgCF=S5CccvHO0mP+tjnumNeEjsVckg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

On Fri, 07 Aug 2015, Javier Martinez Canillas wrote:
> On Thu, Jun 25, 2015 at 2:20 AM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
> >
> > This is a trivial series that do some changes to the dependency for=
 the
> > ChromeOS EC drivers Kconfig symbols. The patches are on top of Paul=
's
> > patch "mfd: fix dependency warning for CHROME_PLATFORMS on !X86, !A=
RM":
> > https://lkml.org/lkml/2015/6/20/219.
> >
> > Paul fixed a warning about unmet dependencies but I think the corre=
ct fix
> > is to remove unneded dependencies. So that is what this series do a=
nd are
> > composed of the following patches:
> >
> >
> > Javier Martinez Canillas (3):
> >   platform/chrome: Don't make CHROME_PLATFORMS depends on X86 || AR=
M
> >   mfd: Remove MFD_CROS_EC depends on X86 || ARM
> >   mfd: Remove MFD_CROS_EC_SPI depends on OF
> >
> >  drivers/mfd/Kconfig             | 3 +--
> >  drivers/platform/chrome/Kconfig | 1 -
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
>=20
> The warning that this series fixes has appeared again in linux-next.
> You said some time ago that applied the patches for 4.3 [0] and indee=
d
> I remember the warning going away at some point.
>=20
> Do you know what happened with this patches? I see 3/3 in linux-next
> but no 1/3 and 2/3.

No idea why you're not seeing them.  They are in my -fixes branch,
which is pulled into -next.  I have _just_ sent them to Linus for
inclusion into v4.2.

Let me know if you still see the issue.

> [0]: https://lkml.org/lkml/2015/6/25/115
>=20
> Thanks a lot and best regards,
> Javier

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
