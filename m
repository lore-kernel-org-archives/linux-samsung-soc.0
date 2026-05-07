Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67CE40DFD3;
	Thu,  7 May 2026 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778176914; cv=none; b=FSq8L90V64rXK3mxgKSnjS+BadgwLL0NIn8PmlI7++TnYaR3lBUB/w17mDdVpZEsd3j8HLc0+lMt4ARz3x2/xFbmfgPjgw7R+/LS7bQ5owi5Og1L9Mw2OtdNAqPN6OHFqwC+5PKPn7PUHeNasOuSZzb/X8eNdoyubTFHDbCXvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778176914; c=relaxed/simple;
	bh=J3dtbGZQFQZuIYIfKBeMMs8pVLnSGZmKJs6jXEj3ulU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omSQ75CBqUgOrRWMbdU0p6hJPNg700lhNbicyu3Eo41gwUK+Iiy519OwV65jyMVft+hoSidwqViKnQ/o40IH/mwC7bn1R8S8Mls4wxocZdDZkOeaQh1ER1tlhyidOMi5ax/qxf4lbs+8b+1D+iQ8n0c0EfYf1PibCoh3z5MEybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaO1Yiba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaO1Yiba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401A4C2BCB2;
	Thu,  7 May 2026 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778176914;
	bh=J3dtbGZQFQZuIYIfKBeMMs8pVLnSGZmKJs6jXEj3ulU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaO1YibaiY+IyJqY51nSLyVcd4rpmDFMD6bcmePzPwcue8MXbSCkUm7RZ5P5PxLjF
	 12qLQTmRAK0WuY15ZVTEbFhCQrsui6VNRlJImcR21p9wxvLxR/2RLI6yICGEU63a8U
	 3n2tQS5b6stI2hFdOwrhEv87G7rHqOU9oekfyVbzCO+oxVm5f7CSd4VAsU3uNoIx2e
	 EDgP3Cp76E7YQpYVSBcC8aBEFcU13rjMTsh1lQ/BKzUT8aQcaPy+791hMUEq+cxxnZ
	 Pi9O3IWWPHZTG47bl8Xl+mobT/nfRVjuKB26Osxy2cqXVoHLBno6C9UPlCCQtiP6VQ
	 REqFkX5ig2dgA==
Date: Thu, 7 May 2026 13:01:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Message-ID: <177817691083.2170439.4110317447956750153.robh@kernel.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
 <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>


On Thu, 30 Apr 2026 02:56:52 +0100, Alexey Klimov wrote:
> Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
> property for the 'samsung,exynos850-pmu' compatible so the driver can
> obtain the necessary syscon regmap.
> 
> The Exynos850 PMU relies on a separate system controller block to handle
> interrupts generation, similar to the hardware design of the GS101
> SoC. To ensure the hardware is correctly described, this syscon phandle
> must be explicitly provided.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

