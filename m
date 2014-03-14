From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: add initial dts for Samsung GH7 SoC
 and SSDK-GH7 board
Date: Fri, 14 Mar 2014 12:48:31 +0000
Message-ID: <20140314124831.GU366@sirena.org.uk>
References: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
 <1394491879-5320-2-git-send-email-kgene.kim@samsung.com>
 <20140311182922.GD3263@e106331-lin.cambridge.arm.com>
 <01c501cf3dac$022879b0$06796d10$@samsung.com>
 <20140313103329.GD5035@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FqExhoTtZ2UFWcPs"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52289 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551AbaCNMsm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Mar 2014 08:48:42 -0400
Content-Disposition: inline
In-Reply-To: <20140313103329.GD5035@e106331-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, 'Thomas Abraham' <thomas.ab@samsung.com>, 'Ilho Lee' <ilho215.lee@samsung.com>


--FqExhoTtZ2UFWcPs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 13, 2014 at 10:33:29AM +0000, Mark Rutland wrote:
> On Wed, Mar 12, 2014 at 04:31:56AM +0000, Kukjin Kim wrote:

> > > > +/ {
> > > > +	model = "SAMSUNG SSDK-GH7 board based on GH7 SoC";

> > > Is the "based on GH7 SoC" part necessary? Does the "SSDK-GH7" not give
> > > that away?

> > In this case, yes, SSDK-GH7 is enough but I though, in case of different
> > board adding what SoC is used on the board in that is useful. Anyway, OK.

> Looking at ePAPR, the recommended format is "manufacturer,model", and
> the string is intended to identify a particular implementation. It is
> not intended to give details about the implementation that can be
> derived from the name.

> We seem to have ignored the format (and to some degree purpose) of the
> model property so far, but I don't see any reason to fill it with
> unnecessary information.

Might it be worth defining a property explicitly intended to be used as
a display name for human consumption?  Half the problem with model is
that we don't have a way to use it for quirking so nobody ever really
looks at it (though I guess we will want that at some point now we're
going for fixed ABI stuff), but not having a place to put a pretty name
does encourage this sort of thing.

--FqExhoTtZ2UFWcPs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTIvqbAAoJELSic+t+oim9Au0P/jHh7yZn9MA8gcQPZ9qrf95K
XoJskG1Faw6vDD0G8JRCRG44C/bAw6ri/tFmVtv+lKMJ+CpB6FjBaIZGRvPCRa00
DjinoxwxcbYwK4iRhMUcS2Kj8uhoDHZRS/6GmJxvF2ubZZ+eMn7BFswJhddlsdPd
yxcHoXwXIRfezb6sYwWxr7q3ciJatGcLJCnqDKNJlCi9NNbVbh/TXW6YzUKnUGTl
kD85if++I2n2ltjxuMUB/XVTt3IWGqK4JPMZ55aH402Ke5F/d7FNw7NIZveRW620
4cM/lKKZSHES/pfNvGPfoimHRq0NcHFmcuUoFBB/39A0lORlP+n0r9ZECB1Bm+R6
jG/9kfSp/XxYOM8N0/EqgpbSTjfH6ia9ZEnjhc2uDNG+ydBvMfAYdWolKYwlpUTN
W/ojfIToEGWNXjoMJMr8/qLrup/es6IauBBEQpwSGtZkPl7VELCOsBc0wv5rfn7M
2bGEl2JMqssve5cNJIjc8l/L1EbkalUddFTUApJY/B6AZfG8Tur2rnvRSfs3/Oqx
RMAoedmdNbDYaCgO9vynjJLWtXvspAh0Ybzo1iewm+F6GqE9Ec5eFdunPF+KNW1X
l6yIoqFti1vsrqNwgAjL+aMjg8dK5njwUbcJj7cMR9MiYcLdKmS1AiU/K1ijQ9tt
kr6f/CFIJ0S77Mhn0fjr
=Y/O3
-----END PGP SIGNATURE-----

--FqExhoTtZ2UFWcPs--
