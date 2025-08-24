Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2535025FA24;
	Sun, 24 Aug 2025 08:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025755; cv=none; b=rwvmPeGwB4M446uqeT3lSgUahzPGbbgLBbtFd6+0vY6Thi8Mbx1+7S8Gs2Ifk6FjVugv00EuvtrYTnm3ycTvS0QdypSuFXnNK4qGGd652HJHMOvgf9J9nIDVjK6yAyaNnKkM/VNEJydrrGhHaEorMgOe1jkH6YaG4vkr50KP2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025755; c=relaxed/simple;
	bh=0t8NYsclUsLqSKfihTaUGdY6Q22Pg+5nw0i9SnPs+rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z41dhwSyjCzXLKm8NthI1+KhmL8h/HG3J1vMijJswiwBuZzbApvSPe4jlHhzDhv0ldmBBZSrJFRLo5LAA6D2fkXVBQwJKv/FTaFIz3s+06N8HI35j+fEune6/Acc2KzUDxoEaXDLIiw80RHXJB/c1mAqjQmOJzcl9P0R4G0SJn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjm4/0x1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjm4/0x1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F923C4CEEB;
	Sun, 24 Aug 2025 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756025754;
	bh=0t8NYsclUsLqSKfihTaUGdY6Q22Pg+5nw0i9SnPs+rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjm4/0x15o2yx/NzpWGvaWSnCm5A5mLB+XgnjSNcNzRkvXQ7rHlUh4sLGBGirZSy5
	 kehj4OxXvckzYWAQgfBSVWXMOtGXRc5dop0Fej8WH4THM9JhZJSDIKedteEKYibA5Y
	 c6CzeeGIqywzIuNo4iXlsRDeLHIOBH320aB8q2x1AVtbC37rPFLQwgYgg6OcwMjprl
	 z+DYoZhQGkMOUPJr8TAeNNGVIsFvqlc12H4puIe8YWWTSUYG//LtTA98GDv6+KzrFj
	 g/oCCklsVlV4QMk0Jc86I2mgjLJ2VaTEXsBpvoTIsW6Xvv5xaoXpm9gyjk3Xwc1Id8
	 hQzlJadGQohDQ==
Date: Sun, 24 Aug 2025 10:55:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org, johan@kernel.org, 
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Message-ID: <20250824-rough-fresh-orangutan-eecb2f@kuoka>
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
 <20250822093845.1179395-6-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822093845.1179395-6-pritam.sutar@samsung.com>

On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> "phy" and "ref". The required supplies for USB3.1 are named as
> vdd075_usb30(0.75v), vdd18_usb30(1.8v).

Please do not describe the schema, but hardware. This sentence does not
help me in my question further.

> 
> Add schemas for combo ssphy found on this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index f0cfca5736b8..96e5bbb2e42c 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> @@ -34,6 +34,7 @@ properties:
>        - samsung,exynos7870-usbdrd-phy
>        - samsung,exynos850-usbdrd-phy
>        - samsung,exynos990-usbdrd-phy
> +      - samsung,exynosautov920-usb31drd-combo-ssphy
>        - samsung,exynosautov920-usbdrd-combo-hsphy
>        - samsung,exynosautov920-usbdrd-phy
>  
> @@ -118,6 +119,12 @@ properties:
>    vdd18-usb20-supply:
>      description: 1.8V power supply for the USB 2.0 phy.
>  
> +  dvdd075-usb30-supply:
> +    description: 0.75V power supply for the USB 3.0 phy.
> +
> +  vdd18-usb30-supply:
> +    description: 1.8V power supply for the USB 3.0 phy.
> +
>  required:
>    - compatible
>    - clocks
> @@ -227,6 +234,7 @@ allOf:
>                - samsung,exynos7870-usbdrd-phy
>                - samsung,exynos850-usbdrd-phy
>                - samsung,exynos990-usbdrd-phy
> +              - samsung,exynosautov920-usb31drd-combo-ssphy
>                - samsung,exynosautov920-usbdrd-combo-hsphy
>                - samsung,exynosautov920-usbdrd-phy
>      then:
> @@ -262,6 +270,21 @@ allOf:
>        properties:
>          dvdd075-usb20-supply: false
>          vdd18-usb20-supply: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynosautov920-usb31drd-combo-ssphy
> +    then:
> +      required:
> +        - dvdd075-usb30-supply
> +        - vdd18-usb30-supply

Why are you adding usb20 and usb30 suffixes to the supplies? These are
separate devices, so they do not have both variants at the same time.

From this device point of view, the supply is called dvdd075 or vdd18.
If you open device datasheet (not SoC datasheet), that's how it will be
called, most likely.

Best regards,
Krzysztof

