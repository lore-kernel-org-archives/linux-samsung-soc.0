Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495215;
	b=1Fh8oxK9gjkwLrpL0kPCml6bY1+13B240k6hwESAHOHMNbHsezP0seaVF+xTqm0znHzD
	 fEVEgulQtEGlT9+jA7NNLFr0efXqHDHWUnTSxDZeD7jjhL34dw+JszWdnOz4KFuJ9mWAq
	 J6sNnGFbJ9YteN6v5bIHKti2toAfpRXpjvHOpTZpFpU/e3i21cNneUV/B8QIsfskKatwp
	 r8qAJBRCwm2eJ8SEpOqc1Ap6TAchmevsOfhd59/m6DMwsQZGII6mQbdYb3r2Uc2r1Ho1h
	 6Dphc47bnEANxQpiFhCvBMCnqCUlbsbeaCifZUwpyORPZP+fDJw9RIsjoXguhXYjeog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495215;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZFztjEr0ZQexLDh3Pann33lsXa1N2kU+5p5eWnif77Q=;
	b=ckYJnSiCySMdn4AIfuVSSyR5J+8WhtQ5pgm9RRpcWP6FGHTEEb81s276CatFBJTGW9+5
	 9IjEZ/xfEfKMCnk6UoUxcTvkF/cTdWYewqkOk4g9fdcp6bv9u0VRQ0X+pdttifqLc4ROJ
	 XV0nId5mpglYtmcmqT5Lv5GxhLU0J/Q6WhESSWH5L7PqInZM/osVvj6gvp7XM7QjSua4F
	 ey3rBFXWInGTEccIaYz9ZyFvpjQM7vCn3/2wNzcj4vcOuopeYtqXP5eBDwUBKk8SP/vUi
	 NXsqs+3ZHqcZTfOyQR+4ZzEtJfFlKAZZgTcLJh3hmhgwR0hHr+HMQdiDI7pXYl/jkZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=opUOeqbF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB960A2601;
	Tue, 20 Oct 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=opUOeqbF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3701F000C5;
	Tue, 20 Oct 2026 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495214;
	bh=ZFztjEr0ZQexLDh3Pann33lsXa1N2kU+5p5eWnif77Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=opUOeqbFYWlPOxOu67WIYDyUVn8DxngW37Z/PJCmqakLjfBd7R03IrVqhVLn4Pxn1
	 xXtjPDZtXPZ4+lVZh9LnYbXaPQxoNRVyNEUba4h5wRSi6MvAOfg/pkhkPV9FzntciH
	 4DyEkhU8VlmkxeapIGBYTSSTTjEhSrNx4EAJQ9vlM3FbjtRod51UwKUAtaAa+Epcvk
	 Jct/IxD/BUzRA5yGVQubYhWgKgzRd5goLLJiBZveR73XkzLUXDdoTcVYDtm4V5Lk4h
	 uXrW9ebh4QUd0RyamHsOBC/8GTXfqWIfiofVBfoKncjsp7DZZaNgnbUaQfbO9/0lDQ
	 q6d3gIcMf/w7w==
Message-ID: <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
Date: Tue, 20 Oct 2026 13:20:09 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for
 Samsung Galaxy Watch FE
To: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org>
 <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
 <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
 <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/10/2026 12:42, Aiden Isik wrote:
>> Is it a wording issue? I don't depend on actual driver code in the DTS,
>> only bindings for the hardware they drive, so maybe I could make
>> that more clear?
> 
> To elaborate on this, I listed that as a dependency because that patch adds
> the compatible string for the watchdog timer, and I was also under the
> impression that drivers must be already in-tree before a DTS patch which
> uses the hardware the drivers support can be applied (otherwise you
> would be merging a DTS of which parts do not work as the prerequisite
> drivers are not in the kernel).
> 
> Is this not the case?

That was never the case. See maintainer soc profiles.

Best regards,
Krzysztof
