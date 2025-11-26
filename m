Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8473195EC;
	Wed, 26 Nov 2025 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149046; cv=none; b=aA9al8zHpMKSHu7G1+oiP+2n8u8nFcK/FK3OiK1ELe6cq+fwq7Np+1U2rfMFapxahGQ4mmC9n76KKz96CgyzvausvyxETAxfpCTLyR+zLr/s1dr42C7ST1jHqFgFUzkKuZfclmq/5jiU6nCaKUYrWzxyp9B9a6lsOg/jPkVZ96A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149046; c=relaxed/simple;
	bh=CP70fC/j4+SpEUytdhUjP0jnYGxEgjsOyK0+A0SlP58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBUevWo1jgLRfd4x2f1XckPFB1KHeB9BZeJerDXrDRNChS+TIGaTWz3at9SEIdAjVBPBdCQgGYPrjaNy7+kou1hrZhGARUbLGb2WM567JOOC5dBjeDdJ666BAeqC2+9QEaeHXl2GPS1Qo2AAI7M6YCGugeUSsGbJFz3TX2r2jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkHhohhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkHhohhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730CFC116D0;
	Wed, 26 Nov 2025 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149044;
	bh=CP70fC/j4+SpEUytdhUjP0jnYGxEgjsOyK0+A0SlP58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FkHhohhuTxvgK8J6GeyMAk/X38BBmZ85TbRvSeMd4hT5AyY8rvrZavicyn1BhN+7L
	 ocpb32Pn7Qq/HGNN5nfB91yVmJbizG+Tg3051F7QvhhzteH9JlkD8NpNkOyoq8C3eY
	 qSOL2XV3YUZN9hIKw3BTTAtmPlB26v3EEcKg79OJiv7TI3gY1sPru75oNRtIQ1+uVJ
	 fZbOXMnpNhKjAD1ZgQHUombN0yS89RobjMKIX9L/Bh6WCjnaBnWYAEc4Vk9r/v2B9I
	 HVcFjw0YGgwiVMWJu52KX/ur1LS3tDog647MXW1O3qYumOSDaItaXc85YcH50rG6DG
	 /TjuzIp4norGA==
Date: Wed, 26 Nov 2025 10:24:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <20251126-mysterious-pearl-cuckoo-b45d59@kuoka>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>

On Tue, Nov 25, 2025 at 04:12:42PM +0100, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> Add an exception to let the secondary CPU boot.

Please say here why.

> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Best regards,
Krzysztof

