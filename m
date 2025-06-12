Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB929CB57
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742195; cv=none; b=ULM+abxCvB7RHJWz9ZNNVbOE8T8KgdzqSka2QM/uoq0jg4Z1WOWUa+KvEOVzkjc7dGSu08yhiszPmAFX1r+KPzSgou11QTyt1ChTydOIXb1PfQDvNnINYUgJztdQBC+0ZbPUDU2zNT6hUePWzljwZ5Xse6Vm5QF7EDAjAs8Ad9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742195; c=relaxed/simple;
	bh=z0ar1hJos7ARhEgbjSSfr1bzntLG3QJmXsE49Omcdw8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W+VrC1zhNpJilcK7HCjQdeBbRIRMd3XcltUR7mHtSteQX3Gqxpjg+QJQLokWx4O/9+tkscY4PDaHg19hdtOK3itNrHKWmeBBW9oSroQ9uabEUwhCOxfSJs3/zl4wMCprLUTESzPfUxh4BIBfzgYJEL4BjaKbazTerJtyvzNS/Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAg/G+SW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAg/G+SW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ddb35583so1612855e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jun 2025 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742191; x=1750346991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=rAg/G+SW2txg0b7vzr6ipT/igZ8ZIsSUxWPPHeSBCfVOdSeb37vMFzo/tnXAwVYVDG
         AjduHqrBXzcBgJQmivIkFdCh/UVcFd+Hi8xsj3ZPERGr76CSuHGbnxjF/6N0Y7D7JqRM
         p0nSVJvXoGYwosAy4osuKRzZdwWJeoPMmT8SFkPvB5oiQx9xBg8rX4kRm94p0yGeF0vA
         rCyWw+crKm2xq4MwJ9AtwYZ/cG4t9zn2JkCbD7AMtdqFdF+ZFm5l0mVAWt0tN57m+FVf
         yKLkPof3O1Po4Ju08M4Qb4BVX6M67vubZmCeQmGbdDX3isCSsEAgqGNYS6JpbzOJXMlO
         idAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742191; x=1750346991;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKvQ0kizkJd8CblYTjjvTx/DyqmBuLZOpwvQ/Oh9KYc=;
        b=H7HT+cz9tYWP9PNwI/NK//r51tlsdE/BP/dKKds5v7BMGQegKLc+WZ6lAK0VLjsAK2
         vRVMauCT2MPU0PFWZE/8Ah+J63eIKr2WD7CJWiUHFdP0MzkznD9v4mf5O/dOGe4aBxck
         DkQw8tgvYU9nsNRbBN6YDz6e4Remp45Kf9H7viuiyt6ErF417cfJzEHqhxIPqiEWqwi2
         AACk1kYlEdYj35wpVybiVC/KCR4YmD0QloGoQ66m4yPYsDdN2iH1uUOgZYEGm4ajs7s0
         PMECwKAh1M4W8x2WK2g+md+hKkTRC693K6tHSz2u3IbhlFSXd50HdYY1loMmot44pBXz
         lcCg==
X-Gm-Message-State: AOJu0YyqvJ89clr1/uWx9+nGCGih/lmxY2kcumR6lP0GXlXsiii1jJL5
	t6dV0hssA4FbCnOOOmUnwz5v3UBmzDPN6K7R9x1cWYjJJyznzLtwo9pkS1xTaOrYIPo=
X-Gm-Gg: ASbGncu7Chh2nDMS53oHkHlvhl0gLUVbTqAxL/c5xS8cmYAU5YqoUioW6JjYoCIEMAO
	rEIBIxQcpdh287SA04TsJ87CHMqvE8veASRC6axTFmyLjIkNy1K37oem1jq2veVRky0sFAiGqHl
	z8s2B1NzXdWbRVGuH2DrbmtgjIcSRaOdW42MVPZQ9fdD6lhnysRoAQAw35/nRcX23Q6MaFw7ewi
	X3eDxyPQKeKNenqQeIg7bLwJOCMGiUpS3ETD0ligwjvsf0w33BqGNzIE0Ftd/qrBeprCj7TEmgx
	iNbS2rxUI9WCgJ20Ns5udDecSqPUQb/heP78BwOscRGCArUQGg8pZrv92LYS6VnP+unBEGa62mn
	B2Qd8xEQ=
X-Google-Smtp-Source: AGHT+IHcEf5K0JeoZyRffkMk2oZLKO8IT8ky+qUldOOWFDZEO8dRcFFzDiYHDmEiK60pzDMoVYDLyQ==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2648512f8f.1.1749742191063;
        Thu, 12 Jun 2025 08:29:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232e4asm23557265e9.11.2025.06.12.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:29:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, 
 sunyeal.hong@samsung.com, shin.son@samsung.com, 
 Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
References: <CGME20250529111705epcas5p25e80695086d6dc0d37343082b7392be7@epcas5p2.samsung.com>
 <20250529112640.1646740-1-raghav.s@samsung.com>
Subject: Re: [PATCH v3 0/4] Add clock support for CMU_HSI2
Message-Id: <174974218878.126240.878153774506566554.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:29:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 29 May 2025 16:56:36 +0530, Raghav Sharma wrote:
> This series sorts clock yaml and adds clock support for the CMU_HSI2 block.
> 
> Patch[1/4]: dt-bindings: clock: exynosautov920: sort clock definitions
>         - Sorts the compatible strings for clocks
> 
> Patch[2/4]: dt-bindings: clock: exynosautov920: add hsi2 clock definitions
>         - Adds DT binding for CMU_HSI2 and clock definitions
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: sort clock definitions
      https://git.kernel.org/krzk/linux/c/3d6470990bfc8600609177962a53201cb0640daa
[2/4] dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      https://git.kernel.org/krzk/linux/c/da5cb65d25f747236a003b82525eb6de5d49a2e6
[3/4] clk: samsung: exynosautov920: add block hsi2 clock support
      https://git.kernel.org/krzk/linux/c/2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15
[4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT nodes
      https://git.kernel.org/krzk/linux/c/e2016763590f571cdc3912d6a7ec848d2b61e6c2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

