From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V4 0/4] Add i2s support on smdk5420
Date: Tue, 13 Aug 2013 13:44:40 +0100
Message-ID: <20130813124440.GX6427@sirena.org.uk>
References: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3570972419390641962=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1376300994-1679-1-git-send-email-padma.v@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, abrestic@chromium.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============3570972419390641962==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BuJNKmHfbt8dxFpC"
Content-Disposition: inline


--BuJNKmHfbt8dxFpC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2013 at 03:19:50PM +0530, Padmavathi Venna wrote:
> Samsung has different versions of I2S introduced in different
> platforms. Each version has some new support added for multichannel,
> secondary fifo, s/w reset control, internal mux for rclk src clk and
> tdm support. Each newly added change has a quirk. So this patch adds
> all the required quirks as driver data and based on compatible string
> from dtsi fetches the quirks. This also adds i2s support on exynos5420.

Applied all these, thanks.

--BuJNKmHfbt8dxFpC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSCio1AAoJELSic+t+oim9ZVAQAJqqNtPRzZ4J9znXd2zzhfeO
ILyeXz+JDWlbCQBaqWSAVC2r0HIabzdfo0wXMWgd1EC4JDexm5ttuFl+IoXFRpRI
KB8ZqSE5ZarJDXNrd5OPwwgYGaVX3GK3eXvaVDzB7NDiWqIlxzLJhdyNp8pkVtIK
bqF7qq9ghHJhMr3TBzV+zp3d4kpEXMWMz8KiBOgKoSb14odeknbVWqTClnJ+IEKG
f82hUFB9ebJ5tUTc26S46J3WtGJzudPArYPC+7hu4lxwTmt5YXqPIezaMsOanyLJ
k1G4X3jQoP2HuM/lliQXf5J6oFQNsos2mO1fGvrTB5gYGgvTNVd122We+FSMXFZ4
EcGAln3SLYM1q33o14LJADFSxStLQU/njMLzJrZ9r/RO100+EVCUPJx3Gj9XwAsv
8aOZ87dPl8ccj03EjOPjFDSd4zpAgvsCsDsw6YXdLN/w7DGh6IbadojQxsEA5swm
pwa1/MZcdTyJONyyJyqSPy5YuVdsf/rWatCO1ll5Ul8DDVpTVGpYEYojuDHBf6Ul
1qrcAzf78EfJ3yuQUZIrnCrBnPASOYfKNjyoYn+0XLXmTzyQS3WUqj6Iqg1Ywki5
UNcbyJool+z1o5auxcdAqtmToW5eCSWV3Em6IGCI/8mesGPwlr6PpuPnTgPiNIF3
MCZQGwbc3MWqJUSEOuBL
=7JDg
-----END PGP SIGNATURE-----

--BuJNKmHfbt8dxFpC--

--===============3570972419390641962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3570972419390641962==--
