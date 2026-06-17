Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7783EFFAF;
	Wed, 17 Jun 2026 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691626; cv=none; b=kWB91REpjZMz/JA4v6T3v4KaQOb+5Z0fIjn2/tzy/DTjCdHUHnFjws9BnR26jL4YJAulhnPcp1l98Saz3MyzQTaUvXsasRm554tZXC8b+U7chwh2i8psrol0odTi9M2UF5bTpe3kHPro277gth8Qxym77c4uHq1yzaJM04K9Kdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691626; c=relaxed/simple;
	bh=LemMe3KggFiCwPPl9bGmfkEUoHEUWpJ7AOoGFXW6Xbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFw38jjPlHupeIcQAUJEH6fCitXNBNR0n1TCYQbjMRuxCGXMc9KWDOzWl4ttfkCyLxluh+JeLBv2P8fEQRW/MOc9UT4o8Kwp3eGl/RuJoyxPBzZVjK4xNPtdpgH+JOV7nMs0EBH0FR1zU+DH8HyZllEQ3+ZaVjVBQ4KcGIKbpEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nngpRcHq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nngpRcHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073691F000E9;
	Wed, 17 Jun 2026 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781691617;
	bh=mGDpQKiaGmdMQBKgXybhSkmu2YNTiVFD1n1EPaO+ol0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nngpRcHqLTi0JBr234u9hEGzndNN1zkYDSWphGDzDeiBEyXscpEG3E02lAUNeKgLr
	 bP1/yubOPljYWqR+GDt7wHMLqr0kuTYXCU85r2UncLrQigEttDWrbj91/PKDZkqcOp
	 Zz2hTNleWc3ZJCNLsMwsfvkDXOvGuVeTQnNj+jzTigQ7+3uXR2bzVSHExxFwQkJ1YZ
	 l2qWmqEOCWBP1CPk3MS22aYCRqTjOZfFmXsfMgGt0Kw9IrDDe66Wk2hRZdyNDjCgbB
	 3gzrKgwCuKBANm8nFxQVd8FsZyYKOP9Mr+Ot0EfDPX2i+7Rvk7uHvEWVe/ZL/kllUw
	 1RHDFK3QZxvnQ==
Date: Wed, 17 Jun 2026 12:20:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	linusw@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Subject: Re: [PATCH v2 2/5] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
Message-ID: <20260617-favorite-bobcat-of-ecstasy-02f62f@quoll>
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
 <CGME20260615083419epcas5p48c6b192d1abcbd5411f0958aa9b83237@epcas5p4.samsung.com>
 <20260615085252.1964423-3-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615085252.1964423-3-alim.akhtar@samsung.com>

On Mon, Jun 15, 2026 at 02:22:49PM +0530, Alim Akhtar wrote:
> Document pin controller support on Exynos8855 SoC.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

No wakeup-eint?

>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Best regards,
Krzysztof

