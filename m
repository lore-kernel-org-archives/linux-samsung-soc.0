From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 15/15] drm/exynos: dp: Modify driver to support drm_panel
Date: Fri, 1 Aug 2014 11:09:53 +0200
Message-ID: <20140801090952.GD21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-16-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0062217777=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406828534-10072-16-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0062217777==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline


--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 11:12:14PM +0530, Ajay Kumar wrote:
> Add drm_panel controls to support powerup/down of the
> eDP panel, if one is present at the sink side.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig          |    1 +
>  drivers/gpu/drm/exynos/exynos_dp_core.c |   88 ++++++++++++++++++++++++-=
------
>  drivers/gpu/drm/exynos/exynos_dp_core.h |    3 +-
>  3 files changed, 71 insertions(+), 21 deletions(-)

Inki, I'll need an Acked-by from you on this one as well. It has a build
time dependency on earlier patches in this series, so taking it through
the panel tree along with the rest is probably easiest.

Thierry

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT21lgAAoJEN0jrNd/PrOhrlYP/08hLKXrEkjOt99PzUf3uBIN
cItmlejbjMvN3iSEIBAjSG7j/ccWXp2zvdlmHHDsYZNVQTaKDYIb6kFb5YKltO3P
yulSxXP6ALl40E/LkJCmpLVDcn6rd14rcyvRhyto3d4sBxzhr3yD6M/nWujgy1xn
dQdUKTdN51YSZJhVXTsiCIhriKNJksmYoQxCPx2rFujMAJDTEnUekY+XYga622K1
i1G8bRNREMKhgbyWOVrjS2zS3xoHNqJ8795j4c5a2YXqgU3Y6AW2Engbt97f9MsY
3lZZewB23bHR8UbjbUu9rPaffzaJRjxEfXuGR/8g6sRiNHR+zoETpt+5mOS+8Iaz
yEDRqCRjrLurNMJF8EP52SGCzIofiAuSPCDlZFOXBZ65IqwS/rMEoVy3L+Bz91je
CaN2cAvZLGt2MooVD8UvSkRHq1+jWN6Mq+Gh7Dc/+J78C49RAwuDCvAc/uMPb+sU
Uo2VOQESPIxhneFdiuazsZu5KI/fbjYChLC/kBiUfOP+LdnZGqOxdceb2vLfIk9j
QraGR3QJs3aixbTKMdq21eIkwVh2mEwgeC8hyQjD0kaEJrBPLdzOoeyW3cyVuRRh
yakRs5kCEOdzQ3mm3P3NJ9SUFDoqHA1nO9LejGNlGW0jp7y+RlNQ/5+xMehWB40U
qN2nYs66CpewDmAYemNe
=xkLt
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--

--===============0062217777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0062217777==--
