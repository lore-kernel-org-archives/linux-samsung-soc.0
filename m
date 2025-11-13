Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C832E75E;
	Thu, 13 Nov 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022125; cv=none; b=tm7nNDsckyRuRN6opX50T8Wu0V4aZp9U5p0rw6COF00F+bjSn1n5xH3UjGwIhpV/ae2U18X6IWqsWznt8zsnQO/NXlSA5PbtP5hTwdkHH3ggerbBlebkHIQP+a/8xeHpfN8pgCOxRsoyUJ/6x4hCCcE/z0sQ8pRo18HF9CLVTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022125; c=relaxed/simple;
	bh=q166VfWGOLQHZ0C2z1lln5Ct56mqXInjhI++VoiZBBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+oTgbf7ZznYIE6+lWpFU3knGyYCDevtaW5SlS6KrcVI7gT8lIwUGDzalnUyEbbbnGxWsQ3hwlfML/uY6+CDBb4N/bpAd/f0kp3TREWcieUjV5zi0j8mLCLjgYV/9P52pfzWtSyN8mW/0E7rAvNJNvnTTb9r63rl0bWeB0PWQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ka+gqp4d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ka+gqp4d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE74C113D0;
	Thu, 13 Nov 2025 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763022124;
	bh=q166VfWGOLQHZ0C2z1lln5Ct56mqXInjhI++VoiZBBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka+gqp4dBFWlBUrv9DoyTbtsnOwdJxgAreQXp/b0agGH+6+FkL3FT7YnZRgNEdDzW
	 OJJ3MR0fMRR4JokhFRTdGtCGfSgmz0iidQIOzKdQTURQdfFesobwhqwdL9s8MW8Kb5
	 2/CZaJ6AeMVKXaJN8QoWv+AvkF52CSPa5OSk9PfNy0Sh7nbZjBCvg/hOZ1y0Y7yG5e
	 Pnw8zf72AMqLhxD9QlnDdXw3QQgdiVOHrNci7otlWWzmDJXtz6JtT5yCKkwaSYsBQT
	 GbfzSH9ewjJ2RxOiGGK07UuFSzqLbR771nugYumHZsI8bPOMoN/82haETnN4Q9GOg5
	 RtUm5o4uJhdlg==
Date: Thu, 13 Nov 2025 09:22:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, semen.protsenko@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: nvmem: add google,gs101-otp
Message-ID: <20251113-noisy-lyrebird-of-enrichment-342e9e@kuoka>
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112-gs101-otp-v2-1-bff2eb020c95@linaro.org>

On Wed, Nov 12, 2025 at 08:29:05AM +0000, Tudor Ambarus wrote:
> Add binding for the OTP controller found on Google GS101.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/nvmem/google,gs101-otp.yaml           | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

