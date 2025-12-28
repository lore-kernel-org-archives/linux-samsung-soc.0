Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359B2C21D8;
	Sun, 28 Dec 2025 11:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766921590; cv=none; b=uYh+OQa/N1Im1x/5MaU5c3bamCbDtWWyXE2f2feG1BrftTQs95ByrDT8L8tPi6bCw6OxzLioaS77Q5KzDO73qRCE0BEb45tv+/71J7razOlboP6uSwTKoMgAXLb3rPpZWuWwT4sQ9G5AnmiG5/qMFiFUKC2uSOXStDcuAfLlRPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766921590; c=relaxed/simple;
	bh=coWrLRzyfgo4h4Wef0U+sHZbBA/bDgv/7mVLJqnRQro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EqvhA1JWNkvV37rCWnOBK4tnfP5Ni9KRaLhTc9FG+lp/gVnfoSyDTB/FpBS3TxN7+mIZZMI89guhtL175DsfKzSTcfX8ymoQdBKLrAS9KaKmpUtmxK22tXB/oCL/BO/ErOPq6nwtIKcNhCyEj8vAy5o05yhT+MCWw13r9OV8cVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEVNoW1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEVNoW1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE30C4CEFB;
	Sun, 28 Dec 2025 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766921589;
	bh=coWrLRzyfgo4h4Wef0U+sHZbBA/bDgv/7mVLJqnRQro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LEVNoW1WcQhaT3ThxDESqTT73nZhgozPhzCNYulfecLLWOkOueMwep7g/eBUI5Idf
	 +ymmeCVMjppma183+75Yn6BBdGZE0HjUpAKNT3kb0rYTWUpy1w77/Sa9Cw42L8Kpyx
	 F+vemiGvTdfkdejFO+/fBLLGUlwx3Rh3rWOCTUMnz7sKeHFmPc1aQ9SQrhTI41M4T1
	 yQ2YUNMQ/QOedivlS+Rh2O0P92NhK45GovpJ0g0n+dQILnw2I6tSuU8LvCn86iVY9t
	 UyNtxX0SZA7gD3mCP6BRsr5Lux9IY0KGIzQKPVjWBxewUn+u08twWqgMGKYOvTc4kl
	 arIB5uBXUUsmA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] soc: samsung: exynos-chipid: add gs101
 support
Message-Id: <176692158656.58608.1877617154747572001.b4-ty@kernel.org>
Date: Sun, 28 Dec 2025 12:33:06 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 22 Dec 2025 16:30:04 +0000, Tudor Ambarus wrote:
> Dependency
> ==========
> Typical dependency of the DT patch depending on the bindings patch,
> thus the bindings patch could go via the Samsung SoC tree with
> Srinivas's ack.
> 
> Description
> ===========
> GS101 is different (but also e850 and autov9 I assume) from the SoCs
> that are currently handled by the exynos-chipid driver because the
> chip ID info is part of the OTP registers. GS101 OTP has a clock, an
> interrupt line, a register space (that contains product and chip ID,
> TMU data, ASV, etc) and a 32Kbit memory space that can be
> read/program/locked with specific commands. On GS101 the "ChipID block"
> is just an abstraction, it's not a physical device. When the power-on
> sequence progresses, the OTP chipid values are loaded to the OTP
> registers.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: exynos: gs101: add OTP node
      https://git.kernel.org/krzk/linux/c/9afdf3e1a59e23180540ecb1fe3287c308cc8113

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

