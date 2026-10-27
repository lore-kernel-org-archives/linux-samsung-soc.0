Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087356;
	b=izcbkKxN2KkmOu4kUiLZBcIpVCqNRuBcUEI/EcCWJ8qtvDX+InGgt6FJQhtZF4oms0RC
	 e7qY4eXeE4LjtTdM9xW0TYiwOqtzDKN8FlaHDLAQlVPqbBvlIFhkp7Lxk6CO3kVdFz1Vr
	 nf21bA/d1m8tX3Hyn47ts2TFsP4m4TCXM/g1/Nk3uTQcV8Sgl4dslrmLInIqQNndOproP
	 tql0OekyKKeJ2R0FBKn4+Jh59LLzV4eYcue3pCTFdhmgzAzPfEc5rS7lk/RoCZTeiwpm2
	 nRIWxMQ3tNZDtffSrpNdUEYLJ1MpyB0qb9cSrs8y/Zk4Vf7QOVH5uoyFoZeW8zOO5XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087356;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=V2unCDaCesF7t0tCAr5s7QNJEM7FuHcgeX7X/YYseTs=;
	b=L1xRioo1H0/zf7yaECpsLVZ49VPxPEJyCy4HlN7Bas4i13zupmyGd0Su4mGGCyDRfuVE
	 bDUYwMIhUrNxDVGlYKV463vzN02rUXCj71Sc9Ta+BDPkr/M+JBnF07jK4Jy23JgJiKnRv
	 3rrplOAcR0ujQTzyDyCtPNrqGMlnRdUXxUlIBifmDy9nB4Dgom3GZXRhMqb85hp5R5zQg
	 HmtBr1goBN8jE8VNtaChhMWs04mLxx1vyyg2sswGa167tA+p+Oyh9RhvvVn+BguZg7+0a
	 IUUrUPvUL6x8ZrPV+KRbQ80kUnZ3htY0/kra0bkQ5dZQyUAqe7fab5PDF0Jg2myrqnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBCmDAOO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A16E606A31D;
	Tue, 27 Oct 2026 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBCmDAOO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37C1F01825;
	Tue, 27 Oct 2026 07:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793087356;
	bh=V2unCDaCesF7t0tCAr5s7QNJEM7FuHcgeX7X/YYseTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBCmDAOO67sb0Djvtmfo2ldqbCyvm8yU4IKQCZ0pEs1bcqtdhkQpD1mqApsbC459t
	 Q58V4/XW1cdGmDbFH97Gm8uafVK1fo+0D6kn+l+acHSMgmgXQXx9o6AORojhYEhZcs
	 vuZyxZWH1WvaWypWG99Hsf3xZTTHHhONQp11BRuIlwuAstD5fk+fkhmBRr3NNbmOyo
	 K3gEn/Eta5KdV54q8nZl+AmZgggSDdD/FBqHQKO/SKgaSUUz0AncpaMg6gSIELsNnY
	 jSFY5keXFW5mbplvc03P6LxKCcbA8PAG0APF7xsG0qaUeumkdD82i73H8We1al44k1
	 TFcNJKYZGUBHQ==
Date: Tue, 27 Oct 2026 08:49:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: Add
 Exynos5515 compatible
Message-ID: <20261027-misty-artificial-nuthatch-9fd82b@quoll>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022-for-next-lucky7-usb-phy-v1-1-2e47f8484bf4@member.fsf.org>

On Thu, Oct 22, 2026 at 05:46:36PM +0100, Aiden Isik wrote:
> Add the compatible string for exynos5515-usbdrd-phy. This PHY is
> compatible with the Exynos5420 PHY when running in High-Speed mode,
> in that it uses two clocks, phy and ref, so document it as such.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

