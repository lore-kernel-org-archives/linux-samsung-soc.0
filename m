From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 00/22] ASoC: dmaengine updates, secondary CPU DAI for
 Odroid boards
Date: Tue, 12 Feb 2019 16:40:32 +0000
Message-ID: <20190212164032.GH20635@sirena.org.uk>
References: <CGME20190207170044epcas2p3d00762663b971845bc86db84af7d3b23@epcas2p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6cMF9JLEeZkfJjkP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207170028.720-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--6cMF9JLEeZkfJjkP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 07, 2019 at 06:00:08PM +0100, Sylwester Nawrocki wrote:

> I am not entirely sure we should be removing the
> SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag like this, it might all
> be a bit more explicit with the flag.

I'm fairly happy with what you're doing here and the Samsung driver is
the only user so the view of people working on that is pretty important
here.  I've gone ahead and applied the first few patches so they don't
need rereviewing, the rest looked fine modulo the comments from
Krzysztof.

--6cMF9JLEeZkfJjkP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxi9wAACgkQJNaLcl1U
h9BbpAf/S411sGXBqmjs6Jtx2jz3XpgIIjk+NWpojHOspH+IxcPXg80qre60i4+l
LSgxhHK0Z6gHVKYr/xDJVF8+BMwZhbb1s/3G4Sv82JeQan4cCrFcXsy2jf3ePJjm
PSGzEi0eEBFqsIbFrsD7rC7UANZ3mKlLWkwfDhdH9V9m4Xq5WCfRvy531WJP+73I
rl4LKj0lnYnBd9AeVSAmqaAXwLvOFoeHBxAi1OCDufakDNbjA0r153fFLQ3aCSG9
otz6eVRta8xiV9/sEtKLC136fuKhy/FKjkGPkprFAAGOOCrbYjaXP33qMFzH3i/1
7L5eVQCACbaIl+LnzVOiqUn+Vd+ofA==
=i+P6
-----END PGP SIGNATURE-----

--6cMF9JLEeZkfJjkP--
