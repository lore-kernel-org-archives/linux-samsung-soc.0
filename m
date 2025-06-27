Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04ED2264A3;
	Fri, 27 Jun 2025 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010656; cv=none; b=jZoZyJoliQCwKxK1jHl1BZLJqqkk+wWruIR8GM6kQ5SCfsli2NDu8eFzm4E59HybC3u3c5k+evVdIvym2zeSXW7n4+ghDXLeUBfK4YcFg9UcMgvdbv2784fTNbyH3TB5z9IUNobsgpAI53H7bb3JVWPa31pAPN1eRU8sTTMuL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010656; c=relaxed/simple;
	bh=JbS8tm4sqaGviJ8DSlzmMGTIfieonXmx71aSWeZoU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8bCojuhPky9m9wHTcN3epizlhpOWT+/jPka7ltd4bPOfPtml7ncMPGzlOyLv6gE2a7PW1F/7NFHMUUBBA9E1YfeiBtzATpLz6diWX8nz9zo1Z/4dzNsuGLs789Nyf/CeTT3n79en7nm52v6d6W/Sjbf5sJATkD74vaprvvxH5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeJ/n1qq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeJ/n1qq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD34FC4CEEB;
	Fri, 27 Jun 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751010656;
	bh=JbS8tm4sqaGviJ8DSlzmMGTIfieonXmx71aSWeZoU2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeJ/n1qq3ZXWmrji1Fxkf4lxd7vQMVfta7pftk2AhMp0U/5OPSsmOlI/rtbbTfOEw
	 Dol/fq67fZUX0i2v3/q7nFlOTOLqSvaAPSWGA5SjPTqjVETnHyv/qs3KEUdnGfnsvh
	 skZkDQjlO4JD80YWV332VoFwQ13PB20Eu8WASTxpZI6L4VaPC0WKxhbLtA9WsYZ1Y3
	 PAwN1EERW1oBTFy9AXcpR+jcmUpCaa6vmyIAS+qpyGKDJ8chmUj596vFhVM0MNJ7jC
	 c/akt9A4lsLu1cwYJDTlrV/jwXz1KsWABx3G5YG8wKJQaUmmH3Dyj+2clEL95Mw0s8
	 kQw0PlxoHltFQ==
Date: Fri, 27 Jun 2025 09:50:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>

On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>  
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.

You need to list and describe the ports.

Best regards,
Krzysztof

