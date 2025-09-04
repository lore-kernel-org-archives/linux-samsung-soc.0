Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA763054E4
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993576; cv=none; b=Z454dnAE3NJ3W2QJRvXzZr8vhZac8gIO+MzUAhR/hJ43ylqTJYjVScA5IFbcOJRIS0BEzL5zHmJHj0uDZIqCr2BV2DJUAGln1hcyqQIpF8WKCYugak8iW9N0GcPRD18TNCNce86aRqnEJ7rKr0aWM+/dOCRfF0GIxBP7HvxZeVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993576; c=relaxed/simple;
	bh=gXxTjmeDzKTB71t19xBb7Wxglec5+6mU41Xm0qtDe5k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rn2iVxB/iIxYzSPJfRehaJHektqk0tCObl/DwKNP9fSAoWTf1sey1GVnaM3SdFAUdIgvrNyDm7+onBOnldDGpB0dVuDu/EJ720dXP5vYYWuQoLzNHNHLsqPsy+6VrloQSDCq4H/VUVGbCxGgqhnm6ya9I+7d9oaKAgtacFL61To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CXFlau1U; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CXFlau1U"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b00f6705945so10591666b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Sep 2025 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993573; x=1757598373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=CXFlau1UNt/Poc6gW4Z87Y6m7IFh83zTb3QHxjsXqPJP3vuw5FSJv4BhwDOd6L6p4y
         8bElfH/ctsxmfvjebSYnpZ/gTAeeGVrskS0tT/M86O9p7+PkCnaewEtI7/KOctchR78K
         zbH9K5QfI9dqHFy7hoMBqrFcItQbmQkVmXB0xJVT+LC8/hxOiTMia5WE3W3BlbP03Q3J
         jHKshro3NY9BN5b4gkSIgoTetUaBRYiPT0iITII2fwrQZT8Xvcelg5psmjpXKvYVffnG
         wfg1DJAWzvQBYwxDz9spgGHKMAGaC6JlvCmu4rWBgeGMT1ez0rEat8o+oMS38vk9eQZi
         cWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993573; x=1757598373;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ26RmHLaQWCbZPPgHAZQdVbT/ghy6v/A0FERV/jWuE=;
        b=X/qrd1xVH1Vd0bx0oRLJJTuSIp2SI9aMIQymLfKdfT/eeqVjPe0sg61msmhE9TvZQT
         IQdRTxWtYsztUvGnRjwwfX2vhA/4tenbzOL+b+dj5NQLh9ISyNhbWj9P83/XU95iGf7o
         uyQQND7U2/7vRGtusWJeU3MK0zQdDjYZMGPrkeEGa+FfYOMklHab9ztM4FWIYIbfbPCj
         OhNFgvYt6pgHoVDhmGO5KrKqre6CLwHvsVqMmCMs2SPLBkrmUXdelVFWFPpH4Ns2RhJ7
         4tSfkjByr4ECaLiJ8hVkbsXBllU4lW0eB5Rw4ZNzL/Y93bMh3oYHHjz7hAsU7slLnnf8
         39Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUpiy2FlnLe0B0NdPxMHmh4/MyLuMgdsZuwRVoMDe3CTSZqdHhlOCIISl6AKuzor7WjCW4haz3ejiF13UckrjDuJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3OsAlubGbPNzsNLznSy9YiXfSklj6pXpfIUhCTQWHSFm4VDFn
	yvNwOZm9E1u8WVSM0IIR89yU8KsxOra0rck3qyz2elcjf9r0nGP3MkCRUOX9QQENXW0=
X-Gm-Gg: ASbGncvxj/aIdj8Y/0SAPtS7zlENJWfn1HKJFq31TWhxwc7lW44XD1dfHln+rKxIG1x
	b2i52B4Z0YoAFOtVqJBr8w5ihMz9iyj6bQx8ZvGNbUQ/yyX8BM9j+2iYHE7e1uYIzZ/9PifGlqw
	c0Mf77xjM7ujtmvW3N/SpQeGPAiDuvAC0VIMjzkx5WCPS9NRs+ZxuPJkolCM+eeSin2PcnprNv+
	aE0ey28ogIdqxtLJK/tiyxW0R6Z4uYbaUHScvYxo3iLE1S7LaPOQiGsz3Gtf0u1lWjLVjPxTLUy
	6Bc2Hsruyqe0TSgO6qLabUnSd4wxPH7A309VM+IBBt+/JvyVc/8hcAViQIIPTmeX6OXBsGbEDaQ
	X/2wLJZyNcYm/Kl3jwyXjxdlotbgjp6w110mcp94JKYIchDzlZw==
X-Google-Smtp-Source: AGHT+IEQoqOwB2yGHXtT3U5ow0C3hw1fUocrSdNOZukUnko/TRqHkgL5aBTtZ+Kkhn/YxvPmHZWsUg==
X-Received: by 2002:a17:907:7e99:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-aff0f15c2c2mr1210879366b.9.1756993573122;
        Thu, 04 Sep 2025 06:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0413782b94sm1180634266b.35.2025.09.04.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:46:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
 swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
 hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250901051926.59970-6-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054259epcas5p13dfe6ccb7759af018a07403ceb1e86f4@epcas5p1.samsung.com>
 <20250901051926.59970-6-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly
 dts support
Message-Id: <175699357104.171312.5414348160649999670.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:25 +0530, Ravi Patel wrote:
> Add initial devcie tree for the ARTPEC-8 Grizzly board.
> The ARTPEC-8 Grizzly is a small board developed by Axis,
> based on the Axis ARTPEC-8 SoC.
> 
> 

Applied, thanks!

[5/6] arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
      https://git.kernel.org/krzk/linux/c/9e74b88c0a57f78dfd3017de435ae400d9b659d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

