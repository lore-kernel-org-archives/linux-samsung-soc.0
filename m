From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/1] ASoC: Samsung: Convert to use snd_soc_register_card()
Date: Tue, 3 Jul 2012 19:48:20 +0100
Message-ID: <20120703184819.GW29030@opensource.wolfsonmicro.com>
References: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q/AGl/UrDvkbRExF"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58149 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932255Ab2GCSsX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jul 2012 14:48:23 -0400
Content-Disposition: inline
In-Reply-To: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, kgene.kim@samsung.com, tiwai@suse.de, patches@linaro.org


--Q/AGl/UrDvkbRExF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 03, 2012 at 02:04:04PM +0530, Sachin Kamat wrote:
> Current method for machine driver to register with the ASoC core is to use
> snd_soc_register_card() instead of creating a "soc-audio" platform device.

Applied, thanks (it's not a generic Samsung patch, it's just for the one
board BTW).

--Q/AGl/UrDvkbRExF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP8z5sAAoJEBus8iNuMP3daooP+gKq4PWE0G3w+vwqm4m8ReVc
XnkcOiF+oi6ePxUD3F+eVo3T1IzrO0+DGtweARnmF8AGV+fzUK1khUCOvxD7K5iG
FETUbJrb79Fup9ez/83VsDzks73abZn/Zt3/GSGSVVoL9IddENtfW2JI4+wvc0Vl
bpsHrtmvSQI+4vlUwMz9hz/qJur6F5am3FkCsX+8h4/9VWsfubfuT/uoI/vjDlSv
oj+5bKrDodOm8hETyyXstMZX+JY1LM+FmmHxf9NpFuuV7aPLkZsW+P4Oi0Ce1ffH
dbW1nWqp06d8PAKds/9mrP0rdOC12/uWbCwjg74whlcrXiSoo5tn9vXaThOl36KA
23MNSl4/3Xgu5rzzNRXZfPZX586Ywzz2Eaj/uKEa1YN9YM/6hBZIPaBNeVZiu1vy
MMfUvQAs9qYmKfqBwLLDQkLAIFTmuSmGZgvNcv6A5ZjDP3RkgWYPcBGfm8VOR7rb
e0VQbRM9UNgESODp3fVrFSYLuKjnHUKdaHBb0OUlj3kts7O8rLqJ6QWT+ccpWPCj
hhbg4+VfX/qQhjkX7Gb+bNDbce2Y/9Ng8Txh2LpbAE3F7TXeYav456FdziYKzojT
Zs+/uYcNBd0oUXa87ZqS9CfgrI/rIfn4+KYe0ffNWd2iJrnPIyHKc5wHV/Pmc+GT
38wfGkqrE8jP7rypI2Kv
=kBr5
-----END PGP SIGNATURE-----

--Q/AGl/UrDvkbRExF--
