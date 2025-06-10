Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F4283FE1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543839; cv=none; b=YVECZ7Md+i6+IhcA3+5Vn+RF2ZqIhiZKz78w64Uix+5raAdgGuyyfIb7nfNRUEr8Ve6EY3SguTI2jBIChoefLuK4Yt+A5FO35nKMCD/LyDTg0f3ikJt3O06vYp263AFBuFZ8mLQ3B0mVDbp2sy4hKP764yTv4QDWXthXgYZWuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543839; c=relaxed/simple;
	bh=yyhzPDdF8NeOOeZr2SZOX9HHHQ5D7bOqPKd37iQiSFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qyilbDhysdE1VnggXILN4D1OcTzS4NOliXcMEre7FvHPwRDj4DB401oUgz10Z7ToQkGfdp8LBYrXFlG327+27qMjGmUfQLwBO+YVK/n8CJXdHV0mkyT2S521vOaPw19PiEvordKSD9TxW5NaKEFi2/TcuwmyL/6gVr0g0i3gaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEZC9Q1T; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEZC9Q1T"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso455464f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543835; x=1750148635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=hEZC9Q1TgiXTu95oc+6NtCo1BRbnOHrDqPXM+MQe97jPplFgtUdf13p/+l/jivtpqn
         AVEQjBzDe0FJXPE6Qt6a8uqrNr2fPd42ABmxo+Ea3b2F/O2bpgYVKdN+pbeS5ePPw1cm
         akKeS/vsivEpT4A4OhOoE989960LD37RLNNrych+3AkFBsAUaYDYEI8fWIB+kyRCdOYs
         LHNItha/qRFBQeNZEdhYjhtgiFYAGupfM9a1F8cMJL3gN3y8zWcjShQ6qS+/8UxWnLa0
         WdUy5IvMd8OPHPs55WlLsoulOhhLt1FIAQwpR257JdBImWFyg/7ZWBilWCccOvj0herZ
         M3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543835; x=1750148635;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=HjRHw/DsJa5TeEIWlLxTxGV6NZVkU85XQ3AWo9cFbJnUt0W5/t/ASsni3kaMFmYVvG
         yu467/lamGwXsYU2EHpPsdtoDdVdo9ZzGJmEuePUM2RQCz+09Cm8MPFSogMcZA5mPCMc
         4nVTI0z22D20wclrb3qAEg/3GPDaY8qlp5FanEm94FZc2tZrmB4Xym9TSoqLa2XoMl90
         /XlcOv8ViimRMnJCq8F5A/k7MG2S059N0dySHRN8yU9rs2ZrbRiCHBubp8d11EucsioT
         rj4adsp3nFiNb2YFhMNBMox/Qq3QfwzTRpedyAAD1wIwOEhmPFQJKtnovEcyDTs8tl3C
         8uUg==
X-Forwarded-Encrypted: i=1; AJvYcCXFqeVLlXUZii/3OBJ/6jIHRdBnkFrsCxkEbl3Ks0nuzf0e2+sDSsKXG1bGS9Sp6x2fUeTVxRf9W4HP2gLkVNIBpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpeLgPpR4NWTSiOZTs4/Q4QBmrPuGRNAghJ/4/95xYNW/58x1V
	fTvy3R3oD8MQ0HdhxXtCvvIzQJZG+vSXlcimyroE3XWWhbdsL9/j/ykR7M+O1aX/N6U=
X-Gm-Gg: ASbGncvFAeFDKjDuT95QySynZYDs2pzTkxyPlWlmPtWSbh14GghBGyw3462+YTfdIoB
	xCHMqufZhWOeyRJVdbbdBIRpagq4m2PmUgQ+GmQmpZCZwph84lbAAjUC2/Z3upZP3NyTwj8AY3K
	fyh5+ai4WdZ+8I+RTh8Gxa4bfC/keStBq9ozPDa/hORjy88w5bnnqgINBHspMVR2N8v6ylPdGkH
	qcb4ai7pq0XJCfJddnSC5jC6IxZwiYW8H0jhx5n9UGFTSmznaAev6ogDxj6YEjE5ucDTIkYlSV3
	Jg9gRWhmoYd+77GJ6Z1OStw4BL0V3LGmimAo78HmU8IJ9aMj9dNAH0CuAue3I3/ExIO/JQsoXuc
	tYSoh0g==
X-Google-Smtp-Source: AGHT+IF3umgoC1MXVewYqSd6NXb0BxRbXdgsSHg+n+0cmqeui+0FYUC+7otmqctsYZrl7Ig6A8Aq0g==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137414f8f.2.1749543835438;
        Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Subject: Re: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Message-Id: <174954383375.117835.6950854237763688291.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 03 Jun 2025 16:43:18 +0100, André Draszik wrote:
> The patches fix some errors in the gs101 clock driver as well as a
> trivial comment typo in the Exynos E850 clock driver.
> 
> Cheers,
> Andre
> 
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      https://git.kernel.org/krzk/linux/c/29a9361f0b50be2b16d308695e30ee030fedea2c
[2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      https://git.kernel.org/krzk/linux/c/ca243e653f71d8c4724a68c9033923f945b1084d
[3/3] clk: samsung: exynos850: fix a comment
      https://git.kernel.org/krzk/linux/c/320e7efce30e2613c2c7877acc46a8e71192cdcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

