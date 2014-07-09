From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 00/14] drm/exynos: support LCD I80 interface display
Date: Wed, 9 Jul 2014 17:23:06 +0200
Message-ID: <20140709152305.GB17359@ulmo>
References: <1404779987-5337-1-git-send-email-yj44.cho@samsung.com>
 <53BD5A9C.3010001@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2033144852=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53BD5A9C.3010001@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============2033144852==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 12:07:08AM +0900, Inki Dae wrote:
> On 2014=EB=85=84 07=EC=9B=94 08=EC=9D=BC 09:39, YoungJun Cho wrote:
> > Hi,
> >=20
> > This series adds LCD I80 interface display support for Exynos DRM drive=
r.
> > The FIMD(display controller) specification describes it as "LCD I80 int=
erface"
> > and the DSI specification describes it as "Command mode interface".
> >=20
> > This is based on exynos-drm-next branch.
>=20
> Thanks for contributions. Picked them up.

I'd prefer if you didn't pick them up. See comments to patch 5.

Thierry

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTvV5ZAAoJEN0jrNd/PrOhCtoP/0z/kgxMY7jK79JgHTvbI5cr
R5mJ9/Hvzp/+V+5VrsCTOyIjPyRky0rZbi94T22mEvFBrR9LjDzALloCOZOb4PIE
ab48ErqHkV0vq1kyiC15tR17U8RLl+E/3Ci19p1ppffybifF/vaO/IAjON8sYi07
hLHIStgd6WE+w7+wEPBucwswtyCt+MgMv9pPECnVtJQGQwkB8XB1sXu8z3fiMu1e
9K1NqD627gbNbcWCULWqb5kGx/QD9Yz5hBod48AxLUc/RPOxzMfF05hUw5eSifcr
zubYx/jn8lpa+/SsBbTVIqxYklEFTGhdGyDVlPkjO6J55j0hmiAa/pPk9lu+pWBp
Wk7RIhUnofebzYXmx5pzqXkY6FOH+gVOdAbD7C3QYTGXUw4hRaLjslBW6+6lu8p3
/cr97qVcb50TPjWyQEn0RIBTrl4enAukRfbJ99xtpCKPaH2gHCZ3BZeHdmFQDupP
7ImBeAps0dENALTG2MmwYlhhMyjqoKv27bF2WIRO7TiVGQyJEDO5WWl6M/SuAsif
Od/PWmSs1Rdq2NeUvTvAqxnZQf2gqNMpHZmEvPiFDWJMDcV4kfD/MjZddLA3wHNX
724JNYz24k0YNM3iX6F8uHP5iPB4s5giaTJ/PQsLzlntEJrvF1A91LD66IOmE919
OlGmAAi87wxJJuDDLPqS
=DKxC
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--

--===============2033144852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2033144852==--
