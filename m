Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FA16F0CA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319516; cv=none; b=SAds/CEil26NKSqgjKln8USqBYzenSBRNNQRNjMMfOUJiA/5MwR4+vyodPRioUqrsKQQNdEq7Q3O9HExJuw0rPR63pA1y/HmF0FBlT2HqBOiCeeled+JhbFdCNkvSc9Cvq68XGBRHlzntxsUxQ001Zt7ycXfy8dFn1xplYtNFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319516; c=relaxed/simple;
	bh=111O/5/1ojVV7OI8NIPGIbmOFNtTVFkol4UsxQyR9uU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gOaZ0ufig7zAVcBkHxsVonhoP1wmeg+drw+A7dHvrCPh8VLgkDHXTGmmyl2SKDaqEG5oJml6kfPGJb2Cn+VzHQ0p5VXpi4Paondyjql5qO5Sd+KZa7vNFvmiCeI3hR7x+CGBB9I5WdTCWBoAuE1R5xXI15dj5BcL64RJLOq95kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWONRY/9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWONRY/9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36830a54b34so34147f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Aug 2024 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724319513; x=1724924313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcAP1+UzidHHBut/wkiIQwc08/qanMcQw9/HOzcokdI=;
        b=fWONRY/9UMTzGG2Qzqvg0H7UBr3TB1U+gX5960uBT4/SWB360FJTy7nM/VXeoqAKQ2
         94cVylOhpoJ+8qh+jovXrAPviM5FaGdMQgarRt//YbuzpR6VMQPrXt5KKizz9K37WkJ9
         NT794Gzmzebjzbznq8rHw3dQnjBF/T/cIm3ddqWArD6wq/y2ol9SdbfmVXBUU72AZoaL
         X9N2fb2WtQDXGiBzkvhvZwyQ/ooOIEbbMBCD2P2epP4CnyGqtKvRBhcNJY78tBfqB4W7
         olua1koQa4puJthRGptKzKCgY02bGzzVOfogOGcVbymO6X78KGMIMoUNhZXBKmMlIiad
         zTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319513; x=1724924313;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcAP1+UzidHHBut/wkiIQwc08/qanMcQw9/HOzcokdI=;
        b=typZx/iu2f+9m4bra3f+wZvoiQdXq2259CWRbJFmoXCdlM6nMag4MotvV2AYkhamiH
         B0+PfOOtzuVFqRdgqfWmq5g6I+gS35a0U9reARTNqn0FIRbdR1kE107dTJ8khwaNxBdy
         MGl8cNqboKJwSv6AgywrQcMVDk4tM7HPlPczRm2s3NhyhUw0awE/xDEwj8gy5fDcU4bJ
         fxj/CgM1Q8hjP58+NrSFs1PgMqtz4FVZqfH9vegY9XjSvieDIsCM58wwTwFWE9OnNOpo
         d66QW3p4HQszcoQcRCXqgup9Va0uP5hJFHMim04GhjyXqhSrlwjzHrjHk8YFyPv/rtY/
         kyvA==
X-Forwarded-Encrypted: i=1; AJvYcCU3O2S25uwHMUdR9BEMN/qnYtU7EJOqe3ThJCaEDCDIHdxTZz7flJRjkN3wP5ig6/koZCysHwJc2nxxtDQcvr7IKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5zFB5a/eGIdOZi1vaOQIy3e5CrGPQzo7C/U+GYEa0zGmhp1N
	dynNZ5UOHiQ5NiE8ja/8yZGxpZtIqfdztFwV++y/jBSKDOMbBR08wEY0MaGGmQA=
X-Google-Smtp-Source: AGHT+IFJFErUAThi7f4GEL5kxSEupuPH+kbml2cXMv40hedr33cHGawmpp718dh+i0XjTApnjQJUxQ==
X-Received: by 2002:a5d:5e0f:0:b0:36b:b2a1:ef74 with SMTP id ffacd0b85a97d-372fd82f725mr1321582f8f.8.1724319512802;
        Thu, 22 Aug 2024 02:38:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730817a5acsm1221805f8f.64.2024.08.22.02.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:38:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kwanghoon Son <k.son@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
References: <CGME20240819075546epcas1p355a3c85ffcea2c43e8f1b2c69a0f3b4e@epcas1p3.samsung.com>
 <20240819-add_sysmmu-v1-1-799c0f3f607f@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynosautov9: Add dpum SysMMU
Message-Id: <172431951098.22090.17586720049616945954.b4-ty@linaro.org>
Date: Thu, 22 Aug 2024 11:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 19 Aug 2024 16:55:45 +0900, Kwanghoon Son wrote:
> Add System Memory Management Unit(SysMMU) for dpum also called iommu.
> 
> This sysmmu is version 7.4, which has same functionality as exynos850.
> 
> DPUM has 4 dma channel, each channel is mapped to one iommu.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov9: Add dpum SysMMU
      https://git.kernel.org/krzk/linux/c/71e0b08ed2a98e5ab5eb255fc86cda04205b141e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

