From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC v2 PATCH v4 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Wed, 23 Apr 2014 09:33:47 +0200
Message-ID: <20140423073341.GE31226@ulmo>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com>
 <1398083321-8668-10-git-send-email-yj44.cho@samsung.com>
 <53567683.1020206@samsung.com> <535716BC.2080702@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618461094=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <535716BC.2080702@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com, sachin.kamat@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org


--===============0618461094==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
Content-Disposition: inline


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 10:26:20AM +0900, YoungJun Cho wrote:
> Hi Andrzej
>=20
> Thank you for comment.
>=20
> On 04/22/2014 11:02 PM, Andrzej Hajda wrote:
> >On 04/21/2014 02:28 PM, YoungJun Cho wrote:
> >>This patch adds DT bindings for s6e3fa0 panel.
> >>The bindings describes panel resources, display timings and cpu timings.
> >>
> >>Changelog v2:
> >>- Adds unit address (commented by Sachin Kamat)
> >>Changelog v3:
> >>- Removes optional delay, size properties (commented by Laurent Pinchar=
t)
> >>- Adds OLED detection, TE gpio properties
> >>Changelog v4:
> >>- Moves CPU timings relevant properties from FIMD DT
> >>   (commeted by Laurent Pinchart, Andrzej Hajda)
> >>
> >>Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> >>Acked-by: Inki Dae <inki.dae@samsung.com>
> >>Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> >>---
> >>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   63 +++++++++++=
+++++++++
> >>  1 file changed, 63 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6=
e3fa0.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.tx=
t b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> >>new file mode 100644
> >>index 0000000..9eeb38b
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> >>@@ -0,0 +1,63 @@
> >>+Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> >>+
> >>+Required properties:
> >>+  - compatible: "samsung,s6e3fa0"
> >>+  - reg: the virtual channel number of a DSI peripheral
> >>+  - vdd3-supply: core voltage supply
> >>+  - vci-supply: voltage supply for analog circuits
> >>+  - reset-gpio: a GPIO spec for the reset pin
> >>+  - det-gpio: a GPIO spec for the OLED detection pin
> >>+  - te-gpio: a GPIO spec for the TE pin
> >
> >Just FYI, according to DT documentation [1] gpio spec should be in form
> >[name]-gpios, however there is plenty bindings with -gpio suffix, so I
> >am not sure if it is really enforced. On the other side it is enforced
> >by descriptor based gpio framework[2]. Integer-based gpio framework
> >used in your driver is obsolete according to [2].
>=20
> Yes, you're right. That is my mistake.
> They should be attached 's'.
> At first I used integer-based gpio framework and replaced to descriptor
> based one, but did not updated DT bindings.

I've been working on a patch to support both *-gpios and *-gpio variants
with the GPIO descriptor framework. *-gpios makes sense if there can
indeed be several, but for something like hotplug detection I don't
think there's a reason to require the plural.

Furthermore some bindings already use the singular *-gpio anyway, so if
we ever want to convert drivers using those bindings to the GPIO
descriptor API we have to support that form too.

Thierry

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTV2zVAAoJEN0jrNd/PrOhlf4QAJMXm3uJOjbn99PCvVKTGJoC
hXtogifVuMu7qONkAQ+6pJs4o9aG3kfqp31b6jCwni38ixFIPTX42MdXaVvvcOl3
nOhbr4PukD08E/gCWMFbVx9H9zPHwAlJ7Ug5O/zzT6C6mE9NZyIQmpYoXfJ0W0Ed
ATToA8sLiLRUcbp945MSkvWfuImjUGyqcdvVCImKCp/KrfSA20/VxSbfpynvClGO
rn6xEErLVkTeLzVs305rnl8Oz+7y1qWqQG24nSFFcIqtpIbhnr99Cg7jR6IuYoaI
OeW+8PeK8D1aDo6N/G692AZdBfkRCp941xGWFOknbw7Cw3O3YCqgKeYLCE1Ms0sc
pQ3UcjNnUghiFxVXlkkRlQQp5raT/z/uA6G5HiyRgfEI6Bs9v2LvHj04XFFU+8A9
k38Z0Nv+s8XuouP7hCWM6VqkC9mxzpzw7Bv8Yr2Tr43E28ubhpp6txVeXhJ2QC5l
t/9EPKneROhNPhCXhy+/AGHA6+zjxdfu9qOwTutHHQVUGBw0+b1/wFHcUbjqA9Dm
1UnIiVcVWutQCv7XXu1c9m7CzSjS9u8EOeZjkT2DV95t02bN6YPsfdbXNk5HiJaX
vOAD0ts2PWx0GjTPi3+diizEMrzIZ0rnwU00Z0LRacQ3XxfxoL9h7RsD+w0Giu8O
qd9aL0ibDwuqXj2hPVA6
=XHoo
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--

--===============0618461094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0618461094==--
