From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-exynos5: add debugfs support for registers
Date: Fri, 28 Dec 2012 00:57:25 +0200
Message-ID: <20121227225725.GB12665@arwen.pp.htv.fi>
References: <1354021236-28596-2-git-send-email-ch.naveen@samsung.com>
 <1356434755-13702-1-git-send-email-ch.naveen@samsung.com>
 <1356434755-13702-2-git-send-email-ch.naveen@samsung.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8370427396812255909=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356434755-13702-2-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, taeggyun.ko-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============8370427396812255909==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 25, 2012 at 04:55:55PM +0530, Naveen Krishna Chatradhi wrote:
> This patch replaces the dev_vdbg with debugfs function calls
> in i2c-exynos5.c driver.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

merge with previous

--=20
balbi

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ3NJVAAoJEIaOsuA1yqRESSoP/iATZQfzkhMqXfVI807r2hMH
1DrbdCTDI7rblYCMx65dv1oaa+FkAiwug9kgCIwDSIMVnm4hkxpMkjBPXRhkFYLy
kLuVbe9ciEfs9CpWD/EJvkyDJX+xyk1hTNpeMiokUYHR5FrBC5iuWZE9Ei1Kq095
GjamTGKHrDHLqJGwfrJ6IAPVOY4eWbVQtF1lz8oTJruVQQ0o1nU9eQB09t1YhgsU
fNJoJbFn1lREF/C9P/At2wY4/aJ/zw+yPIyr//HjmJx338TgVqW8E1Vpey3i+Ha/
xIzzN+pzNO5qHDZfMIp28JgKKXWyoA7SofxWgaZr3zMtZbGlRwYxXtIVfcsTeFyy
l/5HlFtkVEjTQPrAXVs8ZDCLDEwlmh6AsbyFgnT/MCNGX3G4ZFmtADnM88hDFi77
8sP1W8BNnrpoCJ5rv8cJPVTFXffYfiFXY1Ftm0J0SVW/vMZ8t2l9GikVnImugFr+
NvHJDaLD1vgl7eSlOORwpgn/XEgJC3+fd4hEkq28e1a6K6N2If65m6JrFOxI/e8T
eEqBwt6coZjXYCuxCaqkdjW6duTumWEJk/2zPX27oFglgVvR0tJ2cjbSBqcwDdl2
Zoa03PCYRSRVwA9gEdnDCzkFoGzfOEhqRVx7CPwymBWKptlCHj2akiVe8/NVO+uv
kTLMvNlZA/rsUEC1kYEF
=JCHj
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

--===============8370427396812255909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8370427396812255909==--
