Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F567233921;
	Wed, 10 Jun 2026 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076842; cv=none; b=RoqCw9lJeUbkS4VgYA1y9/gRP/Sj2WCzjkWKkbJziR4LptmuYDG5nlNsUmbLWDjqaQ6PhSG3cILOeS+DDCqUYdphfqV0+1PF3Q0ACsgjl8t0XrJQ9wmdVBLGDiLTZM8dMF5Fy71l33ORuuirw4UZXUP99quuDTNOwJx++FHd3LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076842; c=relaxed/simple;
	bh=lESviC0svE2amCYVoFVRRhr+ieJ5rZBQw/NWsidC/Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWxDzPtzegpAYc8dSDAyPi7G7656NyC5TX7evAiMQYZOCf7yWKAhcVRpr8owTAdLB0FJYiUtnTnWRn8tTWGbtuB3kUmMY07E3PFwkGkiz678wHZScYdRARNLpAlr6M0DouTwpEeqLW4lMSaIz5YlOuXI0I3ziNYOmgldr4z9zGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgTw9hhK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgTw9hhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AD71F00893;
	Wed, 10 Jun 2026 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781076841;
	bh=inaKj5F9i8g82bw4/T+OBOlX2Daw4L5xiNY8VDLR7+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GgTw9hhKmYwD++at19+B+prZ3LwW7NEJuDj62qxL5DMSC7aXDl2HlUhKvxn2M3a4m
	 3wXYd3xl3bU/glT5A0oJvDqALKuaA2XOqOikUgDVdHKW1F5I/eDngldqhseyHa3XaJ
	 JxCTfSQLTw2U5K7JdA7EVH4WHJN8Ygs2qZo5Ah6lRmbgJmBfS50PvLC8kS8qu7puF+
	 lZCLi7mC0CiwIrs+Dx3C9lmsDulsMYyiQm4j2FmL2B7nOYG6LTOwoZsNAVW870yFP4
	 /H0OrMYqUx/trQZN+Hf7ChMPS4XqGZ2h3ygBlSV7Iqa6vrQeiPQb70ZCxwnzNpfMib
	 fvbiw6WFY2zeA==
Date: Wed, 10 Jun 2026 09:33:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sanghoon Bae <sh86.bae@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	sowon.na@samsung.com
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: samsung: exynos-sysreg: Add
 hsi0 for ExynosAutov920
Message-ID: <20260610-arrogant-papaya-pudu-a0fb2b@quoll>
References: <20260610050326.2903402-1-sh86.bae@samsung.com>
 <CGME20260610050335epcas2p3ec1c019e86b75e9a4edd965a8b27ebd3@epcas2p3.samsung.com>
 <20260610050326.2903402-2-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610050326.2903402-2-sh86.bae@samsung.com>

On Wed, Jun 10, 2026 at 02:03:25PM +0900, Sanghoon Bae wrote:
> Add hsi0 compatible on samsung,exynos-sysreg
> To support ExynosAutov920 PCIe settings:
> - PCIe PHY power control
> - PLL settings for PCIe
> - PCIe device direction (RC/EP)
> 
> Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> ---

To satisfy DT patchwork:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

