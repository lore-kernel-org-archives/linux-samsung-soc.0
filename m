Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7318C914
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693274; cv=none; b=VzEAaCzV5BTQjqbZbpQcTkHSpDF+jK4i6bK7L+IRSZ0/g0MXTNapjpyLyyMC2IUAdt+prKsRRMBAe5dK2T/1MH0vb62j0poZFRIyYEOmwAc4Sf/8kbKa6HKBceGMVtn/NOxqohrnluST0uDJ7libqCZoisMD2JqffrkKcJGFGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693274; c=relaxed/simple;
	bh=bFaF5X37nnbw3hMYqmx+n7TDoxNSn1SB/CjCcsE9nMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JI1s6NtHP2l5TXHysnX2XNhIH0PL9gnDdJc4uYB7bgYEm+Xu4iQPOO+qsHn77ngPiRHPyWk7G/C3FRxqHii4y3w3VHksEYNCV8mEb9fTjAg0oN9NbYOYvPdNLK3gDnV4kG+Zu/rX4kKgezfkUdJM8DAHpXcjwgp8uYH5zlP60bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tak2QbAE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tak2QbAE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cde5c2700so93308f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727693271; x=1728298071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9yx7O20ucM00gTy0WD2oJzaj6MRUMveHzfeQhnTyOQ=;
        b=tak2QbAESHyVPgtHH/7g83uDdMXlqSRFPESBA5omnKlfqeDQrm9PGOy73cxrNx3Awe
         0DAggJlyqpvUfi6gsK91G0NgQAUyOHQXQHmGNsIAOLM+EU2wFqE+431guDD6Wnk1VCuS
         TbOYCFkyMcRdxdLioxISd0J1qsVkcQ190GBeN6XqR523fMS1ddwil/eMc7TbKJBXfvwc
         FhWg0HxxXi+AVpCAKKuN6TV9GTj9TBIQB10MzzRSwsi6kOIjuyvRr54cJ8FYypTv5rNN
         vxpgrA5QIn33NSnd8n90brKMXSKxgszvcbrhbS58tnjHw8kIREzm4acMieGeW9QHbsB3
         gO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693271; x=1728298071;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9yx7O20ucM00gTy0WD2oJzaj6MRUMveHzfeQhnTyOQ=;
        b=Acz7NGOTCgZ3SxT++libnpQ/Ft99BNqRDuUSomLZL42DR0e12ncuMnLKVDrrAkTMae
         yzyVTbUxnfcCPAGtU5AaxSq2ROryzOR2U2BlDUfYFO7qTSXUcMtIYrex7T5CV92kN0d4
         W21jkGfYJGs4h+ulDD0fW6yJYjd6jyRQwWDPIMkx5NpI8IB2EAOZEb50oVEB5Z+FuTKe
         CKGYPSm2NdcotjqtwZSRWutwoAEkV/EklMmiWGO/g7CYULDv/fU6PIHnde+YETMVmaii
         UuSYg4stIqFxiB0hImkAU/9da2g36+2jQK3q9L83ic0+wVkkRvhrdQtHYaNCfj72xeYO
         N9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWu9q8RLjRey7gvwdP1FaXL0mdWyu/GNH+He/MgruiCIweb1YtSEQWFfo7kLxarHAsuVkkLL3lo7UcS4RdbmO3TxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUlOEP6nW1iA7frt7Fnz5OxX6JWRRRPToqutZV9kAa5v0UanLH
	COHT+z9u4akaoaHjAeskHpSKmUvqZKrRu7ZW1wLX1G++jjp+iM5mq/gApykxNWQ=
X-Google-Smtp-Source: AGHT+IE4TuOPJco37bhfw2D/n1uVWa85Smlfhr4H+UsIH1XmyHCTzZmcLME3LFP54v6cpmwJ3rx/cg==
X-Received: by 2002:a05:6000:1acf:b0:374:ca43:ac00 with SMTP id ffacd0b85a97d-37cd5a7b59dmr3453834f8f.4.1727693270976;
        Mon, 30 Sep 2024 03:47:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6867sm8687593f8f.49.2024.09.30.03.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240826033118.4021727-1-cuigaosheng1@huawei.com>
References: <20240826033118.4021727-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ASoC: samsung: Remove obsoleted declaration for
 s3c64xx_ac97_setup_gpio
Message-Id: <172769326968.27428.11032180341378662225.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 26 Aug 2024 11:31:18 +0800, Gaosheng Cui wrote:
> The s3c64xx_ac97_setup_gpio() have been removed since
> commit 0d297df03890 ("ARM: s3c: simplify platform code"), and now
> it is useless, so remove it.
> 
> 

Applied, thanks!

[1/1] ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio
      https://git.kernel.org/krzk/linux/c/3a6ad95d97eb62a7b7c804ef7eeb329a1f697d00

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

