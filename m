Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3032215530C;
	Sun, 24 Aug 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756025238; cv=none; b=oTJQOK/dDPhBhZ+v9f0QdltyDxK6akPOsTsbd8ZFM1/mM2mt6GoHhFeJuEql8VvD71EXfXMxxvfCEfbStfRvLCeA3xhcEfrVqu1tfu3mUaDI9o9ekRSduanoP2KZHROImE9zKpdAHVjZUcdM626rNg/OfrNV1bxUaUlu5bJ+lOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756025238; c=relaxed/simple;
	bh=8SpFJtgIL6w/2FAMyvt1dybDDF3Ptssrpv3lA6j0/pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+TvTgvM3sUIfbcblovRHetQhlOBGOefaE0va/2RcokM1bsOch2Ogw1c28S6Jka8ChWTCZovb7szTVdYDQasaQzGbWGN7DdK0wXfbAkAh58A5azeeQWe1p9yVUahVxEBnqbM6UQXIyUH1ZuPDIdg3NvhRUqNRnoO5J3xYIhUEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVbVRWmY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVbVRWmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A63C4CEEB;
	Sun, 24 Aug 2025 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756025236;
	bh=8SpFJtgIL6w/2FAMyvt1dybDDF3Ptssrpv3lA6j0/pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVbVRWmYjffMzkM2Tn8yjdKVNjoYQwoT+ItD9JzikzGjlTmRrxVICMOi+/qhD5Cba
	 TLVo/ma3qleuaH5wdQ/xdjD8b5CEW5hf7+kwXlSjPVMiIB/4sGHuCZMaD45FZ+sCYZ
	 GSC8cJXlPPd5b9ExYZskzJ4Ws6QylCvAM+3XA5LY5BLSiNFbW2FEpxzPzqTDrqba/8
	 UldSRRq7Ow0RQtAEDIFlVfhw/G+dERmSRbP/Fqm+ov1PhVFnpHbu4Kbc7z6Bq6Nszi
	 yXW71S/OPbi1xjmLcKUw3DrU1JacEbKCWs7SFChjcNh01qVNaT10Y14Tx3mNsasiR8
	 PMxvu3Yk5PCpg==
Date: Sun, 24 Aug 2025 10:47:14 +0200
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
Subject: Re: [PATCH v7 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Message-ID: <20250824-hopping-asp-of-painting-fbbfc2@kuoka>
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5@epcas5p1.samsung.com>
 <20250822093845.1179395-4-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822093845.1179395-4-pritam.sutar@samsung.com>

On Fri, Aug 22, 2025 at 03:08:42PM +0530, Pritam Manohar Sutar wrote:
> This phy only supports USB2.0 HS(480Mbps), FS(12Mbps) and
> LS(1.5Mbps) data rates. It requires two clocks, named as "phy" and "ref".
> The required supplies for this phy, named as vdd075_usb20(0.75v),
> vdd18_usb20(1.8v), vdd33_usb20(3.3v).
> 
> Add schema for combo hsphy found on this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

