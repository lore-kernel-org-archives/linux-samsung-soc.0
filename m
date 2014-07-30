From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V6 4/8] drm/exynos: Move DP setup into commit()
Date: Wed, 30 Jul 2014 12:52:47 +0200
Message-ID: <20140730105245.GG29590@ulmo>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-5-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0861367642=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1406316130-4744-5-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0861367642==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Content-Disposition: inline


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 26, 2014 at 12:52:06AM +0530, Ajay Kumar wrote:
> This patch moves the DP training and video enable from the hotplug
> handler into commit().

I don't think I can comment on this one, but perhaps the commit message
should describe why it's doing this rather than just parroting what the
code does.

Thierry

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2M59AAoJEN0jrNd/PrOhb/UP/AymB1xBfF2sIA+hl/ottKHy
1cqguF2cqnK1DTrG2I13vE+ovNXC8GVmuQdGa+EEJ4xdsP++OG4gqDsdPm3Ty1VD
aii/Xuj5Cf8/7XLdy0yUsxA0v07nROXCeqEJaTW4/PtNUnmCsIBYWCZJsaO00y3Z
sPjmOhKTfFvyrxTcLGGAVvGk5Gg/iLUgFMFjVsmJaIpL4EvmAzTXu5E5U0ZaULC2
20bUm/0v61aafBhQ6Zd+0Jh0flx0T9XaZL7bFGU6cRM/Kynizw9FzvEzfnWsFlI8
YpJ2KDqEcYaxtLgrDr3f3xO9jHlK9+FBtlXtjr0YNENZRLFqsFpoVFXlzE2lf4ZU
jnkuYiFfuR7aAGXH/9JVbUj4CpKr/IFrtOCBPJeJHGQ9TpeQbuUaEZ83IMVn9hEb
ttQ7iIPui/lsSWyzmDTReNz+0dQRpaxVPiqQtV56OS3g7Cka1lc08IOMCvGsxzS5
7HOx6TFyaIHoMC4a2374jwGRnMD69NQJFukIGIaztJ4PyL5go1e7Bx3iUPAuVn4W
onBcq7Az4l0yTjZwWhQjUDfimQ0ZZtQIuj1/IVEs4NGUYdi7hYjNZmKmMEc2I0Yg
8SI3ym1IBF960324YAFdkw0ugd1jCk5ZHLkpxud4Pg7qjUI9qvHaxj+BNcrpSRMy
m8QyqM9Ug1PRI2diuR5M
=p3e8
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--

--===============0861367642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0861367642==--
