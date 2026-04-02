Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADE3783D0;
	Thu,  2 Apr 2026 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117514; cv=none; b=afFA3dBCdGvSMkkdQkepbVXKv9J3pkUX9hqV5Tg4Kk+i04MGjggW6NXOHtjHet/kOGJFrK6mjpgewWSc4uJXa9XW71YYSCP9W0iClTMfQDqqIh9d13eszkcDGpGq7RzX8OkfGRnPokk5AcfFUEgggOiQXo2Jhla4XLdc5zrBEi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117514; c=relaxed/simple;
	bh=at+kDrwKt+tLBgwx7ez/phBkLtYprqmLsRltROwZTwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQv0kXFAc3Rekm0PfxViMMzooJtNFsH3RWUGSqX6nyEekAaL3O62isjaA6HaR/ELIHmZjQYoEaRXCVoDy4VZ7yp2z05bqhIitcOH23mUGkwvFjF/hN6XIAHrKHjfbTO02FyPAVYUnmWJ6YtvHOBpNcMIlWft3rGjxn7CiGIt7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3ZZeSZx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3ZZeSZx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9102C2BCB3;
	Thu,  2 Apr 2026 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117512;
	bh=at+kDrwKt+tLBgwx7ez/phBkLtYprqmLsRltROwZTwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3ZZeSZxDTwO/kZDCLSJIwFB+fdFrowK0gmwFxGThvaL92zwAC6CrUVRyBpqC99TO
	 3jTEF3dWcLPe4GpOPCCLxU1VOZdcAJwkAKfXxcw2LM90aqGPl90WlI30J6CS2uuHpQ
	 e7HNF0pA/a9UCZhyRvZrA6mQE/6JKdcOIXJYBiMI7DqKKL5PV7w9qF5zioyedHDMoE
	 6ymwv4LfOqG1hLgyti2t+FwgbERlj4jzAp9oV3+28qh6s/RcbfevkTyHmRigQLc7N6
	 c59bRr2APNuRQFLL0GWKbZhpMGCaLJEbCajZS5iho2cFLLrLlbJIzB5MmMfB75nR/m
	 OkgG7d7R0eC9g==
Date: Thu, 2 Apr 2026 10:11:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Message-ID: <20260402-phenomenal-secret-squirrel-3efaf5@quoll>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>

On Thu, Apr 02, 2026 at 03:20:14AM +0100, Alexey Klimov wrote:
> Document support for a mailbox present on Exynos850-based platforms.
> The registers offsets are different from gs101 mailbox, but the
> workflow is similar, hence new compatible.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

