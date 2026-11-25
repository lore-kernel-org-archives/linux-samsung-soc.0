Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605269;
	b=N0uCl5sKTRCMGV2Rb06yGOO3Lys1ujPu3TK7r81LoxYWjGASjZL4WDsGbCtyQHpw3cYn
	 x8w+oB1VP9xirWYKr9+N5biTrr3VfNUuWDVr9omJfzjus3PXPpJWvU+cb5OImlbpQifui
	 4qYikXFp0cb5wawgwvRsNuS+xx+s6VAlqWpXJBILAP5XpvdvzrqlmeKHOAvbD/WMV5rsU
	 FKbpjbtV5sXdUwSlZlx0plHulZdEzwhrojKk6QQ90pWFtsR8l4m4G745aWGgrxp2qMPtk
	 M+X/QSw5HZDOwA7R+XfkU5GGlaBt97x1YttG6WSY72lIMRpqN//7n8p69cNfxn0nleQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605269;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=6vlpmEXN4SupBIvviqVSLO43c+8YDnUBrUBvhVqcCAY=;
	b=Rgw12lbD+01BoI3JPaOAx+agfF9zepZkIcPjOq9C0QpjLodBlKw4UKt+/8SbjYlOsi/5
	 +DlgVh/I5KHhrIm59N87FDfRfIIR/AYfj3i/J5SYne1wJuHAkhtEDCAPO1eT++lvUMiLQ
	 iIzpCg1SiaCly/mKVKT/pj4vcq49JLHzhfftIbbyPemzSBcCyllBQxmRUsudHeZS2VMBQ
	 ha2FZiT38ji4b6XzZMAth/n91jBn6/TS/j8O1icudAaELL9H/J3SFywBk8ektAqHCmksL
	 w+6pEGcwj/WIHCPuNHj9PVwxo6eYdwEC6MdMayUZPLFVq6ouzspG4cvfy1dFHlYhFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5DqkLCO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B69606A31E;
	Wed, 25 Nov 2026 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5DqkLCO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F021F000CF;
	Wed, 25 Nov 2026 11:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605268;
	bh=6vlpmEXN4SupBIvviqVSLO43c+8YDnUBrUBvhVqcCAY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=T5DqkLCOyfSlrv44SO4DIE6ySLO2afEJJ34f1lXt/V59ckTjsMBstO6qNUEXexsah
	 YiC7L8F68AbF6uhNxR2p71S7+0sVlSqRzw5DMIgGL87+qgt6LmhGRoCk0SkU3//dCR
	 1QVELYaeuFIMwmwMZYoMdTEcoknHLvuxl8XCkmmWXte6OeFSbJYi/AvnR2EUDXtAo/
	 v+7blb7NOLvfyFk8EPjTRrPXSjwnzGK1xnMKMJTAYP3yzaJUtTBthveOzkH/BtAaTj
	 r2+He7E9JbaNJIR+DM6QN/3hYUhzXgtDv98nCdmuerYBPcT3aWUZNzVzBBKP4tXQMn
	 u76O5F2f6QPoQ==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/5] phy: exynos5-usbdrd: support Exynos7885 USB PHY
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Virag <virag.david003@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20261123092244.1792040-4-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
 <20261123092244.1792040-4-virag.david003@gmail.com>
Date: Wed, 25 Nov 2026 12:14:23 +0100
Message-Id: <179560526391.84329.5543546580524948144.b4-review@b4>
X-Mailer: b4 0.17-dev

> The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
> USB3 SuperSpeed, but all known devices using it only have USB2 and the
> vendor driver has USB3 function stubbed out, so we'll only support USB2.
> 
> Apart from this mysterius USB3 capability, it's the closest to Exynos850
> out of those supported. Unlike other SoCs though, this one doesn't set
> the reference clock by default, so we have to set it manually.
> For this, create a set_ref_clk_rate property in drvdata that can be set
> to a predefined value to set the clockrate to.
> 
> Co-developed-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>  - Use unsigned long for set_ref_clk_rate
>  - (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
>    error.
>  - Add Umer Uddin's Co-developed-by: tag for his improvement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
