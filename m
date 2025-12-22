Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB532E156;
	Mon, 22 Dec 2025 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766404239; cv=none; b=aSDaIPrPifMVrOqHLJhhrLJoOQ02Ohj1Ek4cqWJS1jPSBnCJWOmyYOz3dZVzLwc1skcf1j1fo4saNYImuvksrWh1e0wDHwp/cGj/EIRCtZlzLiuEDGyJcYA0NRKFDQaQckfCxXnwYi92T/RwVhoCpsS1AA2lYG3EklQFbQw5w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766404239; c=relaxed/simple;
	bh=qtFhad+oksdajZTyUIhQ/cThE6gZHtNWEc9qENT9c2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VOsAxYzBKZUnjHKUZ0E4v4j6mNa0SSvOVGEzGaIwFXTFCd0HYTF3Q2FPHHktobxSO0wYUG/76mgixKFwCvdmeoA0dcg09sHzh0DQFQQ5c3lrNZ5/+7UJ53IqUtSHRiiCyUAfyW5XgMzx/aTdCkZxB7Ntb5Pisq7TwgLEYcQr6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSyz+iFe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSyz+iFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7178DC116C6;
	Mon, 22 Dec 2025 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766404239;
	bh=qtFhad+oksdajZTyUIhQ/cThE6gZHtNWEc9qENT9c2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qSyz+iFeGQEA+35kpg996olqXKNHMAZ+5ja+4eg3YnH0hkrrbawEJgu7DR41OERnx
	 TjDB6udahrCOjg2YGo/0RXCsWDxLj4QSfgbD1kPjrj9EbK/K9w/IPHUMpMOIXA3SIp
	 rckEAFf+K+L6J9nt3PirhSYqE9EWnNvUpWeIw0JVa0Sng24Tj36HcOO05PPNhE7naf
	 ulnRBFXtlWmUxiiMAvLLmOu/dvaTyc6NUzJ1ZxbeJ2UQVcb6FX+GUb3ioKeYajVAl/
	 u9nto3aGPWJnLzyLus8bJU2URh3sCpXO1yXvRYfPTVhLaZQloN7Jje57TAfQZYknNi
	 MTUObcXAjfrLw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
Subject: Re: (subset) [PATCH v7 0/4] Implement hardware automatic clock
 gating (HWACG) for gs101
Message-Id: <176640423317.47079.9046133168071940495.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 12:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 22 Dec 2025 10:22:11 +0000, Peter Griffin wrote:
> This series addresses an issue with Samsung Exynos based upstream clock driver
> whereby the upstream clock driver sets all the clock gates into "manual mode"
> (which uses a bit that is documented as reserved in the gate registers).
> 
> Another issue with the current "manual clock gating" approach upstream is
> there are many bus/interconnect clocks whose relationships to the IPs
> are not well documented or defined in the specs. When adding a new CMU until
> now we have tried to label these clocks appropriately with CLK_IS_CRITICAL and
> CLK_IGNORE_UNUSED but doing so is both error prone and time consuming. If
> your lucky disabling a critical bus clock causes an immediate hang. Other
> clocks however aren't so obvious and show up through random instability
> some period of time later.
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      https://git.kernel.org/krzk/linux/c/01272f05aae5f6aca4337eb52e6b9290ce12e9f7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

