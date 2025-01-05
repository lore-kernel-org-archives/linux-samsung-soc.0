Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D9B13BACC;
	Sun,  5 Jan 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070265; cv=none; b=uVLY26INeGewzBur5a1JJrghF5/Pm16AAuJ7eovs2XJun/9xHvSMwwV9AIYaXssEPJhYbLHBa0PI3HJPKJlDo33aDepAEVHbwN15W4d6K9OFOCPcCJa8bPYQIuYAJJUiQwtMuIU7OkHuugsX/CYsjOrlp9ULMwThfLHj6pOl9UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070265; c=relaxed/simple;
	bh=DDB69pNxioosVWrYNnx6ya2xVnCZs1kpUH60CReFr8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDFLBV5CimnVScHKQo/lH474otOo+vAZZvQSYuhSapwEkk17N1hd5hAxLbMmATgA+46ReruWKsz/6Ty3FPXR0uPFthcfrAKKS5h2dOyRF2cqk3PuWErFtT523C3NHp96CYqQHfJA8WUIxlF0Aiqqyi1EDN4IhXNl0Nuda+EIvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbuHRw+w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbuHRw+w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9015C4CED0;
	Sun,  5 Jan 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736070264;
	bh=DDB69pNxioosVWrYNnx6ya2xVnCZs1kpUH60CReFr8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbuHRw+w7Ne49sz17VMnYP8tCmi5gh59npTbUMM1CtuYuaahNLKhfk7VREL1ypeK2
	 igd7krPaOtp5wqQybiN1lX+bv958u4oRRtEY4cn23sIM6SeLhQ4zOktW5lngFj5iO2
	 SuyRG0Oqg9CWG+rZXFQa5yqACLr1NQEaK/o3muUdUcCzQMkxeSQKqV7H+YN3jqFCQ7
	 ChLuIj24Tn9GlF3yJtpL3Ork+DNxEm3NXE2WTVQk0ckN64aN9FPEggXPEKXFBJCi78
	 1ciKcmHxTXNwZTQiKWJrziVd9+0vJlHBZyH/M2AqVSSXLWlU7blNVtEMk1VdF3H8Xf
	 3WxbYcDlYkmfQ==
Date: Sun, 5 Jan 2025 10:44:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
Message-ID: <exropoh336r5mox5liuepj6wo7meog2ct4bk3wxgsrl5femt3r@flxiqxtn7bqd>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>

On Sat, Jan 04, 2025 at 09:54:16PM +0100, Igor Belwon wrote:
> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
> The design for the timer is reused from previous SoCs.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

