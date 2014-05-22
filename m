From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Thu, 22 May 2014 10:03:47 +0200
Message-ID: <20140522080345.GA30247@ulmo>
References: <1400735767-5905-1-git-send-email-rahul.sharma@samsung.com>
 <CAK9yfHz4DxG-Ey7HieMU9t32arXMDGYn1JXe0g8LNGpNYV6KaQ@mail.gmail.com>
 <CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1945561295=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAPdUM4ODvHXQcN=Z2VN6yuWtOX-4Cb2oo89cHC0PO3Kab2UJJA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1945561295==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 12:06:16PM +0530, Rahul Sharma wrote:
> On 22 May 2014 11:51, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > Hi Rahul,
> [snip]
> >>
> >> +       clk_prepare_enable(ctx->bus_clk);
> >
> > Probably a check for its success?
> >
> >> +       clk_prepare_enable(ctx->lcd_clk);
> >
>=20
> Generally we don't check this in any of the driver. It will be
> quite unnecessary.

Then those drivers are all buggy. There's a reason why this function
returns an int rather than void. Just because you've never seen it fail
doesn't mean it can't.

Thierry

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfa9hAAoJEN0jrNd/PrOhlOwP/A2RMsPJmCn3SVQvzoOT1Y4w
ywNXSl4KqS5cqXtwSKTI40k3RPleSGSfteUsi6FC8TH967+kmJRV0Rc3y86od8Hr
NdrBCIs3+E4rAt+cG3FXGO0BHpwCHlxiMeZlr2GuyQw6Ty9BO/XPD/6uglpJzRGe
cQh64G8GJwdYWbBbqZi7x94Uegon94TQHVNhCGBk1FgdGY/G23vZoFuNvav6PvcE
QU23Dh4jo4YctaVxv8TQFmAWRx6zFNUS9xjtcc96xKwKMADQGL7osgBNSW9wLZc6
vyaWY8caO3PNVx+x2GGZzg04TK7H4s7PXazInAp7vURmFkUJenx3SbfaoQ83n17d
B9LMn+qzi/d6MyaPrbiPjPXl8tUJ/nXEZ11GdbCDV4REtIZMEUX7t5wOaRi1K3kP
vDApxCsw1PKt+jMCLpC+kBTK3S+uJD6BA+oFbrHrhmlWn1LEGOLnGnl9zIJwuTKp
P77+/q3p0QceOZ9YgOjRUTq6ZgDZMmLqLjH9peUrznvNDVmfJiEAxdUkqWO16OrA
dM7VcuamYDg/P4++ysF407DVLgSSHBreckl7+1JeErqlgq330m3kamuyn1ZxqC6Z
6FlDwrGGy0e2n2ofpYMLLs1TNNk7wXF4B7qGwZ5rk93Ofp5sqeJBt+VEvoPhKYmv
G4NHglyFL9+BoF98OP5H
=3USm
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

--===============1945561295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1945561295==--
