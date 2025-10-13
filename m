Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74834BA2C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 01:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317294; cv=none; b=nJK4EDXdk+lr51dsuQyV9VmaWljSfNfzq/fkuybu4zvLfplY7eO095Dh2mI8yy5X3L/vt9coUfecR0XpSAStuHUPzK/iG1wP5lUZTTj+oH5xx1mttUEJU5hszPzvEZEgUHw3m0HejesYSWGhU71AZvZOTNxM0hbHUJBu0HHV+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317294; c=relaxed/simple;
	bh=dhrLxPGTCnTlpUoyVGvUo2ddd4H0lO2MQd8iMkm24hk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CPM5HBPGlMVTMyXtreQvp0s6IOr/yrJ5xIdlEiZRm6/3CmSLS4o/5jXLvuW1zz+16CCU0SsyUOsjxLfsvieKNGjliu/gQGRCgS+7ON15yjSTwxtORWf0Bf82OW6feIYpijV95XW4JkR4wTY0E6jltgQfggFdj3tyAejg2M4cBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3HK5yee; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3HK5yee"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-26816246a0aso8633375ad.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317292; x=1760922092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeD0ycGia2aeOxgxjZnlT8Vbvac6TmHq5j7KmcNWbBg=;
        b=r3HK5yeedWMBhfa0sYr+F+SLA2HAqukwK1kkftd9moxEbAJo4Oj3nDf4Q40DsHMmJl
         7/hJoemEvN5jh5h/hXpyscpunQ4Nm2hLgM/yRdWfYMJ9rArtRgBF5KVujjzun7903gfx
         h5+8wJEMeFnK1lw+XYEeqm8tgXXvDp/ZaOiH2C+keKa2TsuOm9soFf2klWvLJF9yb4SW
         d+0ABNI+gwAvO0bse3699P17g1wc9Hyl1lCaxBTyv1IaLIoilgNk540WLyaDi49EYc0J
         02tJw9h13nrC/6wHqLO8XEr7NkO5kLQLtTmKOm8cIcmd4W5VYGSwlDKl1XNpv1YQ6gCD
         98Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317292; x=1760922092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeD0ycGia2aeOxgxjZnlT8Vbvac6TmHq5j7KmcNWbBg=;
        b=Uv+ifid35PGw1VGPSV3uQEqklYbVZN1r9+MjZPKGbkA/6ZvU3nBWdBzqF/z7PThHwy
         0mIipptAAxEolqxCTHkoKAMlPENjivEoCbvYj7YWMEZ8PesXQEIhh25BQ/ZC+Ui+MQHz
         2CHpKA2Tbznfsw3kVbj8RbuJA+bDahfpb3maszeLVAwVXG2SDdQi3mR0l+P2+tPADI7x
         toNZaU88h4blW8nRIvIF8EX2m1HK1Rn0ZOvZRgF8Mle7szJ06sbvHU/oRKPvoDVTRZRU
         lkncN+BFqAalFAiJQqOHpKx4tgBbfa2N8Rz3gd196G80SJtvkkWBKiPkqsPcRALUmCH8
         h+rA==
X-Gm-Message-State: AOJu0YzuCNR8GpR3Dk9haWuMCTf5L3dgVOB4QM24DmnfbNnrs9WSIrgo
	VPlDtBE9+dawOtnLRJtDMAESK+tqlcK7MXopP0i283C6x2XbimuSXC+l1O6hYy1S7xQ=
X-Gm-Gg: ASbGncsm7ZziPQvz7+LE5BCRHyAMEZ9GJcbyxRax1grUmOwMXkMwOF4RWyshfLCZXuD
	iMfODGylj5RaIyGWBw1NMdh10QLaCJQDMJMnQSG8MQW9Tc+VGuFxsR2YqDWitcBoXKTC2PRcEb6
	trj1rFWGXbaDG05fuiZQVWe2bF3eMiZz2OzYdUpvtz2L1b/ILWtxB9kOke52cl0U4V7xkyW8UO/
	QB/ujwUSstkSweiwf67OnIDJilyUiu5Q0KWY8DXxA5TGU4CO3BaPNmPR2SeuHof37h+7xYq62mz
	2GUPe81zjN4XloW7vsVAhR+M1/SrKXpR1PTfbVUiZNVWhKfzKdLy6GozOK5TPwFgm4/RDWCj/ZG
	K1KbhX+458X/Sui1CParuXRqr5BVma3VGX+LrPHgmtr4R8dwzfDFkrWoMuWQ/a8ymf6Kt2V3kwU
	8O4IqKTg==
X-Google-Smtp-Source: AGHT+IHOaxNaAYL/G3bBHEMSSdgsFReOlc8/uFblf96ArsJ9WQV3cPQ/wzrsOXueFnV0tG611gnucQ==
X-Received: by 2002:a05:6a20:9383:b0:2df:b68d:f7e with SMTP id adf61e73a8af0-32da8461710mr14755652637.5.1760317291935;
        Sun, 12 Oct 2025 18:01:31 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-2-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
 <20250915095401.3699849-2-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: exynosautov920:
 add m2m clock definitions
Message-Id: <176031728689.32330.1215080941311408154.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 15 Sep 2025 15:23:59 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_M2M
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add m2m clock definitions
      https://git.kernel.org/krzk/linux/c/4914c17a76047ccbde24397cf9d406558183d756

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

