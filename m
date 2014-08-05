From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add (LPM) Low Power Mode transfer
 support
Date: Tue, 5 Aug 2014 13:12:25 +0200
Message-ID: <20140805111223.GA27340@ulmo>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
 <1406512857-7213-2-git-send-email-inki.dae@samsung.com>
 <53D675D6.2000309@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1743709199=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53D675D6.2000309@samsung.com>
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
Cc: treding@nvidia.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============1743709199==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline


--/WwmFnJnmDyWGHa4
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2014 at 06:09:58PM +0200, Andrzej Hajda wrote:
> On 07/28/2014 04:00 AM, Inki Dae wrote:
> > This patch adds below two flags for LPM transfer, and it attaches LPM f=
lags
> > to a msg in accordance with master's mode_flags set by LCD Panel driver.
> >=20
> > MIPI_DSI_MODE_CMD_LPM
> > - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
> > command data to Panel device in Low Power Mode.
>=20
> What do you mean by command data? It could be:
> - all transfer in command mode of operations,
> - transfer initialized by the driver by writing to DSIM registers.
>=20
> >=20
> > MIPI_DSI_MODE_VIDEO_LPM
> > - If this flag is set by Panel driver, MIPI-DSI controller will tranfer
> > image data to Panel device in Low Power Mode.
>=20
> What is the meaning of this flag in case of command mode of operation?
>=20
> Maybe it would be better to create flags based on source of data/FIFOs:
> - commands send by SFR registers,
> - commands generated from data sent from Display Controller.

I have no idea what SFR is. But it sounds like you're talking about two
ways to generate command packets here. We have something similar on
Tegra, where it's called "host-driven command mode" and "DC-driven
command mode".

In host-driven command mode the driver needs to explicitly program some
of the DSI controller registers to send command packets. This is
essentially a FIFO register and a control register to trigger
transmission and poll for completion.

DC-driven command mode is typically used to update contents of a remote
framebuffer (what MIPI calls "Type 1 Display Architecture"). This is
done by programming a different set of registers that cause the DSI
controller to take data output by the display controller and wrap it
into DCS commands (e.g. write_memory_start and write_memory_continue).

I think that low power mode is more often used for command transmission
(in host-driven mode). I'm not sure how much sense it really makes to
transmit video data in low power mode. It also seems like low power mode
is what all peripherals need to support (if they can do command mode).
Hence I'd like to propose the attached patch that makes all command
messages use low power mode.

The .transfer() function was really designed with initialization
commands in mind, so it doesn't deal with mixing video data and commands
anyway and for initialization low-power mode should be fast enough. The
downside is that it may not be optimal for some peripherals, but it
gives us a good solution for the general case since it should support
all devices.

If we absolutely must have faster initialization, or if we come across a
device that can only initialize in high speed mode, then I think we
should introduce a new flag to allow DSI host controllers to optimize in
those cases.

Note that this is based on some of my local patches, so it won't apply
as-is. But if anybody wants to give this a go it should be easy to apply
manually as well.

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: inline; filename="0001-drm-dsi-Always-use-low-power-mode-for-DCS-commands.patch"
Content-Transfer-Encoding: quoted-printable

=46rom f93dd508afc19262fd95c01520d5d6d7937be4e8 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <treding@nvidia.com>
Date: Tue, 5 Aug 2014 11:30:14 +0200
Subject: [PATCH] drm/dsi: Always use low-power mode for DCS commands

Many peripherals require DCS commands to be sent in low power mode and
will fail to correctly process them in high speed mode. Section 5.2 of
the MIPI DSI specification also mandates that on bidirectional lanes,
data shall be transmitted in low power mode only. At worst this change
will make transmission of DCS commands slower than optimal on some DSI
peripherals, but it should enable DCS commands to be successfully
transmitted to any DSI peripheral.

If transmission in low power mode turns out to be too slow at some point
in the future, one possible solution would be to explicitly mark devices
that support high speed transmission of DCS commands.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b0a304ab6827..57588b9ff7c6 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -370,6 +370,7 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_devic=
e *dsi,
 {
 	struct mipi_dsi_msg msg =3D {
 		.channel =3D dsi->channel,
+		.flags =3D MIPI_DSI_MSG_USE_LPM,
 		.tx_buf =3D data,
 		.tx_len =3D len
 	};
@@ -457,6 +458,7 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi,=
 u8 cmd,
 	}
=20
 	memset(&msg, 0, sizeof(msg));
+	msg.flags =3D MIPI_DSI_MSG_USE_LPM;
 	msg.channel =3D dsi->channel;
 	msg.tx_len =3D size;
 	msg.tx_buf =3D tx;
@@ -501,6 +503,7 @@ ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, =
u8 cmd, void *data,
 	struct mipi_dsi_msg msg =3D {
 		.channel =3D dsi->channel,
 		.type =3D MIPI_DSI_DCS_READ,
+		.flags =3D MIPI_DSI_MSG_USE_LPM,
 		.tx_buf =3D &cmd,
 		.tx_len =3D 1,
 		.rx_buf =3D data,
--=20
2.0.4


--J2SCkAp4GZ/dPZZf--

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT4LwXAAoJEN0jrNd/PrOh/HwP/RpnwaxTm5Z/T3hkozP07Hnr
2bMhfZobvdhFzDFt07GOmy+SINFa/JEGYKft5oqxtVY5DE98huF3aumifsXNluNT
YA1fcl1pVEZbWH83SCNwsz3OWzOxNpbIPPWbYVtnMY3DB5twL2PK1anWkblDG3f7
pg0nJCrN96eMFAVUietX2dMB0+GB+To4yrXa8G2YwOyjfmwa8IDOVpBgan3ikqrh
hJ6eOhLu9sa+K6hyy82nFhvDn/wuQo2qhvx1z1xsmTIRdke6ht0mohfADs1+DZTZ
x1Keyf4m5G6lUSsRUJ4VCTxCZO8CoLO7OG+Wy/sOS6ZwEz1/Bc7kP5gbBZkinQJV
QlHC7kTplfnIdjqA0/PHTSr3e6eOGZnWcRXtRfhoxHwtJBLx7lT1xIEqj2T+5OdA
PCI8LgIm9i4t4oH3lwtywe65dvTMHJTWh/MbtunAc7bHkSDRCa6BUefDvezbW0XM
I3c4x2DKXJ1vz3utgjku49Fh9Fh9yrAX0vgKNk55t7/EbWmwYa89iNRxU9Pilaja
xS41CcnBh4P17diibKu678kbhK+7yUu7xiI+UAuBr436mycWeM7yCcpb20pM8UZv
4yFRa/Pdc2l7G3wazynyplCOJRjgmLDw/tW4yfhFPtv+pR8vFSpdvb4shb8xzR4H
6KrwhMJffsI5dnrHhYKd
=or4u
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--

--===============1743709199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1743709199==--
