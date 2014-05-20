From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Add 'mclk' handling for
 Snow sound-card driver
Date: Tue, 20 May 2014 12:16:00 +0100
Message-ID: <20140520111600.GL12304@sirena.org.uk>
References: <1400559942-5666-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1722724084882285034=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1400559942-5666-1-git-send-email-tushar.behera@linaro.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: dianders@chromium.org, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-doc@vger.kernel.org, sbkim73@samsung.com, t.figa@samsung.com, rdunlap@infradead.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1722724084882285034==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P/co8ZP+C4wcN8Yg"
Content-Disposition: inline


--P/co8ZP+C4wcN8Yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2014 at 09:55:42AM +0530, Tushar Behera wrote:
> For audio to work on Snow board, we need the codec master clock 'mclk'
> to be properly configured.
>=20
> Currently XCLKOUT is configured as 'mclk' for codec chip and it is
> required to be clocked at 24MHz for the codec to work properly.
>=20
> Add appropriate clock handling within Snow sound-card driver to set
> 'mclk' to operate at 24MHz.

The clock here is connected to the CODEC on the board so it should be
connected to the CODEC in the device tree too.

--P/co8ZP+C4wcN8Yg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTezltAAoJELSic+t+oim9pTsP/j2J/0qbHTLC/QBWUCY5IppL
9OWrNQUz4XE3lAUVM0yRuVTt90+EdgM21A1qTq2ojz/MZXdST6udFkRBw6YRJKNL
xG0antQhhd1ez05mg78bkK2qzGb/oCGUQgJfPQoFhTlb471GnnfmR3K5TR98I08D
1IyA3SLq6JcRA0bBIWED1cGRw0T639QV3RGuTEbHUQ6ZDG5Nl8CwI8RdgPWxzkn2
xcTaMQa0cMDozcxz38cuqIWnO+jwv30fPPxn7CnzF+HE/qzKMj8PAdlc2WUQqNks
6YCbkM4N8EbodVQ5CUJ0/EmuZTA9lHazKsUF01eVFayM/QYcdZXoN7+Pqo/B+KSX
GMsYggkduK3A/vj5YbdtjDBGI+Hbt0wEQmuyPE3SCCbUKdrmGlvUNthlwmdMLpYP
QmKczhQuIJZSYy7QOf+jTi3v62CzqURBXr/p6qiNXwrVT7lGUdlUHug5i2igaCkO
VE3wQx5y5oIStUqOzdzi5Gr2PU6Vs7x4l/hMP0STRVlismD4AxSdDbXO8edF8BJ8
4Lr80mOIc7A5YSngWEbyyEydIcoRSKEmERmNF4R4/QW1Ja0emwgiHpLKRBQkrPE9
Vbq9mFUfJojXKFU2ZBb8rYKXznl737Nmm9XFsg2OcodtxShGo0TkSAi2jp9/97vF
fc9nkwdtSiXdRsD/cmOi
=z2EL
-----END PGP SIGNATURE-----

--P/co8ZP+C4wcN8Yg--

--===============1722724084882285034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1722724084882285034==--
