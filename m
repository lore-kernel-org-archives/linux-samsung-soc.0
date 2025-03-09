Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A3210E5
	for <linux-samsung-soc@vger.kernel.org>; Sun,  9 Mar 2025 13:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741528206; cv=none; b=VOXWetNf7J9gyeDK1yIoYR6aoMI6zTofYez5OBYNmqK7XW9g5MEtm2FyKwxPp98gYslCe9QQpiFd9gA5CW7y3ExFxIdzPxnJgFdwgmnrvFX6Vapg/CNYt5pGOevpbZTMXioaZt6ZJX/Ay0G5etI+uPlrbJDWKJ63VHITHA9IneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741528206; c=relaxed/simple;
	bh=G1hejKLDvUrNRMC63yVoF7zEQMOaGnYjgs2MYcPbuL0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uTOt7BGGB6pP2WJ80crfiawoeNh5Ru/4FPMaNNiAhCl4ibzaLgfh4ksSR4UXTneuItdnRUHopLTysg7eTeH5TVZeDzdw8yJeWAB0UQvPtWOI7iQibttJmTh+1Kb7nQcv+r+dFqwCy+RPn4wv6hB25HTh/aehl5Uf0RdDP0sh/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Ld+OGBTo; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Ld+OGBTo"
DKIM-Signature: a=rsa-sha256; b=Ld+OGBToQ2Rskc3LCPaPVwRkUXTyBr9Uz4nnibZ4BnlSmhq/anii+/L95KlURW6omngaBCiKqkYhFnfUHEUVxqRf4192eWtKDpPyP+nZwHkTK1hP7wTQRC9JLRKUUkxb3rgog/axrEZf5slc2+Es3gu12GJ0OxRlUvpej8fHLvcpQJxnNq5BQvDoAijrI8HglJCzoD074JllalXKnrGXVUI2sJ0BKGO5fZWoS80ILvd+W0veXq5G6D2zxmE4ksiOKRYVsCSaVfPFgyElOT4L1QWE2ha12s7zk64W3MpWkujBLNDEaOnJW0k97dqsed59U5ottVBtjWK47uhcdvY2fw==; s=purelymail3; d=purelymail.com; v=1; bh=G1hejKLDvUrNRMC63yVoF7zEQMOaGnYjgs2MYcPbuL0=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2065352892;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 09 Mar 2025 13:49:35 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Mar 2025 14:49:32 +0100
Message-Id: <D8BS7PJ6LNYY.28AK1FF2MR85S@mentallysanemainliners.org>
Subject: Re: [PATCH RFC/RFT 08/12] clk: samsung: exynos990: Use
 platform_driver_probe() to avoid __refdata
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org> <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>

On Wed Mar 5, 2025 at 10:43 PM CET, Krzysztof Kozlowski wrote:
> Switch registering platform driver to platform_driver_probe(), so the
> 'struct platform_driver' can be properly discarded after init and there
> won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.
>
> The change requires using subsys_initcall instead of core_initcall,
> because no device drivers would bound in the latter, as required by
> platform_driver_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hi Krzysztof and apologies for the delay in testing.

On my Exynos990 platforms this patch causes similar oopses to those
sent by Andr=C3=A9 (different places each boot). I am unable to get the log=
s from
UART right now though (refactoring my testing setup). Apologies.

So this bug seems to be platformwide :(

Best regards,
Igor
