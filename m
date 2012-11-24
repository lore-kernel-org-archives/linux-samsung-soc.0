From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] regulator: max8997: limit the number of dvs
 registers programmed in non-dvs mode
Date: Sat, 24 Nov 2012 18:56:55 +0100
Message-ID: <20121124175654.GH4719@opensource.wolfsonmicro.com>
References: <1353657795-1725-1-git-send-email-thomas.abraham@linaro.org>
 <1353657795-1725-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1353657795-1725-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 23, 2012 at 01:33:14PM +0530, Thomas Abraham wrote:
> In case the gpio based volatage selection mode is not used for either of
> buck 1/2/5, then only the BUCKxDVS1 register need to be programmed. So
> determine whether dvs mode is used and limit the loop count appropriately.

Applied, thanks.

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQsQpgAAoJELSic+t+oim9TWkP/2bsBFoA4+kciro830Q/+egw
/370vhAs6w2XibZuwu7e+0Rbj+2Uxk/ImqO8GMzddD4ug7p5uf/Foi+7x7zuB/uD
z7hPI83fwMPRVYyy5v2u1JIjjY0BXx+nLOZVbk2/fqn3fQvPNPMxOnGeG7Ocg2gi
6aH9xGnZgqBbQd2aH8awaVsiDCXghYR9LNp7X/guGMRDCdBLAnJARpRDFpWgDMuD
tTIw6s7zFRA9xubUqPd+x9VQsZDVexxXUNUofS6NXHkyxGMS/eJrJPYvHbbmv6Rc
X6dNE+193MIlpjvc4c1TCZ/Q4dkbGxL+pluHBnirKtEADp3SIihsy9obEVkZwf5P
S4Ttmq/0VR1ih3g2sq2ew9Ube0Jjr78l6+ko3al9nnAYOb6YeiFyOohs3ujxLCOA
wRcB4oKvyySjzZssRFTtvu4YCM3fZkblUKQ8Yah1sv++QPlTaPs5GHKKqqv1XtSJ
bUumdKj1Dmm6w4nxepgGk8vr34P2HBDYcu38TJ2sbr/g2o3AiAvan2WpTYkWBkug
JFGq20DHsw8j0K1AZALkTVIQsoErC5OuOf6UyfDoJPs2ptgKIsV1O/drkEmt6pEE
bA+c6dAGEs/tlopCVhRWgswFpMI+ryswJlLDam+Q521H77f4a1L/xiwDLjQLFigc
QlGuNw/ThKw3yLEqtjKI
=sw1w
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
