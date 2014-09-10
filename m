From: Mark Brown <broonie@kernel.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Wed, 10 Sep 2014 20:45:22 +0100
Message-ID: <20140910194522.GM7960@sirena.org.uk>
References: <20140908112112.GK26030@arm.com>
 <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
 <CAD=FV=VAqzvJQDQMjjeQ1p5okyDzE=ff_sguObZxh59qbzcaTQ@mail.gmail.com>
 <CACxGe6t_ex1bU=CvTpXR4VJgNf1hAq33hr6ykbHy_sMXEk4h-g@mail.gmail.com>
 <CAOesGMipX3MV6sMWLuY=D+bQ6qe8P17YFbTFwZOHPeSc3Pw9Cg@mail.gmail.com>
 <20140910143144.GF7960@sirena.org.uk>
 <CACxGe6u=QkGTKGfaE_jJ5VFMhdVKQNggp3qVBUgNP7rDbZss_A@mail.gmail.com>
 <20140910153919.GH7960@sirena.org.uk>
 <CACxGe6uBcTPMh4p=oi7m_TVpjUrkgbQvxbStAn27HXEJxYe5fw@mail.gmail.com>
 <CAD=FV=W0qQZF58AvF8kZW+z4CsfnruQZLw_TA-eGy3fUruLbcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cqq5NadOW2RfLMJ/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33646 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751044AbaIJTqL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Sep 2014 15:46:11 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=W0qQZF58AvF8kZW+z4CsfnruQZLw_TA-eGy3fUruLbcg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, Prashanth G <prashanth.g@samsung.com>


--Cqq5NadOW2RfLMJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 10, 2014 at 09:45:21AM -0700, Doug Anderson wrote:

> Right now I know that clock disabling is supposed to be inhibited
> during the early boot process.  I think regulators too?

No, for regulators we'll quite happily disable anything a consumer asks
us to at any point but we'll only do a sweep for regulators that were
enabled on startup then not subsequently referenced and turn them off in
late_initcall.

--Cqq5NadOW2RfLMJ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEKpOAAoJECTWi3JdVIfQzNUH/ikrrrlF1a1E6zoB/lK7XeK/
OyJo8IxZ/27t2mKbJmJqKk/CJ2u9FQDgMBAo4SsWlRjkjTNIwkYI1fktl5FRXCF/
ArIlazILid+tLbsr1bWR4ce/TPc6wnO2xi7HdMNUewA5g0a73pplsw/l0JiSNFJ8
j/bJzlmPM1hYSi3sn/5fB13WPYZvri/y2cTiXFGEFIIdp4uihZ8naV9Bmm+eOEN7
ySd+yLWUWH6qnYFKdG+YcgeD2fgxV/b7P0r6trNfUsRTrRhNXtVaeQxDBoqmpHwZ
W2iuMT8/A6P/ZRLxBApYVAQwF3Sof7qkLuCTJP+BiGcY81KJSJDkbapxfgX62UQ=
=ZLFb
-----END PGP SIGNATURE-----

--Cqq5NadOW2RfLMJ/--
