Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD813698E;
	Mon, 11 Nov 2024 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731358246; cv=none; b=uvyjoarwVVjPGsIyDVznalvcqB5DfE/klR/d2rEXqY1p8SUBqEw1PdPend+DS7tnlL2/OrHTgVPtYxAl0gbHhElMofShTpgeiwfFy37LYrNVIre55LXU034h9X22D9zXTMZJcYJn1I3AG7npYPEOleR1A7UXnSTqyR5xKbT+kaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731358246; c=relaxed/simple;
	bh=KpxZC/P8ao2LzdInQZVMA84c4VfSpNvVV342XvO09Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7f8ManlHyCjzvTpzg+9pMIHnexoh6hcS7RgdxlUFKpLGrhzD4O1DbrG2qQT+ln5bvYeVR7ybF30ptVtqtlVO6A7x4FxE7DPGYheuxyXFCCkA4tkFJTUgpLE1CAVU/t9uH/A/eVCV5Up0SMdK0eSvLY5k3IO3QTawyfAvSljh8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNTqKvzj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNTqKvzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C606C4CED4;
	Mon, 11 Nov 2024 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731358245;
	bh=KpxZC/P8ao2LzdInQZVMA84c4VfSpNvVV342XvO09Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNTqKvzjrtuTP8+YPJU/gM5ZMXFSB0RpgVNc2aPCauXheFcYN7+dflGoAJShq5FHM
	 1nErK+6N/co0TEckyf3XdLAvuDx+KWX5Oj3VB2WWDLD7DmzxcC8ebeIL92NNu/r8r7
	 zYJXLSv+ZbJdDlXDT2BHPr+4+xjg47UJ+cmXL/B+Fn2lu0Bw6mUtIFT++DlnhYaU+2
	 538KYmb4sd+X/qZnm26LCEJTCZn2A51M5rfdI5dbTzACj2VY4X8lrS9hblJPgS8dU2
	 Y9SV96l1/twH2Q3a0R2n2NCealTiwk3P5ZCKsErKKPj+1eutqGyxqCoOfavqcpTTqQ
	 ve2DEMzRI8dIw==
Date: Mon, 11 Nov 2024 14:50:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sowon Na <sowon.na@samsung.com>
Cc: kishon@kernel.org, alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, krzk+dt@kernel.org,
	vkoul@kernel.org, linux-kernel@vger.kernel.org, krzk@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Message-ID: <173135823464.1934645.11982879743240085874.robh@kernel.org>
References: <20241111043306.1250488-1-sowon.na@samsung.com>
 <CGME20241111043317epcas2p48ebdc4c0219c1a4bf7c0a44873c5a98e@epcas2p4.samsung.com>
 <20241111043306.1250488-2-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111043306.1250488-2-sowon.na@samsung.com>


On Mon, 11 Nov 2024 13:33:00 +0900, Sowon Na wrote:
> Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
>  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



