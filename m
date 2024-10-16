Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306361531E6;
	Wed, 16 Oct 2024 07:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062302; cv=none; b=ukEvAf1G87R/3n2cSH/lLUMieL/mAtyQXGp2owl6jEQ7EP2swgERgzdBKMAaYqHFMUBQce7cJ0PSZWgfblrJ/7Kw427DevlnH2YVTDRzIbB5fR0Nte0HXAhkH7L5D8qhVNKuHh/4ipGBKhkK+AOy8ZbT60aM6syPqijC+VsAcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062302; c=relaxed/simple;
	bh=ekrNsly1HAoIvCMB+fvKmm/GtqXPhfurL2OUwI/uHS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tT7YUtjToVcyexXh26Ikx4E/g9TfVCH1dsobCGZPqBHIoj49eMPUimzTI/kDYJRg4xhdVkU4CKORfVssMlxrQxt2TgXwstamoJQngDu8lhipICMcKyxC8UaEDYqVEYaggyafLJIAzMBPfFTtjYf6Ccd5HOhz7y9pLie/z1PIunY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugBkn2qM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugBkn2qM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB92CC4CEC5;
	Wed, 16 Oct 2024 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729062301;
	bh=ekrNsly1HAoIvCMB+fvKmm/GtqXPhfurL2OUwI/uHS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugBkn2qMpTt5fhdYAFEszSKOa8y6tBQHH0l7xC6XRYs24b2ByrfsdsSWAqpk98fQR
	 t//hMU9Bn/zf5OAeU255hkxVjM6OfEdy4BotvE2Cqj4rxKm4nZ5o/pxQ0PnCx/ANni
	 ctzurZSWH6R8Z4Im97WX3pF2GyOI+R0LY7gvqw7kObW9ineXx0VvmnKcD8yzqylAN5
	 IUk7QI0Oq/R4Fy/nvkdKyCv3pG968k6GU/H0NiCOj9pi7SSRXApxnHZrwJqdq4309F
	 sddQNQHlTGJp9EFZpxjkAXGawPp65KMrNuNnsDfjoUhC4Vf1Abd30+PhOyYKnlbDjK
	 X1WcYsvP3VIMQ==
Date: Wed, 16 Oct 2024 09:04:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: Add button support for c1s
Message-ID: <scvaaidgqx5d6j4wuhnj5fmhwgope3euevxfofkime7tvtozyh@ndqkuo6q4e2r>
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
 <20241015210450.964093-6-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015210450.964093-6-igor.belwon@mentallysanemainliners.org>

On Tue, Oct 15, 2024 at 11:04:50PM +0200, Igor Belwon wrote:
> Add button (gpio-keys) support for c1s (SM-N981B).
> Added are all hardware buttons (vol-, vol+ and power).
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

I asked you to split your patchsets according to subsystems you target.
SoC and pinctrl. How is this patch for pinctrl? It's not. It is a DTS,
so SoC patch. It cannot be applied.

Subsystems are defined by directories and maintainers file.

Best regards,
Krzysztof

