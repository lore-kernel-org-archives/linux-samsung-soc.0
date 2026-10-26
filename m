Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007868;
	b=pB5L9ENZfaiP8CfC9YRfhOX5CsDkAsNFxPazlTkGBOh11dPq0pZMUiIVZqQK93adGPxN
	 kKcQuHl/nOmCrFcyoZG7Dv9K/PufVbUnOd6d29DrAr4Am08I1gFuE+hb52i/N7tXUDnYr
	 kDutnVf3oLXSWqBB50nG8mivpiD/iMRPymQ5j6RNoWxFzgOgndzvrAefl4I7ngPjhRh1W
	 /7JOI88svG1QhyqKO5zIUQCWNMvYb+Fk388GNzcJMC+bDRL4LgV1waiQNpxxdxpW1Slz6
	 leyBExQ1rq8GxOw+fo0HHqhpq5Y4Hb1sFFQWKz1QW3sRvAJhNTHr4XIt+/lEgTLFyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007868;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w32GAT+2u9Nd9KdCv0tYjgdg8e8hiYuWmScLSClw09U=;
	b=R68Zk1pMjy1P+Iju05YMR2KpyMwzOeMiNXgPBcTxg83kLk3jTZ2rN9/Ut2oKKGGYjZRt
	 1lcj5VJPG4rrJI1MPXv5DZR8JzBuh7E83APj7S4SrIcCUKmzRIKP/SMjnE7yXFannnnf8
	 zfUzy2wo3s4GiCCj3nfpqT6uXnG3dk6gexa/E5Al3cZylmQKu5Mo/5gZ8DacCYDYnGdQC
	 a3kv+y58ZFrdWQnVS7EEg/g4/M9z5lM7G+ZNhLJavHamU1BClkh5GYEq52gr8cAqBTdQz
	 cjcg76I1fVfeSfw8lCnYaw81k4YOAIdSR9E+5h6S4qcQk/wDAl8K9lSHw8io7RxoqrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+WF+8qu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D1606A31A;
	Mon, 26 Oct 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l+WF+8qu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A041F031E7;
	Mon, 26 Oct 2026 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793007868;
	bh=w32GAT+2u9Nd9KdCv0tYjgdg8e8hiYuWmScLSClw09U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l+WF+8que08J5dhB5KqdafZx8jD+3iAa2MlqD/zBEQnWYqrI+r5A2xifEINxQfK5w
	 Fq2xK4xYPa5HwAh1sODPimIMRkVdBSCuK7gszDbu4bzOmtfJ0d/4VRathIIWqqjzpl
	 mvaiNjoo+3mACXdRFBoVDHnzFm7FLvdGRPBBSFCpJIjIKxTUff57IRHTaCCIveE6P/
	 WSjRkostIJYmj8spU2Dj9xflswWxH+WyeojB7rC4RCrAGU6kx0mB+t9BO+9x2z5DCI
	 fdb/95xbaA2cMFC3/NhZVmuKoDFbUS2DRkFSbL13XkzWVYJDcJ/+Nu9DscwZJMYkyE
	 4lUlHZb8CeBIQ==
Date: Mon, 26 Oct 2026 10:44:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Message-ID: <20261026-talented-wolf-of-karma-8abbbd@quoll>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
 <20261023131501.3157463-2-selvarasu.g@samsung.com>
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
In-Reply-To: <20261023131501.3157463-2-selvarasu.g@samsung.com>

On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
> +title: Samsung Exynos8855 DWC3 USB controller
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on the Samsung
> +  Exynos8855 SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos8855-dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

interrupts go after clocks, power-domains after interrupts.

> +
> +  clocks:
> +    description: |
> +      Two clocks are used:
> +       - ref: Reference clock for SOF/ITP generation.
> +       - bus: Bus (APB) clock for register access.
> +    minItems: 2
> +    maxItems: 2

Instead replace all this with listing items with description. Don't
repeat constraints in free form text.

items:
  - description:
  - description:


> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts

Here you have correct order.

Best regards,
Krzysztof

