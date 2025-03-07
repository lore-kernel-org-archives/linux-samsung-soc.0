Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0747B21CC5A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741359852; cv=none; b=ODOTS7XHkfjov7DR75BD7fvBaV647WGiwXor5PDbXayear2GbCRFAq6bCZMUBCVaHi3aCz8AXOt6a7sYaCksPor//btuh8xlvlCQe+TeWmc9+Cus5pfb02rX0N4uoV5MwlqoJLfBmLDc/YeCKb0x/idCwR60kB/28SNBdsgFbxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741359852; c=relaxed/simple;
	bh=e8ChYfB2JWMNrEuzMXT2LNRFntJeGVEoJBRw50gUiNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lAuzqMRiWw7hHjXtuSFVNGb9fIPU3LMQloS7MXY7h6zpAMkaHlFOJ7F3bhGIphQkIgJvhD8jBuwcEwGYNsV73iEdl1n6jLXdqTtyOdq3faeMxFJiaWzoPTBfm1b2u7Pu6MysWvggKyOBMWuRgRaHXlBlmDubChPfnPMCEQCKiDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuEBcsNX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuEBcsNX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43935d1321aso2101245e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 07:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359849; x=1741964649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=uuEBcsNXrycauQaTCbpd3WThD6WPMrM15LLFeIHM0YlpSKKcRyGb4oYuvWsy9aJExr
         sTe3vs8vrJr0l2TQ3UfySzQV/m+bJiZiYG6FfsyMRBgUENSJMHo9NAFS03wPlZtvrbnG
         H3zGDAH0kpjF1OgaoYeFQZ091Lb+sQL/Td6ni1hyDiy1JJT+xK8Z185DT4Wg+sxVThIB
         yqySAfxXr+1nu4NQfIq4cmIQb46GU7H89zYFPHFDL8vtRGnRwSc1pBh2S1xUqBPXeJhE
         IRuXIvc7hrz9MBeefvfhsSAC3ymYTgZJtOB1iSCICs0sswVS0J3kHv3vTu2WQ25htzzj
         d9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359849; x=1741964649;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ELG0oVhA+BqzmcxJHQfLXvm4d36xTv4jodb57FoDL0=;
        b=FbN66k6+CvTGRcb7QXRimjR3uM+Vx6z5Ievw2taQhX9v2FbRVApBDM2ZblNUgNzJgB
         o9X1BD0bDgWTiALWLOkslLYN0KWnKCmXrLfAXe6k1SmE5sSyQYJbW/GLJqTwEiBVyaZd
         HeRL1EoNNQx8I1kl6WZ3YjFH/jEz/bU/jm7pqFSqV9qGQ+QYJKk6C8LAD3lPeorVxHpp
         RRxzrK11T1jSAg0byNIrCm/8L6+RzuVRdewKSArmTYUcelJhrD8lHutAC5QCO9EN96xQ
         p99srnEWAukq9ZkbN5mUdrIgmhtV7W2+tbbyASUaS7YW2hpR4kDT4rVpcGIjZbZ+S7yK
         t7/w==
X-Gm-Message-State: AOJu0YzrqjaVAdB9iz2YXWFHrb4l2WNkAGoAwU2hdZP2VmcwW0D6vvqy
	et+/YZzyOz4MQQMjRZVBNXWIaefH8mGk79mN3TLXqHOyuEiAtXjo3HL1O4jnUjM=
X-Gm-Gg: ASbGncuKycKwtT71la1qs4LodisEnMnzK22NmUOtW16gRa0Z1GP7DLjEhN2EixQMEo+
	zQ6EJ1FQ05KqUF89MqKP8gzLSw6X0obNL4Z9/iBqVA7O681pI62mOEqus0N8pPPoJ2QMeQr+JRq
	nzz0kRuQi5dYpKn5PCgJG81yZmh40nS9Y99TrLwk48DleMDbcJnvcmW/f4//1JQMkfEFg7tiiBH
	NLcGygNrb6tF4s6wT6z8JQk3EwuIHh7f84Y2tp0Ww6vu+GEfDNRuo1UokzvPHZ3QjXHnI3thg86
	AJISc622snqNYf82EwwpsHMPHuU7yx/UspJVW1nGa4PntPRevCB6uTHM3NMW
X-Google-Smtp-Source: AGHT+IGeiraKGeEqa9VGhWaeeNF9N+Kf66ORaln0VM6PqpULNSWjc+LqFVea7mhvmFHlhfc4guuJvQ==
X-Received: by 2002:a5d:584b:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-3913a8aeefbmr51698f8f.11.1741359847652;
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfa52sm5444573f8f.21.2025.03.07.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:04:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
References: <20250305-clk-samsung-headers-cleanup-v2-0-ea1ae8e9e2bf@linaro.org>
Subject: Re: [PATCH v2 0/2] clk: samsung: Two header cleanups
Message-Id: <174135984582.202251.7619477733984588971.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 16:04:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 05 Mar 2025 21:03:42 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - mod_devicetable.h: also clk.c, clk.h, clk-exynos4.c,
>   clk-exynos5-subcmu.c, clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - cleanup: clk-exynos2200.c and clk-exynos7870.c (Tudor)
> - Rb tags
> - Link to v1: https://lore.kernel.org/r/20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: Add missing mod_devicetable.h header
      https://git.kernel.org/krzk/linux/c/f32f5b0ec0f6eec0186de0607ab12f9cb1ecab73
[2/2] clk: samsung: Drop unused clk.h and of.h headers
      https://git.kernel.org/krzk/linux/c/017bbc922a09630579ff7b5b314fb186b8c0efcf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

