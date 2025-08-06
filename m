Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F546277C8D;
	Wed,  6 Aug 2025 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523791; cv=none; b=IWF62aYgUnkj4G3PNGvKqeeEu4ImEwT6pjEbeEu9sKAyAUuMN1iAnqJpsU68XmE6b/9a8E5tldsUS7ZoesR66yNGTpGl/CXv4Oob7mmgGb/yPOrYDKlcLySTsAurEEGPcgl8gfiBwvPbyAf46II0pBf9nd3+Ofkijf+n5PUOsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523791; c=relaxed/simple;
	bh=XvKaSBjQUK3Lb4uJy6GhrqjQJdMOVbIiQ9JzMOob2KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/9D+nAbCP2WPVDdFeU5LNRUkJSp9bdig0SrEUjTs7DpNuH4ZnO0nfrfrhZxc6g/K+QzzZdl26NjLR3Di/7zfKDHq1rdl/qhckt7nMtHCY+yvNyb+p4d+g1ImXkuxIBXhjnPANmeMurjHvD58pYAXj19Ccy11GhyIfau7L2e1LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqgTzIer; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqgTzIer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDFFC4CEE7;
	Wed,  6 Aug 2025 23:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754523790;
	bh=XvKaSBjQUK3Lb4uJy6GhrqjQJdMOVbIiQ9JzMOob2KQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqgTzIerTzEYEvnC3+PF40eUaqMe6OKuvfEPihBe2N0abgzpfioGzdVfFXvFN2dvu
	 Q2iwTTnN5I6UiOYccj2rFT6D0aG7B95IA6n58G8fDp5YTn1a43yCPJ7AMt4gVTPEWz
	 Gw/zoIwOFb1RyzjoJkdUx9T1WMHQLsBH42XnP0ofm1dceoJ+XFBUfgCMxLUXtqEOm6
	 T0DQyN/pf+Qc4z46KItB9dSNv9bS+CGUrgA7g3w0/Smuv1/ruT49+ojdciQs9lpB2m
	 Ka7z2UYYgunxy/Nx9yDk/yIFz/7W1EI+PPiL6zNoT8kB3oQkfVAocqeeICLIqlN7b4
	 Xup7U5VzQN6Wg==
Date: Wed, 6 Aug 2025 18:43:09 -0500
From: Rob Herring <robh@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Message-ID: <20250806234309.GA2032999-robh@kernel.org>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114320epcas5p3968288f8d01944d3d730b3094a7befe4@epcas5p3.samsung.com>
 <20250805115216.3798121-6-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805115216.3798121-6-pritam.sutar@samsung.com>

On Tue, Aug 05, 2025 at 05:22:15PM +0530, Pritam Manohar Sutar wrote:
> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
> "phy" and "ref". The required supplies for USB3.1 are named as
> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
> 
> Add schemas for combo ssphy found on this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
> index 4a84b5405cd2..7a71cff10fb5 100644
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
> @@ -258,6 +266,17 @@ allOf:
>          - vdd18-usb20-supply
>          - vdd33-usb20-supply
>  
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

Similar issue here.
