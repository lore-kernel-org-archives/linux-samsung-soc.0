From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/2] ARM: SAMSUNG: move all arches to generic uncompress.h
Date: Tue, 25 Feb 2014 16:59:21 +0100
Message-ID: <2577208.cj79hmXajC@phil>
References: <3594365.ORKU4Q2jDp@phil> <3158811.UU2ZyPShVi@phil> <CAK9yfHycc-98YG1ZWD5sB=k8t4CCYmxfRoJxSR_v=Hdm8FPG8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:35796 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439AbaBYQAP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Feb 2014 11:00:15 -0500
In-Reply-To: <CAK9yfHycc-98YG1ZWD5sB=k8t4CCYmxfRoJxSR_v=Hdm8FPG8g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Arnd Bergmann <arnd@arndb.de>

Am Dienstag, 25. Februar 2014, 21:11:09 schrieb Sachin Kamat:
>  Hi Heiko,
>=20
> On 25 February 2014 19:47, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Sonntag, 16. Februar 2014, 18:32:24 schrieb Heiko St=FCbner:
> >> On 2014-01-06 Sachin Kamat posted two patches converting Exynos to=
 use
> >> the generic uncompress.h.
> >>=20
> >> But in fact all Samsung platforms can go this route, as all Samsun=
g
> >> uncompress.h files are simply used to set up the serial port.
> >>=20
> >> As the original patches were not yet applied, this series includes=
 the
> >> original Exynos-specific change.
> >>=20
> >> Tested on a s3c2416 and s3c2442 based machine.
> >=20
> > ping?
>=20
> Kukjin has already applied my 2 patches doing this for Exynos.
> You might need to rebase your patches on top of his for-next and re-s=
end.

now I've seen that he applied them yesterday ... will rebase mine as=20
suggested.


Heiko
