Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853247CC7F;
	Tue, 15 Sep 2026 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467166; cv=none; b=hjkEaAUSyqwWCw+7HC8oUBoGoBp0m/1OalrQ4s1FWmCuBtJ3IIBMp2y5PfizUA+X0/lXo+dCBLvKqLRyb3fJKPo1sQe+IQKAARiC/4CiVKdcJYF11s8fJO8ytByYfrxnSNjLpOf2/RrtXzsZNTFNA6udCU/1exmu8+mFp5TCRxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467166; c=relaxed/simple;
	bh=PFu7flCmADGCQBOU6MKET7NFefP/QS4WIlcfWxXu0jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH6ZpZ/FjBX18j35OrPsgtfhuc6joaWRHd67SIepYBsGScXDXyQ4wRwnhqwlNV2n+xBKW2gbUjZCCTW97P6VBrPqpkzDyxj64GQuEVeVLYwRw5GwWuwyNfBmOpudimGmBrEP7r4lr3sDdNQTSfFexQR2U8EWTb/yrfpVIjTpZ9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpPhct2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpPhct2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501551F000FF;
	Tue, 15 Sep 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467164;
	bh=A2YTvvtUAT2AgcdYYSojWmWFscG/TMLAegHPjK4gw6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpPhct2hKfAhOiCgXC8tXMwSDPZFjkzeLAMrhAFby401Tk3MYQhbXTFLU0qmFIzNH
	 n+KNK2IqxAsi2iJrP9SI4y5J4LEEJve9IYZ2822yD4rfFHMHXCDdQeNAIZFSn5Zv2H
	 oPR5yd7otns3Pcozpy/7Cwy1A8iBDkI1r6/RwQmeR0GED7K9AsEWxtFir3zLDMuk8w
	 +l8AHsX6L1ZwbSfDouqKgRW9yq52CV1fN1FvH7FH6LkrK7GkJKRYxecLM/ejYb80rj
	 FKi8sLfoK5Te6+a2CP3DbJdW9ccSJGO/RmSmEeeObVrwsBNN0pQNjMqUjBmRmpmHGv
	 gXM+HfE6JlpoA==
Date: Tue, 15 Sep 2026 12:12:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas_turner@talktalk.net, alexey.klimov@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy A21s (SM-A217F)
Message-ID: <20260915-squirrel-of-major-opportunity-ef2cff@quoll>
References: <20260913123740.203698-1-tturner@lineageos.org>
 <20260913123740.203698-3-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913123740.203698-3-tturner@lineageos.org>

On Sun, Sep 13, 2026 at 01:37:40PM +0100, Thomas Turner wrote:
> Add initial support for the Samsung Galaxy A21s (a21s) phone. It was
> launched in 2020, and it's based on the Exynos 850 SoC. It has multiple
> RAM configurations: 3GB, 4GB and 6GB.
> 
> Since our bootloader does not set up memory nodes beforehand, default to
> the 3GB variant. Custom bootloaders can be used to initialise other
> nodes per RAM configuration.
> 
> The Exynos DPU clocks required by simple-framebuffer are not kept
> enabled during boot. Add the DECON, DMA, DPP, PPMU and SSMU DPU clocks
> to the simple-framebuffer node so simpledrm maintains references to
> them. Without these clocks, the framebuffer fails to remain operational
> further into boot.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 3GB RAM
> - Buttons
> - Ramoops
> - MMC
> - USB
> - Watchdog
> 
> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> ---
> Changes in v2:
>  - Re-order properties/nodes to pass dt-check-style --mode strict

This is based on some old fork... You need to develop on current
maintainer's tree and test the same. linux-next usually works fine.

Best regards,
Krzysztof

