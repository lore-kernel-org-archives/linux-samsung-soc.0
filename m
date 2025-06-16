Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443D22E3E8;
	Mon, 16 Jun 2025 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061570; cv=none; b=olzkfWb1Cf212D6WLvdOueKQDVqUoadFWQpn+8JrFyx3bupbVHZX95vNx65llKWGEherZcwC3ct4xAnlL4vlP9KvY8T/iUTnisRcWsBAH0guW0zhE2dEKTznQIBMYM/AiyZqmuhF8NDlR48DCNBjqymtZwgo4UysXkN373EB0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061570; c=relaxed/simple;
	bh=6MEk2BlPGWOkhwr9aRQ+chOO33WvaGPh8Hj0e4+4rFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtLyfLV6Y9O4Ev0Nln7MVE7VXVhzNmU11VFPhiNZGgeTlyHyK7YLYTmDDPYISfo9dHM+TvWbxczhrePtvG1SWBlH93I6ESnj3cKAFtcWOAr5JLrlBiqW+3FY57vz0a8ZSMdmQih5oz8wfji4dTtU8iZq8nj6VsYyw4GzORlWkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMp8R6ts; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMp8R6ts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FC3C4CEEF;
	Mon, 16 Jun 2025 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061570;
	bh=6MEk2BlPGWOkhwr9aRQ+chOO33WvaGPh8Hj0e4+4rFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMp8R6tsGTt1rLEDP2Tw2IlA1XbFx0ITH0vQ9LQW5IdSXNJs5JECLTh2/rhb+Y7dY
	 RNa5sEwqrGs503u8bPIRhHg7PFkCX+LjQJy3A6YzEi3qZ2gzvD3O1ZkTu66kI6M/cB
	 KDAojqFv7FOd9V2nVummPdi6KsqPzYFlLj4dXSF5VRhHhG+gEAUbtQ8W41Obhk1X1m
	 KOuWtkOMjvmvF5MrnRzGB5b8vAYlW8/EKWUhoy6O79u+rrnd5ya+/rYiTSzhUKoK4+
	 0ETkvsvKDw1Bh/6cY5EvpEbFHC9sP4UqY136asq8mcEO5jeH4/RdOieI/iXE+AP4+G
	 Y5XftitOANYhw==
Date: Mon, 16 Jun 2025 10:12:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250616-outgoing-industrious-turaco-affe39@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
 <20250613055613.866909-2-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-2-pritam.sutar@samsung.com>

On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB HS phy found in this SoC.
> The devicetree node requires two clocks, named "phy" and "ref"
> (same as clocks required by Exynos850).
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

