From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 1/4] clk: clk-s2mps11: Refactor for including
 support for other MFD clocks
Date: Tue, 31 Dec 2013 16:09:16 +0000
Message-ID: <20131231160916.GG31886@sirena.org.uk>
References: <1383202124-1775-1-git-send-email-tushar.behera@linaro.org>
 <1388053141-30085-1-git-send-email-tushar.behera@linaro.org>
 <1388053141-30085-2-git-send-email-tushar.behera@linaro.org>
 <20131229221723.12054.40917@quantum>
 <CAHbNUh0tJHXv52bA9hBDZMH0Pi+x9uC=LojcvgS=ONnCgEmVTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nkinyqrdwMuqz198"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHbNUh0tJHXv52bA9hBDZMH0Pi+x9uC=LojcvgS=ONnCgEmVTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Mike Turquette <mturquette@linaro.org>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Kgene Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org


--nkinyqrdwMuqz198
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 30, 2013 at 09:33:50AM +0530, Tushar Behera wrote:

> Commit 1b1ccee1e821 "mfd: s2mps11: Fix build after regmap field rename
> in sec-core.c" is also touching this file, which is in Mark's tree
> right now. If I rebase

It's been in Linus' tree for a while now.

--nkinyqrdwMuqz198
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSwuwpAAoJELSic+t+oim9XuQQAInHRRJf0L8pTVXq5Oy8bIAt
/ErX7ZJdqEH4pQASFZjYFg4RYR1zncbdzOLbto0f3OseBflj85R53EUWv/G0ERjD
o6cAj+CdisQC4G6FxfczXE5rDznOxPXPl8VJkfmZfjNKFi29TVItLzS27LR7+h4S
/lJ0+ZtR0Dzi8lx1hmnoY5DToUB/pC27OR8qXnsOc489fKG2V35TaK5slN6oSDd/
7ZiFKDO5FlbYVcOxREIPuILpIu16sN9HJOpKlW6YdJhbR0SFbc4EAn2HIX0C4AzG
vIVPDer9+vYUkj70tyM5lMEcC/T8WlgaIgJUYwjs1y1oRVHzT6PBIc5PIr3w3RZt
MutN8BfxN21QORvL9VIMrBBdVEXjMobPnFwlvb/2sEDwa7kpbCbQXQiGN+NCb4yC
WOE8sRY8HDDn2/gV32hIDqNJ+InZapFPu+bgc/lYIEZemjtkTmck6cpDJ52orrQQ
CY2Qmk+AsYG6egyOA82Wd3pCRBkzZPGGIxGZT6Hvdh7VLh1YNgvAU4siTj+NsXgF
1SQChOP551+FKEnloU+w6og1iiDrmqvhxaVfVs7XKVv286FpsWiXXu4Qk7dNvXQm
ILTAiWp8PNK2K3muC+/k/6+/OcGx0UGysKdaFFt36D1MTyX+BnzN2TPpl2aTvNGZ
xmXCnf6s3JdrFRZrNzWU
=6ur0
-----END PGP SIGNATURE-----

--nkinyqrdwMuqz198--
