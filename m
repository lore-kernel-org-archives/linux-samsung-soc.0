From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 3/6] gpio: samsung: Skip legacy GPIO registration if
 pinctrl-s3c64xx is present
Date: Wed, 17 Apr 2013 14:06:10 +0100
Message-ID: <20130417130609.GA13687@opensource.wolfsonmicro.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
 <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com>
 <20130416162750.GO26958@opensource.wolfsonmicro.com>
 <22399020.Z89v9QS8su@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58736 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965132Ab3DQNGS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 09:06:18 -0400
Content-Disposition: inline
In-Reply-To: <22399020.Z89v9QS8su@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2013 at 12:35:58AM +0200, Tomasz Figa wrote:
> On Tuesday 16 of April 2013 17:27:50 Mark Brown wrote:

> > Strictly speaking this is a separate bug fix (though I see that's
> > already in -next separately anyway so whatever).

> Right. But this fix is so small that I thought it would be a major waste=
=20
> of mail server processing power to send it as a separate patch.

There's reviewer bandwidth too - one of the things people check for is
that the change is doing what it's supposed to do, extra stuff in there
is usually a red flag.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbp4bAAoJELSic+t+oim9gskP/0evw5KtpbP9zmDVmn8ZVmup
E7SUolbelye1fLDwRU+ut6KwiI+gf1jh8GmQ7YiCxVwSVp051LTV3kB9EEIS2LOJ
J9HQDoyCS/jm00b726w7An01UFXgwHQmqkl+6MH5cu9PTAg/v72WUObqlL+wpDTt
hfyFBVW6I5m0Y280ouzEKJV9cWMbc0SHlv4NKJMCPbzTONaXGGUQuTqAHexHc9xk
/hJ4WOrplWG1kRfiwOMsSNNS+GSLBdSMlRkKRXPSpgZtTvRZdgOijKFaw+aDHXPT
WFKijlLVupbBXDjAefo2K61sZ/MzW/JQlerI2ipR4a2bWpxT8HvEZZQ+dG1AcTIL
sSxUU4+gn4zeBvEdBTEeX3bTjyn6W7YAD3+PiMI2z7B7OBmfvePASefmbB/IVDVO
+JkkBx1oAGq/kPG2ffg5C4b2pKkebtqZZx59oJX0FqfX87fzDNLCuC8ri2yVZOQY
KyymqrRXl8+suUCl+Rm8kA6/9J6gicMjMgNLF7sC277ELN9V/1DWyLK66pfMnzYJ
53aMUzIbdwePaGwZdo59Bo+N81jiDosA6mrYZzrvefvEN4NB5fNmhv27go87psy9
B72+q/a/AUaX9F5ayqlGsj6Q2Qvss833SZ+DX5Un7aKqaG56sYUH8x6OhRaTDnDf
iim6U2vqsTBGdJdmgpL7
=cLkZ
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
