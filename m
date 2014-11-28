From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/7] regulator: dt-bindings: Document the ena-gpios
 property
Date: Fri, 28 Nov 2014 14:29:38 +0000
Message-ID: <20141128142938.GM7712@sirena.org.uk>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-3-git-send-email-k.kozlowski@samsung.com>
 <20141127183058.GB7712@sirena.org.uk>
 <1417165784.18249.15.camel@AMDC1943>
 <20141128112116.GG7712@sirena.org.uk>
 <1417175667.18249.26.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QrUjNlhiyonfhBQa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417175667.18249.26.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--QrUjNlhiyonfhBQa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2014 at 12:54:27PM +0100, Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-11-28 at 11:21 +0000, Mark Brown wrote:
> > On Fri, Nov 28, 2014 at 10:09:44AM +0100, Krzysztof Kozlowski wrote:

> > > I understand your concerns here however I didn't want to overengineer
> > > this. Is the same GPIO (on more complex PMICs) used in different
> > > contexts? Like enable control and something more in the same time?

> > Yes, and it's often reprogrammable at runtime.

> I have doubts if generalized code could support such configuration...

That's pretty much my point.

--QrUjNlhiyonfhBQa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUeIbRAAoJECTWi3JdVIfQ6+IH/RhNfucFIPUqbqaU0jpQM4GT
oyosDk2AJTo6JEYI9+NFH9CvZc/9RLb3d2eN0NaOKnY53jpVHN9xWMIDjEAWvM1Z
PK8oJzM2RxLC8GV4wfJWLRotczV9Sr7AwgLf/A23ItLzoVrffSHMLKN2NbTWUMEe
8BcZWKt2wjazzbX8N06szyQpWLDN84OcCWztOJ0fVaaDAWBI/nfioJXw3DWQacAy
bFvK922J6+Ix1YxTVbpFYomVx46mZtZWoJ0g89OnE3tERsUtzAdytMgi1Hi2ACD3
o0SDKuD/Uho8jFJIIVeUkmrWhIlpM+lXjbNLGK07ulzmOwrZnKH4bJKqyi/95Ho=
=eEFr
-----END PGP SIGNATURE-----

--QrUjNlhiyonfhBQa--
