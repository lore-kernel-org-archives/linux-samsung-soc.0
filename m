From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Sat, 21 Jun 2014 10:51:49 +0100
Message-ID: <20140621095149.GY5099@sirena.org.uk>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
 <CAD=FV=Ua+P0CBAfNj4SWWMWRKcEFdmh=akwy1-ZWoGOt2P9=cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zf2GVRt1JP70ixMf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:51686 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758167AbaFUJwk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jun 2014 05:52:40 -0400
Content-Disposition: inline
In-Reply-To: <CAD=FV=Ua+P0CBAfNj4SWWMWRKcEFdmh=akwy1-ZWoGOt2P9=cQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>


--zf2GVRt1JP70ixMf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 20, 2014 at 02:18:08PM -0700, Doug Anderson wrote:

> Is one of you two planning to apply (parts 1 and 2)?  I know that
> Kukjin needs to handle the part 3 (the .dts files)...

> Ideally it seems like it could go to 3.16 since it is a bugfix...

Don't nag, it just means yet more mail to look at which makes things
worse not better.  Given all the problems the DT code for this driver
has I need to review carefully, and the fact that this has got to v5
before I had a chance to look at it sets off alarm bells too.

There's a couple of months to get bug fixes in yet.

--zf2GVRt1JP70ixMf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTpVWyAAoJELSic+t+oim9gQgP+wdFJ1qWZRFGMWZbep79ZPl+
OQkGtvCSq6nAJ1pAZYo4YyVnRAfSsOkQLVtfMoqz1vuaueqxxjV3Ti7cix0uqZlR
Bdq4KYVsaGMpf6YH6roUm0w1NKkrbdwchhVMP4HSmBII5UKZNzVxSgagtWeifsiQ
FvXwrEW8Vj72UmrxJWhk28iF3lrhJ7Hhqq7RfFaOaN1Ezej8R7odY/0CHDuVMcTb
zmVsPztVmGmXOaQbIgZ7ZxxZpixNl7L5kAcfH1T3tfpiE+yk9fOUAapsl4aNzJtA
fuTaXrmcrtEzA3Xsr2RJOYezxncGtOThG4jiKrcXVbCaKfRlGXUl34lolGqJDXrM
QJWk65gVHm51bGb46NtyWjr33Q+3AV7swg4Ym1RCvtqGOlv2FjLSgW+eN9aexidx
z8i6UMFT02ddom2NzZvFQha5Qyu+56SSB2V7AgHw0aKPJTiHGStgf1rQiG8jzyXl
b8YLNxvbVCfX9OV81FGEXPUHi0V16RfvRUZP6jhOL49dn8Y03S7/9gOUSBQ/BGJ4
N+Qiss5xEdnElVhQ7JD3+POnBnVU4OQ6b0nD9ryuNuzA92blFsvdFHoBXi1cC1nO
4do9/sPPaRpj3i/DaXyex/pI6Xdkxar75x2ajzmx6YcXVZ6AE9zoHCrmL3ZL7VHc
mMVtLWn2aQtiDEkWMaQE
=ax2N
-----END PGP SIGNATURE-----

--zf2GVRt1JP70ixMf--
