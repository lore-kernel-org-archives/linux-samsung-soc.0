From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 14/15] drm/exynos: Move DP setup into commit()
Date: Fri, 1 Aug 2014 12:21:23 +0200
Message-ID: <20140801102122.GG21724@ulmo>
References: <1406828534-10072-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406828534-10072-15-git-send-email-ajaykumar.rs@samsung.com>
 <20140801091834.GE21724@ulmo>
 <CAEC9eQPARFrDP8k31v_P=ve5DK9Kx9Ao6ZBRuDt2bVS3eegiQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1450540871=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQPARFrDP8k31v_P=ve5DK9Kx9Ao6ZBRuDt2bVS3eegiQQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1450540871==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Content-Disposition: inline


--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 03:11:37PM +0530, Ajay kumar wrote:
> On Fri, Aug 1, 2014 at 2:48 PM, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > On Thu, Jul 31, 2014 at 11:12:13PM +0530, Ajay Kumar wrote:
> >> Add commit callback for exynos_dp, and move the DP link training,
> >> video configuration code from the hotplug handler into commit().
> >>
> >> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_dp_core.c |   24 +++++++++++++++++++---=
--
> >>  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > This is not related to the other patches in the series, so it can be
> > applied independently.
> This patch should go in this series only.
> [PATCH 15/15] has dependency on this because it modifies exynos_dp_commit=
().

Okay, I'll apply it to the panel tree. Inki, can I assume your Acked-by
=66rom patch 06/15 applies to this one as well?

Thierry

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT22oiAAoJEN0jrNd/PrOhd9MQAIGxjFif3RED4hD+ikOmIz7G
AXl5OAFKKi6Qqzzo3s1D8kSL4T6NvLskhMhkPDYIfXuSxse02MvfH5JFfKZiWnDe
zRI043XVrpbEsBXwlWVUSL6PaO2w+uyO7mY1XBy57qB6NMK7kVYnKtC15q6KBb+k
EPiUv2P6vBKcEiOnbG5wjtNpkVxipSppHZOhQI0/oGVWgSiDTkIpxwzAt6lr9w4f
eK07dOZ0jbTpCVPPK+gjPHlEbCQ1wkRn0rdQ7+K/lNoWu/XW2xNz+xUtNGwQ+smW
Tn1s2Sbg4uDIjAYv1Ov33lSFq3wf8Of64RQhRRdp6dC8kAxDysvwhvAr2eYUPYZp
If3P6nhoqxtupxJjk/KXLxpJWXxWh+eEZCKHGWfodEEfHZTyyLJYqlYWOV9f3LWc
TQ/VO+EWSHe0C2iDdNJ417fKVADf4vcMqzgDToLH7hoDvHmrmiHq28ervZyv9EWa
vAwlQvsrY9YA1kDOhu0cYiBJqJnypFmAmAIuP9smxIsyN3QhZOVRK7BoxCAxHpRo
pVnCPZ35UcqR6uBAMEr/v6+ZeXsFrwBR+PiMrts4yQ8JHlge/oCI1E4fddelqIiT
C+mM+EBm9AW2fPaN7d0PGgdvnusy4jpJ0b0/+/SF4B/Wv4VANm2eBbHQ514JdNWP
9kmKWYfV9tcBS/MloKlv
=BprP
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--

--===============1450540871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1450540871==--
