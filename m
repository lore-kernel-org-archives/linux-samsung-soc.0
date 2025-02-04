Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FBC207DF0
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Feb 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659063; cv=none; b=pR1RP8L4FQrB/P0v2Fwwy+fPdpXfdp1IGlMBcQqewq3z4OvxKu4PVadHgre4L2O/hlxPuCHQPkd7xrxH6HSQDg5YdjQusavEwxKLiIHW6RATlenEnmfJdEJQwkJDMNvIHRI92R9nyCClTcQAYBfSNr0nzdrDIgsQItipWx0rvHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659063; c=relaxed/simple;
	bh=c6sdauT4NAjCLcdSLhhpbauGdNlBvhu97kIIicEbFCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hhJWCDDF8cADMuiLs3wQaGFrDxigC79NHjMKYEre1N9Pl0fbJRqF0qI5YAHCeII7Bq9ZDImdUQjXXZcvJbMIOOhmj6tjXtTFaBs21tBscI+R2O4wmDcX0dbFxI23dzOvhtstlC46B8nXtyDK8bBYq27GktQn2Ol+Gw4Rr0S+02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WccpIako; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WccpIako"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so6746045e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2025 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659059; x=1739263859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=WccpIakoL1eoJcWs/SS/O/QB1hI7ZbyadkE9kdIYhzetbSnwfRcde1kK0IQ8v/sHhn
         bIXvFt9ba0+8yf0Kd94MvAYVo230DGmZ+4Mgq9bARa9kMQpOBUguUnxeTt5sHQeJJT9i
         3WtaF7fki0GWAX0YV6w3Y0JJJ5cfb7LWOdKHWF3js2XP/ViUZaN8ZmxODkzQ6yT03ye0
         fFwOq/E85qK6l5dosFv+I1LAKnWX7NEvcnl44L7ttDlQmxVHBu/iDlCqFAF6hD1FUsTY
         PY8w1Cop6LkNRRZo9sxMRXiLsbBMYptQBrnxZFVLeAb/yf/emsK8bdh6xOO83WeJ3Rxr
         Wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659059; x=1739263859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=XIKZ0YxiDN4V8IIfMbmemGZzLh8km0R9lvjwnuQhLvHC/4k5zvoHav687dy1qKHRA/
         2t2Vn7DdQFa8dsAhtU19CaJwAHd27FBGt0H2Cr2U9w30zeot6gfTXFIRCtXZNh7e8qTs
         VSvMzsfZ1IYwxGVokmZ2FVbho0R1hhfVolW4LNnzEoB+u+irXrcFWMKaGnFCBKZUNtjo
         xofpJzrxO5bGgEYY86tddCZGATuU63SCWiSJjcBqo1wFlQD2xfuSD30bACj30tj7PIyz
         sbfi1G2ZX3VrpbBfSzRyreQGHE9jYJnRmsVToe/pIRKDLd5pAg/H98VghgpqIXyuRcZW
         FgGw==
X-Gm-Message-State: AOJu0YwoL7LWCQFVcdZZ28gbCZ05HI4ANcSNZeRNY2ukqdMNKl+PmoSX
	/nAvLYp/t3jaL4A1z3J9DxYl5WlIRwewfR56aqGfiRrtz7BHmCZH3IMFnGiXV4k=
X-Gm-Gg: ASbGnctbShpOca06pIi9vQszEB9/BIZdLWYpPAQAW99XgbyQIsC3D5gctWt1wsQ4Ijw
	Kf18cBdPFYZ2cLwv+qB3lgDw/8QfbIlVMXJKoEzGJJdez6IWj35e8KSi5T0kUVEbqFgcD1O2bIZ
	TXW0bNRW2Q8z4qE9g1IP1A60uvGTwsT6zb+18j/9l15rwwqLs6OqMhXXSssd2ILeh8+OWmfJoFz
	ISurxdCbvs/IyD+ADKsE5IIp0F/QowiB0gWQASPw+zJZr47J7i46iFPKGbD19Q2kmskP0rq6ihH
	M5E09WQym6oQZztxHQ0lkUY/54UOlbo=
X-Google-Smtp-Source: AGHT+IHYuKkYPbhh9kBPc87DdQpAZ9zcHEHdGkABawo/Qtr0EqGi6f6CTD8BUqoqUJP8UloWPAQavg==
X-Received: by 2002:a05:6000:1848:b0:38d:9e86:2b24 with SMTP id ffacd0b85a97d-38da4e440aemr794591f8f.8.1738659059133;
        Tue, 04 Feb 2025 00:50:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] Add CMU_PERIS support for Exynos990 SoC
Message-Id: <173865905768.26600.7188664956285706035.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 21:05:55 +0100, Igor Belwon wrote:
> This small patchset adds support for CMU_PERIS for the
> Exynos990 SoC.
> 
> Best regards
> Igor
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/7fa119f5707f12f3ac00726345ea6b7a22977ab6
[2/2] clk: samsung: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/3214e7c0cfd29b1f0d80e0a4708145326d759d68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

