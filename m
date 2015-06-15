From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 7/8] mfd: cros_ec: spi: Add a DT property to delay
 asserting the CS
Date: Mon, 15 Jun 2015 13:25:05 +0100
Message-ID: <20150615122505.GG3266@x1>
References: <1433847889-7220-1-git-send-email-javier.martinez@collabora.co.uk>
 <1433847889-7220-8-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433847889-7220-8-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 09 Jun 2015, Javier Martinez Canillas wrote:

> From: Alexandru M Stan <amstan@chromium.org>
>=20
> Some ECs need a little time for waking up before they can accept
> SPI data at a high speed. Add a "google,cros-ec-spi-pre-delay"
> property to the DT binding to configure this.
>=20
> If this property isn't set, then no delay will be added. However,
> if set it will cause a delay equal to the value passed to it to
> be inserted at the beginning of a transaction.
>=20
> Signed-off-by: Alexandru M Stan <amstan@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Olof Johansson <olof@lixom.net>

Applied, thanks.

> ---
>=20
> Changes since v6:
>  - Add Olof Johansson Acked-by tag
>=20
> Changes since v5: None.
>=20
> Changes since v4: None.
>=20
> Changes since v3:
>  - Split DT binding and driver change as suggested by Lee Jones.
>  - Add tested-by tag from Heiko Stuebner
>  - Add acked-by tag from Lee Jones.
>=20
> Changes since v2: None
>=20
> Changes since v1: None, new patch
> ---
>  Documentation/devicetree/bindings/mfd/cros-ec.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Docu=
mentation/devicetree/bindings/mfd/cros-ec.txt
> index 8009c3d87f33..1777916e9e28 100644
> --- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
> +++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
> @@ -18,6 +18,10 @@ Required properties (SPI):
>  - reg: SPI chip select
> =20
>  Optional properties (SPI):
> +- google,cros-ec-spi-pre-delay: Some implementations of the EC need =
a little
> +  time to wake up from sleep before they can receive SPI transfers a=
t a high
> +  clock rate. This property specifies the delay, in usecs, between t=
he
> +  assertion of the CS to the start of the first clock pulse.
>  - google,cros-ec-spi-msg-delay: Some implementations of the EC requi=
re some
>    additional processing time in order to accept new transactions. If=
 the delay
>    between transactions is not long enough the EC may not be able to =
respond

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
