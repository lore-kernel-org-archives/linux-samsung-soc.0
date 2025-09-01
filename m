Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333A259CBB
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756708403; cv=none; b=tFnq3J5b+bQ5eQhr/CsbTinnPWokUPkxtnabnulK8ls/+2R6L3x1DVQaihiLrxaGRr0Hv/rPiLosmOHpcflaZzCHsA15BxPR6wHo1urecwxt8OCkk4H6oJzkNOkh2zTD0lTw+CpbXdCGWMvlWFmX2hbjjIAGZ4e83YLpkqpJ7No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756708403; c=relaxed/simple;
	bh=+CeJXa+e4zK/6sG28nGzvsAwOcZbN6tT4ayz7cnNcJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YBW3WKJxKdw0LCSmStP/mvrlc9XPhsTc8HQlkfmJDPwhswhGk0fczI/FCTQWaROJqEbKebmkzEltCFNj1MIHFQpsvL5+j41LHusNAMUi1zUxwrx140Kak6yK/atn4DpC4Rak36u/o6rgDId/Q967QxU/6IXg+zhXIX6qL5c4Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUH1RrNn; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUH1RrNn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61cbf01e472so745088a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756708400; x=1757313200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=PUH1RrNnX/sGj0uVxSftlS47ts2qMTvfJtWGC1Id158DGBvbma8oIXFMxW7/2p147c
         0TVzzBq2YelCPXRGg9x/yFVpbIj1M0lssPuj7cBc7SZCTsrodalpoq/Q1r9OO+z0mwIq
         dxix2dgQ5Wms0deyjI75QDkwQ2l108rIjJDOhaH4LQf5of9yX/Kp4r+fOuJVRA1nSIR1
         1D4aG1bmBuiyLNDZjdRr3qq6diAlR7bh8L0o9XAx+bvK/3BO1du3otBiDokR5tB4KvF+
         bA23umEJJtg3etLSj7GavtHHNSPbqEBd+ZA9uAVoFt/2zgxX8AL/7Ofmm/8tZNvMZcN2
         to9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756708400; x=1757313200;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT25ONXdlRJv+CRudnnHBniNSpVv/dBQXOd0f5NOe1o=;
        b=OXL0Ofbl+IZ5mrmekM62lXFNJgW/NwyWHJvVzW14gRz9fM9LZwrhfky2h37P4z195S
         6jVJnGXaK8agROuAy/My5YuC+lr1liUZ5P0Ks82Y65Y5SBwUENqFGHRC2KYgiRl0CU3I
         lC2ia4nwBOx73RJrYkTbu4FpgSW598vlj3K5eRnnpo/QKuGRUbwc2XWynEVPPW+BR/Ep
         Yy3qhBCMfheemATMmjRDhsRWe5O33CZMLgvFndTULQ9GoKooQA1vO20Dn9rRneIGn+yf
         rCCl30Zd4yAKLH3s/DWO66UT8ZEfwbMCgfilmanqRAlKUrfIcvP0uofIBIVVQI1VvK1p
         r7GA==
X-Forwarded-Encrypted: i=1; AJvYcCUPmXrwX5Um243yZ1SYSkPJ+WtkXWT4djlBjPLZUpvEKMP+2P/4Z8my/wfQcPv3aaPMFvWf04GwjrvErMFNwrpL6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwlksahGjn360BL2HUP9GSEx3uQZsynaajWT0kH5tV4PRUVzs
	IUa65yPJakaRrwjr+mEAKeVr7AT8Z6+S3HquRhCbdv3H45yGa8LIVOGBiYmaLICqfGA=
X-Gm-Gg: ASbGncv/honk+yirpY+s+9eRQTCCEAy1bJUIr+Ks2Qf3zKo+VWoGAnHkmXsr1QOaxAl
	S2l40K2c7cLKceWa8JO2Nlf2q8qqoCUR7eIFi4Fw54tsyRllABB9OQbD1ysU1K5UtvFil24XhcJ
	PeG2T+KgnV5NiDCYpwTuq/eQDnvMe1Ueqb/D5IglszuQK84GJCmptYa6/AcXLb0+lbUtuGFD1v0
	1ffRGbbGi1sP7/sPvQjdBYBMBcbHZqZYiwSw6GdNdhW/05WRiqU7wPDj2TloL4JB/k+HmZbR7vH
	5KWkU9rkQw7s0Ydfv4oxSc4t1uPDtvk8P1xYWV9uOOT7t8MSpjeSM8FibVbXtWvCoC5Ji3sSUZN
	UKuJsd8yKR2aPKFn2c9oZY3i38BH/kkH/XT3Dd30=
X-Google-Smtp-Source: AGHT+IH2EH71GqZysZaHULgZnawZA/ilqSzMTKNSHRHdyGYISzSRl8kS8S+lxJ5IgYxfEUW2K8qFqA==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id a640c23a62f3a-aff0edc4d6cmr519702266b.1.1756708399621;
        Sun, 31 Aug 2025 23:33:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0420ec9787sm266471866b.72.2025.08.31.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 23:33:18 -0700 (PDT)
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
In-Reply-To: <20250901051926.59970-2-ravi.patel@samsung.com>
References: <20250901051926.59970-1-ravi.patel@samsung.com>
 <CGME20250901054239epcas5p214f3d0a29b87eda7f9b671fe05ba4bf9@epcas5p2.samsung.com>
 <20250901051926.59970-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v4 1/6] dt-bindings: pinctrl: samsung: Add
 compatible for ARTPEC-8 SoC
Message-Id: <175670839704.114610.3984450537189054873.b4-ty@linaro.org>
Date: Mon, 01 Sep 2025 08:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 01 Sep 2025 10:49:21 +0530, Ravi Patel wrote:
> Document the compatible string for ARTPEC-8 SoC pinctrl block,
> which is similar to other Samsung SoC pinctrl blocks.
> 
> 

Applied, thanks!

[1/6] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-8 SoC
      https://git.kernel.org/pinctrl/samsung/c/03724b3496cb0272a5050a989ebf2494b1ff5a55

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

