From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Enable audio support for Peach-pi board
Date: Fri, 13 Jun 2014 18:05:11 +0100
Message-ID: <20140613170511.GA20112@sirena.org.uk>
References: <1402464739-19044-1-git-send-email-tushar.b@samsung.com>
 <1402464739-19044-4-git-send-email-tushar.b@samsung.com>
 <CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40227 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102AbaFMRFi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 13:05:38 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=XqqP7+xDOAKCixivzgaO0xvJX7L+CCN+unAEuf-6aUbQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Tushar Behera <tushar.b@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tushar Behera <trblinux@gmail.com>


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2014 at 10:03:50AM -0700, Doug Anderson wrote:
> On Tue, Jun 10, 2014 at 10:32 PM, Tushar Behera <tushar.b@samsung.com> wrote:

> > Peach-pi board has MAX98090 audio codec connected on HSI2C-7 bus.

> If you want to be a stickler about it, peach-pi actually has a
> max98091.  That requires code changes to the i2c driver, though.
> ...and unfortunately listing two compatible strings for i2c devices is
> broken.  :(

It is?  We should fix that if it's the case...

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTmy9EAAoJELSic+t+oim9MjIP/Ra1/AFufpJ/bFV8fTcMbQkY
8QUzOuvfsXK9yBHZ8dSbl1EvAdZBhCD9zGRxI059K3mHRPUV09Dg++0tJqIZaqxl
DGTHDHGayJ5qdbmaKN9Krg9Xwhf6WemNWVo9/2eAuw+OkRcMWN3v2Uva6BpvQXOo
TApI2W20XXvhV8OHcThBNZFydgwdl0smO82eEmc6lOvn7jxS7EVql/stM9/JCjPL
uWqkcvS13ub4+VIYNkkOgTpMns4tkCtn8OVyczKk1WXma/egf41WM4cDTMBaLY0o
01rD8DqfGPwkayTamD9njjlbPlbWl+ukpE0Yv9hjFYLEcdG0ZJnvUhoKlY/xl6q3
P6Qbw+BOrrlovHqupFM+xgY8gJTppKj3Kt4bHnTCUQCX/ZKjToJPIGVgG6CrIwUJ
UMv2SB3cV3mpid0nnuoJq1q5P0V+N5CUj0177+idu9QQ8J0jKdQKETApNOJHAcpk
cy9/1gVzeNBDWyM/0zu8qVf4OqGXApVn6rz5nfv25ZJ+qoWUEMRQLDR4z3popcnE
0eD/Dd3IzfPNTrCXlfGASpppzG6Y3f8gRdJRU6GmRBABfhE2ORetR+UrfLl1nO3i
iQCBc8/5zaK/NjERbp/c7ox/eR1m9Hhb/CyvC8hhYmPyAPhj106OrEFDMzjGcHR4
dY8NMEq3OjHc+B9MX4s7
=HhDs
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
