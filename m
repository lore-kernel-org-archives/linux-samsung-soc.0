From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 06/15] drm/exynos: dpi: Add support for panel prepare and
 unprepare routines
Date: Fri, 1 Aug 2014 11:04:45 +0200
Message-ID: <20140801090444.GB21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-7-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0924024442=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406828534-10072-7-git-send-email-ajaykumar.rs@samsung.com>
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


--===============0924024442==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 11:12:05PM +0530, Ajay Kumar wrote:
> Modify exynos_dpi driver to support the new panel calls:
> prepare and unprepare.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Looks good to me. Inki, can I have your Acked-by to take this through
the panel tree?

Thierry

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT21gsAAoJEN0jrNd/PrOh5QcP/3ZzaWIeR351uRlq1RHhyCgi
JacEzXTY8fIBWHxbZnvb4V5RYFWgWi4UG9scDmlHDPlSqEF4UkEDFpl4CCTPpghp
nJ4qdxprapZKGVolwOFEMvsoBaiLk1UaMVugpMbYERSUdDh1wQDfn9kw2my6gWf3
fA+qRFBM/W/d0J2UeBE48XaPZoMZMKS17ImBeBif4qoeOc5yA5EsH5MwH9Gkxrje
qWwm/HPww24t1ndPlQhLuYCIoW87cnohyq/c65OMxcctnpLRgdRHcd5DhXwoDgZN
RdXFUb+pZJIdcP8lkPujqI1tSD6dCtf6ur2RuA5ucxD2DdoWurDHWNkytpVtr5Mu
7BNnnhEIcl0bKc8JMnBrXFAyL5nRT8BNT5rpSdE+7lwK7jmbTIsRzGR/v7Xvcclm
bEMEFPoi6k0y91ZJ/8fwjhK+2LpmxVVR+f665/KTkU1t7DbfCFBIX0wIKx3dnzmK
XYTIgo1gZYZ8HstXsiV/yaJmVGILmRGDIE890iqlLxx6U3aw7BRgITIz/hU5sADA
M40GLnIq38E4dcXsHlBEyNq/4Wi5Bv4fHUr+cSPVrBMtfkhNp2I/sT9Feb+XkG30
r5YD7yXdTYELEyJV3hYkmtFYD4ghaNK3Yj/AwuV4ZOVQe9W4kjgVbpBblRQl9yoM
gPF4kSDD55TDMNn0W68c
=9mFZ
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--

--===============0924024442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0924024442==--
