Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA31158557;
	Thu,  1 Aug 2024 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495309; cv=none; b=FEw3bK6A+1BhPloeHB/9UDTIDNMbI//oRbVyw0ZmTzU9DN4nH/lpL11+aR85xfSbOuOQzJh+TE50bZdWmK2ORs41Xp6rd063SPstyRCvHjC237jAsL9HIHSrenN1oz+84vjYAcTEzk4A6nv00l3D9HyNmzK4G/sRlQ6TbBmexR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495309; c=relaxed/simple;
	bh=yBHTc+YfefDNuFZSbdUt+ev72AY1+QGyX9tR7wDxkJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AwuvHPm85QfBR9budR6APcKjKlwuV830wzXjpWT3EK+siU4qx6QiBo7TkI059vcLpP7OFk/Ybvk8qkV81RL8cIBqPRN7tEzHEbkIS/iH3aDzbiq5mflWnf+s7o/v2wkedwVca9N/AGn08JdkA21a7N9HrB+7ejCFlJZuAQFbae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIj8rlMK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIj8rlMK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031C5C4AF0A;
	Thu,  1 Aug 2024 06:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495308;
	bh=yBHTc+YfefDNuFZSbdUt+ev72AY1+QGyX9tR7wDxkJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kIj8rlMKohw4/Q+qvxeFSj9uvdCa5Cxu8EY16CjddrZsUXZGVoq06TwfsRA52KDHx
	 MZZu6LQq2vdn7MFkvRAymI2iJTky/Kws++70s9pwojJaB1/ybOe2S8XLERdeZZ3i9c
	 XlBVf3aj1iggoVd38wYDWCbdG3M7POvRex4adM5ohU4fBSs54HQ6H3I4WcBL8Av/0Q
	 kR4yYYpS8VTLStj1sML45EQT3Z9zWdZl63m+G5vkMPYk2XKFEqzhRCUWLrb+Aj6T1q
	 nIj77xYrzE/SQlV4d1vVQ0Gl84PUQ484a7eVTHzim07KMcfIpK9fze7KuGpTBYBaBo
	 UUKZVrdzbUg7w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710-phy-field-prep-v1-1-2fa3f7dc4fc7@linaro.org>
References: <20240710-phy-field-prep-v1-1-2fa3f7dc4fc7@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: convert some FIELD_PREP_CONST()
 to FIELD_PREP()
Message-Id: <172249530458.256913.1079769256598597448.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 12:25:04 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Wed, 10 Jul 2024 07:45:07 +0100, André Draszik wrote:
> Use of FIELD_PREP_CONST() was a thinko - it's meant to be used for
> (constant) initialisers, not constant values.
> 
> Use FIELD_PREP() where possible. It has better error checking and is
> therefore the preferred macro to use in those cases.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: exynos5-usbdrd: convert some FIELD_PREP_CONST() to FIELD_PREP()
      commit: 7e6c2ffe6c2284a10f77079670e3b26b43df4443

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

