Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE4290D95;
	Wed, 16 Jul 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655186; cv=none; b=SV0GapNoI0jcyztq14Xa+8Vx7buhUVZz29ycGJ83j722NpdXiRRdcJ3DNFsMFAWW3S3AMD7wPvcKyjbmOqy6AYck15jceyRxJhEX7HHqP1OQjCVHQvRW1TpK7DHcgRAe9jiMKFFUr++C0jTSxF0tyWdUz1hCKfTIYtfn6HdB6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655186; c=relaxed/simple;
	bh=MAh20KtVgdhwUpKFxkd8krU5hsKYLfu6RVE5PlOIAXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9hYFlYQzfpp0Y5sVXGPPUUhlYNYVotsF4Jvska6admaHKYBfvJfaQ2AcuuLs8jG4iracb4RbXb/XjK9cXtbJGvorJLlnFQ2MuxB1nhUYQ8FTzz+LpUcZESI7EYolqG/R+N3mWuh67Li2AEZgCH17kyvn3m/PjprqAl5ETVWcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzMhCFBZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzMhCFBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D9AC4CEF0;
	Wed, 16 Jul 2025 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752655182;
	bh=MAh20KtVgdhwUpKFxkd8krU5hsKYLfu6RVE5PlOIAXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzMhCFBZ6X73XnflbcanRuvq4vspVQVGE1OvRfu5te+giBRv/tAnwZMcCVNCrkWCh
	 Gh6xbgtrnzpuChLFJ4cyNG2zBNdQhIeVVrkoxJGKzYsWcnOULmE62ysrpw38pPNA9t
	 bfXO5rPMNeorSSMCPzqj5RpOTBmPsZE8qW+W0MboqvrGLoEPoLC9AxWkCGJXRietms
	 ubDCKQj1QszxtX7NIy9+J08pXTkqaQQd5IaUNgZi0LEVirV2XcKAAj+T0oEYBsN6Bf
	 SbZwpZ7F9qTSZmBJLM+TMblKR0BHe4I0LWgI4iiTYJmG95ylVOrvU9pcHrGZ2wPkK5
	 6f30RPe9spT4Q==
Date: Wed, 16 Jul 2025 10:39:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sowon Na <sowon.na@samsung.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: ufs: exynos: add ExynosAutov920
 compatible string
Message-ID: <20250716-adorable-pastel-mongrel-44b71a@krzk-bin>
References: <20250702013316.2837427-1-sowon.na@samsung.com>
 <CGME20250702013332epcas2p4fe456c285c96c143d96f98b31d9b5255@epcas2p4.samsung.com>
 <20250702013316.2837427-3-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702013316.2837427-3-sowon.na@samsung.com>

On Wed, Jul 02, 2025 at 10:33:08AM +0900, Sowon Na wrote:
> Add samsung,exynosautov920-ufs compatible for ExynosAutov920 SoC.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
>  Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

