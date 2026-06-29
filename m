Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60F35DA67;
	Mon, 29 Jun 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727782; cv=none; b=F3w0MaoSkXKrl4gRHfP6R4bvfXvQAKCp/KVI4aiZIJws32xEiqbp5KY4JOjtrUF8tbvhRuMQ06W+ye+hLloylsGPcklGQEbsXbSVJqHI1m9YTYrZRfZtx/sqC6beCBpJs2p2zGDrzRvKGD8zlwN2OoYczcgk851eoCeQrQX84dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727782; c=relaxed/simple;
	bh=rJ7behxGWlK4N5LOMQ0+yWv9zW0C6Ey1TP3CJDWXHwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ePaOCp1oN0Y70QCQpfo+4wp7nHM7mnM9MsoR+DrSg8tLeuGIjYU8o9PV5J85hYQFAb88R/zf0u5m6+GKQ6VV2lUOZGOhfiZP6QsWcyclJ1lgWkVcKcN4XrcxCxdDH1STmfxOMTGmbw71xKrvu8GYoDO90pgDrA4dGkJxkactJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQxCdrYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQxCdrYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7791F00A3A;
	Mon, 29 Jun 2026 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727779;
	bh=ebjnWQv6XltAAY8DynSNwP32+/XGXdALp+3/b+dFArU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gQxCdrYgAbwXldvgcL6PG3ezQ8sIeHf7AdSndy2A1JJr3tIBJMJOtHOAuVmGJO0+4
	 clfjGn88ZIyJdYVk3/CLs07Ccetk6bU+jTQyT8TfMkwQZlhI1Bl5zu0W8nPZlTdaee
	 dFczxm1IWhAJguvxQxjUOZNKrxff9yjZ1b440sgVNxBMcBPCKTIRLSR1hx1Q8qZddG
	 pZFuS+rtFiWUjej5+WWE70L4b4yKvvX4SFC4CBlgX4bwFbuIsbZkmP3dip8pUVVGWY
	 uhiM64WNNGwUZjFe/ZwG1c2x/l/X91rebzPl829H9qVapsVIveuV5WEHOVmtaUmCqW
	 DF5kui8rQIuQg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
 alim.akhtar@samsung.com, kishon@kernel.org, 
 Sanghoon Bae <sh86.bae@samsung.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 sowon.na@samsung.com
In-Reply-To: <20260610050326.2903402-2-sh86.bae@samsung.com>
References: <20260610050326.2903402-2-sh86.bae@samsung.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: soc: samsung:
 exynos-sysreg: Add hsi0 for ExynosAutov920
Message-Id: <178272777644.113362.12732081976179857200.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 10 Jun 2026 14:03:25 +0900, Sanghoon Bae wrote:
> Add hsi0 compatible on samsung,exynos-sysreg
> To support ExynosAutov920 PCIe settings:
> - PCIe PHY power control
> - PLL settings for PCIe
> - PCIe device direction (RC/EP)
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920
      https://git.kernel.org/krzk/linux/c/d3ebfcb66147497c1f6a4ceaed9a499cec2b3fe2

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

