From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Tue, 15 Jul 2014 12:00:00 +0100
Message-ID: <20140715110000.GA17528@sirena.org.uk>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
 <20140714172524.GH6800@sirena.org.uk>
 <CAHfPSqAzab931yurSs+3zj=uoFj93FuAdd24AQKm1fZm07Nq8Q@mail.gmail.com>
 <20140714191533.GH6800@sirena.org.uk>
 <CAHfPSqAgCbfL2nkrfSYNJZitT-nGw7+5fpR9FMaabmwVJM6jUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:38462 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758656AbaGOLAj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 07:00:39 -0400
Content-Disposition: inline
In-Reply-To: <CAHfPSqAgCbfL2nkrfSYNJZitT-nGw7+5fpR9FMaabmwVJM6jUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2014 at 09:33:21AM +0530, Naveen Krishna Ch wrote:
> On 15 July 2014 00:45, Mark Brown <broonie@kernel.org> wrote:

> > The problem isn't what you're trying to do, the problem is verifying
> > that it has been done correctly - making sure that everything has been
> > accounted for in the change itself.

> Understand your concern. I will try to get it tested on as many platforms.

That's useful, but please note that it's mainly a code review thing.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxQmtAAoJELSic+t+oim9dB0P/jebDkqiuuUfanpDMmS362hr
+VLGU0tQ0QKE1cCyDJaCPGGdRnEBuWEDWqA0LHc4YNoUJ/6yjhTcLMRdPXabk0DN
A8FBeICkOIt6vzVzDokblHB80t5a4vCiKSDD6htgOyZ+Ux5bfQut3BoEKUwwWcgq
6MCPymc98L/C+xb3Dq4pMD4PTwd16DKptRt/x/7FFjVbtMQOdAZ8GeTNu88lSEJ4
3jE2W12WfLbrLiZoQWYVLBOi/XntTYQI+hQZbjvqxon2Z6C/FA1wLi+p7r3sE9Js
s7yL8ooKQDGPV6np9TX2hBiJYgi/mXD9f8Ax+L14Ow/mU+MI1HzEVuwiRpdNKdpd
a0dFpHmE2jPhRrVTfHFwXDf9rV4OrmZlEo1YUrgcb8CTagiSUTJYxDreatI3iTz4
xHtDvSDABy0pTRirDlR0VVNsGCXDvZwTI8p7MvLhyHK2+4tUl5y6KQurGck9+M5p
ls4qYccY9r+o3ZLsOamaDbDNNmKjdjykj8e/HUr5mY4avcAS5cx8mgAegdmOKUEN
7sFWOcDEcJ6FqcKScRLW/uVAiPxOH9Eo7VWSTScer0b6hccG26EoK4trXPTeQ/OT
9tbtfdSn+3BcDkXRd+N9rSl7FfvsaGMOFqh+CsEBxqvVVMQb7P6RgesFIgV2tgY8
DhAB9CalbrPHozjS4nzD
=puuZ
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
