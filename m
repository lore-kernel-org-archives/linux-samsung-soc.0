From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: fsl: Constify platform_device_id
Date: Fri, 1 May 2015 17:51:51 +0100
Message-ID: <20150501165151.GO22845@sirena.org.uk>
References: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
 <1430496014-32309-3-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aKTE1b/cJViV0G00"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430496014-32309-3-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--aKTE1b/cJViV0G00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2015 at 01:00:13AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.

Applied, thanks.

--aKTE1b/cJViV0G00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQ68nAAoJECTWi3JdVIfQyuoH/jdUX9612tajqc3lmGrV7vyT
ciNYRyyYFUMUqJLeVFRDuo+Q6i3PwRjBSC6yPoWv1+MPgJZeQLCzA9yQCt2xCrij
TiNPscnvgJybXsJ2QR+FzoH8M0PbtykVDI6gUSeXD7hAjfQFItTEX7l9CZbhGqLN
0VYyE0YtjvFoTcRGCX+MxoXNV0sBWBpKgRZvD6tt5KAfMKfG/E1VbRmj+lgpIh2C
mOzxwsvu+zoLczb33x7V+y7rYCx+nSQVtUJOaVvCPqzjD7DxxyH6S/ir5OEmtMrC
b9RlUioM9WghI/OVTyPK9RVZNLdyQW5T3kZYJXi5Bn7/nAMW+3karfLPetCTMCM=
=995z
-----END PGP SIGNATURE-----

--aKTE1b/cJViV0G00--
