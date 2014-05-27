From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 13/18] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 27 May 2014 09:53:29 +0200
Message-ID: <20140527075328.GA13081@ulmo>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-14-git-send-email-yj44.cho@samsung.com>
 <20140526134153.GA2373@ulmo> <538430A4.8020702@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0818883072=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <538430A4.8020702@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de, laurent.pinchart@ideasonboard.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0818883072==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2014 at 08:28:52AM +0200, Andrzej Hajda wrote:
> Hi Thierry,
>=20
> On 05/26/2014 03:41 PM, Thierry Reding wrote:
> > On Wed, May 21, 2014 at 01:43:05PM +0900, YoungJun Cho wrote:
> >> This patch adds DT bindings for s6e3fa0 panel.
> >> The bindings describes panel resources, display timings and cpu mode t=
imings.
> >>
> >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >> Acked-by: Inki Dae <inki.dae@samsung.com>
> >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   45 +++++++++++=
+++++++++
> >>  1 file changed, 45 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6=
e3fa0.txt
> > You're totally confusing me here. Half of this patch series is about
> > adding i80 support to Exynos FIMD, and then you go and add what is
> > apparently a DSI peripheral driver here that's supposed to be used by
> > this new i80 support. Nothing I've been able to dig up indicates that
> > i80 or DSI are in anyway related.
>=20
> FIMD can produce parallel RGB output or command mode in i80 style output
> via parallel lines.
> DSIM can accept parallel RGB stream in this case it produces MIPI DSI
> video mode signal or it can accept i80 and in this case it translates it
> to MIPI DSI command mode.

Then the command mode timings aren't a property of the panel at all.
They describe what DSIM expects, so that's where they should be defined.

Thierry

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJThER4AAoJEN0jrNd/PrOhWBcQAIyPFZg8zTqeGhUssDktc+SW
M7nAWFKJG0YbrUuNX5w41Sx+gYQ23ij3m4UQY5enHNPak/MlRgz68xgPl4FVb7f9
t2C6tolZOvAlzoGYeUgQ2pSYxlFLYnQ3ViWzrvS3mY2gs6Vqig/NzZ9XE9EeQQ5J
YQrDmB1EK6sA3t4VYQt/X1mOcxn9UCeBXqG7+VaX2X/rjIjCe9B1K3MfMnipqgtd
saix+15OwHTYQ8G8VRZw/+JqK9UUuedPpJJk9I8OwlP+Raf0dm8di+BJaEBB7np4
2XwNunc5c7nktSy28GGxSoG3CqLouIDE5JycHVCE9j1RWn5nkwdJpSLqdjNear5H
6NpwM4JZOBUYoLMAYJPbKauFQKYN/dhleOWf8Yn4ZbjGEJUMPECmQAURP5Wdgodf
oS/lVFnbXpwgxK8YwJ1Z7vOip6hdncJdPu8Nxz9kZVluiTld8gS/gC3wqH+Aba18
qK93E7oJvCl6JxOkCQTao8HIgnmfhnhfuEPZgdIusfSrOMd+qnCzKPOuCFwA/MUy
ZfQGG8wJAd/fsvyezu1mOKHSrtsi49ozMEumf1LBu+oJCmGVffAn1DE2M+O7jOo/
tFGKYwETv3X29jpmmFZ/gz5MdTwDmjt8LhcxR560TSFm7yhZ5DuxveECgEuDeJ5w
P7Uxa/zKam3V8Un4F8Gs
=89Oi
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============0818883072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0818883072==--
