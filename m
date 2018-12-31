From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/6] ARM: dts: s5pv210: aries: Add reserved memory for mfc
Date: Mon, 31 Dec 2018 12:44:30 +0100
Message-ID: <CAJKOXPdWt1A=RPzzbv+DBJj6z1gUPF3OofGthYeyOCYcCiYwAQ@mail.gmail.com>
References: <20181228161819.18931-1-pawel.mikolaj.chmiel@gmail.com> <20181228161819.18931-5-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181228161819.18931-5-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xc-racer2@live.ca, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 28 Dec 2018 at 17:18, Pawe=C5=82 Chmiel
<pawel.mikolaj.chmiel@gmail.com> wrote:
>
> This commit adds memory reservation required by MFC to run.
> On S5PV210 both regions needs to be on separate memory banks.
> Size of both regions is taken from stock sources.
>
> Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  arch/arm/boot/dts/s5pv210-aries.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5p=
v210-aries.dtsi
> index 575094ea7024..35ba009a1a33 100644
> --- a/arch/arm/boot/dts/s5pv210-aries.dtsi
> +++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
> @@ -23,6 +23,24 @@
>                         0x50000000 0x08000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               mfc_left: region_mfc_left@43000000 {

Although you used the same naming convention as existing
exynos-mfc-reserved-memory.dtsi, the name of nodes should be generic,
so:
mfc_left: region@43000000

Best regards,
Krzysztof


> +                       compatible =3D "shared-dma-pool";
> +                       no-map;
> +                       reg =3D <0x43000000 0x2000000>;
> +               };
> +
> +               mfc_right: region_mfc_right@51000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       no-map;
> +                       reg =3D <0x51000000 0x2000000>;
> +               };
> +       };
> +
>         wifi_pwrseq: wifi-pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
>                 reset-gpios =3D <&gpg1 2 GPIO_ACTIVE_LOW>;
> @@ -329,6 +347,10 @@
>         status =3D "okay";
>  };
>
> +&mfc {
> +       memory-region =3D <&mfc_left>, <&mfc_right>;
> +};
> +
>  &pinctrl0 {
>         wlan_bt_en: wlan-bt-en {
>                 samsung,pins =3D "gpb-5";
> --
> 2.17.1
>
