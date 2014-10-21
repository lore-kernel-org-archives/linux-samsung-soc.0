From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 3/4] mfd/regulator: dt-bindings: max77686: Document
 regulators off in suspend
Date: Tue, 21 Oct 2014 14:01:11 +0200
Message-ID: <54464B07.8050608@collabora.co.uk>
References: <1413890597-31037-1-git-send-email-k.kozlowski@samsung.com> <1413890597-31037-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413890597-31037-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/21/2014 01:23 PM, Krzysztof Kozlowski wrote:
> Add information which regulators can be disabled during system suspend.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/mfd/max77686.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
> index 678f3cf0b8f0..75fdfaf41831 100644
> --- a/Documentation/devicetree/bindings/mfd/max77686.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77686.txt
> @@ -34,6 +34,12 @@ to get matched with their hardware counterparts as follow:
>  	-BUCKn 	:	for BUCKs, where n can lie in range 1 to 9.
>  			example: BUCK1, BUCK5, BUCK9.
>  
> +  Regulators which can be turned off during system suspend:
> +	-LDOn	:	2, 6-8, 10-12, 14-16,
> +	-BUCKn	:	1-4.
> +  Use standard regulator bindings for it ('regulator-off-in-suspend').
> +
> +
>  Example:
>  
>  	max77686@09 {
> 

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
