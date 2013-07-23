From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on
 Exynos5420
Date: Tue, 23 Jul 2013 20:44:47 +0100
Message-ID: <20130723194447.GT9858@sirena.org.uk>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com>
 <29860116.IF545KsGYb@thinkpad>
 <20130711112023.GM24508@sirena.org.uk>
 <2214161.FSfscAvpna@thinkpad>
 <20130711130139.GQ24508@sirena.org.uk>
 <CAAgF-BdM4jw0o4+ELVo_N029tbgMJBBqJxU91e=TgBNiiREyaA@mail.gmail.com>
 <20130712084932.GY24508@sirena.org.uk>
 <CAAgF-BfdfuhoFDH+SeZogXh1wju34hGp-T9N7_+mnapHfc2yww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6QoWHXajryvO0ZWw"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53860 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933618Ab3GWTov (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 15:44:51 -0400
Content-Disposition: inline
In-Reply-To: <CAAgF-BfdfuhoFDH+SeZogXh1wju34hGp-T9N7_+mnapHfc2yww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, abrestic@chromium.org


--6QoWHXajryvO0ZWw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 23, 2013 at 09:38:00AM +0530, Padma Venkat wrote:
> On Fri, Jul 12, 2013 at 2:19 PM, Mark Brown <broonie@kernel.org> wrote:

> > Yes, this is good but the quirk should just be found by software based
> > on the compatible string rather than in the DT.

> You mean I just need to initialize the quirks in the driver based on
> the compatible string?

That's the gold standard.

> So what about the quirks that I added previously on 5250? Should I
> also follow the same thing for other quirks?

Yes, ideally.

> Or it need to be passed via driver data as it is done in spi driver?
> Please clarify me.

This is a good way to initialise things based on the name - the core
will do the lookups for you.

--6QoWHXajryvO0ZWw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR7t0sAAoJELSic+t+oim9jSoP/1903jDMr7BsIOEAWcT5diXm
5GrXZt719vV5v4rMrWZhMolb9Uugr43U9U7+I+5RdpCEbxnkF7kDcn+SRduo8/2r
K/E/6F1T+FCxvVvTZxj9ENAR6NQ+Zjx1EZuIOhyUg/+s0t5MN2xp/HCE58LwIUNg
13Bjywgn/OvkyeGMZKWQiSR+yje7d5IfahwX4rH/eZt+pQVCkYWlXJhLgJ062kk3
C50U7nq4aeOnXQyZ7kKDckY6ZWro/tfq+DB1wtjKDBXYeAvXx6DEFjZPpUhpo6be
uz/ydQrzlQEExNmZpY1PiM/eh0Ng1fL/WufgZoLZSwGhWPvPyRL+5uHDMS+/rllH
JDmKM0m5rYpXcdBIvRWr1DARKgHhEwD0H4rN5thbhKHzvrRvpJcHlrih28/3cILM
Oj8kaWkFktnDzw5DvN9qSYN/6Ina+fojyLY0VHT9fa28Ei4j+FMWOf2GvnIQEw6G
+A9Vsdt48zqxJWuhAmXUg5dLqa8fgf1kgytE5sTopqqvx/oYe+FpQj8gWFh51sW/
iC9+eaq3BJM+IP4/iUmatDHKkZQ1KL6IYDrzaqbKwB2uBiWThyFYY5O1GgnHBELJ
dyksOJW5uLYMzfZt15dM0HdV80DEp0v9Uv8cmSllaQeBGJuS1LZ2DJusaapwsVa9
9fZLCcD4r5M/NSGzz2Db
=4+TE
-----END PGP SIGNATURE-----

--6QoWHXajryvO0ZWw--
