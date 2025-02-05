Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE560131E2D;
	Wed,  5 Feb 2025 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745676; cv=none; b=jrgPAYIV+SnS/lWCTq4IooyrGSKT5h4/OJLfmgupBVjzwKnxErAkk9UKEX5/n0XkP393RTF8DYIWzeTY/ScTZCP5PBZWnQOpUUnlHxbTw1fAm3+x0iHeqXcozLzTX2r8nsrK97KJqN2Xiv+YX4qL2RpVdNNaq0m4EQrik0dYW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745676; c=relaxed/simple;
	bh=jDRflpWn/eNSVYWYsmChMhlBoAx8KSfDOFOxrHxoKr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkFov3b84vd4YyUxiI9vhtM0TZ12FKutrUBgjVM0pZYOS9DUCV5VJ+6Gp6p7eCfGSSU+LQK+cCyLjke96ngPVBcdD9m0+WyKQjDmTT7czZ8G8IzGyM7h407Zxbfjpyeu6lK1bn1192vVcIVWQ2OcxJ4ozRwgGdMTLUq+R3j47tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tc/UMR2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tc/UMR2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CAAC4CED1;
	Wed,  5 Feb 2025 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745676;
	bh=jDRflpWn/eNSVYWYsmChMhlBoAx8KSfDOFOxrHxoKr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tc/UMR2FRlTFRyVgYY9afrZYTS+LM9UgZhIPbWvhBkEdq50RpckoDoMsFG2Maj+Xp
	 xQpnREgSJgAJk6owZFc7RIUFxYZ6XMGaK9ikVr3V+GX3rZRNnwawmNQrqGuwf72pp2
	 FOLNnxXK33Mvs4CknqYG6GDUWaczasrSd10uY4pX2DcgewkSsezuzgfbwjwSZ6JxKr
	 CHMWtN/jjvrIQHZtZe+pSujeJtrETJ2gvLolt/b7+RxL524dZ1Xd395O97XC6+Xvg/
	 KuHpmUxhJX3odtIxR7SFQCK6xzWD/0CHny2bDFC0FQ42H/8Kpbl6QE0kQolyHb+DGP
	 3KJ4U6pgJpb0w==
Date: Wed, 5 Feb 2025 09:54:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Message-ID: <20250205-sturdy-emerald-gaur-953deb@krzk-bin>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>

On Tue, Feb 04, 2025 at 02:10:14AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
> documentation. The devicetree node requires two clocks, named "phy" and
> "ref" (same as clocks required by Exynos5).
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

