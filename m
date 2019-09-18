From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: sound: Convert Samsung SMDK audio complex
Date: Wed, 18 Sep 2019 13:15:19 +0200
Message-ID: <CAJKOXPc=OXLY3ynUKGhVduuiSyzT_1Po19Hhwd6fGkbaar8GQQ@mail.gmail.com>
References: <CGME20190917120634eucas1p20addfc4e369468561714f3c44d3d8bf5@eucas1p2.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com> <20190917120627.28357-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917120627.28357-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, sbkim73@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 17 Sep 2019 at 14:06, Maciej Falkowski <m.falkowski@samsung.com> wrote:
>
> Convert Samsung SMDK audio complex to newer dt-schema format.
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added missing Signed-off-by certificate

I understood you cannot certify that you have the rights to send the
patch. Adding someone's else Signed-off-by does not solve the problem
of lack of such permission. Marek could certify that but you cannot
certify for him. Otherwise it really makes the process bogus - anyone
can add Linus' SoB and say that Linus certified the rights to include
this contribution.

In my understanding of Developer's Certificate of Origin 1.1, these
patches do not meet the criteria and therefore should not be included
from that point of view.

One minor comment further.

> ---
>  .../bindings/sound/samsung,smdk-wm8994.txt    | 14 -------
>  .../bindings/sound/samsung,smdk-wm8994.yaml   | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
> deleted file mode 100644
> index 4686646fb122..000000000000
> --- a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.txt
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Samsung SMDK audio complex
> -
> -Required properties:
> -- compatible : "samsung,smdk-wm8994"
> -- samsung,i2s-controller: The phandle of the Samsung I2S0 controller
> -- samsung,audio-codec: The phandle of the WM8994 audio codec
> -Example:
> -
> -sound {
> -               compatible = "samsung,smdk-wm8994";
> -
> -               samsung,i2s-controller = <&i2s0>;
> -               samsung,audio-codec = <&wm8994>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
> new file mode 100644
> index 000000000000..a66c0dfdeb57
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,smdk-wm8994.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,smdk-wm8994.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC SMDK audio complex
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sangbeom Kim <sbkim73@samsung.com>

Unfortunately there was no mails coming from Sangbeom Kim so I think
he is not active in maintaining these pieces. Let's skip this entry.

Best regards,
Krzysztof

> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: "samsung,smdk-wm8994"
> +
> +  samsung,i2s-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the Samsung I2S0 controller
> +
> +  samsung,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the WM8994 audio codec
> +
> +required:
> +  - compatible
> +  - samsung,i2s-controller
> +  - samsung,audio-codec
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "samsung,smdk-wm8994";
> +        samsung,i2s-controller = <&i2s0>;
> +        samsung,audio-codec = <&wm8994>;
> +    };
> +
> --
> 2.17.1
>
