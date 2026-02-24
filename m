Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDD437D116;
	Tue, 24 Feb 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933179; cv=none; b=GLcWCLR9s783zEj0yGeNQa4fbuKVEa36NW8NOcCRz+kIYmQupmYt56Hm4l3wxeOio4q5H6BRmsOrNrp5V/esSRGc7M/4rweQYK1bUC3qk6FAnx0iXIlL7aU51euAh9G6glvdL6Ts0eyjbjd3fgzZZ1zUwPw4owHonfzti6ZIcUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933179; c=relaxed/simple;
	bh=XciIbqU0M6TfQN6a2di9ZkjY1Gufztdl8IPqFNkmZUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tJ758BgMOni34zko16ic0YTEMk4Nc8iuhnnbnjWTwhMQwt64bPEIg/Zky0SVQybMqizSkfUCwJiP1FJb9F3aHdpYb3yNWWH8SGahDkiItgfpN1Zp18la4orvQs/J+71FfTh3trjav1f38CvhMD8Ig+wtk0uCnsT2MSjKW0nLg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McI+sIPd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McI+sIPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D86C116D0;
	Tue, 24 Feb 2026 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933178;
	bh=XciIbqU0M6TfQN6a2di9ZkjY1Gufztdl8IPqFNkmZUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=McI+sIPdYrfgC2TLM3Fs+Rp3irXWV6tfxny4WrfQg13JtnWuR0lxbzDTnpjwQ3ZR9
	 0sR5DDieMj5azyqWLtuY7cP01GqJP/xyH+tysMBoLXfvTIzj0jwGfSPuM21uPm7VmH
	 21AxkcPTuVHTMgktpctk8jk+OrOZf4fHDSrNViX6MXLpbDWElKvUXPXD2BnJ+QCCty
	 T6soimrym5fSFipWCgmzuemIA6WkzoZhxB7cq9TIUqaSW0zw/5JOF2bLlXmqtLsBXO
	 26d4JtUmXx2ceBRs1ZQI7tL/kSoCVxT0/XqBNmZ0EqQK3HrZcjO4+BWo0EEeEengcw
	 d27S60t/SkeVQ==
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
In-Reply-To: <20251029130731.51305-3-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52@epcas5p4.samsung.com>
 <20251029130731.51305-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 2/4] clk: samsung: Add clock PLL support
 for ARTPEC-9 SoC
Message-Id: <177193317288.54984.11991926930863142214.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 29 Oct 2025 18:37:29 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-9 SoC platform:
> - pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
>              This is used in ARTPEC-9 SoC for shared PLL
> 
> - pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 2400 MHz)
>              This is used in ARTPEC-9 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/f051dc5bc8e785b221d2e69094e774507c3a52dd

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

