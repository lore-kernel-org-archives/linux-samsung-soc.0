Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E833F8EBE;
	Mon, 17 Aug 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974225; cv=none; b=kTsChhQ0dIUGvL+J1PUEjVCZI6leGLugw7OEB8qdg9iVY+b+7SgAx7jD89aeXIes9Xfd5Iq/gW9fNf79re/pJ5OgYlO8zHNh2AM3UznHlTXCfGJeweOIyyqEYRTbWdyJcaQUDcpBYU+X4L2fxGw6F5qcseuSLaxZ51LvxbEzY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974225; c=relaxed/simple;
	bh=b9MKJxJV5vAuZcM23XdaSIgq4d2Yiv14ayV3TTGoMl4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOGBkMKVeE88fhjvGfne/ozPDi6goK4qwum7+8f13ntTao48cHae+jwzc5xXFNz8zlcRhH/iftL89fN4rY2c1oqkuALAU5M7Fu2zu/0Ob+RAQf1VWUHNnyArMP51pWsoLwhlBsa9i+o02cKTbZnMbC4CZPL2m9Bfww7n4Y3j4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=lvAQ7aqX; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="lvAQ7aqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786974219; x=1787233419;
	bh=b9MKJxJV5vAuZcM23XdaSIgq4d2Yiv14ayV3TTGoMl4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lvAQ7aqX0oXWAB3bkIwejQxqSdRgd5fTz16Kes+Khx0NGj5S5I67K7jnyCnf0m3Z1
	 xcLUBzPnGTNV0+P91vx7eOzN27Cc9KkTfGplbkUjnI2bgpQwe3g+izNXy74vSDj5E8
	 S7W+/pfIsdgyUv/1687gL7h5SD9E6qSuh+Z6pOxE8WzPaIjvE9yJ5q7HhyBF7qVkBV
	 tq5ZOTaVvdTBNDjZjHrU3yQcN3wLXGSZVPSsIwxMkURaoAEcMf02xAzTpQLZn+31vl
	 AQfD9S2VbdChcnEiA2ZVVi7ZhU4LGaO0MQp1ds/QgcGYhY8cldCU2TxMoUWCQpFteu
	 CF0IafeHGFEXg==
Date: Mon, 17 Aug 2026 13:43:36 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
Message-ID: <RwK7oMLsbaq-iXAaW_FlHc3yl355kfN_h4lpvXoLVOUDx2dMdRr0j3tAuVNb6Y2nnVWaiwHKu9nUK9iAZQOi76D9XuZjIH4UwRCaVhkgyOM=@protonmail.com>
In-Reply-To: <d592c554-5e43-48f8-a1bf-5dc6c6525c27@kernel.org>
References: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org> <20260817-for-next-lucky7-chipid-v1-1-eb2908705c0d@member.fsf.org> <d592c554-5e43-48f8-a1bf-5dc6c6525c27@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 6b1b7eec98b0ae89d941f57c5bfa429dc8d022af
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> > Add "samsung,exynos5515-chipid" compatible string to binding document.
> > Use the "samsung,exynos850-chipid" compatible, as it is the same on tha=
t
> > SoC as exynos5515.

> I do not see how you use "samsung,exynos850-chipid", probably you meant
> that devices are compatible? Just say that you add Exynos5515 ChipID
> fully compatible with foo bar (no differences in registers) instead of
> repeating the diff.

That is exactly what I meant, will fix in v2.

> s/exynos5515/Exynos5515/, in every commit msg

Will fix in v2. Thanks.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik
