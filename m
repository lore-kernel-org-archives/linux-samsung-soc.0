Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DD1EB9E3;
	Mon, 15 Sep 2025 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944041; cv=none; b=kZAL8V9H0ZaxAPa/Rzleej3R4EQpWIDa8R/eu5waxTuu4MeQ0y7zd2pgs33FoVVJKkjucHvgZ2E/SbmZiapswx33BrDWeKmvKOCu7UAovduOfMp/UH5QzM0hybI4OM2MxI3T9C4COBEAx3NwGCfDRHQsC2c+h0ZG5BlxaYKZ0+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944041; c=relaxed/simple;
	bh=9AViTU5RWD1JwxYeTPUfmvXGdgLMSJvWywCAquChztA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9kxu1+PGQICMASd3rSyT2J7NmVMHQXEIUlKx5q0U+1KG+ZQ0j41dF55yVTL+amVd6Gsz4wNHf2QKmZic1gQh20NLEzQByxWdfsNFAcGv8ZuUiODpz2rCN0ShMhpHfoSYaDXNjGSG1Hg/Zt0jBvMX6zWN9+nqk/xD6LisISW3ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5KAfDUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5KAfDUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E81C4CEF1;
	Mon, 15 Sep 2025 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944041;
	bh=9AViTU5RWD1JwxYeTPUfmvXGdgLMSJvWywCAquChztA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5KAfDUWhWUxaEyqapMF5Cz0bLydBIAIluRn/zrIwSrGO1+Nw2U2GPTXJpThhAbsF
	 5BHDeWxydPDVX8GJXKoczVtLV8Z0SCcUJIq2BYyKb8RV8l7YJraFEEkHBr60QEVwfs
	 QEj5vpwKS1xQdprghKyJdFRKFYhiWQB8iMtPiBRpqL8BFftY7iTcpzcBIRSsQpHuPG
	 9fZV7vcTJMQYwqqSoWRjP1lj0ChhmWq9R7n06kNkN5C2MOi39lvAwJeb30zYPMERy9
	 m9lXC5JFhJLdfx7HOFWt5uOjSqBUuWTAqcH6ZsvLf7O8bLz67kO74aGLa3tlsQMnjO
	 hHSKzNGq2hU0Q==
Date: Mon, 15 Sep 2025 08:47:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandru Chimac <alexchimac@protonmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: soc: exynos-sysreg: Add Exynos9610
 SYSREG bindings
Message-ID: <175794403920.2666251.4158627694069114504.robh@kernel.org>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
 <20250915-exynos9610-clocks-v1-5-3f615022b178@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-exynos9610-clocks-v1-5-3f615022b178@chimac.ro>


On Sun, 14 Sep 2025 21:20:09 +0000, Alexandru Chimac wrote:
> Add bindings for SYSREG nodes, compatible with the standard syscon
> driver.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  .../bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

