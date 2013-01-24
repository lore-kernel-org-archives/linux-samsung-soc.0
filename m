From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration
 implementation
Date: Thu, 24 Jan 2013 19:18:47 +0800
Message-ID: <20130124111845.GO4955@opensource.wolfsonmicro.com>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com>
 <50CB4E99.9060506@wwwdotorg.org>
 <20121215142135.GB22033@opensource.wolfsonmicro.com>
 <20130124111329.GC12933@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2700028684666482072=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130124111329.GC12933-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============2700028684666482072==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qse+WBH4guesipZ+"
Content-Disposition: inline


--qse+WBH4guesipZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 24, 2013 at 12:13:29PM +0100, Wolfram Sang wrote:
> On Sat, Dec 15, 2012 at 11:21:36PM +0900, Mark Brown wrote:

> > also get things like read operations which appear as multiple
> > transactions on the I2C bus so require something higher level than what
> > multi-master provides.

> I don't get what you mean here. Can you elaborate?

A read is typically implemented as a write of the register address
followed by a read of the value, usually with the ability to free the
bus in between.  If two devices attempt to access the register map
simultaneously this results in the address going wrong.

--qse+WBH4guesipZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRARh8AAoJELSic+t+oim9WcYP+wWmw33S4AKN/3CeMXNRjY+s
CgiNqBwux+fQ1JfAqcTyJOp4pQLJVNewFZIZClvUN3t+7ZkgNnIImo2fEIc2vcol
AugQkOwVEkeBYKmY5S1R9bYymFyvv7CjdaMNv2w06hjOpwhHHcIpXIOlMi5efIXh
j58Kdl5VB6YJvyCUJGxywbiHYDTV4rb90fZWLfy7qwm81QoXhIsjc2GF+UX7iHXq
SSbI1F9r3KazOrxf+pA3Zl76qili06T61TUSrSVpLaYhhPjUwM84qBn4p0724DFT
tx3Ky5ZXBHYzrnZQpJ7ZERIqECOVd1AvSrwnhPS3l6S3MOxXjWZzG3BBA4H6GfRB
I01wMCFVZfuiXtcVC6zY5kTqN5aYIVyfX2JR8dKVSHEoi+e7Q2bbjxK0t0CU+s82
0zGRq+ZqT7KIeePHRTXkR7H3fFUZSgY/6O4BKa+gvoxzXUskmqwKhPYFyvAFrcKm
0k/4XfXmfXpXri7aiZudwDmH6NhGNJfsIodwY6QyoQBXZulmEGuSzXcSbt0IHTXa
1guFvK0Dja9GB7Oy6Vi7199qMYgbpOJ27Hu8+MTd6QiVsiVOEmguqWZ2DpM16Cic
WpZbaKwb3uiqbKo/OpanYHi6rcaJdkdghnWBDnCZXv0N12NHUgQaUpcbX8KORATa
nEas6DvWliPzPlCjPrNB
=MQZP
-----END PGP SIGNATURE-----

--qse+WBH4guesipZ+--

--===============2700028684666482072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2700028684666482072==--
