Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD223EAAD;
	Mon, 13 Apr 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118278; cv=none; b=bUfOgyvkHPneZhn3+sa1wWAiNrMXJPlqmZ/Kcjn6itGUKGtmOP6wMBRuUFxn6kchY1zreZPB8bFwqL932QyCwMB18X4mId9bgrgV/6Y36sWxQOZyIR67rzGNfyhw0kt3eDwI1iftwG6FMxUrRTumpjn1ryNNSJmSOoNR3Qi1uRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118278; c=relaxed/simple;
	bh=Zzqk2At/3hnsyIprEjIPNKdLQs1jH9hnpq4HpbuOPKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRC+48EkZKujk56MjYapJWheX4y0hi+SiTd92VsfP2eU5uGS8oqskPgBcY6Os/Iz0IXdhC5ds6Gj+lDZ5TgA45KVA9nB+X3TV/flKDdi1tUFeUUw4Xym8NYabknBNjwaFuLR2IUyKfUDnN3vbzbPgEL+Rvuvsn9bZlpKavuFXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZZKq6p8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZZKq6p8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E007EC2BCAF;
	Mon, 13 Apr 2026 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776118278;
	bh=Zzqk2At/3hnsyIprEjIPNKdLQs1jH9hnpq4HpbuOPKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZZKq6p8jWxdY2fbSMpHrbr6TWp3fJ9tuIBH9pAnQprZZ4T3iybx7MeUCEcn2hrjF
	 XccnQLUKj5ck3nLJ6ZKAEvpwtXYqpWIIbhtTAy0/AKUkqGGKYMJsYvRF78oIjBZDyL
	 O/cbb4/7ND21I7Wx0sb1fnKqo5VmF2wtSWKBv4gGzTfkcM8U3lmxdnRMFSQwRhFE2G
	 GVcocdQkXI/NrGx53XxKQ06XaifHLJ/A5Z8ZaXI32MGx6mTuUQgG5+F9nAoGaf8WqD
	 g35rh2dAvP3KWZ66J/JVdW0ly3s21f9lrZkrpkpi7DOiw7pA+h08ULwEy9RbfhGD/7
	 q4j3X7mVTqMkQ==
Date: Mon, 13 Apr 2026 17:11:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sam Protsenko <semen.protsenko@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: soc: move,rename
 google,gs101-pmu-intr-gen and add exynos850
Message-ID: <177611827492.3624314.2235321083489065615.robh@kernel.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-1-c5a760a3e259@linaro.org>


On Wed, 01 Apr 2026 05:51:54 +0100, Alexey Klimov wrote:
> The PMU interrupt generation block introduced for the Google GS101 is
> actually a standard Samsung Exynos IP block found in older SoCs, such
> as the Exynos850, and is not exclusive to Google SoCs. To accurately
> reflect its origin, move the schema file to under soc/samsung/
> directory and rename it.
> Concurrently, add the new "samsung,exynos850-pmu-intr-gen" compatible
> string to the bindings. Support for this block is required to enable
> power management features like CPU hotplug and idle states on Exynos850
> platforms.
> Also, move this file under Exynos850 SoC in MAINTAINERS entry.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../samsung,exynos850-pmu-intr-gen.yaml}                          | 8 +++++---
>  MAINTAINERS                                                       | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

