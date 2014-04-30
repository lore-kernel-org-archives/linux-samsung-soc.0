From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC v2 PATCH v3 10/14] drm/panel: add S6E3FA0 driver
Date: Wed, 30 Apr 2014 20:20:44 +0200
Message-ID: <1586154.6P7a6bVWs2@avalon>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1852265.JnliZKqXKk@avalon> <20140428212547.GA13897@mithrandir>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1119757713=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140428212547.GA13897@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============1119757713==
Content-Type: multipart/signed; boundary="nextPart2460409.hEu5xXmStR"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--nextPart2460409.hEu5xXmStR
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Thierry,

On Monday 28 April 2014 23:25:50 Thierry Reding wrote:
> On Mon, Apr 28, 2014 at 05:05:24PM +0200, Laurent Pinchart wrote:
> > On Tuesday 22 April 2014 10:24:39 YoungJun Cho wrote:
> > > On 04/22/2014 08:00 AM, Laurent Pinchart wrote:
> > > > Hi YoungJun,
> > > >=20
> > > > Thank you for the patch.
> > > >=20
> > > > On Monday 21 April 2014 21:28:37 YoungJun Cho wrote:
> > > >> This patch adds MIPI-DSI command mode based S6E3FA0 AMOLED LCD=
 Panel
> > > >> driver.
> > > >>=20
> > > >> Changelog v2:
> > > >> - Declares delay, size properties in probe routine instead of =
DT
> > > >> Changelog v3:
> > > >> - Moves CPU timings relevant properties from FIMD DT
> > > >>=20
> > > >>    (commented by Laurent Pinchart, Andrzej Hajda)
> > > >>=20
> > > >> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> > > >> Acked-by: Inki Dae <inki.dae@samsung.com>
> > > >> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > >> ---
> > > >>=20
> > > >>   drivers/gpu/drm/panel/Kconfig         |    7 +
> > > >>   drivers/gpu/drm/panel/Makefile        |    1 +
> > > >>   drivers/gpu/drm/panel/panel-s6e3fa0.c |  569 +++++++++++++++=
+++++++
> > > >>   3 files changed, 577 insertions(+)
> > > >>   create mode 100644 drivers/gpu/drm/panel/panel-s6e3fa0.c
> > > >=20
> > > > [snip]
> > > >=20
> > > >> diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c
> > > >> b/drivers/gpu/drm/panel/panel-s6e3fa0.c new file mode 100644
> > > >> index 0000000..1282678
> > > >> --- /dev/null
> > > >> +++ b/drivers/gpu/drm/panel/panel-s6e3fa0.c
> > > >> @@ -0,0 +1,569 @@
> > > >=20
> > > > [snip]
> > > >=20
> > > >> +static int s6e3fa0_get_modes(struct drm_panel *panel)
> > > >> +{
> > > >> +=09struct drm_connector *connector =3D panel->connector;
> > > >> +=09struct s6e3fa0 *ctx =3D panel_to_s6e3fa0(panel);
> > > >> +=09struct drm_display_mode *mode;
> > > >> +
> > > >> +=09mode =3D drm_mode_create(connector->dev);
> > > >> +=09if (!mode) {
> > > >> +=09=09DRM_ERROR("failed to create a new display mode\n");
> > > >> +=09=09return 0;
> > > >> +=09}
> > > >> +
> > > >> +=09drm_display_mode_from_videomode(&ctx->vm, mode);
> > > >> +=09mode->width_mm =3D ctx->width_mm;
> > > >> +=09mode->height_mm =3D ctx->height_mm;
> > > >> +=09connector->display_info.width_mm =3D mode->width_mm;
> > > >> +=09connector->display_info.height_mm =3D mode->height_mm;
> > > >> +
> > > >> +=09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFER=
RED;
> > > >> +=09mode->private =3D (void *)&ctx->cpu_timings;
> > > >=20
> > > > Wouldn't it make sense to create a new get_interface_params (or=

> > > > similar)
> > > > operation for drm_panel to query interface configuration parame=
ters
> > > > instead of shoving it in the mode private field ?
> > >=20
> > > You mean "new get_interface_params operation" is different from
> > > get_modes() ?
> > >=20
> > > Till now, struct drm_display_mode and most of mode relevant APIs =
are
> > > only for video interface.
> > > And CPU interface also needs video mode configurations.
> > >=20
> > > I have a plan to implement the CPU interface relevant APIs like v=
ideo
> > > mode ones, but I think they should be used under current DRM mode=
 APIs
> > > like fill_modes, get_modes and so on.
> > > So after that implementation, this private field will be replaced=
 by
> > > new ones.
> > >=20
> > > Could you explain it in more detail?
> >=20
> > The idea is that the interface parameters (RD/WR signals timings in=
 this
> > case, but this could also include MIPI DSI lane configuration or an=
y
> > other kind of physical interface parameters) are distinct from the =
video
> > modes.
>=20
> We already have the lanes field in struct mipi_dsi_device.

Seems I've missed the addition of mipi_dsi_device to DRM.

> I think in general I'd prefer to not spread these parameters around t=
oo
> wildly. If this is a general requirement for DBI devices, perhaps wha=
t we
> need is struct mipi_dbi_device?

That could be done, but I'm not sure we should expose the nature of the=
 panel=20
device (i.e. "I'm a mipi_dsi_device") to the display controller. I woul=
d be=20
worried about using container_of() on panel->dev to get a mipi_dsi_devi=
ce=20
pointer, as we would then need a strict guarantee that the panel->dev p=
ointer=20
is embedded directly in a mipi_dsi_device. This might be doable for DSI=
, but=20
other kind of panels might be connected to different control busses (I'=
m=20
thinking about I2C and SPI in particular) and still need to expose vide=
o=20
interface parameters to the display controller driver.

=2D-=20
Regards,

Laurent Pinchart

--nextPart2460409.hEu5xXmStR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTYT8BAAoJEIkPb2GL7hl1GsQH/jb8Dq1BnQuslLFzgere3nd1
mumUmJ15/238b3RLsxV59a+7RU7AdE4/LIDS2hDGjpozi8qBePVYnkABPRX0qw63
vY3ttwVEsheMNr6EVR1zN/269kzfM0POtxs01mkWxz4ftKuTMt3AibYviCV0lsp/
HnAr/B98mXlNzQChwKDjRrwlN+heGSe0NdwaCT7sc95D7OSBHhSLR+GovBLD3JDc
xVziOGXVqwabKLf2X9ZDxksewoVax6KHAbbkqYp09GvWaCYJK0eFrHtSwtSvM4+r
tYD1rSwu/igd6koMLjcPIL+Scsk5uWlWHeLxxeWBOMX2drej+w08zVDQqCdUykA=
=LGmB
-----END PGP SIGNATURE-----

--nextPart2460409.hEu5xXmStR--


--===============1119757713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1119757713==--
