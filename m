Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9482046B6;
	Fri, 21 Feb 2025 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130749; cv=none; b=K37evrlB2oY03iiNbDb2jCQ0797LGTLU70WutTdBFXShN2uKg15oQJaHl7FMKQk5WJfY5DdQyokY15f2/dAvXYn++Tq67r9uvRzUeXC1VqXl7Zj5SRzuIiorQN7bJlTrieuYBvFCRnu8tgd0PGo4O287xHJH61zCQ/DJxFR6avk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130749; c=relaxed/simple;
	bh=7iSC6jX/BBYZhH5CaMvHMaDMArGW/YNl+vqAADY7Ryo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUfUFALNz7pk5urY/S82cguHPGIfd0+c+4Fy13QdPm+rdds/ibR+UxvENAPZd5LOpxvKJz60cjoVlGJl/EzARlXUQHUsCuOGNpB4fJGtVfp6iMICTjl5BSh5o1zy8xjJs2WxnNxMInWhI/9W8bmzR9bPFHM6ruQBI5lG1V0olGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPYUgpNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPYUgpNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41675C4CED6;
	Fri, 21 Feb 2025 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740130748;
	bh=7iSC6jX/BBYZhH5CaMvHMaDMArGW/YNl+vqAADY7Ryo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPYUgpNUY6pSswlFIBr7Sc7Jt7au5PvMrBxeQRljl90tC9FK685BZQaXbYqm8lk0+
	 G05lEdamwdcfC9P5awa+51GjhhSHmY5kXPfyE++ev9CVcuFS91FVc6qGCzCtw3u3kq
	 DVXcvlbu8SPq0RLTGPnamPS8F5eywE0BT1MDl/i+kl0R6iNZr3AuNuR0oeTj0jI+dC
	 BgQNxQTQy2dbIXAPv6HNdxmsQ9XCZZc9qtq1I+BK/XQ/bASOz+9DMrv4jl/SFc19Pc
	 ku+synFWgrAeQQGcAmJcnkYIY4sL2hmx+/UemrDn4BdzT6i7/gaPHczw5Kj9hGSYBd
	 4pTbZdSAlFJdQ==
Date: Fri, 21 Feb 2025 10:39:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/7] soc: samsung: exynos-chipid: add support for
 exynos7870
Message-ID: <20250221-stimulating-sophisticated-armadillo-0a72bb@krzk-bin>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
 <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-v3-3-e384fb610cad@disroot.org>

On Wed, Feb 19, 2025 at 12:33:13AM +0530, Kaustabh Chakraborty wrote:
> Add the product ID of Exynos7870 (S5E7870) to the existing list.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 1 +
>  1 file changed, 1 insertion(+)
> 

This does not apply anymore - conflict. Please rebase and resend.

Best regards,
Krzysztof

