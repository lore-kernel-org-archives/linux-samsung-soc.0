Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B748B1BA872;
	Tue,  2 Jul 2024 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927370; cv=none; b=NkqFnfDG286P9EZ+hp9PU8VlWD3jwmbYKM1if8Gzps+cFnbwrfUVXYD33Uy1r+ZpGlnYdRCVtQFnZ1ggU0FeQZp04bJejACh+w3HUE5Cko5SwuvFza1VyavsVyT61Ut2kbl+M9cEtVqblM4URgFhpeMxB0jLWYi5Xf7UwYUlmPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927370; c=relaxed/simple;
	bh=VuDI2hz715w7JDtFUBg0Dn7GnvH1/Of0l9YjzbCusP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sR3on6fhCGh9LStgzpuNaNsJRuZgvibFHRbdccM+UEHLAzy0RHwvQcF6q4hkBUtgcObb/x1dhxavBL0cVeZ4vPEbJfIlGiJdibiZuWZk0SXtTon3a1zRRV91ZIH5lsYnlbjmGoG+vo82uzUb0lt+uMzA9EXLSO1CdjqhkBLfcXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTfUMNNp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTfUMNNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB15C2BD10;
	Tue,  2 Jul 2024 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927370;
	bh=VuDI2hz715w7JDtFUBg0Dn7GnvH1/Of0l9YjzbCusP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VTfUMNNpsm7Sr0ZVhuMbNNlyO1GyhXsZIgc5pWE3kpy0VB3ZpLoe0fuVL+6r75Etb
	 A3KB06yHedGCfmoj1Nv1YYwB3Gn0L/18QkcBlhahh5n/Rlem8P/TffEzw6aG19qU06
	 apiA05dc0tTuE5C1yvWRRwe2HiVfmtlRjlVkYou+rzJaw/81EITWg1Hy/jI5yUezTi
	 L+XEXxPm26JFZb0qNo4ZqXvRrKR72wUrSTSwZCBzjjja3Zk2P2iZp1IazleGD2wVA4
	 YWKNm1Ce8JSqmQc1HOPv0RwJ3fE3HIu6LoBpra358IGdRKBI+Rl1sbpWAmgKcZKykW
	 aWTZKiFy48+Hw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
Subject: Re: [PATCH v3 0/6] USB31DRD phy support for Google Tensor gs101
 (HS & SS)
Message-Id: <171992736365.699169.8645962740649153976.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:06:03 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Mon, 17 Jun 2024 17:44:41 +0100, André Draszik wrote:
> This patch series adds support for the Exynos USB 3.1 DRD combo phy, as
> found in Exynos 9 SoCs like Google GS101. It supports USB SS, HS and
> DisplayPort, but DisplayPort is out of scope for this series.
> 
> In terms of UTMI+, this is very similar to the existing Exynos850
> support in this driver. The difference is that it supports both UTMI+
> (HS) and PIPE3 (SS). Firstly, there are some preparatory patches to convert
> this driver to using the clk_bulk and regulator_bulk APIs to simplify
> addition, while the bulk of the changes is around the SS part.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
      commit: e340c041b7a4c0321bfe2cb54817837c9040c739
[2/6] phy: exynos5-usbdrd: support isolating HS and SS ports independently
      commit: bbb28a1d733a94330f5778b4cd0dbccf6c34597d
[3/6] phy: exynos5-usbdrd: convert core clocks to clk_bulk
      commit: 54290bd9811ecdd82c19b96093e2c78325f59574
[4/6] phy: exynos5-usbdrd: convert (phy) register access clock to clk_bulk
      commit: 26ba3261215b44d466bd2093daf3796031c09c0a
[5/6] phy: exynos5-usbdrd: convert Vbus supplies to regulator_bulk
      commit: 497ddafe915e8d9fb4d11542d16a1ff95a3e8034
[6/6] phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)
      commit: 32267c29bc7d5c9654b71e4f354064217a5fb053

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

