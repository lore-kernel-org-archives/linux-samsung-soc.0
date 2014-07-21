From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 11/12] Documentation: Add DT bindings for
 ps8622/ps8625 bridge driver
Date: Mon, 21 Jul 2014 09:06:29 +0200
Message-ID: <20140721070627.GA8843@ulmo>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
 <1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0012470332=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1405629839-12086-12-git-send-email-ajaykumar.rs@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, seanpaul@google.com, daniel.vetter@ffwll.ch, joshi@samsung.com, dri-devel@lists.freedesktop.org, ajaynumb@gmail.com, javier@dowhile0.org, prashanth.g@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org


--===============0012470332==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 02:13:57AM +0530, Ajay Kumar wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
>=20
> Add DT binding documentation for ps8622/ps8625 bridge driver.
>=20
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  .../devicetree/bindings/drm/bridge/ps8622.txt      |   21 ++++++++++++++=
++++++

This is the wrong directory. Bindings are supposed to be OS agnostic,
but DRM is (mostly) Linux-specific. video/bridge would be a better
subdirectory for this. Somebody really ought to be moving out the
existing bindings in the drm subdirectory to a more proper location.

>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/ps8622.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/drm/bridge/ps8622.txt b/Do=
cumentation/devicetree/bindings/drm/bridge/ps8622.txt
> new file mode 100644
> index 0000000..1d154ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/ps8622.txt
> @@ -0,0 +1,21 @@
> +ps8622-bridge bindings
> +
> +Required properties:
> +	- compatible: "parade,ps8622" or "parade,ps8625"

Documentation/devicetree/bindings/vendor-prefixes.txt doesn't contain an
entry for parade yet.

> +	- reg: first i2c address of the bridge
> +	- sleep-gpios: OF device-tree gpio specification
> +	- reset-gpios: OF device-tree gpio specification
> +
> +Optional properties:
> +	- lane-count: number of DP lanes to use
> +	- use-external-pwm: backlight will be controlled by an external PWM

In case of an external backlight, don't you still need a way to control
it? Perhaps instead of using this boolean property you should make this
take a phandle to the real backlight? Like so:

	backlight {
		compatible =3D "pwm-backlight";
		...
	}

	bridge@48 {
		compatible =3D "parade,ps8622";
		...
		backlight =3D <&/backlight>;
	}

Then you can simply look up the backlight device when that property
exists and instantiate the built-in backlight otherwise.

> +
> +Example:
> +	ps8622-bridge@48 {
> +		compatible =3D "parade,ps8622";
> +		reg =3D <0x48>;
> +		sleep-gpios =3D <&gpc3 6 1 0 0>;
> +		reset-gpios =3D <&gpc3 1 1 0 0>;
> +		display-timings =3D <&lcd_display_timings>;

Why is this specifying display-timings? It's not mentioned in the
binding above and I don't see why the bridge would need to provide
one since it's really a property of the panel.

Thierry

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzLvzAAoJEN0jrNd/PrOhHgMP+wW3gOH7JEXXGhOWBZVJw9Hb
J/rcYrawGqIkaONc+95kIoZG6N1qVAC/qLXdIsJMLcdsl+VXp5xIx84EFrgrlU+5
tWmxSthAEDZ69OiP7c4vzC0HAG+soSHvpZC+ekfjw5rt88qlUsNvLjuhHpMX+hSe
Mm/H6wBUP7RrLA6hzz644uEwnOnYYVudepAhK2cxKTjE+N/dMCcHbQ//P/IUiKRx
pJ1XsDcnz/s46pKhhEzmufgodr93DxVwLG6/tA7K1v+oHF3b6f9qhGKEOvr+Kyvm
pLrmZfmnK6alzmDyrGzz/7+wNbRzwelvQ0cfWRQ1TA9BXVrAy8WKCXerLFwb7kC2
wZ2ZaqOP1XRQA3ADHCLPcPAXCggx6nD470J0deB+X7fTW7NkUWSwUzY8vZ5cnLeE
l7wRUI6kFOq1CcPxEWNHx0mz5MN178sJfTvSproseOayTdjLcD57VpNkEbJ27GVd
4I1tVNIMYJio0E0PdFH0W3OD+Y+A6vBlJVVCY9Am1r6Ane6fCs+FGL4rEor3h3is
8jqDSkzqI6FxNhu6gKqLWOOMXTfdSIN77kF6m6TsiH+jnWHxqIqMNAa8yt4WVOZs
L8/oVsiyikebHVOzqZJ0ublsunLRItYbnvGESNvEI+Nb5LP9Z1/hJR4dxO6mRkmG
H5KGoqSmQlvgliiNdinN
=+0dl
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

--===============0012470332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0012470332==--
