From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 01/10] ASoC: Samsung: Rename samsung i2s secondary
 device name
Date: Thu, 24 Jan 2013 14:41:12 +0800
Message-ID: <20130124064111.GC4955@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:45017 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751278Ab3AXGlZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Jan 2013 01:41:25 -0500
Content-Disposition: inline
In-Reply-To: <1358509629-20471-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 05:17:00PM +0530, Padmavathi Venna wrote:
> All Samsung SoCs has max 3 i2s controllers. So the i2s secondary fifo
> interface device id was named as samsung-i2s.4. Renaming this to
> "samsung-i2s-sec" to support device tree in i2s driver.

Applied, thanks.

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRANeAAAoJELSic+t+oim9ndQP/ima1hyyIS6X1SLkrMFm14t+
W5/vP87orHdz/7MHaBfPO+syHV5uzsuN5MUfrJsIzGt7UemIVDEtkz+1wB8VB5oy
mUwoeh8uKDzbHHD+Lc7PKuQOma/rgNX9WGVNap+MFqnL5fPwuRCeTaDBjfnbqtTE
JvRZexCTKCKCkR2zMaJ4a6YXM4UwIyB9G7CMhodt479daraHJKqswuIVx8sU0C9Q
MTIE93fF4fznteriRXBUfQsdbxLCgSj37/0kLEN6qek6K61oFnj0jBG9khGxNwaI
Bio6fUaneH5Z2zkbviTl2wVMFFgH3Vff7gv0TI4lk6XB6zP6HN6b42aT1APRiwFc
75S4Qlx8HVbluS2N+cFO//vtjtGg0niFxTZHnOD/Z5ojeC8yChJCowljqshEkt5+
oMSien9dRMgi1Po0YF6uMd2p80eKF2glWZNVcDL0+06SeSurC8AULi6EDPxVNtCk
jEFqH5CqDIipBUFOPxcwwMmbOj8UToIrv6uY539n/durXDtlHQt6oBR3pN11gvgU
LIV7GjPAk9RvYkfIb9HcG8jOtIXS9QJu6KDMYEy0renkIwiD+Nts1t9I1Tl60SAo
PKC+tyTF7Owu22aoU+IqAvRbKzz2qzexY1wiPWZ+rus5i3atkkKJJMfqpXEvGlqI
rKpC4pS1jWi84VqxNE5g
=twyB
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--
