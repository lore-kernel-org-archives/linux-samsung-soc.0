From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 08/21] ASoC: samsung: i2s: Drop spinlock
 pointer from i2s_dai data structure
Date: Wed, 13 Feb 2019 11:50:46 +0000
Message-ID: <20190213115046.GB7540@sirena.org.uk>
References: <20190212180342.32040-1-s.nawrocki@samsung.com>
 <CGME20190212180506epcas2p43d7efeaec4a4ff63d13e5f79b281707a@epcas2p4.samsung.com>
 <20190212180342.32040-9-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1717848281428898805=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20190212180342.32040-9-s.nawrocki@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, krzk@kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1717848281428898805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2019 at 07:03:29PM +0100, Sylwester Nawrocki wrote:
> As we now have the 'priv' pointer in most of the places we can use
> priv->lock directly, dropping extra indirection in the SFR region
> spinlock access.

This doesn't build for me:

  CC      sound/soc/samsung/i2s.o
In file included from ./include/linux/spinlock.h:309,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/gfp.h:6,
                 from ./include/linux/slab.h:15,
                 from sound/soc/samsung/i2s.c:15:
sound/soc/samsung/i2s.c: In function =E2=80=98samsung_i2s_dai_remove=E2=80=
=99:
sound/soc/samsung/i2s.c:1109:23: error: =E2=80=98priv=E2=80=99 undeclared (=
first use in this function); did you mean =E2=80=98pid=E2=80=99?
    spin_lock_irqsave(&priv->lock, flags);
                       ^~~~

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxkBJYACgkQJNaLcl1U
h9BCRgf8C6g91IeZ5Zcqep/EFsANLZTg7cBQGfvyo5yr+WE3Nua7JshkBLE2yT/n
YKyJRAOBg25eFepo6gqzkA0E7z1WwSsT6x4KcinMlOoflE5oyX7EnAv39mxjQwiP
nwrUqxGUyOsh+aNK8b6r2XOpgb1NUhFIoVaLiK3ZRnpQdG16UEpRn6IvT3O+y/p4
7fPABzRIsG27hs7jaHe3/MyfOONsxeIi/COH1QeV9FGJI9hgG9PuwURR2jXJgC9q
ycR9vBOkoMWDYc6jY+slVqKgoUvtiiB823pLpEx787T/Lt6DtIJ71RUeWMz24iZS
9K4/DtsC0Wt+7ADoYMisKkkNNX6d2A==
=YtDk
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--

--===============1717848281428898805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1717848281428898805==--
