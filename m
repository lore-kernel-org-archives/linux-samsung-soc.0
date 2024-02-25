Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE0C18AF9
	for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877462; cv=none; b=pupbqiPde0HIOvK8HLmLYSdpmFTafWHr2SebaZ2+dzLu2IvdT8BT0NDSPmP5YKxQm9MA6XxltS+zARdK8L6AUNNHUNN7TnSpdqy19KX4uzbBZ0yGDvms+eLqRx6D7esYv6MvUpfHPcBf6Oeip9kaoLLJ18rXDi2SX9hwiGovqhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877462; c=relaxed/simple;
	bh=xSH+YB7t+3pdc8pXNR8f/jgF75lBsNqAWWrei3EbdTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jyQOKYADdIrb806eenU4piZk4x1S4M4WPH4FPWGWYu/jqH4YEVmQaDTDUDQo3Mx565JuJC/TeMO/CScGjVESuLs5cfqUVAGB34tKTbqyYuXzpbjFbXL7Pu7h7MixR3W/KYh23JmSmu8j59PNkYO1x1pVWpPxTYn2T9YmS6qg4+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsg9e3bc; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsg9e3bc"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d23a22233fso21393311fa.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Feb 2024 08:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877457; x=1709482257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwy9vyyCnZwGdt6lVtjOy3+PH4iIn9f2qsNf+7CIDLM=;
        b=gsg9e3bcBeM3GErg6f2g1mX4Lj5uGlZZGvoXEeiCsS5dzMIrJpw5LWXWgZudFqkoW2
         4HiNUUSMzoIqwp6K+azdbTCm7/ksLRJjPaH3SI07z5+0lS/AWaxblL6iff4q/id7bZ5u
         OcyQXVGq8+x+WH/SJtk5Qmtl4zL2qmYtpycQ0ZmZiFjKb8pe4tbqm3YUhM56pTBo0FFj
         JiRmmLV1yKeODPap1TdkTGaq3mhkfUZwqz+QoKQKxoQyfaTEnoGRcm3NTx/rEcAfrDYy
         zMcZWUSF9Z3262VRFAT/cHbZ7fEgP96aLWqLPBWvq2u3euS0QKAgpHM0iprLEl8amrjc
         L2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877457; x=1709482257;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwy9vyyCnZwGdt6lVtjOy3+PH4iIn9f2qsNf+7CIDLM=;
        b=YtX0FZAAdgRxUl9aoa+0hRBD1eoxtIWLAQ0ZRjZ+aHSY72ofMhTPTz81YALLrjmMP1
         sIOxRATO+AWctIS23r2xZ36PC3Bfm5ZXpMcRUaf8QH1wF3wTXgvCzGQ39EaBcjRhZmDS
         FmbGAlx+j2XxNuycczDznCPG3pxsnC2wrDwUkoKNQJVFh6wBsEuv2ltsAVM52AIcWbc7
         CQWwa7KxMbBIJshcVh/nrm6VTY6LkjOSik/JCB+m47VmS54GRtuwV9XnXdKAZ51g/m3a
         rt+N+YitesTZRo2ll7HFX6bKs2pIgHyDLfKIqem2o0yCcsKniNv95Qo/opTSh3rh/AXd
         Uohg==
X-Forwarded-Encrypted: i=1; AJvYcCW9W0O5QKlRS1qDZrAZpnZitYl586hTMizXju8RMK8KlP5ZM+LnRDGgK1KaMFjfu5W6SdkKE7jHmd6JFTrQA4N0pQr1My1pzxyRgto/MlLLNt4=
X-Gm-Message-State: AOJu0YwT5X1i2rHGA/bDUK0x65Y1i0jQTPT39s/5RZ25h1OOuDE/SwYe
	2azY53mHGhXc/MLdE14lf0VsnD4ZvXJV/8xhIr2wVPX5clKULAzEFc7YLjg1Aig=
X-Google-Smtp-Source: AGHT+IG8/ptAobua30//y2+R96EYFI741EQSKAHAi8ZfiArwF+v21fcfv5qDmbPTyXrvQSKw8DPEzw==
X-Received: by 2002:a2e:868e:0:b0:2d2:79c8:838e with SMTP id l14-20020a2e868e000000b002d279c8838emr2549906lji.40.1708877457033;
        Sun, 25 Feb 2024 08:10:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:10:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-5-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-5-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 04/15] clk: samsung: Reduce params count in
 exynos_register_cpu_clock()
Message-Id: <170887745504.215710.7797838794747602399.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:10:55 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:42 -0600, Sam Protsenko wrote:
> Pass CPU clock data structure to exynos_register_cpu_clock() instead of
> passing its fields separately there. That simplifies the signature of
> exynos_register_cpu_clock() and makes it easier to add more fields to
> struct samsung_cpu_clock later. This style follows the example of
> samsung_clk_register_pll().
> 
> No functional change.
> 
> [...]

Applied, thanks!

[04/15] clk: samsung: Reduce params count in exynos_register_cpu_clock()
        https://git.kernel.org/krzk/linux/c/84d42803e4f163b1b6cb4ae05d91af693a1985c2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

