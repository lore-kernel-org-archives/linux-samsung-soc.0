Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9221614F70;
	Sun, 24 Aug 2025 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025176; cv=none; b=qLEUU8fiiljZOEp11vkKWdfKoIz1inJk4aWnV1PSPFCRQuQjnWj4pnxyE0jR2iTUWOAfNIGTANUOXgZzSYpUFXhyjslNeUgq8KGLaNPexZRJYVNWhLWL/+RlRHpfPKAUqH9WuDec+gdLHxI0yUH47T9afSjs6dTUE4030yp1zEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025176; c=relaxed/simple;
	bh=alXxqMcedaDj3l176SPehI3aJia5mng2LYO8cttSggQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuV2pMkGRZOg6RK+ljotrzfsaXA3ry84qXklzM2Qlkhw7+UCPYXCCDXCfmjuwpyVp+pzrtOzL/zFStNm3/UikI35iK3jQ+fy14PFB5pnocL8kOBhh2fw0wNg5IVIc2OkQx534GrJ07n6W11xCGeGDdxdb87XuL/i4WpK2sn6b2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Atp+nQ92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Atp+nQ92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00A7C4CEEB;
	Sun, 24 Aug 2025 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756025176;
	bh=alXxqMcedaDj3l176SPehI3aJia5mng2LYO8cttSggQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Atp+nQ92EhnFQoDX3pPs0POvqLEIX11b1fFTeD5HV/jF8hMgxbC93DMFnskXIShO6
	 Z/TOyYQuneK0Dhy/yjEBW+Th/wzONrxUSVIxDN5boL2tUkJXM2F9Hgb5HwI8sV2bw5
	 dhv2zNDrm9HTptytQ0eXwxhE6rLuBiP5CSvSMiDQWALXiYUAmAxDXboiaVP/L6EJGq
	 Wb011LjuD3lwfnBlTHlYDAJgzlX0QGJP3pjvnEiDbSuH2e0H5gjJ2DSQhjsrUpt6PQ
	 rF8pqVthgx3mdgEst0Hb31A7HoT2F3xpn9WfffDocT0LWPPKfscEVg4z3JMjzJoqfF
	 PSPDBSccoocuw==
Date: Sun, 24 Aug 2025 10:46:13 +0200
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
Subject: Re: [PATCH v7 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250824-mustang-of-glorious-sufficiency-b55bf4@kuoka>
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093008epcas5p218f9f9a5381a716b5b8e0c4b23e4b3bf@epcas5p2.samsung.com>
 <20250822093845.1179395-2-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822093845.1179395-2-pritam.sutar@samsung.com>

On Fri, Aug 22, 2025 at 03:08:40PM +0530, Pritam Manohar Sutar wrote:
>          reg-names:
>            maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynosautov920-usbdrd-phy
> +    then:
> +      required:
> +        - dvdd075-usb20-supply
> +        - vdd18-usb20-supply
> +        - vdd33-usb20-supply

These if:then:else soon will become unmanageable, but I guess we can
worry and fix it later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

