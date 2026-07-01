Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99CC431E6D;
	Wed,  1 Jul 2026 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782935916; cv=none; b=fN54nT6kjAJPibWifrRuifgTJXirHBCZrSNhO6/ZN6CU3pAq9V35pllcGUKFJpWHTArSm34ymTeMt2gO3gMm6n3WkDwSQSSEGMcwbpaTbxJ2N8MEgwaT9vbOPS8wizoLyhRQPH88z9Tkb7/9IRx42e9OK942MXFZWCx62RwUS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782935916; c=relaxed/simple;
	bh=LZs/Y8uZzTpFOx6D6uKCbnmfZT7JxrIJwfXq7FRM9Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZCtnVksPFzWd1x041W4Zp7fc8HynIztUUKedarWS9MLwNPDjDpHJmdsCipL1nw/nXoJE6yud+WfAabjWufvwXa2KVdxM6eoQu+qVZer912KJsD3Go65YJ8YPORL2ee3TGrY+Z0f1Jc4Fn7nw73dnsAAgmdXj7sD1LaQ1rfFDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1bwuJyU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1bwuJyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8381F000E9;
	Wed,  1 Jul 2026 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782935915;
	bh=snLU1eFT4LzsIrtC77An4/P+s5Ttcpj33qcJtxNCgOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K1bwuJyUPO0aoycSbE7Ytyuv8rtNs7TE4RRDVr1hEF/h2qpeHZOWdL4i1d9ilHhND
	 S/OUeqX1ClXRuXlhFswDzqlULH0DF4fwVMWfF+YptjbnZ9GsyN720btSxBornoAUYR
	 BA+cjDEWQV/iRwejBxNvd+VyGJLnjof1FhViHLpRybxmPLSK/s75dSjCL6llZ7PHWk
	 qsNIjuSlArXURCjSSra3BdboeK2Nv6Z4iStXVQeXVSlne7/IPPMlvBtwEbtG/CKcVs
	 g+Sbb4PE7EhzjjYv4Mu7wxvpFZNmwLHvujOd8ooycwKhN5Y18Snv05PSDdxEtRwkhw
	 UZdNhQBnRh8aQ==
Date: Wed, 1 Jul 2026 14:58:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: samsung: exynos-pmu: Restrict children
 with unevaluatedProperties
Message-ID: <178293591372.1662355.5233552174253951440.robh@kernel.org>
References: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701105731.196618-3-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 01 Jul 2026 12:57:32 +0200, Krzysztof Kozlowski wrote:
> Each schema for a child node should end with either additionalProperties
> or unevaluatedProperties, so add missing one making the schema tighter.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

