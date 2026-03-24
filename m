Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989553D0900;
	Tue, 24 Mar 2026 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356268; cv=none; b=DVKC7mSla54qQnJF1RLPFEHQSEgdvS1FF2foyqXgNB+NBVSx28IB58gj1+uGxnyrLSzzMGoNfG4n3lcsUTMFqbtt9CqPYH3qXhf39RQ4K+zxFxL8OTmrEJtjJvh/1zj1S9TnKCVQFfUk/IE635+xbKbjsrFQVUqsKC0Uj8oEGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356268; c=relaxed/simple;
	bh=o1MAC3ATghU10xL4Aes89ym4NEC0lex8R7/g7kN+Ua0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=obZqf6/G0ihHWTZsv7cQdTjdR5vsuaRalMA5VukIJFakB73PxCu0GnejprG2H6AGPQ0CsqtOrOy0GjGbg+RWoE5W3OiFL+25et9EKbB3+x8Z3lu+bO0uIxZQad7sJGDWBR9BLI/ZmLNr/jIJFMwvr7GbSUFD3/IUlNUDYxSxEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhvRDFRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhvRDFRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16EC19424;
	Tue, 24 Mar 2026 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356268;
	bh=o1MAC3ATghU10xL4Aes89ym4NEC0lex8R7/g7kN+Ua0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mhvRDFRSdlsyjpNt+QbRqbBJGpQQz+1HiDQPDqZSYZjncL8a1S3p5S9LyFb1lkieV
	 zslampFzGx0PuxHVt5CnMPNEx+o+dTt2LRI5cQUf+uFOXg6IvIkNbW5eg9HFjAD67D
	 l9H30ts7/tTrYitQZ+CO1ymkZ1WckOBQLRIAgPBJnqZJHs6ZwxKLKgZHb2wzKzrUt1
	 ZioRvYvCr6fWvlb0Raal7/vsCUN+QqfZGtpSrfwAjWqb7gYbS2h/gEvK2+6daXGwh6
	 DQFFcnkVBIy/7MA25aQ0MPUnxWPUCaVHO507CPaMk5bOVX93FCBNr1um2zM6qCVvsz
	 OeZEPtLP3tdLA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
Subject: Re: (subset) [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP
 mailbox clock
Message-Id: <177435626440.57018.18123617463088558125.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:44:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0


On Fri, 20 Mar 2026 21:15:14 +0000, Alexey Klimov wrote:
> Add APM mailbox clock for communicating between APM and main application
> CPUs in CMU_APM unit. This clock is needed to access this mailbox
> registers. This mailbox is used for ACPM communication between kernel
> and APM co-processor.

Applied, thanks!

[2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
      https://git.kernel.org/krzk/linux/c/e57c36bc1a3e459239ead492ebce731a88a264b1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

