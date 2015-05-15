From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/1] drm/bridge: ptn3460: Fix I2C ID table to match the
 reported modalias
Date: Fri, 15 May 2015 11:21:05 +0200
Message-ID: <20150515092103.GF4984@ulmo.nvidia.com>
References: <1431613889-32737-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1901050635=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1431613889-32737-1-git-send-email-javier.martinez@collabora.co.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1901050635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline

--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2015 at 04:31:29PM +0200, Javier Martinez Canillas wrote:
> I2C drivers that support OF, have both an I2C and OF device ID tables
> that are used to fill the supported module aliases. But currently the
> I2C core only uses the OF table to match a device with a driver and
> the aliases information are always reported in the form i2c:<name>.
>=20
> The client->name is used as the name postfix and when booting with OF
> this is obtained with of_modalias_node() which drops the compatible
> string vendor prefix.
>=20
> So for I2C drivers, the I2C and OF device ID tables should be keep in
> sync in order to make module auto-loading to work but the I2C device
> entries shouldn't have the vendor prefix since that is not reported.
>=20
> Before this patch:
>=20
> MODALIAS=3Di2c:ptn3460
>=20
> $ modinfo | grep alias
> alias:          i2c:nxp,ptn3460
> alias:          of:N*T*Cnxp,ptn3460*
>=20
> After this patch:
>=20
> MODALIAS=3Di2c:ptn3460
>=20
> $ modinfo | grep alias
> alias:          i2c:ptn3460
> alias:          of:N*T*Cnxp,ptn3460*
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/gpu/drm/bridge/ptn3460.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVVbp9AAoJEN0jrNd/PrOh0X0QAKdZMamtIk3nWGAX+m3VuR/Q
hoMzSHdVr3IKW4Qja5LVvLP7hdYtWQ4ECN28gztwt+IhFGe7CjcyZZCrcwhO1mLn
oX3zv63ZpZIYDZ6wF/jQYEzNCqzYMEyMGcnSFbQx8i5xAxFIIHDB7ObHpvezciUB
L5ZKdDdGKQ1ZYYqWf0/b2XOZSvuNudvsD8f5sneyRW/Ng4dwHYGORp8USslhYYMY
4edsVmf1EaAAQa5cw/i3IJKLqPeOnmNZDJ0Lpn25/Y36M28XUhBw4FIqCLwXASA4
aq+6VNAU6wXeFzwPMJyc/WWhNUFpf8YSCIkEcdkGQSQwCEBTRBM7ovf9jUEfNrPb
jhl/MzRDx34oihKKyReo7RWpv/XiRXUSQoxNDxo/r9LL99pfr3CJ6rWF0NuDfUUs
WfW6VcidKoG4zaGDjCRnqaD/Z+rUjYI6wYh+Rf5p6c7GXwwNK1k33kvPdbp6qV06
mOMgIt0eAPWjVWEcjlNC8JKRz2mLzBIIBHUnUbWYq38ahUp9ptUbcs01CUNz6qZ0
TtUWX4M/Yql9CJwyRTVLOaafo2ZAM9TRwz+N/OQvYIyGaJg8Ob6LeQu321oYfz/r
WhyOA0FetmgmoB0GTtgS+fnpO47u1fCrksimVIn1oBGvePE9UUPST8eESg34lsty
sPMm2QvltU1be/EJJQqu
=p3e9
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--

--===============1901050635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1901050635==--
