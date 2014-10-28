From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/8] regulator: max77686: Make regulator_desc array const
Date: Tue, 28 Oct 2014 00:38:43 +0000
Message-ID: <20141028003843.GM18557@sirena.org.uk>
References: <1414422226-10948-1-git-send-email-k.kozlowski@samsung.com>
 <1414422226-10948-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DLrrb1ThO6aUXDeM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414422226-10948-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--DLrrb1ThO6aUXDeM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2014 at 04:03:42PM +0100, Krzysztof Kozlowski wrote:
> The regulator_register() expects array of 'regulator_desc' to be const.

Applied, thanks.

--DLrrb1ThO6aUXDeM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUTuWSAAoJECTWi3JdVIfQD78H/1KsM8QW4a0/mMUJp6K8714S
XycwEQKUcu4n/uIx5w39oLar47UrhrwI8fjjwSywnxj96ZxyVUpOLSRAo9uMxqHm
WYDXvibXIS1ZorS8Ado+WvzMfN+UDTNlsv4qVSIYchPGhXCoVUBI97CDFpvHlhdF
i9T1PKCibFtjBjfk6UMGJ02Yw7Uows06mN3083FdFjDvnf45HHyYB2oLUrt1TsSL
ANzFeuw74XB1Q1yfiFVEtB+cyfuZEOJs2ovjygHeOOwJ+P+j8R1XWCHMGHmuGwhL
eYGeFRbA0tf/4zdmF8upWjcwCm+v2BM50rMpnHxIIReTflpVzdDwD0gO2qdF9u4=
=1x+4
-----END PGP SIGNATURE-----

--DLrrb1ThO6aUXDeM--
