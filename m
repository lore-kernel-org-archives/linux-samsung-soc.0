From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v4 2/5] ARM: dts: Prepare exynos5410-odroidxu device tree
Date: Tue, 17 Mar 2015 11:10:11 +0900
Message-ID: <07a201d06057$800cd410$80267c30$@kernel.org>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
 <1426456834-6308-3-git-send-email-afaerber@suse.de>
 <CABxcv==cnFQ75qaykfkOcFo8FNqkzVswu8iYOB3riZJT9=4U_Q@mail.gmail.com>
 <5506B02D.3000400@suse.de>
 <CABxcv=kXkMkGkq=xjEBkfzdeFZ7XHDhneAxCgANoMDZ4u2Z4yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45116 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbbCQCKO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 22:10:14 -0400
In-reply-to: <CABxcv=kXkMkGkq=xjEBkfzdeFZ7XHDhneAxCgANoMDZ4u2Z4yw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene@kernel.org>, =?UTF-8?B?J+q5gO2VmeyjvCc=?= <ruppi.kim@hardkernel.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Humberto Naves' <hsnaves@gmail.com>, 'Jan Kiszka' <jan.kiszka@siemens.com>, 'Johann Pfefferl' <johann.pfefferl@siemens.com>, 'Ben Gamari' <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, 'Linux Kernel' <linux-kernel@vger.kernel.org>

Javier Martinez Canillas wrote:
>=20
> Hello Andreas,
>=20
Hi,

> On Mon, Mar 16, 2015 at 11:27 AM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
> > Am 16.03.2015 um 08:56 schrieb Javier Martinez Canillas:
> >>
> >> I think this should be defined in exynos5410.dtsi instead since is=
 an
> >> IP block in the SoC and referenced in the .dts using a label to ch=
ange
> >> the clock-frequency in the board.
> >
> > I hope you understood that this is a literal copy of smdk5410, so I=
'm
> > not going to make random changes here. If the Samsung guys want to =
make
> > this change for smdk5410, then fine, but otherwise - like for Snow =
and
> > Spring - I want to keep the diff -u low between the two.
> >
>=20
> Yes I did understand that it was a copy but I thought it could be
> improved anyways. But I don't have a strong opinion either to block
> this series and always both DTS can be changed as a follow-up. So I'm
> ok with your decision to keeping the delta to the minimum for now.
>=20
Yeah, everybody can update everything in mainline if it can be got revi=
ew in
mailinglist. BTW asthe fin_pll can be different according to board cond=
ition
that's why it is defined in each boart DT file, it is mostly same on ea=
ch
boards though...So I think keeping it would be more make sense.

Thanks,
Kukjin
