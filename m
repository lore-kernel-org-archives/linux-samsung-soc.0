Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BE14A0A0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Jul 2024 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719836886; cv=none; b=ZH0ieem8B3fAHr5uPUqrHip6s3eSxRdDkKBxX6tDWuUcZWs+JTCYBAAXwFgKP8FinFf+fwM5J8OoykvaG2ctBMziJtIQWNFPDrFqQk7qd8rOK73EqRtGpt/AvZuTuHqtrbvWhlmG8J8vkmmQmtbeGhyBRUj2f/FK+fyrjv8X78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719836886; c=relaxed/simple;
	bh=NyOtAI1NXSX+QQw7SggCrEBU9gGkZ4JyZB3lSqJOASE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ieABAJvm9qX8gXhsAaN2VrmakzUaSgEMlBf1QR06nsodWN1ikNNcjtra0oEosmlczUgwBxhhbWakyt8ZCC9KvSFim/rzwF8YubuDTyxYiQNjy5VAdApqveTT7t6iDjOuRV+iPTDpt+/mT/fI3GZYKlRqDcglF4+Ee7Y54fdJ9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKcZlSko; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKcZlSko"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3674e1931b7so2077859f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Jul 2024 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719836883; x=1720441683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zb0c/5vcct3kAz5q/BqOH6khG+ryrEiFFFxWSt2tbM=;
        b=HKcZlSkoddB2t5vZfjIYMVtfBqlyDAxRInXFK7GoA50HrjP51Yej1x7lBVJqY+QfP0
         JaeMdFXAgj0m69+o33wBYabNpRb5rZcuMVEzudMVi0oe1iszYhFEMTFLcxwWQOezhdvY
         JsaSeGKo8GxOLZthSfCt7nieLNHRCz82ud49uIoa70yxHOkM//QNCL+hISy/b3BM/WA3
         vVj04RYl2YrXf5e4pktzM/t1A3807fpfnXPMEYYLIK4Zq8kjxjP9v9FscjI0IZvLXHHX
         XXZMpxebJFsT3xlJVHnBOxHsdwbuWXsaCMOBF/bzLRg1Vn732BrlyRwUpPXGvAGsWvjT
         pnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719836883; x=1720441683;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zb0c/5vcct3kAz5q/BqOH6khG+ryrEiFFFxWSt2tbM=;
        b=G+Ap683ta58v2ibhsa5OYktU8JUpySlxP0ed6zy62TSSgXsUSky3YRX2KCH9l1NZ+c
         p128r2NcgtM836G0iTh71MPOUVaxDSeUICPGy/SgZVYGqEwQFsHKZo5NpH7hFItj3RJf
         +VA/cKUw6T/tgTsardU0bVADRihUFPn5BZSr9CTvyiar+/bLgOyQFGuLcxCXAowF7QhO
         ZeY1edwrqCMoJIiuGrt9ndoqQr8Vqq5EEesJtxgsyFLwOZRLVUjW4aVhmOw+KuhQJ9VP
         PUlrq8/6wPnlV3O9Mp4r0OPPZJhkdoosnkB8cmE+NUmCianLLhgUKOAG84mf5VxmrhgV
         Dn6Q==
X-Forwarded-Encrypted: i=1; AJvYcCULsBTVw2yw7QZx66nzOMmq4D2SE6ZA3mn0sUafoMQC7ZHWZdJCP0k9n6AY1fGOPe7W5leEikDh0L1IvFSXzldc/5sCif2wchDBT5Mb4fI0CJI=
X-Gm-Message-State: AOJu0Yx7yycv5I9fv+n8JJLA1I1rTWPvP9ikPbM3LJuaPHqjatm8wRdS
	sMxAlui6MS/vop2sA6DwpPJFbHuUfqGgATtdH4U//nMSKL1fHfig6CoDtX5KGlE=
X-Google-Smtp-Source: AGHT+IEdTCfn893UC3b63gCFt6tkkIf+CAZq69gxd3al2qXzVPDeqS/JFBRxwT9KoaZ+Djh/ROzaGQ==
X-Received: by 2002:a5d:53ca:0:b0:367:3fdd:632f with SMTP id ffacd0b85a97d-36775729a6fmr3144050f8f.67.1719836883441;
        Mon, 01 Jul 2024 05:28:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd5fcsm9860697f8f.11.2024.07.01.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 05:28:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20240628223506.1237523-5-peter.griffin@linaro.org>
References: <20240628223506.1237523-1-peter.griffin@linaro.org>
 <20240628223506.1237523-5-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v2 3/3] clk: samsung: gs101: mark
 gout_hsi2_ufs_embd_i_clk_unipro as critical
Message-Id: <171983688170.414803.12761957664942092731.b4-ty@linaro.org>
Date: Mon, 01 Jul 2024 14:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Fri, 28 Jun 2024 23:35:06 +0100, Peter Griffin wrote:
> The system hangs on poweroff when this UFS clock is turned off, meaning
> the system never powers down. For the moment mark the clock as critical.
> 
> 

Applied, thanks!

[3/3] clk: samsung: gs101: mark gout_hsi2_ufs_embd_i_clk_unipro as critical
      https://git.kernel.org/krzk/linux/c/e61f400d6cf3d598ac3ff88a47b34823f9e1f2d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

