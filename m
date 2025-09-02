Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80472EB5A5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Sep 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805524; cv=none; b=LiSxY/T9SGS6V2++ZQsRE8kw2XytUr+RVg80jnLER3L5xXqD8univTztBdn9Imwql80eYB21GsFVw7rDVdDlmLazPM2rHqNWLlru3+wWI2Gxae939MTnJnystC1VQK/eOd4Xtley8GDfZsJDWAn7kobn67K2bvcEbnsOsIJTE1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805524; c=relaxed/simple;
	bh=aLV5q272r3B8QkMTmOza7YKUzvB4FtaoeC/BZBqbhAo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PEDJgeL1K9bafQ1ay1txAqFMcFly9Xu4HQNHCKp38V5bmrFzAfbiQo9yZ9rASrutu3gRZoMsvz93X1DNgNGQI2+B5iLXA+6dB9AQq6zD2i/Eon0Ddvh4/aW3zk/G4c1kVO90ZEApAyaRKgzONfXm4AtrrvjbTzqhjNA++ZcLmcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSkGuW7m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSkGuW7m"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so241775e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Sep 2025 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805520; x=1757410320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh6pXHDb7czykJvkZSECzHtYEJIhB8sIOeQx2+V0+0Q=;
        b=wSkGuW7mkvn9WJC0H8ezXeIdlUW96o1eJVApqILsyLCx8Zj+z1lVkBvPza0EQrESze
         FyR5AnOBNa6xzP2plvpEWzYo1NhyxqQn7hXqrgnchbH149Hvs1WOI5dI+G62OwL/LIgS
         e8OZo/OSNgni0eNTQyCnikzCQT0sVHgxTWQaoMcOPU1pLhAC/VKZ4t43WFDOX4W3LW9x
         1puriBLsjH2M+I4nDeueAkbxupzevtVhrYUzmg9+upRFYHWCsPkQ9hqcAXadp3LPaOjK
         OCxKb//1QtixR+fd0hoA94/DMfQX7OZcSmpKegf2FfS5D8IZMVNpse78ZnuSAuVpcLWw
         okkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805520; x=1757410320;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eh6pXHDb7czykJvkZSECzHtYEJIhB8sIOeQx2+V0+0Q=;
        b=vAZQGwfNI8lNh82TY9zoXYAFJuNOLgnjF0ef+639VVKXb8B/pNfVbkbBP7zYt2Z5G9
         dNz+K7m1eETZTl9a2oYmjumXmlcagOHMoWdlO7t9n7knlBraSKoxrZ4otVx9ndxS6xGE
         YQrUDmjhnKtKXe+kOCyFA72hlbPSRWXsIylp12zVRpbNnrS1yL56BOplLCc5XbTNJHfD
         9akuammdtzn2gxY5B44xm7yG1TdwbvGivVaGLbgDn8B4d93S5siTzX1VQlZhE30V7iWN
         RJaw9vWYVCzUbfLfaiJpuJum1nj37NEECPnaUjXs4kcx5vYm1wEzsSSFG72m5sAH94YH
         A88A==
X-Forwarded-Encrypted: i=1; AJvYcCV5nhQwsQybe/hoHndYLdST0Q3Aeg5aHxOMB3OIZBa3yRNPD13gVExKjBawqxM0OSE7A25jpzpAxY9coUDBkq6CCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvC18RiXKBZQbqSqKd5FAq4d8pNyO2fFVUmtMq6/2LafUFXy3y
	FCKBn7FHNHyGR0qxE5z6Fwdq1zmIwWwNlUubmG/CU4ObP/tjy/gQDSR3/X2pgc5Wbx4=
X-Gm-Gg: ASbGnctLt0yVp4e26nAQwKRaq8bb7PgK/PfFCnEkEhca992OhbYik8W6AVwSGSoDHkY
	oXEAQh5fJ6Fb1Oaw2fJ1py0gqS1+zOfW4U2VcjuZeB0bpz3RZ6y4xide4sFK8LVd5HrgqPYa4Vs
	xFg0UavJqMqclKgz6s2pukUp/60WcomHNeW3cyi69hsfJOCA5/Ca2i4EGFZyga3194OIlqhr3S7
	rsAGZVF7jJ609KaDrCI8eLHfc2JIHUYwRh2RvafsLFLdsyNvodtKVpeqEHuF7877F+JOV0JiquC
	6kNXExciFGX1w1i5Keg+MG+El2BimD6GGnvsVZCUojA2rVkUhljFAmCOnRALm34W/nlC+WdU5RY
	UmY5MLckKqP8xtP6nosAZWiQKNAiUo1oQ32RO+Eiz7ihIZLbk8Q==
X-Google-Smtp-Source: AGHT+IE5jYdHUbUS3l29jFR/Jwe1LDiKUmJNFIigz6TfN/+SC34Z3RyjNu1csb1trH6mfuj+fpgVhg==
X-Received: by 2002:a05:600c:444f:b0:459:d7c4:9e14 with SMTP id 5b1f17b1804b1-45b800cecd5mr66503255e9.0.1756805520238;
        Tue, 02 Sep 2025 02:32:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b72c55c1bsm281314925e9.10.2025.09.02.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:31:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
References: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Message-Id: <175680551873.122080.16462297851841792228.b4-ty@linaro.org>
Date: Tue, 02 Sep 2025 11:31:58 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 13:32:54 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: samsung: Drop S3C2416
      https://git.kernel.org/krzk/linux/c/1557c2eb023d9cdf97b4686fd206048c070d4e70

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

