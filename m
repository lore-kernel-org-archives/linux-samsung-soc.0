Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01CC14A8B;
	Fri, 31 Oct 2025 00:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761871055; cv=none; b=Q5WwlY7JCjV2O4qbMMh/ferppqljBEgTSfDV2L3CNfxIcg4IRoBiuNTmwFLBu3A9JVCSXT2WD2KU2EGRBj4/yi4lw1oi+haEdivcYlBEvr94mL9sN2nThLBBzn7F7Euz6uQuBlioDhlKOBcomU/iVYmFljB2xP5IAfYHF2qDyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761871055; c=relaxed/simple;
	bh=UJ698Jno07nR5XfDleZ0Qe9g5aAp4wc2xXQE8LuHlcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvOES6vSxPipa1wTbnNG0bvdb248v8v/5EzmjiHqvyyDcRpcDLSFKsbGAbzkVlvgW8FikUNtqkauGOnxqQRrxQgHAiT9Bhau+V3sDAOsrbWV7xowEvVLws/vTYVGxpGlFIrZ+5N+azEDOlyWL62n+9lm6BFflm4BR1RdzNvYeeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5fEdDxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5fEdDxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AFCC4CEF1;
	Fri, 31 Oct 2025 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761871055;
	bh=UJ698Jno07nR5XfDleZ0Qe9g5aAp4wc2xXQE8LuHlcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5fEdDxB627FZa/t8gM3Jz4LMui6/DhRxHay44Mqwc48NACf7ALmGzkGTlJzd+V7A
	 2EOr2EFFRGpJ/FTFId+4h0uMHQWzkPgWBY16YIKA2dsjuDOBcYq5xCrda9auLmoTpi
	 WKf98O3ORGsxYXShG/zX5gENvborpM+84Irk1joA8MRJfGMroq87lWRvJ79mmDiWA8
	 9BuoP8J4ULoqQeK452oqhEXL7CgxvkQRJnOPFukvxr8TsipvTUDvj+n5g3lmkxTL3K
	 5w7yMA/k/iuZ42Ckp6B9F/xchG0k8YWIFnR7YFDk9CClzymjFfPI8Y3tjhdLdRc3av
	 Jc6nMOTcWqipA==
Date: Thu, 30 Oct 2025 19:37:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu: allow
 mipi-phy subnode for Exynos7870 PMU
Message-ID: <176187105276.535345.11626627128189629348.robh@kernel.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>


On Fri, 31 Oct 2025 00:50:15 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
> compatible to the list of nodes which allow a MIPI PHY driver.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

