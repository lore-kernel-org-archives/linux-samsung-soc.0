Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4E278C9C;
	Sun,  6 Jul 2025 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794840; cv=none; b=jaw2CunVDroBvcd0zMHZb49jiCzKXuQH24GRBqQY+n/pTl1sWTs1vJyAzTSQsMuLyJEuhMrCIbkkKkGWTqMy6vb7KhJOtxEEA2o4MjjV7OA8ClrpT+86jw6cjJkYkE84AzHTUmCEwToMh18l8KqqYnIRnHjRhsbVdjjtDOhjBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794840; c=relaxed/simple;
	bh=E1Gqnl0Y5v3pm060FcRZu8CjsVWlnU2UsjIGzkcfq1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMjvf/pwyr1fKBrMlOHBI2hN44aMgveCxWuISJlK3EKgX/duaLQUhRLtIwjVsgt5Zg+nmlYkulOsSOTLRhJ5ZUxSeAF0nlRjeD0Im1ijERiFnAHcUPPSwYLtzhzOQ/IQ4nJPTAKXhLWp4M9Woo7cMCqnJG8O0YYUOwhio2nUFSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F068C4CEED;
	Sun,  6 Jul 2025 09:40:39 +0000 (UTC)
Date: Sun, 6 Jul 2025 11:40:37 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, neil.armstrong@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250706-fresh-meaty-cougar-5af170@krzk-bin>
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
 <20250701120706.2219355-2-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701120706.2219355-2-pritam.sutar@samsung.com>

On Tue, Jul 01, 2025 at 05:37:01PM +0530, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB HS phy found in this SoC.
> The SoC requires two clocks, named "phy" and "ref" (same as clocks
> required by Exynos850).
> 
> It also requires various power supplies (regulators) for the internal
> circuitry to work. The required voltages are:
> * avdd075_usb - 0.75v
> * avdd18_usb20 - 1.8v
> * avdd33_usb20 - 3.3v
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No, really. Look:

> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index e906403208c0..2e29ff749bba 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -34,6 +34,7 @@ properties:
>        - samsung,exynos7870-usbdrd-phy
>        - samsung,exynos850-usbdrd-phy
>        - samsung,exynos990-usbdrd-phy
> +      - samsung,exynosautov920-usbdrd-phy
>  
>    clocks:
>      minItems: 1
> @@ -110,6 +111,15 @@ properties:
>    vddh-usbdp-supply:
>      description: VDDh power supply for the USB DP phy.
>  
> +  avdd075_usb-supply:
> +    description: 0.75V power supply for USB phy
> +
> +  avdd18_usb20-supply:
> +    description: 1.8V power supply for USB phy
> +
> +  avdd33_usb20-supply:
> +    description: 3.3V power supply for USB phy
> +

None of these were here. Follow DTS coding style... but why are you
adding completely new supplies?


>  required:
>    - compatible
>    - clocks
> @@ -235,6 +245,33 @@ allOf:
>  
>          reg-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynosautov920-usbdrd-phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: phy
> +            - const: ref
> +
> +        reg:
> +          maxItems: 1
> +
> +        reg-names:
> +          maxItems: 1
> +
> +      required:
> +        - avdd075_usb-supply
> +        - avdd18_usb20-supply
> +        - avdd33_usb20-supply

Neither was this entire diff hunk here.

This was part of other block for a reason.

NAK

Best regards,
Krzysztof

