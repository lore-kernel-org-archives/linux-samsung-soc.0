Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC59E2DA75C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760943357; cv=none; b=EtGycZfloLRH5t6+vVGiMbaXCfw79+PrqBQE5OPO0yd8X3wQ1lpOjRNY0ujom8gACxLC3egJSQR6jOy3Un4uB5JGooCZL6jGv1EOr4Qt6AAq7fX2lrSIwOKIKxWEb9X+bdhqUlRzN7DvnWDiN6z7pM5gYw4LVO0iOtrztFSYdWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760943357; c=relaxed/simple;
	bh=l+qiMZCLW4L04/8hKzR+kyXDDTjgr7TGBBwRRRf2t6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DWKA/WXzQFdFfwM5yskLjo0Da2GkMdh7OM+b97NKiqw1Yn4z3owBDWe6Kcvnfn4GPR6gBmaEwNuv3meCgG0+XnWhur4hafUFAodmraX7ElqvHSTQIXX2jC9Qw6CDTCm9zvkNxbJsA0eLdRpAFYx8hDcgHBmgIxwAqAEDQN2sMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVCYABZN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVCYABZN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4557950d23so78467066b.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943353; x=1761548153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=WVCYABZNh1kzR58tV6AZB3MlczhWERCJnjERxLl77XCC7yVnQUuQgSoeGcM/U2J0Ab
         6nYgXpHS2A+QR6jTz5jamMI4SxutrBQDx9JtBGEAaL1GYumioezGvjrCSUI72gcMtogx
         M9LQqL35IIVNXQIgxVLynAauZuwWNvw7ilBRYLTODn9goL0FpsSGr/rBZtlN+0+dhG41
         qeD4wy+j4DwM3ePJ0XofSDG5zet8InZdgU97A5FtqSf0qC8YAK+EGgFus5a+qIxJ1Fjx
         3SFhBoqV+mKhWQgSZFlhge+3OsmiqSNv2flCSlmMmYUF/9L0ual6oo5i0SpAbFNrbQu1
         ybXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943353; x=1761548153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=Hq4idUGy7UCj61nMP9UZFsrUscLEowp+cVoQSNr2Ws9dgvS77V0cwz2a3sKa5vh3y8
         bOeeyr6jTd5j8ocqYnJrZU/LLwSWiSgyW/BEmWIxQ3K91HhazQe4zg2YX+sNdviTP+Q3
         R08fIObT6YHY3126BT+/8d8iNYR2h+nLSksjOmIlQkg409JaJ4pKK30wTO7zhH0y5sFy
         wyycrWbgKUTAIW0dIJ7S5mVTMkn+02QY5SlXWwkBY3U7ruW+mpDO5y/qTRZJBWtxNxrK
         eg9luF8UAxI8nCASsfTxnBWQyf4YutH1NTNer25qynSl9xszhKNLMWIGk48LideeG9UW
         zlxA==
X-Forwarded-Encrypted: i=1; AJvYcCVjWlUIPUkh0CG73flhwy5/B3w9g2w9IOx6rMK7wIW3/L3+Rk5UGIikYoMfjFPb6Dkb/94BYqG3km1cwyLdgOMnvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynVzReLK7W8QaYAFQ/k9TTInxyXwj9x0ILG+rv4sVRMlWsHCBW
	ldIgk4sqRfLCuESnd+FWc9IyM1l7clh1xkX14mOf2OLsgNlMHWvlEAvjBTRA0HgXl3w=
X-Gm-Gg: ASbGncugKjr+7n/GRsbeNCB+E9hPzjitqmjF3h3dxy8HErtZ0rqJ4xr0GDTPNLfREjV
	cA+ZaDhi+HcAZY+uqPNdQAkHK9t0dvzzqiv7L/OWSBqM6wOXZryDRW296xVe6aYL/pbIRwZjnC/
	oadNrGcO6YoGCDf0DkTt0t9VvzKi8xPfy/bUAqnKvKVddY4KMxrXuOKdfD6injbM2zdU2rdFxnW
	601nxEwdOSOfxtYHK/0j++zMc2SmYpobJk/LSp7Rlz2RFikV9dT/CP6FTC5UU00zzmP2LyXPczY
	6+2O2GbEM+8T4qjmExQdCl+l/X56BXGSK7qHtpBAuD6MTvI05v9kmuQxupjyGR3lqTGGjC1/s13
	6L3aWFzIsdJhPXT+ijq5P7xwAMXqTADg8ztXlRJXjoRS834uJz3Is45O207mlDkAjM/EJqCM+Ti
	Rl8jiXWa/u1Pc/3MC4ZhghTZLs/1bH1XIK4Ui+pg==
X-Google-Smtp-Source: AGHT+IGTKKXPfeTmQ5w4wCnEeRSBRbYzpWHN3venhYhhsMPDOmR1qv1N3pYavRGP3cVhRdJ6rJ9Wog==
X-Received: by 2002:a17:906:c113:b0:b3f:5eaa:ef19 with SMTP id a640c23a62f3a-b6472c64147mr707558966b.3.1760943353147;
        Sun, 19 Oct 2025 23:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 2/6] firmware: exynos-acpm: add DVFS
 protocol
Message-Id: <176094335134.18498.14626588240652120863.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 10 Oct 2025 12:46:32 +0000, Tudor Ambarus wrote:
> Add ACPM DVFS protocol handler. It constructs DVFS messages that
> the APM firmware can understand.
> 
> 

Applied, thanks!

[2/6] firmware: exynos-acpm: add DVFS protocol
      https://git.kernel.org/krzk/linux/c/84a222d1b369ba83f8947948670f775367e653f1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

