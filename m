Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1C729B211;
	Fri, 11 Apr 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373449; cv=none; b=YPn5VGpL7NseUfdgTBePYy7OzOVvM2ABaeEyaqq/TXnTsDlMVIeKFjkvwBXCU1oEiFfwNGIn/ETcts8PXN4m7Ne+E0QuYeZtQhUDYNebG6yINTVkvxPyXxKqXeIRVkQimDDIXGcAXO2ru1f/R6UuCOaZnT6aXvPxBYF0Nn96ZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373449; c=relaxed/simple;
	bh=8UJVV5Fz36IAbJkObz0XEdemXb50xF/yasXI52r/U+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oOglx+rk33V5D1dm4GLEWaEzIVl9obcu7jVlWdc06PUbLpuNnOfMoRNhMZXqEfaIUNT+UawtwyAasm2uTaeZ+kKZtgyoIKfpIJaI411zBC+9Lk5yNvkdhf6xtRag5cR5UYZz44gADe0kEFFHF4nxniEwX9wcr2o3t7i641FOU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qv/HC1U2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qv/HC1U2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BC1C4CEE7;
	Fri, 11 Apr 2025 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373449;
	bh=8UJVV5Fz36IAbJkObz0XEdemXb50xF/yasXI52r/U+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qv/HC1U2J3/8PruNyRpxqmcsFlDP346pGbsOn5Nv6QihFVAc/z2r8jgYlms10gjh0
	 x13ETk9epDlXd8BPCMPVVp160/0jhtnGlkZ0xXb8CrT8itRxWomLXut6ciIzjxCGFF
	 g8vdp9zF/kI6UrFR/PGCQ9XJZyBe+W80SjluYpXg1BiN6FYhO8Tq98MZJ6k7laioUw
	 EOLjtkI5Yndn/C7iiz8DUbyEyn47+D/75QOkGfYP5FnC2eNU9y18roqf7VYflORUVl
	 N9v4+B5AVNWgEi7lDn43yTW2Zxo90AZmQNt3N7fY4ANL0bXiTvYUKNWAo2EkFTAxUC
	 YZEeMQABE0aYw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
References: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
Subject: Re: [PATCH RESEND v2 0/3] Introduce USBDRD-PHY support for
 Exynos7870 SoC
Message-Id: <174437344510.673939.9919903469471924069.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Apr 2025 14:01:11 +0530, Kaustabh Chakraborty wrote:
> Apart from introducing driver support and documentation, this patch series
> also introduces a masking fix and non-functional changes.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> 

Applied, thanks!

[1/3] phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers
      commit: 9b6662a0f715b3f43b42c3aadf32fa6ffaa8890c
[2/3] dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
      commit: 23f793850e9ee7390584c0809f085d6c88de7d3f
[3/3] phy: exynos5-usbdrd: add exynos7870 USBDRD support
      commit: 588d5d20ca8defa5ba5d1b536ff3695f6ab7aa87

Best regards,
-- 
~Vinod


