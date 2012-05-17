From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle - declare the states with the
 new api
Date: Thu, 17 May 2012 13:28:02 +0100
Message-ID: <20120517122802.GG26337@opensource.wolfsonmicro.com>
References: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
 <1337004377-17732-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51778 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755165Ab2EQM2I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:28:08 -0400
Content-Disposition: inline
In-Reply-To: <1337004377-17732-2-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 14, 2012 at 04:06:16PM +0200, Daniel Lezcano wrote:
> The states are now part of the cpuidle_driver structure, so we can
> declare the states in this structure directly. That saves us an extra
> variable declaration and a memcpy.

Tested-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPtO7LAAoJEBus8iNuMP3dZlQP/361ID4+EODBoLILsKwdySYE
SsQGihWxieEK+xyIW+iGViiNfovGem1nDRCpSiIiqAvb1yT9w0zIUebKWVPOj2t5
i/8Gx7gEIlC+FmIkH0eVWR8XCFLiJ7MID2EFhvg8bsLbP8NvtC0DAs0jPMMv3a9Z
g/nSKky3DTnGVAsan/l0qr5SfQuWc02Zx7sXE/BsZGlCBhK2PB+GNFzfOO/j5sa0
aniUEl0AddfN3Xhk6kF0dm7dc6uUawpv3wxjuj6OOd5zLkD5qJnSJCvpmTK2RB00
QF/yMR71b8M6t2U+PM+3YLnZkr5lw7eZsA/joDkiROETkSGIx1+yqTfp6TsKkjPS
HgldEKtVmE6hoWWJvl90R8r8kGCiXIxE0YcY+woXeoLY2y4hKYOAPAEGsRnEQb26
di8oX29lEkyVAhzyJmegwlxlU9Au3/HUyulCfcLBqHGqBFWJ8mFeIUJI/WxMXYJc
0Sn4Sj7wnBafzqxC6sc/tMET5gQa+4wf6VBrewh8/TFGIZs0mDdtB9tPj3bjNute
j/zOZe0DXhqv7xh8KxIntif6OPut680qGMyT4/T7IZwfnJKCfEomVHBr/MgL18Z0
/FdlDPpPOWuW62j30M1jFlN/3LUFdAvAtEd4G4NV82YAV6IpwNigJZdJHbNmuzvA
eSijxC/tYoiOyjI1YnP3
=08TB
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
