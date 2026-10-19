Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083A63AC55
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418760; cv=none; b=oawzj1F1CRlKzJQLU3X58YjlVzIB52ryBrdyVeab+naqOYwIUc4iig//VLbv1+vs0ChnpZRVA5Hsig/MxxTqvd6zytieobe3dRiTDixy8i/i2wovYyGEKr2MweU9Y6kCkPsjze3kNo7VGSoputPC3gZJe+SDercO+IBg22/elKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418760; c=relaxed/simple;
	bh=XW7BceGWPY9WiX1upsARm8MUVolkmVHvz8rIGu+9G9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+E73kHhbX/1H4x8AoGSYeETmvkt8nAen/4XVYR2y9Kfut3OEHnoItssmL150MD2Wx62YhIfjeTrex+hBovhAss8YwUta9tiEK2Mw2eLhQKSSF29YmMLHwVbrkCxhJMSwKOwtogs0k8dZhibsyqkjx/0r8TH4LurX66kGNzIvwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=TE+vxoCE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="TE+vxoCE"
X-Envelope-To: linux-samsung-soc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XW7BceGWPY9WiX1upsARm8MUVolkmVHvz8rIGu+9G9I=;
 c=simple/simple; d=grimler.se;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792418755; v=1; x=1793023555;
 b=TE+vxoCEf3stLXSEjVEUNU9n45xc88Ps16DW4AoK+qdwVrHUyg+myOFhZEjYfjekhMUPiop7
 U/1pHMarY1sm3fnKfRUqsk7hhxtsC52MHbKKMihjb21YemHHzBFo1s0Q/WvKLmwYJ/qIK8Ag4r0
 J+PEMZbBApEWCtrXaGZK4/Kk=
X-Envelope-To: linux-samsung-soc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 6aae6aeb5c5dc7b9;
	Mon, 19 Oct 2026 14:05:35 +0000
X-Mizu-Trace-ID: 6aae6aeb5c5dc7b9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 16:05:32 +0200
From: Henrik Grimler <henrik@grimler.se>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Message-ID: <20261019140532.GB26863@localhost>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
 <20261018124459.3026-2-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018124459.3026-2-pepe.schlehofer@gmail.com>

On Sun, Oct 18, 2026 at 02:44:58PM +0200, Josef Schlehofer wrote:
> Add Hardkernel ODROID-U2 board compatible string.
> 
> The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
> computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
> MAX98090 audio codec.
> 
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Best regards,
Henrik Grimler

> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 273464400477..f863803c84f8 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -86,6 +86,7 @@ properties:
>          items:
>            - enum:
>                - friendlyarm,tiny4412            # FriendlyARM TINY4412
> +              - hardkernel,odroid-u2            # Hardkernel Odroid U2
>                - hardkernel,odroid-u3            # Hardkernel Odroid U3
>                - hardkernel,odroid-x             # Hardkernel Odroid X
>                - hardkernel,odroid-x2            # Hardkernel Odroid X2
> -- 
> 2.54.0 (Apple Git-157)
> 
> 
