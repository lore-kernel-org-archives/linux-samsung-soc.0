Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF139C01D;
	Thu,  2 Apr 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117467; cv=none; b=kQRIXdWmMw0C9qMTeRHv+xYZn8ziiWHCL6VMZI307VZ6VHb8DlBxtanBLwbZbZu04VHMTT2fMZmynnIsrmQAp/SsLpGl8Rzv339sIVjqM12kOewqaJHQ9HjHdUw2FE76HF/T+3f09Nk4MjZymCBNvU/vlFzRYCF171ZPjJStVaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117467; c=relaxed/simple;
	bh=/eYR7q28xOoXfwKdKZH1Svo/Q1tCKLQF1NwcRaM91MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXmDcbKaS3OqEAmk91+kXYnAJtvZ6GgjCzuwxDc4eXCdtCHyqzfYZEJSr6Xsc6lX7ilb0e7cmNc0wgVruoF4We8SUro7cUPOnTWVh9lNzqmiqVWq+U3luLhh32a19MYnz3mkqxAthrE3j5h12oniWFx5G5mSzJu3mSAbbbpjysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiNp3uLe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiNp3uLe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1C3C19423;
	Thu,  2 Apr 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775117465;
	bh=/eYR7q28xOoXfwKdKZH1Svo/Q1tCKLQF1NwcRaM91MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiNp3uLe2VcqWA2YbxCsUinUlHj1nuZqBm9IMQsarSrZ5H8cPF6TR1rXOLu4tdznp
	 jCSJg4lXdCyHQYf+PPL/h+Jt2K+UDi8D6rT9wcIiq+0vULPC/Rza+1V9YZNqkTOdVQ
	 A0N4j7y1TU+vKOijYInEnr0bGYWu/z9U7oodbLOEeDpouvrjao9XMeVy0XtoW0sFSy
	 BlU6ffHIvsaopfiARHj5WIDDsm0z3QcnAukF7npVSDFrFuNuWOmcfKRhSXfjOMLekv
	 KL3qioieyVDzZqDKIoHBTplPv+6uKp0Q3rdCkqLRrkHHZj5UFUM5G0Q3x9f/FhV8++
	 WTRBeaC+i1v6w==
Date: Thu, 2 Apr 2026 10:11:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850 mailbox
Message-ID: <20260402-lively-magpie-of-apotheosis-3caab1@quoll>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>

On Thu, Apr 02, 2026 at 03:20:15AM +0100, Alexey Klimov wrote:
> Exynos850-based platforms support ACPM and has similar workflow
> of communicating with ACPM via mailbox, however mailbox controller
> registers are located at different offsets and writes/reads could be
> different. To distinguish between such different behaviours,
> the registers offsets for Exynos850 and the platform-specific data
> structs are introduced and configuration is described in such structs
> for gs101 and exynos850 based SoCs. Probe routine now selects the
> corresponding platform-specific data via device_get_match_data().
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 67 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 64 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

