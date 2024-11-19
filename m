Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4A1CC8AB;
	Tue, 19 Nov 2024 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027717; cv=none; b=q5WyeM6caNFMvIFDfRggAoLc0lkNCozvhNg7856xfnhJl2xYnFnaxk62JHRer4pEO2XHmm6zTEz0/x485aZ6mSuf2iklg9ihWzlTHJUJPNBuf0PdxSaGdaOvpPJ1mTXx1KjprJjgWU/F6K2f89xtaf9bDsuKSao5xFQ88M7Qhr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027717; c=relaxed/simple;
	bh=DaEi8UO26z5ignH1PEJ3LNN/E8nGWO1/gOyys3l7KTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYVOGpRsw/zegHt3QxufhY7K9hQabSvHuPKQkkfCJG+khcIEhcf832+gubt15ceLIVILng8v/sORdQgAI1WUQRYWtJKGNm4NMxP8y7Jr1ZYM2PaNupO3tdFJL6kF2BmXaIOgU/N0bWit7tXVU3tB6TYtXDUr6uk8pEc9+JD4ZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWdlVinf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWdlVinf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9881AC4CED2;
	Tue, 19 Nov 2024 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732027716;
	bh=DaEi8UO26z5ignH1PEJ3LNN/E8nGWO1/gOyys3l7KTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWdlVinfVMv6wD026au4cvMZkWhlNayip6cTvjlLRhDwrIghUHG9tEC3c+a6LGLUa
	 o3/g3oywbU+ItcrYOLxHPuLup2dSNb/7xSuOCAKwAdnkpnYEfOMXtjtefDqDEunm6B
	 kUfksj67Fx4DmbKxHP5a6FS81oXuK3+hlv0BxCLjJUi7hwekAS+OOQcI8wEOZOp5rR
	 dA4p/+GCQQtR3k/RlmHAncNbgdWuhsRQVV8p+OioIs0g/n+2a/MbuBTexgJaGrlwg/
	 voiuVm51LFZZBJh8Vf8ABu5m/KYkSsbhw7almXrEICFEFtkeSwYkJtNrEiW0mYPKCY
	 NtP4QfYxwweYQ==
Date: Tue, 19 Nov 2024 08:48:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sota4Ever <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy S20 FE (SM-G780F)
Message-ID: <173202771422.1534150.8231777309282960542.robh@kernel.org>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
 <20241114143636.374-2-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114143636.374-2-wachiturroxd150@gmail.com>


On Thu, 14 Nov 2024 14:36:35 +0000, Sota4Ever wrote:
> From: Denzeel Oliva <wachiturroxd150@gmail.com>
> 
> Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
> based on the Samsung Exynos990 SoC.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

