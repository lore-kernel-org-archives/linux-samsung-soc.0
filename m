Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008700;
	b=hQCKDP/AfjONnaQvN0jdDioMeQPDLDMJ/vWMQ62002wm9WEXxBlzU9VKyaPyNsKXxA6O
	 Di3vxkAKsyBr0a3YYAc2Bjo4VROkC3zmkLnm7m6xVAK2gafudavU/YqneDH4KyraeMWNc
	 y3fmw/pLisP3ww0CMbx+DyS/llL9ulG3i5c2inDJfUJEOu3b+OY3mM3tvA6dSMZ63J+FW
	 85ZdwCfFF+LCbqFFGetlRho5ANVVRO1rg/cpV1M5U9noCq0HSNzq2GAaRbRLC0Zm8vkye
	 zMMNTp0+OJSHMZSlgNDBs4uJeOrd2/0GDgarx6/qM3kEuv8Gfvcx86tR3jmudhA4zWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008700;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HED2kevfhrwGI8UExCHr+WpHjCuw2FSIBaGbLvE11iQ=;
	b=G4P/hfwtlidw1FjOyK2Ao+eMehB/YxqEXvuIOUJnuUUnrRejooJM6dx9GZQr70VkMEpL
	 YlewWHI33mmVOp1e416KTpgnZfKGN3wst3Lx1xEvtxL55mbVaSAJg7iAKckeN+UNMrT2s
	 555wvfrVeInls0CPPOcg7endOBYeXWUND4yGJ7mypHbOOwei9s/7FsYUFnDCTIY/rWj5+
	 leO9ThKiRYnwK+po3/0BjAXpUkJlg2ZO/Q5+Om6NpxQNnXCT3McbXDwkFIbA4Uf2xqVl1
	 yDksSmB0CNQBFyFLP/Pvm8MqdnjQtpLZmDXP5sb6b4huTdey6dSz+vQ3LEKp9W40Ohw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NshH7fEY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A160A2606;
	Mon, 26 Oct 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NshH7fEY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251151F01181;
	Mon, 26 Oct 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008699;
	bh=HED2kevfhrwGI8UExCHr+WpHjCuw2FSIBaGbLvE11iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NshH7fEYMysbqpjK0M5dWEIb5ohUsmMISWWZQ2wcifVxFJq9icmsimIRk4GrTrxmH
	 aetSm5BzdHJlc3kgOEUrrgfCRkWzO3xEiOXFaMcfvQ6ndgkyOfNLom9iXDkqPzPSvM
	 usAIOxjjTySSzxCiZmvnCDgJHR1o7/7t860t7S/AtwzCVc1ywXq07iVlxrofEruyMN
	 7nf0BAtlUGaG1BuK39QRTgukxX3qhJylrrpck2MswXDpcv7ou0O81SoR/XmuWH/yzp
	 6uyIpS3/cEpZD19svrigYARFeSmVZja7oLid+42ppvD5YxGESUzFpkIQvWam/vtihA
	 0fYMi9BwL/vNQ==
Date: Mon, 26 Oct 2026 10:58:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 2/2] usb: dwc3: Add Exynos8855 to the generic platform
 driver
Message-ID: <20261026-obedient-aardvark-of-pleasure-67e5bd@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131548epcas5p2aeea6d1ff5351907df204e7b3fbe6030@epcas5p2.samsung.com>
 <20261023131501.3157463-3-selvarasu.g@samsung.com>
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
In-Reply-To: <20261023131501.3157463-3-selvarasu.g@samsung.com>

On Fri, Oct 23, 2026 at 06:45:01PM +0530, Selvarasu Ganesan wrote:
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue. While at it, alphabetically reorder the existing entries.
> 
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

