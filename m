Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1DF1D9346
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 00:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760315169; cv=none; b=CwxMUpBYm/i2XfUn2ym9vmXXrAJ5T/hV70JoEkBMHXq8HW3S6RFc/qG5UfOzJ0gIwVGLG9llm0BCCqUL13kZb7FIoZBPwkaAr4lIX4ZMpxHzWDpg6gvsGCiEddk30Jmu5ONJx/5uDMD5xCOJldml4psx9qcNzA65w3TkEIUpIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760315169; c=relaxed/simple;
	bh=qkI2fr9nMZfALOyGjObaRxpnsyOdhK8rFNnreSoGoGE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RjUqtDs1gLM3bPPgyJIHhggL7pTNYlKBNeGgdLD+mUk3NzAhxrMtfO8NcP/jvvJuu8GZFS1RJ8IFId+UL0etdfoN7+T/qCEJarLq82eeSIvZZnmrnGH2/K6iWazLfrRea7Lj3itXLsLE9pL0oWq9m/PdGsTO7HHvekfcBeYf6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZVgnal4; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZVgnal4"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5509894ee9so104307a12.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Oct 2025 17:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760315167; x=1760919967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=;
        b=IZVgnal4TPPqm+BLGQR3Q68J2N7ADkxVk+y/3rAoQGbpG5cLWE1Cg7Z1OMa6Mw0KoM
         JCdZEsZ6v4bluXZqUIVA3dyClff+i+C698IBEWSIHPzJ3AplGx+mKw8Fr3gonRNKMchL
         B28SSZOe5Lh0c0VAkG4bXnSrni7JlVJb6tmVNAOuMD0tzoKRRjpp+6A8P8g594C5Sgar
         lM0LxTGC2cPP6Jguu/5CSs/96bJaTBcJA2STLul9TWueZlLVD+R4pk/4KvShzvT/IBXc
         b+vThXRS0Br/Ii1tTe5d6+qoIeHw/qJtESfVGCQwJhpIvcNqRw/qcmtIovdQKaozGFOq
         a5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760315167; x=1760919967;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52qW7t9qFGfmc8duc2ZnW0Dwh+huBp5wpeF7g/x2FgA=;
        b=ThMdeblW60FRnJlej2KuM90DAx1tdqzJt/0J2CPA3qF3cMJfZ4Dt/pOsBUoGIVg7Yv
         OcQcnc+YxY/kt7nli/SBHY6schmLdejJtfXbBq7YFA+CqNPm12dKNv6ok9guZLPPjJAo
         7qAVk+9/AQmoswneCBwBj6tf5AUgRPbRWZFprI2RDFTCTpdQys25ZdlkUlrLl6CC9kU7
         HllD3li0ZvyaTk/1sfP3ruw/0z6/5bxDtYOLl5i64z7mozwMTHm+G49rsjGKfl5If0BX
         NCcb8SfPHlUB/N7103Vkq8hA0+pbTxrm/oMAIL5ypbQ4VXxmETYn/0/L9hhqUUhmG4mz
         sisw==
X-Forwarded-Encrypted: i=1; AJvYcCUFChus/vuqeZDafe8Pp3T4xj3P1ILfsiKv2ThI6zRGouTYBltGkLumuRr5EEtzZjSRLooB4TQuQTTXGqUCJ78Dcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxcNkGL1c2wb0BUD3VrFBb9Mtgryhej95NbB4p2+RUI5pEv/ap
	KKwW1rLuKdoczIDYFAqPyDSr+4kby9tjwrBjIt7l5H/k4COtZQJIU36zo+jpgb4jQVw=
X-Gm-Gg: ASbGnctZfgmfk6STWtIWcaZcit3Ri5Ly/SDUWT3OulwpHPdp09Vtkon+ZcVaZpEYOMx
	SF/D6bnhqBcR9wm4JOXLUfKMzWgRejK9rY4Yrzl9F2vFBhFB2+aRLHYfLWm5KhtLOzz03xv1zEC
	aiJqJSQwqivLgVvS3Rwkx3DBJpRAkAhjzj2Wr+tFOMP9pAh2nstXVsqFe5H18Nhatshf3Zqb+aT
	EqD1pkBb47KLI7VVL8Eqgvmz7vbWp79tKb9umo0RVOxyFm0Obft/Kj12JPviprRkh6s+eb7k5tG
	yX2DD/uD8V91dskVZu/FB9H7okp94JpC3Op6p/t3He3oP5g/j88nXZpzWyejBBg2YkbNaznS+pP
	e3FNzeBrr8W/dO5slDcX838st+bRorZpjnUltGzR/pMBYA4vAOZvDiX94iqBCGZ61Enw8fSk=
X-Google-Smtp-Source: AGHT+IGvoh+AZ0SUxDtJK2K9IGdS0Lw3Mw50fcHGc3vf/lr8P7A3VShG6ttG1Wy2MqgJYHaTqL7WRQ==
X-Received: by 2002:a05:6a00:1250:b0:781:1bf7:8c66 with SMTP id d2e1a72fcca58-79387c1ae19mr13001682b3a.7.1760315167533;
        Sun, 12 Oct 2025 17:26:07 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm9624862b3a.38.2025.10.12.17.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:26:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-7-a40e77a73f16@disroot.org>
Subject: Re: (subset) [PATCH 7/7] arm64: dts: exynos7870-on7xelte: add
 bus-width to mmc0 node
Message-Id: <176031516254.11660.11521062491196215930.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 28 Sep 2025 22:13:58 +0530, Kaustabh Chakraborty wrote:
> Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
> assumes bus width to be 8 if not present in devicetree, so at least with
> respect to the Linux kernel, this doesn't introduce any functional
> changes. But other drivers referring to it may not. Either way, without
> the bus-width property the hardware description remains incomplete.
> 
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node
      https://git.kernel.org/krzk/linux/c/2bb07378bae9504f5122bfbe4a6082bcdcc8bdf6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

