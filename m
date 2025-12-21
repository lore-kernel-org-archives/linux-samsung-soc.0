Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB01373;
	Sun, 21 Dec 2025 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766323861; cv=none; b=KaZpZAcxwrzimFAcwmH/AUD83s5aW11RGYugOkzOUbIBfdqX4sjH6TWG50R6qlqHrjnfue38vMlGEYDCpPbpNtDxFsByWufOWT18cjKpmxbuTk+JHS4kXgum533qv72MfyKJCOORy7Fg13pI9MtIW2gSAN5JppLsPgA6YMPLeyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766323861; c=relaxed/simple;
	bh=C95pBC/of2RDtllaJWeqA4lDBg3IEEK6Pq6I70LkZfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h9dIs0yuKXhC1WfF20UQKfADr5W2RyKohwoSXfCacb9iqgyYCgctGZL3SLHiivhmqVDctzPCJS16TtrvWG8V9NxULhV5hoT3Q+uOMnmLhgQ/Chr4DyKr9Oyl/joyZzqIZL3L8ebq+/YaFeHcBBOE6+eh/ZY4JUW3qH1L31EYEwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b49awFXh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b49awFXh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A435C4CEFB;
	Sun, 21 Dec 2025 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766323858;
	bh=C95pBC/of2RDtllaJWeqA4lDBg3IEEK6Pq6I70LkZfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b49awFXhl6ZyrvmzyVuFZjeQ+81LoAJYvhHPlq9jQ1qpAEkNuW7RK87fvcPYe7z7y
	 sMJT/impbhhIhR2M/hYYqo/EiWpSrlnBDr6TgjxjVxRTNTFgIybtPiggHjT5Znimz0
	 I8jgKkBDujuwp7o190Yp7GI2rn2i2s+ibDtyLPLdB0SO/el9R0MG044g2lgiuKUmKv
	 mTiHHmLUkxWETghbwm2NvQxoBh3qqipaKP9VI9Qq2Qxk4Kdk5coT00DYJNcR5B+LXA
	 n5L6x3+9JzrsKzy49zIqGbWge+1TgZkz9Dt8wmxAVg6/bdJ/23Zg1vh+3nu4sPPjZ6
	 qN3R4DfKjC0/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20251119114744.1914416-1-raghav.s@samsung.com>
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>
 <20251119114744.1914416-1-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 0/3] Add clock support for CMU_MFD
Message-Id: <176632385218.12602.17940267617216000945.b4-ty@kernel.org>
Date: Sun, 21 Dec 2025 14:30:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 19 Nov 2025 17:17:41 +0530, Raghav Sharma wrote:
> This series adds clock support for the CMU_MFD block.
> MFD stands for Multi-Format Decoder
> 
> Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
>         - Adds DT binding for CMU_MFD and clock definitions
> 
> Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
>         - Adds CMU_MFD clock driver support
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add MFD clock definitions
      https://git.kernel.org/krzk/linux/c/db1cc4902f2f51977e427f796ea8daf49ba93c69
[2/3] clk: samsung: exynosautov920: add clock support
      https://git.kernel.org/krzk/linux/c/efa45bcc73e1a30705eed28933e341d36a08bb84

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

