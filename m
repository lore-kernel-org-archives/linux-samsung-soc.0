Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F02040BC
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733148138; cv=none; b=hlwwmuhk7t+6rI7DOj59lHMEDGkrTw7IGvioY28IbAXY0b61VVAFc37Xzps4y0QwfghR9mtb1A3McpIbsiRgWLmvkwf/5vbiELy0yGj2W6B/uEt+oAnwWEttwplicgSXokhUokDGLQWtOCjj6qjO2Uy15/3NCZWBb1cPuP929mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733148138; c=relaxed/simple;
	bh=xEY/MYEzww5v0mEutJbZHHy0DYJ5xp3n5zeADP54oQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=smk80Og+FWm5SHa4pcqQD7VgylUteb5DMJGiUQqhlxqpiglbG6+hkZIBOAPDfbnmUsfZ1lQxoMCJZyj7FT6tc9SIEW+ADesakVRgH6HQHywKymYWz4/FKe5gUtP8AlplZe8yJ7fRpvIRgE+YZV/nWe6rTThP88lTo2vHcoRFHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Il36N5Xd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Il36N5Xd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a36b82b7so3615525e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148135; x=1733752935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFdTL5VEPeunnOwNpwyKpiYpCh3mlklnlXFkbGWKFNQ=;
        b=Il36N5XdHOijTPmyx0W4A+hb9woYKhF7acX1cEwefc1A0tcVqnQGodbUqy9m6K+5yu
         kkNIxMy/zjGi598u8K9lGyKEaR3raSjwcnccA8ctpoHUcCILqlm1LL6lFwbCAsozTJk/
         xcKnEuAi0+5S6dAg1bJhMLFDiFMW4A76QMsmHrD1tFaU4jCljMZwdR90mrFxVVDSLRag
         zJo4fXImBDclVoGlw++fRvE/xdRoQnjlbyjp1SZFwhd9GOiVybdtmjsYYsQQHh1d1vs7
         KATzl7crdPgDrkJN28ielGb+NlbdG1LEmpOGCPqUch4eEVGQTzPS9n3tTUje6vaTxgK8
         dQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148135; x=1733752935;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFdTL5VEPeunnOwNpwyKpiYpCh3mlklnlXFkbGWKFNQ=;
        b=Wk2fd6bMhcRQL9VmfbdoHu4vqBOuCC7PAMiGIVcJVstl3ly+OhvF3Vl0pTNbsJoWMO
         lSRonsEfXTt5Hc0bSs4D6nq4SWUgBtL6e/tWU3rBMeAQZo0ffV+1PH53LgLX2aIP7gw+
         GzV+nUhKb48KtSTBZLSC03PKvS9oP6ZQ1VSGVkqsNYDq0MN1ZY8L5ngy6i2ZkZtsGX3Y
         bOvnHF41TcBOo6xqC8G72OVZbmkuMngz7CbOHunpXJp7Vlhly21ghWEeoHS6FHVvcDZk
         A4H/45NsGzzo+lnWpAXuwTsj8FQWg+cpPK12akNdEFnZ7RjuP3RwxE7S9MtNCD8gVz5I
         D+vg==
X-Forwarded-Encrypted: i=1; AJvYcCVr6csBqJX4Iv2kXnGUDNIoRN8oXXH6aYAhP7g5We3lmWOxUs+K0rHZgi0LOkioZIAaUDORhzd0k4FDbg7hBB0Afw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycB4Qf4ZovLbx6iobVDF4s4y4z3MyBTsLBeuwN5R5hXjinQ019
	DUliTyBpQKu0TgUDXu6itpXeA0HRdi6bZ7O3Cvn1K5ct0YG3IIMXwaRQhWruJ4U=
X-Gm-Gg: ASbGncszy4+9YLN3eB90dvtcfvR1Nl5PpltrrnmooEnJY61mEwi0fC0OjC3kKPwLLzj
	EOpZG9SHfW4HganxjwtphAoD2LySwRryhjnDc646eNttMMJg5MnDTYkbrvENOywUitpd67gNQex
	5jzV572KHKaqYNC4qT/SXZc0ulR319RAm53Q9Dh9KnmNVfd1yJPpDuFJA2CPJNS2fN5Vri3RR6U
	Xb2ewsgcd3/aUHVMUaEDzCg60jODiS6jk8lyQzLyxn2TpRXsNg+rPyXFet37u8g
X-Google-Smtp-Source: AGHT+IGxwUtz2qX6sl87AP1MAktuEdNdgWw/JHxE62KrZvo42zm/39LbfbWZORwukdi9PptFej8bKQ==
X-Received: by 2002:a05:600c:1d1e:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-434a9e1ce8emr81193255e9.8.1733148133134;
        Mon, 02 Dec 2024 06:02:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7691b0sm184502815e9.17.2024.12.02.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:02:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sota4Ever <wachiturroxd150@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
Subject: Re: [PATCH v3 0/2] Add support for Samsung Galaxy S20 FE
 (SM-G780F/r8s) [SoC Exynos990]
Message-Id: <173314813121.47662.7729149107568659652.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:02:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Nov 2024 14:36:34 +0000, Sota4Ever wrote:
> From: Denzeel Oliva <wachiturroxd150@gmail.com>
> 
> Hello :),
> 
> I'm a newbie and I started getting interested 1 year ago.
> Well, that's the beginning,
> until I learn more about kernels and the C language,
> which is important in that.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
      https://git.kernel.org/krzk/linux/c/9163693d368f00c02fb8a07beabe2c2f18fe0a32
[2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
      https://git.kernel.org/krzk/linux/c/706119fbbdff2f95a62d1665fb4234ebe4e9392c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

