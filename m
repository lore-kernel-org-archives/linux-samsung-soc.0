Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492950;
	b=biSAGVg+Afk1znNyRDah0WPKQAG2ahv23h+v4I7B6lKDlZf2Fr+rNpK9P/ADu0UB2Evk
	 XDPbtGDAEJxYjekUMk7VlHYxehuEy/a2ihxaq1bh3vkdiQz/fuCEOAY32nZ9dlqQMY6QW
	 r2o+3y0r8g3AxRm4ggYD7nRJwS5QUvEt6ubXLz8kR/Quvw6UtzxlIWnnIkRUrCVKLJjhL
	 0AfjEpEoRBI2/TDuydaTj8QuaVBwFjkMSYtMVdcgfYbypPvSGvJNkhfr3f/jDIssDcHiT
	 OslzAqiEbrNC2YZAyhQD0ZdDwfgrCyrwhjm9XEhF8qxAOg7ZgiROT39B0rC7ZnZN4Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492950;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=;
	b=CjGQg4JXUDvcQ4K9cLl+jrCVSAum/qkktxlrjFPf3DLMXbYHt4qWAqX2TfWQiQwNdq5o
	 i+9+HUK9RebiUDk9xrd2j4rX3CIjfDeGzfPbB66fO5q4EuuKBmS3DPm3cH4ebDntPKkRs
	 ke+xNKwq61H3KAaHhphBi3gz1uNb9FEdEyazyhq55L9r2o5eSCNDgyMD1K0LR9uSJ55ak
	 phbfmP/oJ0kYgu241NQAl4J68Nh8RbiEWhGoZAPSE8SVAmxBekb2oeiAP9fcqPnFV/Dzi
	 zZUQcrhb+xlG9turP1FG6+HoGOMNHm0hl3MiehEzir3MWIxHpUKUuYUcUKHkzdgmh7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AxH+hKLI;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E3606A31B;
	Tue, 20 Oct 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=AxH+hKLI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792492947; x=1792752147;
	bh=FhY/buZq8qZcY3rN3OPgKMgzFsab5qOuy5WLXWX8or8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AxH+hKLIiEwKeOct9itNuDm1mwkpIA49KP6dHfhgR4qvK7aGgnAoyYcZ1e9+g3nb/
	 Zd52f0e924wL9/zFDreFCy2XInTxhjHTga5GMA+gRkOrt6aWjKc+QPeKmLd1b+ipLW
	 h6U7zTCrV51FhMl9UiWhgyGtHu6XNSXo61+lznKaXme+ywjiokhby4+xeC3QTCFz3S
	 jxW1WI9WoN417GtYMesAsEe90nhCABDasRBgkHAmDTsRm4DZaPVrAcWeWHP+dm9cjU
	 L/BBumpf4P7rY5M0NlHJnJ36uMmaWjnu8kITSnBgv6Re2RiSEDIjIEVI78l82IHtDM
	 l4u44QDwyahhA==
Date: Tue, 20 Oct 2026 10:42:21 +0000
To: Aiden Isik <aidenisik@protonmail.com>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Aiden Isik <aidenisik@member.fsf.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos: add initial support for Samsung Galaxy Watch FE
Message-ID: <5CDdVVnZEwA25WkRzHJtuO-Tw47UZGTEFrZ9SBbQ2ax1bG9_OUemLDoX5C-TzyFyS5WxuFauKFU11QGk08RM0_Nn_3HGrglq0AR7wr8IggU=@protonmail.com>
In-Reply-To: <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261020-eminent-juicy-woodlouse-c3fd24@quoll> <pyssceEfVM7C-RyMLXJw8UV4wTs-zyDxywEasLdafttU1LwckC7RjzO4BvAhElk2ExTaXVZYZ0NSQ82FcgBFXSrsGmj2TtBQ7HN0vv7gEOw=@protonmail.com>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 72be47aef9cb2283fc2490f8c7ce36d8a972c2ee
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

> Is it a wording issue? I don't depend on actual driver code in the DTS,
> only bindings for the hardware they drive, so maybe I could make
> that more clear?

To elaborate on this, I listed that as a dependency because that patch adds
the compatible string for the watchdog timer, and I was also under the
impression that drivers must be already in-tree before a DTS patch which
uses the hardware the drivers support can be applied (otherwise you
would be merging a DTS of which parts do not work as the prerequisite
drivers are not in the kernel).

Is this not the case?

Kind regards,
- Aiden Isik

