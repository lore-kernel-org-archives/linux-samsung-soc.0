Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8FB285069;
	Thu,  4 Sep 2025 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968498; cv=none; b=C2Dediy7u2R6KsMeorhoTatBEBJEJ4LL75AyHx9B5Qe8OcVUjeHcU9PGwA1z5TfSL6SDoZ1gQitdrE3hGto6rYOgPr2Da5xZ5wqTi4edhpO4DWH8MyIBWq/tXDO3UUQi+LtXw5b1Nai4iTxXi/EdbG8oSn0iNdypUngYRR1+h5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968498; c=relaxed/simple;
	bh=WyIvrOVDNWf5X8qTZLswd5dlm0L7vHB640A5eFNHu8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPc5pIavln/dA2OGyvU6mecN0MvhOqMkDe1XWXPALVdxBFl0fcE9K3N9lNkKfqxeIs5RBU0D3WYVGM5+QUXoeSe6zGw2S7md3W92D2zrAVovGXz0yfJp+1Z442sJcJnWTRV5bKujOJZUd8y5txlyF01cn61L3NRVDEBfQfCkvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKF40z36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKF40z36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107DBC4CEF0;
	Thu,  4 Sep 2025 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756968496;
	bh=WyIvrOVDNWf5X8qTZLswd5dlm0L7vHB640A5eFNHu8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKF40z36T6RfMUh5C1AQd4nbgMrAgm0MeJh780thFPYJbKuSL0apzCOU7eP15cHUK
	 kKm5/Dejsjsy6TfPgf0zobV/ssA91J8UYmFvtpaRcUAWot99NvbxHuzx1JQEGKFI58
	 QiiL0ok7G5sQSlo8yvQkPEQuS88rzE1HcgPzWmNuI1Ito7lyj/jVpZ4v3jh3HHOZYA
	 SbnveT0uf1mhQkjGNzzBPrZiVfd1dH5QTeAL8Sj8fmkJFB/mA1ig3njRVkWqUw2Xbg
	 iEaN3gGOGDzF2JpzLMRwW1iT1xPXR8bgc1/8gSlkA+U/icaAippFP4/wLerAesmnDW
	 GWNpLB3ZFLi5Q==
Date: Thu, 4 Sep 2025 08:48:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v8 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250904-interesting-lovely-ringtail-38bbef@kuoka>
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
 <CGME20250903072936epcas5p4a28d0e63c7f0792b516b0cbc68bf3a8e@epcas5p4.samsung.com>
 <20250903073827.3015662-2-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903073827.3015662-2-pritam.sutar@samsung.com>

On Wed, Sep 03, 2025 at 01:08:22PM +0530, Pritam Manohar Sutar wrote:
> Document support for the USB20 phy found on the ExynosAutov920 SoC. The
> USB20 phy is functionally identical to that on the Exynos850 SoC, so no
> driver changes are needed to support this phy. However, add a dedicated
> compatible string for USB20 phy found in this SoC.
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>

You just dropped all tags without explaining why.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

