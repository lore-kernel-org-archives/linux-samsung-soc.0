Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A3376BE5;
	Tue, 24 Feb 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933284; cv=none; b=Qc/n3WsO7P0NEYq+IqimCn0NjqheLVNqPmCPTfsFZBIJKrOlXwBsC5nuEUMGBSfryBJhRFkrCWq6zYnQCS0i7VnC5k0DFSbxRS7+qC14+qA4vQbDvv9kAiyOcFvA4UkszwVdQcG6FZsxF+khhCi2rFKX/84LzYItohGQTgOgXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933284; c=relaxed/simple;
	bh=1g/1lWEC4KmpoUAN4DrZYJBxYp3+OnwE2eiZQSewiaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ma7QWCcsazHqkBLBsobR1iMCkYpjH6O/516heNowfC9nWvD0AA6wCm/abbPqLiNPErH6i9vfv8uRPDdG6zFX9iXxHtLYzoLX/sUzDbXqyVH/4NF/l54KS2IQLn9jUWGMGI1xzOXe20K+cdVc6DFVDbbApq9pjAA3r/Jc7HXMOlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqPq5G0K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqPq5G0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B342C116D0;
	Tue, 24 Feb 2026 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933284;
	bh=1g/1lWEC4KmpoUAN4DrZYJBxYp3+OnwE2eiZQSewiaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qqPq5G0KG56/vM/1brvKDwfj2nQbmVAU8a3h+u3AnKK48B7rRhd+5GEo9qSAw9vIk
	 Wru97eBz0B+bmI5Wgx0ieGifOWZQ/p31QI8+4A0ouVInuPFdzfAHpxZFoktWEfgZ+l
	 WCqAqEDMeBa08i9XBEa8dBVX/uGhFXJ4MxidvCuMKUrhzxOogZHVK+xzQzxK3i5zvo
	 mCPytp19G9hMTwpxsIZ50UOx2n9Nyeg/dJP6jqGppqnQ00y7pg27o5GlZIBvinRbMt
	 Op5EAnkVM6js0ei8FcJk+4jxmsRSDiqzkLS7twq9p9oJfujX0RXDujyblnmJqieDs4
	 P1x9GKuuVntJg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-4-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130859epcas5p41a6ca2132b576687c89c6e0f07914750@epcas5p4.samsung.com>
 <20251029130731.51305-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: artpec-9: Add initial
 clock support for ARTPEC-9 SoC
Message-Id: <177193327821.57323.11275739203663152206.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:41:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 29 Oct 2025 18:37:30 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-9 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-9 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS0
>  - CMU_FSYS1
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/85cc5be65b82481d9eb14afb6a6d52d5bde36cb0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

