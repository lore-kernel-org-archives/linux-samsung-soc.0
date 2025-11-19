Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311134CFC9;
	Wed, 19 Nov 2025 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552453; cv=none; b=pxC75sVytdpzHYh6fsc+3lYPTv2iopavy9Kci+bN7ERXR5xMfTXoGj1Dy7rsXoFWERQLvOSJula+l7lgotr2i6AUAOV+0EhGPz4FW7R4c4KxEB7wnDDoiUqnuIzq6iqKtp1pKQCK0UhQRonj8sSKAoqcNJdbd9N8KMnxjZc1fEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552453; c=relaxed/simple;
	bh=Jv9OnmAWW+VdN1c8JNk07SHBgQv4frybNTEwYqw203k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=svyZjymTmDFgMcns3E5VNyulZqTF3MR+CVGPkRinrQ7LHiJYBZ0LlU0LZcjfNax6uaGVrn4K1aTfHQTfE5DXIRMXqng2NRGng61qZiqc14zsHCChEq4to2NqZd6DUKtXUMVUN/gWnqAtYdFvB7/AlqQhAtCkncqQmB60xp2Jyh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtZCa8h8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtZCa8h8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B22EC2BCC9;
	Wed, 19 Nov 2025 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552452;
	bh=Jv9OnmAWW+VdN1c8JNk07SHBgQv4frybNTEwYqw203k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FtZCa8h8heOS3iK+vQ8WTQKd8Paz7cLEwPD2pD5rgieMYjEhqLizFuLjV2tB40sji
	 PJIoOHoya2pw94aeT8JHhdzkDrbfQ6Ng5iZGnC2x5pR/Velong4SabptfmkdxGrhOO
	 TBX71nXNuDvlDFF66UcXw980jCQs/GiopPF7965vrLlhoUttFBJ+ILyL8Q+JHfH6pp
	 tUrtzrmx4KxzIgaM/4JOq9KWK5WD3qA0hIb8Lo86DGmuViYI1SPIi7zdf/+qQMvBIr
	 Kjso50IWGpWvPj1Uu2oTE9ND5mbTAxokGSPTRvbK/XR6es14nHqi0PLoKinnxz3z8q
	 8I/njoWbKyseA==
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
Message-Id: <176355244518.116968.2249686000765158535.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:45 +0100
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
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

