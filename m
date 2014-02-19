From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Wed, 19 Feb 2014 13:08:18 +0900
Message-ID: <20140219040818.GQ2669@sirena.org.uk>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <CAKew6eWcwVm1EAUAdFu48y_O5puu+eGvGW3k6923MdXfMa3UAw@mail.gmail.com>
 <1392383156.12506.20.camel@AMDC1943>
 <20140214210502.GX4451@sirena.org.uk>
 <1392624454.3755.12.camel@AMDC1943>
 <20140218003555.GJ2669@sirena.org.uk>
 <1392711129.14646.9.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IIU4lL9vGQnN7Mxl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392711129.14646.9.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Yadwinder Singh Brar <yadi.brar01@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--IIU4lL9vGQnN7Mxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2014 at 09:12:09AM +0100, Krzysztof Kozlowski wrote:
> On Tue, 2014-02-18 at 09:35 +0900, Mark Brown wrote:

> > I don't understand the above?  Are you saying that suspend mode actually
> > turns off the regulator or something else? If it's a separate setting
> > for suspend mode then it should be using the core suspend mode stuff.

> No, it is similar to external control (by GPIO) except that regulator is
> controlled by PWREN pin. The PMIC's PWREN is not a GPIO, but instead it
> is directly connected to AP (for Exynos 4212: XPWRRGTON). In AP's normal
> mode the XPWRRGTON/PWREN is high. In sleep mode *AP* sets it low.

How is that different to suspend mode then?

--IIU4lL9vGQnN7Mxl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTBC4vAAoJELSic+t+oim9UBUP/27ZgifIgkfwQhwVTp+LfxIg
IWWl973Hxcj3mT8JgLd3EDi4fxRV8Fsb8u1VwSfX+umThkZmyIPqhk+MJ1FWFwcU
4VQg9ZLfq3HSVxZW/gw1CePk5AyuDjUEaX39TCsV6lSBst83rP2mItYdAZnl/4CA
JDcdavbxi2Lduyb97+Wi8+pP7mPSBXMCJ8n9kaY7yqoe1l2c6xudqrB87V+uk2jt
qYw76qbQJ6grhQrXwUmcbY0zjTePp3XqaTtqknEV91yCwQnbmFuye/iQp6cIjhBM
mnwFNv6KiVdwjYXzJ5Ow+2Y8JGrN4HIiFQ0Wv1/s/1uGElRSc+PPOfHqlMWYL0Mv
lPH/n9VVnW8uUUSYERvm88PwagftGlchQv3cBasvkf2SXgIoUjO9bUoPX9YjLpgp
P3xQ1vABya6rdI0P/3i8b6lgSy2fZgb6e7LsE9kgu3Ya/9yBCRgLtY3v5TOptKL7
OGFoCJ0hcwmrqt0Vdj2FA9CGd+8TKLX/GlwAdugCyZ3k1SsxQCmfn+w0jaSe0DVi
6JiEP+QnOnFec6kdpzJNxBG6t47cvbdOTZ5qX5IhUuJMny67hpcLInjmppH6QtRs
6Ll6wypzRSJWKx1991pD1mkz1HWadIUeXslqS+eir60f5g1uca2TYgIUSfd5GLxr
utgJg/SROzxdXl9A6wP2
=Nfz4
-----END PGP SIGNATURE-----

--IIU4lL9vGQnN7Mxl--
