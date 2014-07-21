From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/14] drm/panel: add S6E3FA0 driver
Date: Mon, 21 Jul 2014 11:35:50 +0200
Message-ID: <20140721093549.GL8843@ulmo>
References: <1405587689-1466-1-git-send-email-yj44.cho@samsung.com>
 <1405587689-1466-11-git-send-email-yj44.cho@samsung.com>
 <20140717103645.GD17877@ulmo> <53C87D2F.9000906@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0828350203=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <53C87D2F.9000906@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0828350203==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yaPAUYI/0vT2YKpA"
Content-Disposition: inline


--yaPAUYI/0vT2YKpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 10:49:35AM +0900, YoungJun Cho wrote:
> Hi Thierry,
>=20
> Thank you a lot for kind comments.
>=20
> On 07/17/2014 07:36 PM, Thierry Reding wrote:
> > On Thu, Jul 17, 2014 at 06:01:25PM +0900, YoungJun Cho wrote:
[...]
> > >diff --git a/drivers/gpu/drm/panel/panel-s6e3fa0.c b/drivers/gpu/drm/p=
anel/panel-s6e3fa0.c
[...]
> > >+static void s6e3fa0_set_maximum_return_packet_size(struct s6e3fa0 *ct=
x,
> > >+							unsigned int size)
> > >+{
> > >+	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> > >+	const struct mipi_dsi_host_ops *ops =3D dsi->host->ops;
> > >+
> > >+	if (ops && ops->transfer) {
> > >+		unsigned char buf[] =3D {size, 0};
> > >+		struct mipi_dsi_msg msg =3D {
> > >+			.channel =3D dsi->channel,
> > >+			.type =3D MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE,
> > >+			.tx_len =3D sizeof(buf),
> > >+			.tx_buf =3D buf
> > >+		};
> > >+
> > >+		ops->transfer(dsi->host, &msg);
> > >+	}
> > >+}
> >
> > The Set Maximum Return Packet Size command is a standard command, so
> > please turn that into a generic function exposed by the DSI core.
> >
>=20
> For this and below standard DCS commands, you want to use generic functio=
ns,
> but I have no idea for that.
> Could you explain more detail?

The goal should be to make these standard DCS commands available to all
DSI peripherals, so the implementation should look something like this:

static int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *=
dsi,
						   u16 size)
{
	struct mipi_dsi_msg msg;

	if (!dsi->ops || !dsi->ops->transfer)
		return -ENOSYS;

	memset(&msg, 0, sizeof(msg));
	msg.channel =3D dsi->channel;
	msg.type =3D MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE;
	msg.tx_len =3D sizeof(size);
	msg.tx_buf =3D &size;

	return dsi->ops->transfer(dsi->host, &msg);
}

The above is somewhat special, since it isn't DCS. For DCS I'd suggest a
common prefix, like so:

enum mipi_dcs_tear_mode {
	MIPI_DCS_TEAR_VBLANK,
	MIPI_DCS_TEAR_BLANK,
};

static int mipi_dcs_set_tear_on(struct mipi_dsi_device *dsi,
				enum mipi_dcs_tear_mode mode)
{
	u8 data[2] =3D { MIPI_DSI_DCS_SET_TEAR_ON, mode };
	struct mipi_dsi_msg msg;

	if (!dsi->ops || !dsi->ops->transfer)
		return -ENOSYS;

	memset(&msg, 0, sizeof(msg));
	msg.channel =3D dsi->channel;
	msg.type =3D MIPI_DSI_DCS_SHORT_WRITE_PARAM;
	msg.tx_len =3D sizeof(data);
	msg.tx_buf =3D data;

	return dsi->ops->transfer(dsi->host, &msg);
}

Thierry

--yaPAUYI/0vT2YKpA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzN71AAoJEN0jrNd/PrOh60oP/10svYuds9e6P4XPy1uteAPk
Qp0V8unV2LnenjDwgNgZNQUFtPzTFMcGFUQIUgTt1j3guTUCAaKP56Yc28K2Xlm4
pzLwKSbC3L2Uv/xfubwnAJuLwopeDv5y0uR50BCp7r/rmMPyv1Pimd7zXDiWZxbP
aM4VqIKpraB2Ki9nW/SY90snlwAHKjsA1VCFjsfyvbVoBYczhqrqmdoKNMJZXl8+
aBLphlLoTyVZrhokFODt5DwLf+bZwZ/kpwDbyK96gpV0KBd2dK5w22jlnluDedZS
8gNixseA4MxLRB50RpqG4y8TEJILQSBEoHvqerPKDFvAOTyB2BXf+CA6xUNsRnBP
ScRPDn9eJyv6OTxHE6+vSnBdReHaaEqSbvgcvOE63vVPe2o0QBD7dKiRvdIKz40/
+NL4SQpiyAe4W/iPtrKTj/Z3FDvtSVVzuGM1pxp0XpG6QzSWddMfTYjXL9rq/ivn
uyNxY181zS/4U0/X17XcmE8HkPpUwRvYHCB387UutcHJ56mPWz59aRm5GPTcW2M+
rgXeG0KacPRlvrfiCQXhs7ttuEy00N2GAJ8UJCpakCKsBYm97m0CfOeV1ZSfMu9S
hYMAJ6L+SXb3zOHd9bQcJetlJwkKUoAkZikoirzwSzQ3VyOFyHa+H9MpmuQ/BRYt
+6b3vqEUp1SwphDWP5LI
=UaNY
-----END PGP SIGNATURE-----

--yaPAUYI/0vT2YKpA--

--===============0828350203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0828350203==--
