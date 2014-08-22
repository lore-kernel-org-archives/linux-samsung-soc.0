From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v7] ARM: dts: Prepare node labels for exynos5250
Date: Fri, 22 Aug 2014 19:49:44 +0900
Message-ID: <080101cfbdf6$c8fd1f30$5af75d90$@samsung.com>
References: <53DCD74B.8090400@gmail.com>
 <1408539764-5835-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1408539764-5835-1-git-send-email-afaerber@suse.de>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 'Vincent Palatin' <vpalatin@chromium.org>, 'Doug Anderson' <dianders@chromium.org>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Tomasz Figa' <t.figa@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, 'open list' <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Andreas F=C3=A4rber wrote:
>=20
> Allows them to be extended by reference.
>=20
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v6 -> v7:
>  * Dropped uart* labels (Tomasz Figa)
>=20
>  v6: Split off from Snow/SMDK cleanups (Doug Anderson)
>=20
>  arch/arm/boot/dts/exynos5250.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/ex=
ynos5250.dtsi
> index 492e1eff37bd..42eafd19cfb2 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -218,7 +218,7 @@
>  		clock-names =3D "fimg2d";
>  	};
>=20
> -	codec@11000000 {
> +	mfc: codec@11000000 {
>  		compatible =3D "samsung,mfc-v6";
>  		reg =3D <0x11000000 0x10000>;
>  		interrupts =3D <0 96 0>;
> @@ -227,7 +227,7 @@
>  		clock-names =3D "mfc";
>  	};
>=20
> -	rtc@101E0000 {
> +	rtc: rtc@101E0000 {
>  		clocks =3D <&clock CLK_RTC>;
>  		clock-names =3D "rtc";
>  		status =3D "disabled";
> @@ -261,7 +261,7 @@
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
>=20
> -	sata@122F0000 {
> +	sata: sata@122F0000 {
>  		compatible =3D "snps,dwc-ahci";
>  		samsung,sata-freq =3D <66>;
>  		reg =3D <0x122F0000 0x1ff>;
> @@ -573,7 +573,7 @@
>  		#phy-cells =3D <1>;
>  	};
>=20
> -	usb@12110000 {
> +	ehci: usb@12110000 {

I'm not sure which one is recommended between above and "ehci: ehci@121=
10000 {"

>  		compatible =3D "samsung,exynos4210-ehci";
>  		reg =3D <0x12110000 0x100>;
>  		interrupts =3D <0 71 0>;
> @@ -588,7 +588,7 @@
>  		};
>  	};
>=20
> -	usb@12120000 {
> +	ohci: usb@12120000 {

Same as above...

>  		compatible =3D "samsung,exynos4210-ohci";
>  		reg =3D <0x12120000 0x100>;
>  		interrupts =3D <0 71 0>;
> @@ -725,7 +725,7 @@
>  		clock-names =3D "gscl";
>  	};
>=20
> -	hdmi {
> +	hdmi: hdmi {

Should be

+	hdmi: hdmi@14530000 { ?

>  		compatible =3D "samsung,exynos4212-hdmi";
>  		reg =3D <0x14530000 0x70000>;
>  		interrupts =3D <0 95 0>;
> @@ -751,14 +751,14 @@
>  		#phy-cells =3D <0>;
>  	};
>=20
> -	dp-controller@145B0000 {
> +	dp: dp-controller@145B0000 {
>  		clocks =3D <&clock CLK_DP>;
>  		clock-names =3D "dp";
>  		phys =3D <&dp_phy>;
>  		phy-names =3D "dp";
>  	};
>=20
> -	fimd@14400000 {
> +	fimd: fimd@14400000 {
>  		clocks =3D <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
>  		clock-names =3D "sclk_fimd", "fimd";
>  	};
> --
> 2.0.4
