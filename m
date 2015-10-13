From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/3] mfd: dt-bindings: Document pulled down WRSTBI pin
 on S2MPS1X
Date: Tue, 13 Oct 2015 10:04:31 +0100
Message-ID: <20151013090431.GI32409@x1>
References: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
 <1444178681-16188-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444178681-16188-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 07 Oct 2015, Krzysztof Kozlowski wrote:

> Document a new Device Tree property 'samsung,s2mps11-wrstbi-ground'
> indicating that WRSTBI pin of S2MPS13 PMIC is pulled down so
> corresponding buck warm reset function should be disabled.
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> ---
>=20
> Changs since v1:
> None.
> ---
>  Documentation/devicetree/bindings/mfd/s2mps11.txt | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index 90eaef393325..890f0b0e1643 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -19,6 +19,9 @@ Optional properties:
>    connected to the ground so the PMIC must manually set PWRHOLD bit =
in CTRL1
>    register to turn off the power. Usually the ACOKB is pulled up to =
VBATT so
>    when PWRHOLD pin goes low, the rising ACOKB will trigger power off=
=2E
> +- samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC i=
s pulled
> +  down. When the system is suspended it will always go down thus tri=
ggerring
> +  unwanted buck warm reset (setting buck voltages to default values)=
=2E
> =20
>  Optional nodes:
>  - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffe=
red 32.768

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
