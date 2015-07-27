From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/4] mfd: max77686: Don't suggest in binding to use a
 deprecated property
Date: Mon, 27 Jul 2015 11:33:16 +0100
Message-ID: <20150727103316.GV11162@sirena.org.uk>
References: <1437114567-17629-1-git-send-email-javier@osg.samsung.com>
 <1437114567-17629-2-git-send-email-javier@osg.samsung.com>
 <20150720081020.GD3061@x1>
 <55ACC986.5040408@osg.samsung.com>
 <55B607B7.6050803@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YBvFKvyrw8Qeqs3/"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:41655 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071AbbG0Kdb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 06:33:31 -0400
Content-Disposition: inline
In-Reply-To: <55B607B7.6050803@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org


--YBvFKvyrw8Qeqs3/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2015 at 12:28:07PM +0200, Javier Martinez Canillas wrote:
> On 07/20/2015 12:12 PM, Javier Martinez Canillas wrote:

> > This PMIC uses a single I2C address for all the regulators and these are
> > controlled by writing to different I2C register addresses. So the regulator
> > nodes don't have a reg property in this case.

> > By looking at other regulators bindings, besides the generic regulator.txt
> > and fixed-regulator.txt DT bindings, there are only 5 (out of 40) that use
> > the node-name@unit-address convention mentioned in the ePAPR document.

> > AFAICT all these are for regulators that are actually in different addresses
> > but I could be wrong so let's see what Mark says.

> Any opinions on this?

I just don't care, this is just syntactic noise which has no practical
meaning as far as I can tell.

--YBvFKvyrw8Qeqs3/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVtgjrAAoJECTWi3JdVIfQvp8H/1gEvXFldCKHKzcAkeyiPUIW
bo8kxMF7QfbucXqSU7ebsYqCI7roO7CbQCuSCSyjGsc78vchcacAdKaFs523FXbc
tx27XDN5sbUx2ifpk8n9yt9lGbrghw0FZVn4HVbsk8Ku+ueAJbX7BKx1h2dy42gA
qcGtWKq0nqDZLhjEcdr+t1SkNEfG1ViN/F3vfY0qPLB8b6Tv8ljQMEYZ1MlqITOh
gnfyfIUzU4Xt4FXybI+4LyFdwTRC5mYlJrXJurVdR7cfSUtj6bnqiU9w2g9WAVAc
7WX7kmgn20xAclWfodeqz7syLDYu3YCY+jo3XuvalqxAGM1wM6RbOc7ZxPg0drI=
=g0EG
-----END PGP SIGNATURE-----

--YBvFKvyrw8Qeqs3/--
