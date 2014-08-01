From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 07/15] drm/exynos: dsi: Add support for panel prepare and
 unprepare routines
Date: Fri, 1 Aug 2014 11:05:06 +0200
Message-ID: <20140801090505.GC21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1357095214=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406828534-10072-8-git-send-email-ajaykumar.rs@samsung.com>
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


--===============1357095214==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline


--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 11:12:06PM +0530, Ajay Kumar wrote:
> Modify exynos_dsi driver to support the new panel calls:
> prepare and unprepare.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c |   12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

And this one as well.

Thierry

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT21hBAAoJEN0jrNd/PrOhbZIP/3RX1f7yT5AOtsMA8XCEAGg7
htXqHV+PHYQjw3Z5Q4Qrd2ozD5+urDvYvdyyNaeskQISCQCRrgVkZrEsnMGchcvD
m4ulKq8LzvVk1RdziGZT+yO5xVxqvwLRbX/EXjckUdFvLumfRTKTRpPL+2wh/dil
6fPO1TXmhwFZub99vxUE/3CORuNW6dv/2D9243PaHfzbPJPZSPtXy/p8HCwuZSqL
Z/MP6if1S/vQUwbi5dhtnySdBDGDh6/VRVOj6g9C99auDQvvCPWVfat30Zmou+aZ
cv1yQTul6OsYi0H/iC8XpBuParsiF2Zr8P1D9MFoW8aZlgENMzmeJ9e8GL7uo7G7
qRobdOuI48x8dRufu7ijlkXPENRAf0BB86IRrXmoIX3Ascx/lfMq0U8B8xQig/dW
sVw4crIzfhlkYv0+PgHBv8IHkkSoAoW9bXt6EgbsHflPClqHYo5B0SvqeWYMQdze
fubtQc1hDKl3EpqL1+atmDy9y36cZLe228sP1rF8gkGqENgms56dS1Jl0jiWOL2w
CeM3GbOLQfoXqDavZl2hWiXZTrhVjOXh5LM4LQS8Puy3ovcWAlEJuUDLLL3l6Lij
TFiCi7nUl5XjeBKyBxKBIbt5WVR+9bejxyvBJtYr/7gokeeHMG6isbOYCMmUSiH+
Ao0p0pjFlulyC4ySojRR
=JMsh
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--

--===============1357095214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1357095214==--
