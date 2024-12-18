Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C56198A07;
	Wed, 18 Dec 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517255; cv=none; b=sEnzsO35i+49b6MEFmANfyZIwBvxfrktuNMymzbOQX64AHTv2e/YPxW5B92VV1z4cDLYMXt0ZntJxShNe94fxUJNp5E1b0fdzehda7ufVLTJo2Z5DNX8EUe4HYkYP3xoZwbf6NuKodSLGjlA/4z2MQeCew0t2B1XRMSX6R6rBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517255; c=relaxed/simple;
	bh=Ab03XkBtUozzcDUMdRROIutgfm3vkMiKIL2A68fECHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEtn4vG/jbpSSEQOQq9yYqNfxd6z75OtN+isSrzJbpRBW/R2DMj/Bn8KKgl5/WD8JzkQ7uIHH374zlAhPt/5K+67Rceszoe2+SZAf8eGhSU8BzWe2umnq5e80cdU/Qvi49au6fyMcfcK3tXpyiw3J8La69TwB2/RRiRXTG5nt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZD6fgX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZD6fgX2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B20DC4CECE;
	Wed, 18 Dec 2024 10:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734517255;
	bh=Ab03XkBtUozzcDUMdRROIutgfm3vkMiKIL2A68fECHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZD6fgX2S68dJW4GP+MS3aRohCyuLVIN7F8Khpjr2vRlROwsLlMqczZPp6LAzRGy+
	 KBhc0RIvygKEB4Bk9ks8HLU2svTGV76k7x1NC2gCRVic0VzrIrvsuPG0AnvJs33B1S
	 96POBOWFBJeP5RoqdB7p7gOXsxDd4PQxqR3nSSe7L6/7+O1mijrGXfC+wWl3sqN6Vg
	 g/UNb8oc1Wy2UyCXm7YcA8xEJglEEKtiE+H6tkTbRJKbVl9z5rk0L/1UQGkAy5gVzL
	 LK+a9Q3srp2YP5pGsSKhJy1jxQs3E6zSIU8OcyK/GJqdlzrIyB2L3SFk0EzU/TkrR4
	 KoZaHHZaktfLQ==
Date: Wed, 18 Dec 2024 11:20:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v5 3/3] MAINTAINERS: add entry for Samsung Exynos mailbox
 driver
Message-ID: <67thhhblxntdoej3gzxj6qqwaalloztazujfydv22dl34lemir@ixipa4h2fnwm>
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-acpm-v4-upstream-mbox-v5-3-cd1d3951fe84@linaro.org>

On Tue, Dec 17, 2024 at 09:40:22AM +0000, Tudor Ambarus wrote:
> Add entry for the Samsung Exynos mailbox driver.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

