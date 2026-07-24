Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01553B71C7;
	Fri, 24 Jul 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882999; cv=none; b=MQStCmQpVPZ/h7wnfh4CwRvdU4SwEOkuGFD+kGai7W/9vzVRyRj5p8bWm5uHPQMtczkSZYQWZvtzmebQ76xAxOBLhlwrUdlh+OBpmWlOK8RY4GrC5TroDxUKf82dN3Vkep7ynEwEKUKiG6JWkctccpgvOXdGsy9oATNDyHNSS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882999; c=relaxed/simple;
	bh=wNs3XxtR6CRtEhJlwg/HaT60FJ7JjaIqsQFiJk51sPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2DYODCAuQOzyBzDZy7FLFsWHERm6LNmjawxw7ZaQQTxrYxxUorxOnHRC0Jw2WwOjg3ACzPdWmEwAuqlUpw3aNAM9fevwwo3magb9IQ1atf1FXCKfVgZgytraDqAdeFFPtvzOg86kEt+p5WY8Duu16T4ow0t7YFZwdFl5te0uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8wQxjKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8wQxjKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592BE1F000E9;
	Fri, 24 Jul 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882998;
	bh=TuwBCNbQhQoeK47sIaZgyMbGKs971fOOek/O6mzWfJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d8wQxjKWLLDbmpZFzcV6hY311fIyeDPqtjucw8RCKFX1d6a6vZUIOdsX7PrdN4UXi
	 I/PD+rYjTjanjMLjuoPsNMMtJ0Fnxbu6qOxN3Uj2ha6c0tm2rTLpChzjMbHZ6WMqM1
	 6LyGkCNMuV1wm6i6v1nITXYWlfv5xD6qAbi0oPzZxXjTrqC8Cx9FcPd+dBQc3Ht8ev
	 2C6n4RqXj19TF+61WQTTwy4Wv8VCpIAy8jgLJHqCdnf8mUHddxtfRN6TyVlrKbkwrJ
	 zEqeTIOWYIP1bQiR9ud5+sRvgr8OJ7UEfioUuj4OdOszbZ1jrO6csixlvgr9rNcMdw
	 YnHBP9P6VEz9Q==
Date: Fri, 24 Jul 2026 10:49:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Message-ID: <20260724-spiritual-qualified-crayfish-b65efd@quoll>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
 <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723-exynos850_sram-v2-1-c94968e52f42@linaro.org>

On Thu, Jul 23, 2026 at 04:29:46PM +0100, Alexey Klimov wrote:
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
> for ACPM communication on Samsung-based SoCs.
> 
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

