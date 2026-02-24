Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C337FF72;
	Tue, 24 Feb 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933443; cv=none; b=PuPXERLxNO7aQd4ttCKMw95PkQQnv9C1TjDp37Au5TIuHc6YsOq3amc34vRFrVFIhsGRzmyBq0JszcY/tt6D4NqsZDoJlLUF80ihiF94MtIcfhJLpApRsb9neRvxSJwyOWUpK7KMeBOzRia7jYBmU0t+/htvg0ArRnNMClE6nyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933443; c=relaxed/simple;
	bh=VWMbw5u8A4droiuhmQwd+aULLH4cHJyizo2SxbHh2R4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mJ/qE4SHeHsCLnI/t3Bg49Nra0lmJ0LR3UfISUo1Q7cVgRYf6vaAI3z/2ar9Zou9GEQ6+Cydnqf5zQCVxHT4e2/7boo1EOovr9VC7XIY9/+Do2mLxga+jcja2wWJLAFK4axkzGa6HZVvGLk4kGTxCRph/tKRAZUtsDAMEPV7eAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luKvveXD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luKvveXD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3F0C19424;
	Tue, 24 Feb 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933443;
	bh=VWMbw5u8A4droiuhmQwd+aULLH4cHJyizo2SxbHh2R4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=luKvveXDX54Jxe+c+E6c9rdADIpUOmKyPtDlnqPh+8EH7sw9zOH1xxU1Q+rxdcgvB
	 o4Lbp/JZg9Tgb8A1S3E67Lt8D5pGrDyje4k6TC1AvmwDGHtH1GzLY0mUQFCd/PWvJP
	 wezb3VVbE3OlT1tHBCzKKQ5Ju3f/fy9RBqxE8BmhV1h+XoskuRDdISafIXvNVl2ZOn
	 ftIU9kRlvXZQUNRW7e9nw6bON5qvYFgwLm2NV1luDyMjCh9UGLrDG0/Xe1wBRNViVH
	 G3uo+ZKKnXtzLM7sVV/hDcUJZrFMLHEvsVmjnzm1j+iRlRPixuMzVujflTmhh8pEX4
	 ZvtgWPt0wbbcA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, 
 Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com, 
 jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com, 
 hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com, 
 swathi.ks@samsung.com, kenkim@coasia.com, kitak81.kim@samsung.com
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
 <20251119131302.79088-1-ravi.patel@samsung.com>
Subject: Re: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC
Message-Id: <177193343795.72471.8737899847600826075.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:43:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Nov 2025 18:42:59 +0530, Ravi Patel wrote:
> Add basic device tree support for the Axis ARTPEC-9 SoC
> which contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
      https://git.kernel.org/krzk/linux/c/7b43a16c48fe761480ddb0312e6727d0f5fb0b4a
[2/3] arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
      https://git.kernel.org/krzk/linux/c/3ae2b7442cb878c8b38fc39855f89e47ba43c405
[3/3] arm64: dts: axis: Add ARTPEC-9 Alfred board support
      https://git.kernel.org/krzk/linux/c/b567d42112a2b38c186b37f7ffb2e36fc567e442

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

