Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492034;
	b=30ViRZCyFmAoYveCDd5tz88k1mh+wH2glbybcM/TRFFftHOk5Wwyxv2xqjqT6ws9ylMS
	 GUFrUzahOlasC4mqkP4ttaxIHY0vJ7nrg8OAVRGLy6m2yAT12+yXRIT0qqp/cenReyTG4
	 ENyA0RzhN/LakUbGwlROMMZTLz3kIL/nhD3B5lEl1LcoNqxhEI3RCGpJh1N7DgK+1uxT6
	 kCSz2fyBGOdiZ1Z/VQeoTgNrmg3VB1QAc7d3VYqErYDCgmrc6pdKBEtskb33mqNcFwsfA
	 KZ7ZWDiOY12PZReRJyS3cHWM72Wkm4//RMDyCKMKxQtXmCn0w8xbA7ApA3AmCUul+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492034;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=;
	b=zfehExiHGwfsfXAV6O9N5DWOiCG1UZC7CkBXSlQWK9h+62w4M6arjbOuUm0AOXZqQRO3
	 fQ5eO1iHcp6L8BnwScPio46ZOPzuMy74BCsIK7y3ONMl8TkKg/bpfnkm85YooiKMYMSkp
	 9B6zPbp8vsS35v5L+t0D11bAtZRWYZgVYeD9kEc1j29GNqt0t/sTBl7NCpR1Y7Bjgi7RF
	 415nE/HZop6LB/BEWHLEBkTlU1xGHtotno4V4n/YI24h5FW4aOOYuK6ygWPXcLSgvJ9W3
	 FwrbmBjR68AIfe2eWF/b6itCyPI6wcBWEr8AJ4MnxxlgoGD98Jh4RgYuG2xFOPyQ8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=df16b4rZ;
	arc=none smtp.remote-ip=185.70.43.25
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1E606A320
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 10:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA1E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=df16b4rZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492031; x=1792751231;
	bh=/9SxjfkPBMGSwJHNywZJ/fVHoFLAInw0+z4Jckz+hCg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=df16b4rZju6WCMCD3p3UGKnP0ESVB9DEKjsYPJ2fW5bNaVzmzVYAqUwRMjQdZfcgJ
	 sq8L6UwDLGg4a27L1PeAy50+hV9SJ5Hm2cLOwOvDH5Wd9s79/NMAk6B9mLOuZEz9L6
	 LgdQ1XwyRoBuypsbtRqWrcLsBFkCnVQaJk5N5VSxs2tAk1IepZukbffrAOjalzsYxU
	 cBT90y4d190ej7DDGACf3HHKMy3sf3nj2Nz6BKXnS4AaAvw/qfkRmOWX97/VYHDhPG
	 h8NT0UBB8aFdxo5emOCcatvqzWWnDkHNkdeGxBZ/xq0/V6fHDfaYKq/WQlhBt0Wpdq
	 RLMVaWCqC0VxA==
Date: Tue, 20 Oct 2026 10:27:06 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
In-Reply-To: <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 95ccd282feead4333ddd8254b6582c6fa33f7465
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

Hi Krzysztof,

> DTS cannot depend on drivers. Please fix your code, to avoid that.
> Dropping from my queue.

What exactly do you mean by this? The DTS describes the
hardware in the system, which requires drivers to drive it.

Is it a wording issue? I don't depend on actual driver code in the DTS,
only bindings for the hardware they drive, so maybe I could make
that more clear?

Kind regards,
- Aiden Isik
