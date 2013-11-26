From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: Use ASoC dmaengine code
 where possible
Date: Tue, 26 Nov 2013 10:23:11 +0000
Message-ID: <20131126102311.GW14725@sirena.org.uk>
References: <1384264120-24750-1-git-send-email-broonie@kernel.org>
 <1384264120-24750-2-git-send-email-broonie@kernel.org>
 <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456736532150454773=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAAgF-BcJZrwwHYtk6pKj_-+CzmbhhV4V_Z02kjHveObOR6oiFQ@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Padmavathi Venna <padma.v@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1456736532150454773==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vHrcnSuaBi45WmF/"
Content-Disposition: inline


--vHrcnSuaBi45WmF/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 10:55:17AM +0530, Padma Venkat wrote:

> I tested this patch set on smdk5420 i2s. During playback audio playing
> fast and there is underrun error like below.
> underrun!!! (at least 0.061 ms long)
> underrun!!! (at least 0.043 ms long)

This sounds like it's setting the transfer width incorrectly, though I
can't immediately see how that's changed unless the DMA driver is not
working correctly.  What exactly did you do to test?

--vHrcnSuaBi45WmF/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlHaLAAoJELSic+t+oim9DXUQAJhcwoqibr6Y59jKPWz1upqB
iaoQcaWqAkIxv/xu56D4xvXj3NvR4PQcZWMRD5eiprh2sZCsLGyBumC01x7ozDcO
lqiJrzk0AiLtO/4o2aA+RwDdlizxmGVNEVYG/oDOqZsE6XrnyLc0iXnFxoSlHuft
a4OIYcOWow9GmUGAt5TdkmurBAfAuzdlU8Ssb4L0Oo7lcbO85+7kYUs0ggVfOSJw
QM04+mydltK/0aAnn9JXnc9ioToYv+TNGGmiYA3g6ImBRlv5eiNU0NHVcDYNHTFH
1JIwus4miPtyOdAnGjXVTOS5wNxN21NH3gjWNKj1RHiHVwOBwDwge1vodFGCWkqt
DLaUGa4nr0daiHCBpQalbN/kkkAlma4eBlh5ksp1kfOd3pvEUjGfsO5G8TIJkMm3
YJ6j5H7z8NjC2yQx8dycS1mAbZzGXW8TsIMw1ZPZ0jL22FrdMawGfHCeMMXsik0y
OIYbFpjvkYn1AFe5DL6m7VHSX+JjBstD5FZLNy+PoyMlvzGdTb9tmMSkuqCO6SI9
qOFS7G1tCDKjFrIDZe50/SBgujHvTWtOJrr2Vsmxem6SxnuTDWi12j/CHmREAziJ
+v49l4Czsz+HzQV6u8ANyaYN1GNvkxnS1zsQ1h2Pxfs56Lz0SSRetaEunFyDqAo+
l8+1niaOK1Tbz94AJGg3
=nUxc
-----END PGP SIGNATURE-----

--vHrcnSuaBi45WmF/--

--===============1456736532150454773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============1456736532150454773==--
