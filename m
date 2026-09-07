Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D18448BA0;
	Mon,  7 Sep 2026 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775381; cv=none; b=rN/PzKRbdmKmWc+6peofJ+EvpP0DOasP3qaZTr9A7Lvkuo6G40KndHPMbl5fN+BdAu+VqSREfTaKYhtSFXB0xP3YR2m2a6j4zXC0CBtaQwfSA/8RHnFA7YqDM0P76sbhshFEBeOjVGWziZnvyw7K9N6YdtQ/UxYEuRE8Q/wg5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775381; c=relaxed/simple;
	bh=JsXGBKz+aLdpD5lPB2V0+4HoyhFZuLgr7ToqnrOJ8Jw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VCygA+6g4X+abBlsjSoESfI1eZGr8cMP8qTPTr0/fy9SX1r/DcCapcOa43xAvp7NNbAJunq9mih1JwY4ivsp5kU8C4bpvf1jnbnksoFcVUmxKfdn67clOaiXcfcKUjgAm8N1PWh8+U5/9M2qrKY62VMZ4gB+Qto5TBpinNS9Wog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcuvWqTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcuvWqTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9A81F00A3A;
	Mon,  7 Sep 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775380;
	bh=E1bmjEjuXg4V0a1odWzBZHBwutxRktqwzbVaoXj++OA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YcuvWqTO2JrcuELqckcilHReQmr0b1T8MZfB4PLzR/RfGi7I4qweZpyA0iXRqphmj
	 xKbhHXDictGihsCJPBZN4yRY9Gc1a/XiFCrHy161HtWFycm7PCan5f32JGr6NZlYTt
	 rSzRddzl13UHkM3t1FO6k2FJSv7quHruyTpMIWVSxnn9+8qQr5p4QhtHVPQ38zPRqQ
	 N652ifNwfF6CYNt4Awg1bQfEZVBe4ou+bJhpdVIzxzSpdC5WA77Q3qrGNAsjkhS6op
	 F8PqfAcRN21XZOu7a7Yc/bLzm4x349y8ZFAgGSdtLlFJYK5pLDuFKUVuNukjqAuXWP
	 klHh2VH3Zhr7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Aiden Isik <aidenisik+git@member.fsf.org>, 
 Aiden Isik <aidenisik@member.fsf.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
Subject: Re: [PATCH v2 0/3] clk: samsung: Introduce Exynos5515 clock driver
 support
Message-Id: <178877537489.237750.11976683817275167813.b4-ty@b4>
Date: Mon, 07 Sep 2026 12:02:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 18 Aug 2026 22:58:34 +0100, Aiden Isik wrote:
> This patchset introduces clock driver support for the Exynos5515 SoC.
> 
> Currently, the following CMU blocks are defined:
> - CMU_TOP (handles clocks for all child CMU blocks)
> - CMU_PERI (handles clocks for USI, watchdog timer, etc)
> - CMU_FSYS (handles clocks for MMC, USB, etc)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: Add Exynos5515 SoC
      https://git.kernel.org/krzk/linux/c/3c120e1c651da5c13b803f4742cc5d929b78a772
[2/3] clk: samsung: clk-pll: Add support for pll_309
      https://git.kernel.org/krzk/linux/c/6fb3239a9a58399ea787887ad555b6f6cfadbddb
[3/3] clk: samsung: Introduce Exynos5515 clock driver
      https://git.kernel.org/krzk/linux/c/0ae5dad7d9e6e4b8c8f3611f04fa929e634630e5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

