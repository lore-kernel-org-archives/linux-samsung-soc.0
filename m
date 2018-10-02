From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: hwrng: Add Samsung Exynos 5250+ True RNG bindings
Date: Tue, 2 Oct 2018 13:14:11 +0200
Message-ID: <CAJKOXPdrtCGa_doOk_fQDC6d9=ZDY460X-0qmWjaGyJpxeB+Ug@mail.gmail.com>
References: <CGME20181002075700epcas2p1e1650ae02c1d6b1bfb946b146d4ce223@epcas2p1.samsung.com>
 <CAL_JsqLoZfU+DMxHJg7ZqD06dgcsxiDbYYW99x8H4C0sOwdiiw@mail.gmail.com> <20181002075633.25658-1-l.stelmach@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181002075633.25658-1-l.stelmach@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: l.stelmach@samsung.com
Cc: robh+dt@kernel.org, joe@perches.com, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 2 Oct 2018 at 09:57, =C5=81ukasz Stelmach <l.stelmach@samsung.com> =
wrote:
>
> Add binding documentation for the True Random Number Generator
> found on Samsung Exynos 5250+ SoCs.
>
> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> ---
>  .../bindings/rng/samsung,exynos5250-trng.txt    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos5=
250-trng.txt

Mine and Rob's tags disappeared already once (v2->v3) and...  now
again (from v3 to here). Just amend the commit in your local repo and
add them permanently.
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trn=
g.txt b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
> new file mode 100644
> index 000000000000..5a613a4ec780
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
> @@ -0,0 +1,17 @@
> +Exynos True Random Number Generator
> +
> +Required properties:
> +
> +- compatible  : Should be "samsung,exynos5250-trng".
> +- reg         : Specifies base physical address and size of the register=
s map.
> +- clocks      : Phandle to clock-controller plus clock-specifier pair.
> +- clock-names : "secss" as a clock name.
> +
> +Example:
> +
> +       rng@10830600 {
> +               compatible =3D "samsung,exynos5250-trng";
> +               reg =3D <0x10830600 0x100>;
> +               clocks =3D <&clock CLK_SSS>;
> +               clock-names =3D "secss";
> +       };
> --
> 2.19.0
>
