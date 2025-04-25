Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160321858E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574187; cv=none; b=fbT+8Geoz7s9WLX2nS3KuMuwvlgGCuNZiV9llBkmYFs5syWJeXwJqllx+k6KB1W7zjZ5T7s0idY4NTtrYcA3VzC2SP9FzkAjIHFnqIHnEH9xoqoHxan4jFu8aVkqROo8U9rM/eAzzfcwUhlvxNcqhdI46pkbxLzIH6Mct8aEBBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574187; c=relaxed/simple;
	bh=HR1ELbXjB62zE6Sff0xpFGFrP2hzDkcrivmHZuYivdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PCt2UQISstbPQQ2VzQKJWdLPAHDhw8Gi2yYoNuf/8LB3OBjpNTSzf3APj6ChhcFCDRNwHwvSLk3AQOyq9IjfBJ4mjFRM1/UTxRGLctJL3e/ZTfDUark8hAHLPN6cv7nZwYYJUpIkcFpYIqUGLSjnTJ4kp6rJlK405xj0gCr6BO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZ3w28sy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZ3w28sy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so2198365e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574183; x=1746178983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=WZ3w28sy5uDk84L0Jj5N7p1QwFcp9T2ivniA9tGfNHNj1ytyKngak+qP5I49bYxwt4
         AC0C+BCXKIB5zp2fHs555x5RpbA6AWkBqu1DHFAHbjuptavuTtrHIsTmz0RhcQBidIhP
         YGXdx+2MAdGkW8LmMKr3DUrfgqdWiIgPDX6D4KsMR8y469/03+VRSwv9mFjBC0H7v2vZ
         am/7IJNfNlIQi0OxQRXYBIgRmOnrZmwg5+x+d4hl7y3mDOtsGBk2MIq5/AfFZfmtel7f
         RlgLmdNR91I2GBrxe4zUWFSE9QZAnRr+eFaav4P8WIHai7TAlua12ie9xeYrPK+e2MQq
         ZvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574183; x=1746178983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=ugVmdUFRiXPgpcWbMThnzvnQXfb5VFvNWlT3l12npQFPrnORABYNWhMvfg5XDSyy3v
         JAeE5SP06B5eg7ecaldEsLH4szX7BJrzVxx6XfO2d17CV1UYvqWc0oEvnyC9u5I15H+C
         mk7waGsHewW3XtqbAnBmUzazC1WAkcK3AkZr5Zj7TXLXvDoVN0SdRBItLNOHI9CYYLyr
         Vnz8Tf1giMgkXgvzFCSvSwxQxRsOwCQvqanuVHFcxIS+KIVmyrxW4rjeHuw8VznhWvHj
         BVix5FH/nDq37sYM85bdUCSZYTZ74hQ9c7++aaFem/HzDbco8hytxrsl2MK6fTGM+6nx
         h+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUep7CXty2/9Z2+KGpA9yTsdZ9uQzpJOU8gQwby9XnfZAmyCHi5BcvTouD+04EiDRwmTNJW/RGpu/OUUn2u4xG35Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmybl4Bzrk6erO0tVH2Cn6NK5tmxbNOYFwGkCyX9JAPS5zanD3
	Is5/bhdmEP1hq5h+Sa2yX8ZpfP+z5zKHxjuvx5I9kfcdlfPi9NJO40zclqrdSAo=
X-Gm-Gg: ASbGncs6rB6rzOwtC7uugd7vsfvQXdJQoPPAkTPdoPyy+K5YOzoDl983FFDnWwNseKf
	CS1DvftQ6JzNrsZcRuBCfq8ZAMRyOsxn7nrkaugV58CBa+2feO0DEkMXlKqYRl+COVUr13azmNA
	M3aLHNwou7z3PIWunjNvyQIaoTpwPriFFLs42Wx9g4t2m869NQtMDJ5aBmKawkK1U4D7CmCS429
	1HorFrjQUam6qZreXWKS69dmP7U+yeymLA9JAIUrjjqEDnKncANNJ3djfRSmaVsHszlYOJ9VciX
	lUR/ArILSlfK3JYjhfB4hJlHDAKFZVxAjAqby1oZYcFt5TyA3IAW3IKEfWI=
X-Google-Smtp-Source: AGHT+IESpUAhFZOOS82e4GvGIHokl7WEd11AkZbPGij323CqMMkH0yOxQl4M55ja81NtzkvTeEUUHg==
X-Received: by 2002:a05:600c:1d01:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-440a66c250dmr4935225e9.9.1745574183356;
        Fri, 25 Apr 2025 02:43:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use
 typical np argument name
Message-Id: <174557418225.69534.7174672611109460880.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 22:33:09 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
      https://git.kernel.org/krzk/linux/c/2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

