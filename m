From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 0/4] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Wed, 20 Aug 2014 10:22:58 +0100
Message-ID: <CAD8Lp45105m+OXOFpmX9wFbSos+iNdRwq2xdK8_PaDtP_geGpw@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<53B0F6D1.4090006@samsung.com>
	<53C93FEB.2030507@samsung.com>
	<CAOesGMh-XRpX_U9s-BVE=BuOG-1EMDL+B_Dm1hdm+tcPQA9E-g@mail.gmail.com>
	<CAD8Lp46pY9_+N6M17i4xv71BR_poT2Pfh4cmM0J2jxP96m9sVA@mail.gmail.com>
	<CAOesGMiSTBt8f4WURFjqpxTZGzy7ZSWw_3RTNdBZ6KD_vei2GA@mail.gmail.com>
	<53F44056.5030601@samsung.com>
	<CABxcv=n4uu+ST-sncfYS0SCcTYa4cXMOxRG5EQ7ZTcxEOFm7vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35269 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbaHTJW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 05:22:59 -0400
Received: by mail-wi0-f172.google.com with SMTP id n3so6753937wiv.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Aug 2014 02:22:58 -0700 (PDT)
In-Reply-To: <CABxcv=n4uu+ST-sncfYS0SCcTYa4cXMOxRG5EQ7ZTcxEOFm7vw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Olof Johansson <olof@lixom.net>, Przemyslaw Marczak <p.marczak@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>

On Wed, Aug 20, 2014 at 8:18 AM, Javier Martinez Canillas
<javier@dowhile0.org> wrote:
> More importantly I wonder if a design where a IRQ line is not
> connected to the max77686 PMIC makes even sense. If such a design is
> possible then the "interrupt" property should be optional but if not
> then I think that the driver should fail to probe in that case. Yes,
> it is a regression but also the Odroid DTS was not following the DT
> binding and was just lucky that the driver was not checking the
> required DT properties.

I think it would not be totally unreasonable to have such a design
with no IRQ line hookup - after all we just did a load of ODROID work
on 3.16 without this interrupt being available, and we didn't notice.

At the same time, I think its unlikely that someone wouldn't just hook
this up, it is sensible to put this kind of thing on the board even if
you don't have an immediate need for it, and all the reference designs
will have it.

No strong preference but I would vote for the slightly simpler option
of having the max77686 driver require the interrupt specified (like
now), until someone comes along with a board that physically lacks it.

Daniel
