Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF88F18BC36
	for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693272; cv=none; b=bVJuUhB6LLqOnaV7a6E2RFxHpJ/xDTyHsqH4B7WNYIVIm1Z04x4Twj8uljWeAoVNUsisB++9xYJXP4fwNVmdRtftFOduyGs+9iMJVA56RAMxIlEY3MaKWa74U8H4Zi3melQEJX7x+H+Vih83f0PztVd0MpTqdcw4jH0mlfy5B8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693272; c=relaxed/simple;
	bh=2ROv7/Gh8CvzONttDjHJL9x9IJby/+Zw5LwOfnLE1Qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p0BSgGh9cScFnVS6NBcJ8L64NutZIvmc3SadtwA0lsi4E950GBYTV+3EbWjWeAWN7G5+H0VdEq+MDkF1ySxGXY4Fsl3l/UjEiSIGzyO44bpn/mRY6TURkjJ6zrg4pkHSdD9Y7FjhSkwbezNfIY1PKv8u77EkPx3tdGw5Lq6NsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aonq3BwX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aonq3BwX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb1866c8fso6239315e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Sep 2024 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727693269; x=1728298069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifsdcRyLc8AppobTgYaDVXN3/6+98nfOy3hdyFb+q+o=;
        b=aonq3BwXo5bB0elDt46MXneX680t9tELPNXCt6IEudlvwy1U1vj/p1HvTI2vWVOGJS
         v3HfWMNGgo4xzmjOll1l7cmlJC+a4Oq2s55EGXWjCM8g3t6/7Keb4DvaDK4gYljLUbEz
         EMJbPjp9uq7xC7XqERAqyBT98CdPBJrs/ZCtn9OzC13FmsYIlWzkzMPz2W6i4wO8v6Kn
         3hIDu+6mjtqmlN7jMEsNLKPQrt7fINWJ/v2s1bISs2MtZ5OP611B61QQHHBKWjHe8DP0
         xkgTvIxTED0Sj2Kb81pXOZWQIYyhYHCH6qBQm0RKjX3EF5k00Yf4rsh2bTb1PVO6gCHe
         wqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727693269; x=1728298069;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifsdcRyLc8AppobTgYaDVXN3/6+98nfOy3hdyFb+q+o=;
        b=R/lpTw/6FPTRFODIKRpeSTnf3thlc3vlT+EV3kMHghDOIoo5XZs1E5ufdZ9ncWWGZL
         iT59ifp3RlcbMCgBRGgAIUO1oIf8fCBJMEGEa0v3zLmddmIThlEFu9KQxKimnBgg3wq0
         bOF0/iRjKLU7pVUdbKkNmd7o8L3EytiXUHJOmadClMQhGvVq1HeuNNWlYeDnXawBmvE7
         aHmfFflqnm0BrZmdR4ClFb7L/FpwrwEGQT1yrmxd6TEuO6hME4mxPmgdWdm5IBrfE3sG
         PpAkA0nZPcCNNVAsgQj215+PjfKTB6BkG8YA62KVP3birpd4W4JgNVXcnjCHR0vyAN9h
         dPnw==
X-Forwarded-Encrypted: i=1; AJvYcCUq/pY/O/DJjCa00f4RI86PS5/MnTjKmbaUwSGpENE0VV2UVHsUykBLveAHzGHW3AXgoMfhsDUUZf0zeyWnfEdDHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yHlyGW9d7fl4WGMkDE0ddBKrvQC2uO/xxAVYnV5k4VA2jkxJ
	l5tToa2Dw8G5mSt3Id5FRDCzr1QeiWZJRPTSeU59CsjQLDMOZRvTVCJgKAfS56w=
X-Google-Smtp-Source: AGHT+IHJoRXRkjLmhyhWnRc+J7AYbPUgYP3jewZMPLvRdwxWa5QnQsnM0qAc4hEFeUFQFEP8qsUjYQ==
X-Received: by 2002:a05:600c:45ca:b0:42c:c0d8:bf49 with SMTP id 5b1f17b1804b1-42f582a34femr38726355e9.0.1727693269189;
        Mon, 30 Sep 2024 03:47:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6867sm8687593f8f.49.2024.09.30.03.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:47:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240826033411.4022822-1-cuigaosheng1@huawei.com>
References: <20240826033411.4022822-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ARM: samsung: Remove obsoleted declaration for
 s3c_hwmon_set_platdata
Message-Id: <172769326801.27428.5676749908903769507.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 12:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Mon, 26 Aug 2024 11:34:11 +0800, Gaosheng Cui wrote:
> The s3c_hwmon_set_platdata() have been removed since
> commit 0d297df03890 ("ARM: s3c: simplify platform code"), and now
> it is useless, so remove it.
> 
> 

Applied, thanks!

[1/1] ARM: samsung: Remove obsoleted declaration for s3c_hwmon_set_platdata
      https://git.kernel.org/krzk/linux/c/0f702757c68b9790a844e5c07073d3d1c777b13a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

