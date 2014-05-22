From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode
 display timing
Date: Thu, 22 May 2014 15:53:45 +0200
Message-ID: <20140522135340.GA8761@ulmo>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
 <20140521110204.GB2014@ulmo>
 <537C90F3.7050404@samsung.com>
 <537DF6A6.1080804@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:38700 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752136AbaEVN4H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 09:56:07 -0400
Content-Disposition: inline
In-Reply-To: <537DF6A6.1080804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, djkurtz@chromium.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 10:07:50PM +0900, Inki Dae wrote:
> On 2014=EB=85=84 05=EC=9B=94 21=EC=9D=BC 20:41, YoungJun Cho wrote:
> > Hi Therry
> >=20
> > On 05/21/2014 08:02 PM, Thierry Reding wrote:
> >> On Wed, May 21, 2014 at 01:42:56PM +0900, YoungJun Cho wrote:
> >>> This patch is based on videomode and display_timing relevant codes.
> >>> To support command mode panel, it does not need to guide its timing
> >>> information to the display controller like video mode panel,
> >>> but it requires signal timings to transfer video data.
> >>> So this patch adds cmdmode struct, cmdmode_display_timing struct and
> >>> the according helper functions to convert cmdmode_display_timing
> >>> to a generic cmdmode.
> >>
> >> Can you point me to relevant documentation? I wasn't able to find it by
> >> a quick scan through the DSI specification.
> >>
> >=20
> > I'm sorry to say that there is no specific one document.
> >=20
> > I referred to several ones, CPU interface, I80 interface and
> > DBI document(last time you said it).
> > I think this is good to check it.
> > [ http://cache.freescale.com/files/dsp/doc/app_note/AN4180.pdf ]
> >=20
>=20
> Ping~. Is there other comment? If so then I'd like to pick them up. We
> would be happy for you leave reviewed-by or acked-by.

I'd rather not see this merged yet. Can somebody from the i.MX crowd
perhaps look at this, to see if they've had to solve a similar problem
(since the above document refers to i.MX)?

Adding Russell and Philipp for a second opinion.

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfgFkAAoJEN0jrNd/PrOhQPgP/25D7rMoPI83xHx16N+2cmc2
ns8YkF/kgRj9IZg1K2kYVzustJzvil8Otnkr71N5SHp/cLD4t7nlq1Dsa3DW2jh6
r5x4UW7o3J6JuCnB+ivcT6krolo+1Ee6fpSm2PS3rJUMPczLfU3ZZKoCTHfsYp9h
3l+CxhReuAFun94Qxw/Xt160YuQaIhzHpLzbr1iFk6wFkb3cZr4N+/PKwLI+S/eR
RATOPN7zuXt9ODhYyE1N4RJgQj3No6kPzbvo+YRIxVUdJyNJnZFSkkzW0yiDzo7o
uCx/7N22+WSbwKPA+r9k+FmkSS2yqjQ8zRfhGW4p/wWAOBDSmGHE2ZUV4hhLHRVS
n3gKdmVMzhcJK9cGrF5MkAI1Ubixekmlw5G93+1zKFfREuU0oaXi4/X3O7EQELdn
mk6VmHz+rjHJ8MV8uFcJy/aXs8ybtU4OGkV8skJax/sQXCJ2XznA6gtxW3wW0K6e
9sZwCUQt9hoeMlsAjAwP5QX6U7vWT1gblFC4QqrIr0mT6QasfB54nqmXHoTU2R7R
Ayt05PxKVgP+U+UVny/xm/73XsAfY1wciAGlAtza/U8PLkGa2mVHre6wdUiAOndV
M/WCNxqFEsJmI/1nDCYUn/nq4wUGbcNAwCF6p7LRVw5OddtxyCjBrvo+BXX2qdAq
yrFuIQT2I3Hufv4Qu9Bq
=aDZp
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
