Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501018;
	b=fWTsAViDij4ZodFdvwqH6NpSRMhqS1IV5IcN8hvjI1CLbGyljgCt26l86hDvM2RZZ1K/
	 HtpEnXxLzJ2Q/ZFyfaIC12MX5OGcD0O6nobeumVUu2hB/PBwFBapLE6/i7LwUo8+nvdua
	 lzpVaEJpGjHm8VdEZ1F/KpVs14QEC9aP0VyxRDrVrMpJK24K3qzBr9y++RSfPiBzXY73i
	 8jXajFRS0bcbssEZcAZrDUcpUAK+cSMdT9ab3fpBa/WgKwYDg76VRA0A08OyL+fU0E/hb
	 KitPSEuZYT78wb9CVMFmcaAzke0fM5JHBUPFgFWnCs2yNRkQ8MUe8yJj3ovoYUooQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501018;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=;
	b=Oler/xlpznARtkAZiZEidHHrN2luyZq2TysaCwQxSJKnBB1Na0T8Ml7QDa6NqPXfVBF+
	 Nj4iyMQK0Fj0o7tE9j7KQth3RdH+/fGlJ/vGeevbMgY52iEoJBOFdKmoZ2sbTStWE4Iwg
	 rtxhzgEwbWQ8E/GYpEwl0RdYvuZw32D1X68RGXxbeCRWoe79/kTO0ol9mKyJr0N+/Qi2P
	 DomQeMY84If8Jgw7TvY/9sueklRbKXRFDPdv0Irk71h1FJfpTCOzOYNIo0JwZ7/TBvw0c
	 J1HQAdUyjVP+Lb0SbIFLG3yc9HJMXHPcWgwCDpBLaTKFmbKrVQO2oFmqSl08tZSoLzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zpsirt15;
	arc=none smtp.remote-ip=109.224.244.28
Received: from mail-24428.protonmail.ch (mail-24428.protonmail.ch [109.224.244.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7697606A31F;
	Tue, 20 Oct 2026 12:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7697606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zpsirt15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792501014; x=1792760214;
	bh=w/aZgrm7dgCOsexbLaT4aECuHA6/h9us0ehoDpa7RA0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Zpsirt15KyfTrH31JaJcCMcTT7NRbu+8WsdQXGrljWHUk0wPUCmI+c7cfUXvxOLhD
	 ixLe55UCsM4AFHDxmvTpzIGdgLqeHTj7imPf8z7gq7Nsf4belrgBT2AIn+J7yc6hHB
	 Wd8Re/jFOvMKNKZjNEHJ808PA7qPR8ho9KcIw2Yo1ydoPwLkMH1ENkD2SOWhR5Rtys
	 /TMt30ne/rsY6s8/Im9uMZ/m2pF2ou+2sfLvlxzu088vi6yWciHQRckpmg7VcE467F
	 93osPHsNTTzNc+nWK3Tz/4poHFsBafCwUnjp0HpKFyyFzp8kpa8ZTSFq7UmmYOJGM1
	 hOUNOmYp6DNLw==
Date: Tue, 20 Oct 2026 12:56:48 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <s4UILXDPoM5J79laZ-Kd-LqQhFFKEy6vh8axrHJUAQ2EP4R1HOmcCyV0xtu_LhKfTBHk49bkb3E9qD44d7LoeRAuIA8wzfEjPrF-sJ2xFnE=@protonmail.com>
In-Reply-To: <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com> <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com> <e4af2bce-7bfa-463b-927c-9641d74e0e8e@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: b772592dfa4fb31ed61ac52e603a69298ce5b717
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

> That was never the case. See maintainer soc profiles.

Thanks. I have now read maintainer-soc.rst, and will drop the watchdog node
until its compatible is fully in-tree.

Thanks for your patience with my patchsets.

Kind regards,
- Aiden Isik
