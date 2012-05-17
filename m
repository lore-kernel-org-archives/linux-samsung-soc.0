From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ARM: s3c64xx: cpuidle - use timekeeping wrapper
Date: Thu, 17 May 2012 13:28:57 +0100
Message-ID: <20120517122857.GH26337@opensource.wolfsonmicro.com>
References: <1337004377-17732-1-git-send-email-daniel.lezcano@linaro.org>
 <1337004377-17732-3-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51788 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754655Ab2EQM3B (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 May 2012 08:29:01 -0400
Content-Disposition: inline
In-Reply-To: <1337004377-17732-3-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 14, 2012 at 04:06:17PM +0200, Daniel Lezcano wrote:
> The timekeeping is computed from the cpuidle core if we set
> the .en_core_tk_irqen flag. Let's use it and remove the duplicated
> code.

Tested-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPtO7pAAoJEBus8iNuMP3d1xMQAIoKQSu8D1ErzI8qUeqPq3lQ
m3xZJaf1g8lE3lbnmaSsbBAudm+vY2cmfRsdXxC/q0WSXCMBgtQzgbSWuZ42li/6
dKG/8K4LZh9ZO/+zaO8BSDZVHC26RkeCsqhVqayTBlXdJ3diWZXWNDPKWdoPaXlk
geE7kW/z0pNuCcW51GchVhzFpBCUUdIKvclPwSAvWMR/afVUsjNlzWg+HQfwYpqs
GEw32OlcpCikHJ9ycCuiFbL7I1GrWdg+ICNpzLARZQv0xYXCTbX5sLkpMm5Gelxu
UKSHxhiwjjaiRJdDjH7WfJT9wgHwbWl3IB6Ovp4qyD+dYlLU4GimjpYqbVveOnXC
1Hj9aUF4o4Vm6ymlRyU/kWfPMqjVmpqh+G/0H3t3Ktt12LqKkHKeqkyGlNWjrzyU
I+7ZVH5b91Lv95mh1Q4BQVRc3cSF8tEkcGnk9AAfzKf+7YfL/bB1B8lEFgN4r3ee
4MsS7kBXrtQVOhBCkmrSHk2+Tq7AwlTSVXhB3T/EXsgDnsctyY9k96t+xDj5xygw
JqLvdw2/VGZC5SaPfX4lpeIUyZYMwobbmjYGKU2RP7M7WV3/6DpGGfxz52kZ/rks
pOOsyAZvPqMe1jMKzEvxHwYvXb9ikiVklJr8bhrF47kDRzXimBZxwxzf+yS95Uyb
8qIEL7TYe+ZOoFwSvh2h
=ymxL
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
