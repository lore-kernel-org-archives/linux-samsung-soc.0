From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3] dt-bindings: sound: Convert Samsung I2S controller
 to dt-schema
Date: Fri, 20 Sep 2019 14:27:53 +0200
Message-ID: <a7289122-9114-240e-8e84-9d7c1000472c@samsung.com>
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
        <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
        <20190920113540.30687-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920113540.30687-1-m.szyprowski@samsung.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Maciej Falkowski <m.falkowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 9/20/19 13:35, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.

>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 135 ++++++++++++++++++
>  2 files changed, 135 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> new file mode 100644
> index 000000000000..20ae5da7f798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml

> +  clocks:
> +    minItems: 1
> +    maxItems: 3

> +    description: |
> +      There are following clocks available at the I2S device nodes:
> +      CLK_I2S_CDCLK:
> +      the CDCLK (CODECLKO) gate clock.
> +
> +      CLK_I2S_RCLK_PSR:
> +      RCLK prescaler divider clock corresponding to the IISPSR register.
> +
> +      CLK_I2S_RCLK_SRC:
> +      RCLKSRC mux clock corresponding to RCLKSRC bit in IISMOD register.

Sorry for the confusion, this description refers to the supplier clocks
but the clocks property refers to the consumer clocks. The I2C controller
is both clock consumer and provider. I'm not sure where this description
should be moved to, "#clock-cells" property might be better but is likely
not the right place either. 

> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: iis
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +      - items:
> +          - const: iis
> +          - const: i2s_opclk0
> +          - const: i2s_opclk1
> +    description: |
> +      "iis" is the i2s bus clock.
> +      For i2s1 and i2s2 - "iis", "i2s_opclk0"
> +      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
> +
> +  "#clock-cells":
> +    const: 1

--
Thanks,
Sylwester
