From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 7/8] mfd/regulator: dt-bindings: max77686: Document gpio
 property
Date: Mon, 27 Oct 2014 21:15:16 +0100
Message-ID: <544EA7D4.8070406@collabora.co.uk>
References: <1414422226-10948-1-git-send-email-k.kozlowski@samsung.com> <1414422226-10948-8-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414422226-10948-8-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/27/2014 04:03 PM, Krzysztof Kozlowski wrote:
> Document usage of gpio property which turns on external control over
> regulator.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/max77686.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
> index 75fdfaf41831..e41dfa7e2b90 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -39,6 +39,9 @@ to get matched with their hardware counterparts as follow:
>  	-BUCKn	:	1-4.
>    Use standard regulator bindings for it ('regulator-off-in-suspend').
>  
> +  Optional properties:
> +  - gpio : GPIO to use for external control. Valid only for LDO20, LDO21,
> +    LDO22, BUCK8 and BUCK9 regulators.

When using the descriptor-based GPIO interface the standard is to use as the DT
property name a prefix documenting the GPIO function + a -gpios or -gpio suffix.
So this should be something like ec-gpio.

Best regards,
Javier
