Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0882C0F7F;
	Sun, 28 Dec 2025 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766921550; cv=none; b=MjoJmI6KroHq3Vh2LJnGuMlzFBHuhU37iv1VA9t8vtM5dY6fYyO693foSkAYDW0JTmVBErilKM70YxJXleUD/n8ojqSrQRLS3fAfUGgADSLV34hh8yYk8jkgoYcaFflGbh6uLhih8/63Lnm0f/FwuTBezY7LmpYr4CfOsNl2qco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766921550; c=relaxed/simple;
	bh=n4K9RLEp9lrCFOR1ULBliIc1beBtnBois0mcOjw4yBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PzSiRSml5PJ/1gfjPaXH6qRbPkrJFJwCi5Dfz/KjZRWJWKjWXnZsIVaYgoGqEnIBeUI25PFsZtEGdOGNZhsYT8eGe3kEg62W5vulwQ+asH5XLH3t63EpfsUkAiY2U8jtkF8MRAEpwjQaY+4u0l4Z9O8t3WdWropWzmU7dPYECvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYnVo/Fa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYnVo/Fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E498EC4CEFB;
	Sun, 28 Dec 2025 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766921549;
	bh=n4K9RLEp9lrCFOR1ULBliIc1beBtnBois0mcOjw4yBw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UYnVo/FaMsIVBGNkVo6vqQ1yLjPUAhZWHdNEz1+Z1QcIBfcBqJNAVB0M6rExYM4is
	 8It0+jVo54DKPQ7s/yw3SztC+CWm1yItASySJuAspwAxlAnpDUS2PqRBTk23xmIAGK
	 Qo7Wi9o7a8zu7OLsVtl+e2zB7Q3jupGLRLNULB2JGNmmJLh9JAmVMDucLKIpoS6yaC
	 VJrqbENQYLKF9a51RY6uuudLy0XB6npbUwOBaVIq27LgB3yx9Dmo7hvPIHzn72Ql8M
	 o8TSUFIFIxIrixkZ8R3pY0YVXOlnG0wMYzj602CPxR03DoDITmLNQJo99j20xRMMe6
	 LoyQTDRkD7DYQ==
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
Message-Id: <176692154663.58022.10187099781030304762.b4-ty@kernel.org>
Date: Sun, 28 Dec 2025 12:32:26 +0100
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

[1/5] dt-bindings: nvmem: add google,gs101-otp
      https://git.kernel.org/krzk/linux/c/12da6f08a07ddaddd336af878350d30449d23a54
[2/5] soc: samsung: exynos-chipid: rename method
      https://git.kernel.org/krzk/linux/c/9133ae2119cb3c948675dc566eebf11cc4bb1681
[3/5] soc: samsung: exynos-chipid: downgrade dev_info to dev_dbg for soc info
      https://git.kernel.org/krzk/linux/c/c38cfc303db9ab4d5f482ae8e36e5a677db8eee6
[4/5] soc: samsung: exynos-chipid: add google,gs101-otp support
      https://git.kernel.org/krzk/linux/c/732af51910960535382db3f6e0b33e2e2b0ff7b6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

