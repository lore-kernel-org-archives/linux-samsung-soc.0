Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D61547E7;
	Thu, 20 Nov 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634590; cv=none; b=SXDb5jiz3Mbm3OV4/VeOZEifuCbsniQLDbrn2f5Onr+InPdWuQl4RxlApJft85v5ID0Ji2uWPF0fpUFyERLkHHxj1vrN+tWR6X7LKELPnMEpsJBp5DwT9Fuik3Wf6JCOJtXVARg6Num9u0RHhyA7mjs7SVmCtqAHjvk997NjIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634590; c=relaxed/simple;
	bh=ASXbZBDr/oWUGE5d0sOCR2JWPcV5cPBNzrDFvE0Hvnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rlf9AktIiLebPIUBQQdcR0yCJ/3lDyNVeWkGsWpPFpoC9wopNeXKNJGC33GnY/DUn1dUkHWbtXjUeOjV54xcqpZGoscCF5+78AMmIioQD4kwf6YWcEbVZDTnbrVPIDFuaFlfAVOCncr85SDAkEQZwdR/Q7oWqqq4Xibs9fWISIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4Up6EbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4Up6EbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87596C4CEF1;
	Thu, 20 Nov 2025 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763634589;
	bh=ASXbZBDr/oWUGE5d0sOCR2JWPcV5cPBNzrDFvE0Hvnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=o4Up6EbIImL0S03mACS/c6as2UjmkTy1kYbeQFQpVlw4UKJFE5c8tlvqZS7tdMGCM
	 nLC8F4yjztTMOsTkKRRKYx2UGRvfbFqw6h4Kp3tdCgxo9CquYoTvsjj5+/mXMrex75
	 zPaU55Gkk7/qGgt+21nWg0CaVXxNmqY/9Gy69YV1KbmrBdqZxZ24YSYZRurGH49Gzr
	 GrAAdrah1nvQQh0YgDsS31z9VpuJLAmcvHEfG0w/z97ktqY5hs+/4bQ8F0tpaUyPg6
	 Hmd4NmfamP0LdCJBtlLtkymJwx8xIkbKXstM5NToV1WwdobzRTvAOHKZwIwKLXoFIo
	 Bs5doITlM6TdA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org>
References: <20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org>
Subject: Re: (subset) [PATCH] mfd: sec: Use chained IRQs for s2mpg10
Message-Id: <176363458726.601076.17998415477527766315.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 10:29:47 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 14 Nov 2025 14:10:59 +0000, André Draszik wrote:
> On S2MPG10 (and similar like S2MPG11), top-level interrupt status and
> mask registers exist which need to be unmasked to get the PMIC
> interrupts. This additional status doesn't seem to exist on other PMICs
> in the S2MP* family, and the S2MPG10 driver is manually dealing with
> masking and unmasking currently.
> 
> The correct approach here is to register this hierarchy as chained
> interrupts, though, without any additional manual steps. Doing so will
> also simplify addition of other, similar, PMICs (like S2MPG11) in the
> future.
> 
> [...]

Applied, thanks!

[1/1] mfd: sec: Use chained IRQs for s2mpg10
      commit: ee19b52c31b3b111f140c1affd88eca1ed11edd0

--
Lee Jones [李琼斯]

