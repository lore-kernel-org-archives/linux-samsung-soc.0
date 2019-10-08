From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 13:06:11 +0100
Message-ID: <20191008120611.GG4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 02:01:15PM +0200, Marek Szyprowski wrote:
> On 08.10.2019 13:50, Mark Brown wrote:

> > This then means that for users that might legitimately enable and
> > disable regulators that need to be constrained are forced to change the
> > voltage when they enable the regualtors in order to have their
> > constraints take effect which seems bad.  I'd rather change the the
> > cpufreq consumers to either not do the enable (since there really should
> > be an always-on constraint this should be redundant, we might need to
> > fix the core to take account of their settings though I think we lost
> > that) or to set the voltage to whatever they need prior to doing their
> > first enable, that seems more robust.

> Well, I'm open for other ways of fixing this issue. Calling enable on=20
> always-on regulator imho should not change its rate...

Yes, although there is the whole "don't touch things until a consumer
tells us to" thing going on.  I had expected that this was kicking in
because we weren't paying attention to the constraints of disabled
regulators but I can't see the code implementing that any more so I
guess we removed it at some point (it was always debatable).

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ce7IACgkQJNaLcl1U
h9AGmwf/UbimQ9sq/zEYWdR5N0U5nYyw0n1illJslo92MzhrHjeXkA+J75dNT9wo
E1wtoPEndtrRtb0F+650lzfqvceJauFIaDwb2WvG3vxutwoSdFCJ9qjoPoXLFZOx
T0gTrPtDX9HHTgMoFackql9B0xwjwHg+cEV6bcAfw3B4F6LnwYIZB27i4Rbf+DXt
oxB70sgrULzP0QJAtJLMN3QZtNOg94vNdA8xH83V/FeXdtZiE1VLlJVSQ0hjAjc2
GJ+zjjSFfC5qRLw+DpKpF6CbBO9NwkcBEhFt5CVNiQlQCwL/tuXHBBGUAXvlk/GN
zDivlP9XJXhyJRNSbxzDX7C4rEqn3w==
=Qc9y
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
