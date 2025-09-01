Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AAC1DC9B1;
	Mon,  1 Sep 2025 20:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757734; cv=none; b=nRugCuPt6yNposlBe6gwYAQHmPEr5S3zcMQrYvOW6Qd7RIa7UUefbEOpFsat6tS604ikkKGAvoERNyZ+vrsIclsGPD/3rYXEUJbL82ubaREPv2/bYwrSz8Ffyf4MJWjU1TKyjg3jmP/xLskAtI2sIolWRFDofhklySzdFKm4uO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757734; c=relaxed/simple;
	bh=3BZH0uUJXuz6io7ubXiAH/ONnYIewmwaMA9TS+0uono=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWOTkeWjHoh7vsHzBzcyheR6sk/B9wPwfCq2YBo9OecD2zO/OGcBsrMFVPWZA6N5fvTHHVJ3kAwKRlu5W2VcM5Y5xCq35YNNxpijuBXejgEVrCG6BrHqdvebvdrYZiGatK/R8lg4PuAWvwHYrXkMfQA0mGLHSGin1R4BAi7h9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJNldwou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJNldwou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92333C4CEF0;
	Mon,  1 Sep 2025 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757733;
	bh=3BZH0uUJXuz6io7ubXiAH/ONnYIewmwaMA9TS+0uono=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJNldwouDLazoESO/VLGKWy1lJLAmMwN61v5yNIha6IorVJ6x0Uo1W2ciPuGtDtZa
	 vaKC51dBvS4xPk4bUQD0B819+3dt2rEEfUeOM7tzKOLDJw4OS9M7hdXdRs2lPAuCAX
	 zbIiovzGaDmTW+8wv1LRHM/fkXv/8lEcLhXGFRf1YZhu8wXVVtccELOFm0YQaIN6ir
	 RySrXeHcq1pN2/gasphhAicd74PCSAZDwo3+NUyTttiKGQ2w8xvxU7RfHO5jOqy9vh
	 D6xh4sp18r6CZVNL7BEkpXFte4mHCer7cceFvy5c/5Y9jnOpXjWOS2Yb3dKr8PQgZH
	 9j3tlEYmiXxZA==
Date: Mon, 1 Sep 2025 15:15:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Message-ID: <175675773230.269015.13722583795481095762.robh@kernel.org>
References: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>


On Sat, 30 Aug 2025 13:32:54 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

