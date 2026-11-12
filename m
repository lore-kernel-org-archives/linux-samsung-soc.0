Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488000;
	b=ofYdlhXGD+Q9UWHkwom9Om+96LYpKeSvzzb1XlgDGUkSS+uok0bIOJ6WokrLaOZswvfN
	 FFZA+d6o4HorFH25zOW0BXptbllgcu9M2ul8y0Gn54Wm6VdU6pIjQxocLn5WuEdmzxThY
	 deFDMx/67qL2yGa2Bh8kBu+8UKp5sKNSZ9+AOip6EBsDNwsG5Y5RbcuFnkUmaIynRBXte
	 6iMrA75nfR+LTly8agDG99TLeShv4sXtUIT6gFIYy+/DJlyFR1Q/E1aaPHTJBfyN8zb4r
	 YEziOEP4QgJ1FiDjvs8T7hE3QIPL5RNaSHeKgUXTvxAinBMH3Fx551r7UDsPtO2DDhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488000;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jGP1b9jLSQAhw1LFbHdnVE1Cm2LzDCydg1pHvlgHSlU=;
	b=Sj9x83KclBtY8NKcDBSieVHmnzi1fEGcU3M9HSiU4OP+EKNK48dbdwNUzQPc9rDurIs3
	 6xtt3EYJkQW67LGUc06IuxE8R+5GkpMw+Lxd643SpfqfJUIW5/7buzhdhpvrRtPJjW0nK
	 vaTkdPsudv52twM6dVp/RgsuTB7qYGDLDUSxcpIEQtm/bhCMGv9YXBS9Ji0JfQjKvqKV9
	 Ftx+P8J5s+4VthXQyztSI8/ajyqGQko76xVa02sYdvzwUBLsEvsJHw6aGij6kLQZrndlo
	 HKa4qPsVQcoynMR4/oYn7NjPVEObuJVvD5YTzGU8wpwNMY7wKvhEZ02X7B/xtV2jU2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=m0BvharU;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1976606A32A;
	Thu, 12 Nov 2026 12:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1976606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=m0BvharU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794487998; x=1794747198;
	bh=jGP1b9jLSQAhw1LFbHdnVE1Cm2LzDCydg1pHvlgHSlU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m0BvharUtArG4OstXIzrvNfYNCC4VZhvXTlvV9msTyo7x6bfiVWEAQE3QcXUBin17
	 ub8mMN8L6PHCPEYXlNqEhJS7oBDtkHv3VVY5cd/r7f1MAqwfu7EMSRcowTj2HnZtnl
	 LU/ZuilRJb+1nmqI6MvC5mGv8VCGVWCVpgKVgIRozLTAo6XVcdxBqwKtgsMlhC+y3v
	 vR995jHgD6DhGvPmkZrSkwqnulBRwduA0fs4FezDJJJpflEH0e5gELUVYFkWTQ+hMV
	 No907ESqdTkXIgLwP98X69v9GqQNY3NLuAhM+BkS2IPvKHYpetIGwegv/3QMr8da3o
	 SLmaVZkaNGGFA==
Date: Thu, 12 Nov 2026 12:53:13 +0000
To: Vinod Koul <vkoul@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515 usbdrd phy
Message-ID: <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>
In-Reply-To: <avWeJqbpbLcWgq_R@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org> <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org> <avWeJqbpbLcWgq_R@parshuram>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: cb3b8ddeefb938cd47e6dcf3bc37b5939fef5922
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

> .n_phy_cfg does not exist.. Please fix this

As stated in the cover letter, this is introduced by dependency [1]:

> This patchset also depends on [1], due to using an
> exynos5_usbdrd_phy_drvdata member > (.n_phy_cfg) which was introduced to =
fix
> an out-of-bounds access bug.

> [1] - https://lore.kernel.org/all/20261020063559.3530901-1-selvarasu.g@sa=
msung.com/

Which has since been merged by yourself. I assume you just
looked at these patches in a different order so saw mine first?

Kind Regards,
- Aiden Isik
