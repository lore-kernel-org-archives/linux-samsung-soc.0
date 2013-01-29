From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 07/10] ASoC: SMDK: WM8994: Add device tree support for
 machine file
Date: Tue, 29 Jan 2013 15:12:41 +0800
Message-ID: <20130129071231.GG6878@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-8-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40701 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753727Ab3A2HMw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 02:12:52 -0500
Content-Disposition: inline
In-Reply-To: <1358509629-20471-8-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 05:17:06PM +0530, Padmavathi Venna wrote:

> +Samsung SMDK audio complex

This is just for SMDKs with WM8994.  I'll apply but please send a
followup patch to clarify this - it'll be a different binding for others
like the older boards using WM8580 and WM9713.

> +		samsung,i2s-controller = <&i2s0>;
> +		samsung,audio-codec = <&wm8994>;

I was thinking this should really point at the DAI but since it's
specific to the SMDKs I don't think it particularly matters - they all
use AIF1 anyway.

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRB3WlAAoJELSic+t+oim99M8P/1ip3oe2f5jXA9OapyY7nH5Y
dXREkRc8mmtFW7WgIEQvlLaaDhUzS7Soz/pbvl6A0Q3KILc3vuSMbLQA6PlWmyGU
AjYEOLxO6ZnmkULSgxgFCJC/biJafs3Czkw9KsqlPZmvVpSfCg/K9JL+jbzinsw6
fE9xd8GznkOu7dg1pLjClNdpvJvwR6QeD1Rr1yl4atuH2jMIEbo93pCzrocIhk20
Fcnb5DTEHYp0yw6lAB2xJspWLSgx5B5W0b9jeHjm6BbVcJLzfAr1B+EYTCfqiMrH
UHrBiN9TehyOSCH6vysCJwyjRijSvS+7w99DF2hg7bsHu5RkNZrf3vMg5S2o5tfL
IFl8lzNIWPvxUy7u3VyaaXUrlpIjdCLKtHfDVucuYDNGCTfC+xcdqy4qHe3bpLvi
mRME4MKRXnbZMXsrS/FCNV2/R3PhAbM8Hs6SQFKIHQS+yoVfrYjioy9wcpnRpY9R
uygB4XK4UMTXgyHRwbc5L3eofS4xCnN6qOsCO7na8yq6ahcMXyqIR8BkE5kHfM5/
Lx4z8FXYBrx+HKG+XJVMcH8zsaSmVv27ZInCtiRA7Ez8DrPkp7dLQqL8eFeJk5Xw
3W+s9XObNsgnKkAM6xvcaO2KYQWbaWXp/oD+3m9vVDDIGgD1yP/eV/ERcL4+5lPc
7d/wx1Vrw4zApY2c3ZhN
=DqlG
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
