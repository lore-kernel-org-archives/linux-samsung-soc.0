Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F894D117
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922126; cv=none; b=ObCxPB7rnErbHldUCNC9oEi5UQSdZkVB18y2QEDM8QWKif//ORXsma5CnbBxJOQtafnJWFLBzjwkHXvpm+PTTyMIM2oOyhdhIEmJj1mF3/dlAYUPFrvN+bhmgLE+Wnzkt3ZamZSLVIaVz6HfjGRIXlI3vYGabclT3ehM1oVeiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922126; c=relaxed/simple;
	bh=jz5+fq15v8P2y1IAjuMP+zZSU56HsumzIfdjgfbshWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EFI4r7TAzQJgac9FpkyxMJy/8IQhrWrScjaxiwwfJu1u9/pkHM6J3CSXNRIdxJd8zltFTa+1UNdpfX83erkbBjTweaS1FALauJtuxOi+o0z8k+VKe4ke8tiAdkQihln6HatGst5lCj7JuegiR76+Mx1Ps6RXc+/U5DZ8uespgrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fhm3kBQy; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fhm3kBQy"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso32300801fa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705922123; x=1706526923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcuxO13l9rVY0t17bgZ5rUtyhA0tzJvdYRk5OWx3zok=;
        b=Fhm3kBQyu5CSFGLxS2Tx01fuJKhjuvVCM5IrOR4M9Sc6rl6UT/r9YUvc812Fz0gwIl
         ru2bo8zzo7QFtVikySAOswqHFhWyu2E8SKNrCVXZSG9svZMkqI3IK0u6Kc/dpEplup4M
         JZPLqGvFLSqMq0PXdSH6MUaJGqN0/Pzh6kXcPataikI0UvgeSZUMiclVZ6NBcto3XocZ
         lVgubsTVDEJFXAiNEG7Teb8zllzHaYuXCeJBTGHNYoThh/T3FZxJl+Na7iiMXf8i2yWX
         mm4na/F7T9UF1i9FC2hYWzurjpvgX/lJlD2kUH4shlOaFCZMkGH+0PJlRBkMqTdWZR3/
         UNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922123; x=1706526923;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcuxO13l9rVY0t17bgZ5rUtyhA0tzJvdYRk5OWx3zok=;
        b=YYwY1sbNMTHXCYODxPSzzHz5Ag419ggjoLluo60q6lAgZJqoJPPqoym+7dpMyHp1o4
         eh6ELLaS4e5loTsRKqNvq5a0oAW5vQNeXfozfJU6tEfOWc9raX2LaFhP7po/whldXU2d
         tq9z4OfNeZGDxPLT2ai1tgGZE5NzzrqfU5Q99MQTpPAyCjjGuSGpeYyq9N9YN7EbyhGy
         yRvL2U4IgEXdEfJw69W15ChShnHJFlRpU4/mDYSgkxhvu3Tr7Gaq1wQD7Y7dLw9Z483S
         XflvHIvqPUZOs9h4JU9xYt/zLslO91n0pMMEw2yEB8f/qwNsRppntvzLfufv1GLsznZL
         AB9w==
X-Gm-Message-State: AOJu0YyyT73eYcYvZD6pJSbx8GWuuQR5+qzhhob4x3Er8ajka5JzI/kA
	/OS2OJN4GG+OJYYC8TtSUtBT4rmhjz/kKOkrWi7LGkiz5DPMg8MEcYPGXEPhHobNM5fneixxAh4
	e7fg=
X-Google-Smtp-Source: AGHT+IH9GCOtDWvqqem7I6JtqINBeY4M8rLVsz/vddPraRdlqQUuPr0C1iB6ZvQxovWcHQFQ8xuEQQ==
X-Received: by 2002:a2e:8895:0:b0:2cd:8ee5:2d8c with SMTP id k21-20020a2e8895000000b002cd8ee52d8cmr1592791lji.33.1705922122727;
        Mon, 22 Jan 2024 03:15:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id h27-20020a056402095b00b0055c643f4f8asm179422edz.32.2024.01.22.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:15:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-6-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-6-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 5/8] arm64: dts: exynos: gs101: enable
 cmu-peric0 clock controller
Message-Id: <170592212128.45273.4024019835261321108.b4-ty@linaro.org>
Date: Mon, 22 Jan 2024 12:15:21 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:29 +0000, Tudor Ambarus wrote:
> Enable the cmu-peric0 clock controller. It feeds USI and I3c.
> 
> 

Applied, thanks!

[5/8] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
      https://git.kernel.org/krzk/linux/c/8a670bb84cdcf1397fc4a3bc295c0008f49bed91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

