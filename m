From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC V3 2/3] drm/bridge: add a dummy panel driver to support
 lvds bridges
Date: Tue, 13 May 2014 10:05:03 +0200
Message-ID: <20140513080501.GH6754@ulmo>
References: <1399647182-20951-1-git-send-email-ajaykumar.rs@samsung.com>
 <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0227459153=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1399647182-20951-3-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com, ajaynumb@gmail.com, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0227459153==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDnEQgWzhgf+8aPe"
Content-Disposition: inline


--dDnEQgWzhgf+8aPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 08:23:01PM +0530, Ajay Kumar wrote:
> implement basic panel controls as a drm_bridge so that
> the existing bridges can make use of it.
>=20
> The driver assumes that it is the last entity in the bridge chain.
>=20
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../bindings/drm/bridge/bridge_panel.txt           |   45 ++++

Can we please stop adding files to this directory? Device tree bindings
are supposed to be OS agnostic, but DRM is specific to Linux and should
not be used when describing hardware.

> diff --git a/Documentation/devicetree/bindings/drm/bridge/bridge_panel.tx=
t b/Documentation/devicetree/bindings/drm/bridge/bridge_panel.txt
[...]
> +	-led-en-gpio:
> +		eDP panel LED enable GPIO.
> +			Indicates which GPIO needs to be powered up as output
> +			to enable the backlight.

Since this is used to control a backlight, then this should really be a
separate node to describe the backlight device (and use the
corresponding backlight driver) rather than duplicating a subset of that
functionality.

> +	-panel-pre-enable-delay:
> +		delay value in ms required for panel_pre_enable process
> +			Delay in ms needed for the eDP panel LCD unit to
> +			powerup, and delay needed between panel_VCC and
> +			video_enable.

What are panel_VCC or video_enable?

> +	-panel-enable-delay:
> +		delay value in ms required for panel_enable process
> +			Delay in ms needed for the eDP panel backlight/LED unit
> +			to powerup, and delay needed between video_enable and
> +			BL_EN.

Similarily, what does BL_EN stand for?

> +	bridge-panel {
> +		compatible =3D "drm-bridge,panel";

Again, drm- doesn't mean anything outside of Linux (and maybe BSD),
therefore shouldn't be used to describe hardware in device tree.

> diff --git a/drivers/gpu/drm/bridge/bridge_panel.c b/drivers/gpu/drm/brid=
ge/bridge_panel.c
[...]

This duplicates much of the functionality that panels should provide. I
think a better solution would be to properly integrate panels with
bridges.

Thierry

--dDnEQgWzhgf+8aPe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTcdItAAoJEN0jrNd/PrOh37UQAIyn4a3JfqfmmPAFYoX/QTHM
7id1Nr2DAVhd+PS6tbY8Q5+5YOcw1SffSGB7aBopiyPgwn9K8CmMxMbKtKxlP0pB
uuTV1qSB9abh+Qxp5DhrOqttvpIzcv3Ys6zb5y3gZJIdAufgAG6i1sd1kvpg1v/N
J4FXdHCZAppmOc79kJJAKMifHub8XIekpAO/uJBlfB1Bgsj+v8q/k9aMmSFucYh4
caipi2pkpzrcLe4jN533vkzWjVoWMB+OYZCrvaQi0iQhYPGEUTZ9jPua52oKWTGM
sX2Xv2ZrRO5sBciBogQZgrThRxYRKtrzlze/Tp/eGNp3OMJ7Qk7EoualTTVUdS1c
pj32f27Wl2t5kGbn7rgLyje8IROFuDP5Wt6F0FwRAuWqtvXk6zQOxlUsL1OlC15W
VmbnzJwcvP0thvTIhic8SpuK7n3NCSFsE6PLPxNVUttLAEZu8TOGVC2AeULMVLjZ
i6zqqPRjGC1gW6PWrDDjOJVrHCG3uHjRUKnpfQeMYugeb/T5tUbpAFLpaCUB3/BM
Pl6KSsatGvCSNA80YMkB1BazpzGLhOyum/3nCPC0nJhx7El44CNpI7+UBaQ0JijD
I7qTGaTD/nqa28FNT+JSqcIeFBTnY5/ZFYg8W0rh4Llbi0TrCkGQJzaTWKlDZeta
iyz6ycERUeOM95vbPru0
=DIBk
-----END PGP SIGNATURE-----

--dDnEQgWzhgf+8aPe--

--===============0227459153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0227459153==--
