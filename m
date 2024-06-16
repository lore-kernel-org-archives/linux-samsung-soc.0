Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B073D6B
	for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2024 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718522654; cv=none; b=JX5ASlX8Mlsz12OHgCvon+QPJEdZNY0JpvmfShHOpEjK16k8Yf3ziAIvRtcgJiDt0qA37gBeVvyeTBqZHPERHs7W5xhI38hYqB03SdHadfnxMmChC4BtbL6p7hybTMrgY0JbAoLJJk/bk0Fc+Ct6sMpSoGhTVB/inR4KljPBI/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718522654; c=relaxed/simple;
	bh=3v5X7OMLawldb7SFk/J4caXxyFYfI65QW5lRP9eUVkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ErABta4gM2l3UQwj4DbRgKfidx+pHFCqALMJPI+0Ir1Z7n7S6lv4cSYYBWML7XjndKyW/PqvqcOtspozjRLg0laLvjcyG3R30pxaNpb33VrwphzHx59ETZOvvnHgaKYXG9A+5dyONy9EVP5k8wVQr1RYvFjDr1foRXoFS/OkWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHyQNrr8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHyQNrr8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f176c5c10so405390066b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2024 00:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718522651; x=1719127451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3+k9sB6bIvCFm1HjBgH8dCg7qh1UZx1fKQ1LomFQ5M=;
        b=AHyQNrr8yrumRYU2ogrz02u6cpS5bP2nOi3YH+b8HSf8szP67uNY4s63TWlQpeo04E
         gzhtXyZKW8MxF9Vjod62dSZ9bB+LDo6qIK157ROEDOBu7R61t7PUiUnmKs7AIFI5I5Wo
         M05ftIBNXi0j8VKaqnf/V+0fWP9dbT47WXcw0RQE4mCOEpJUkp7T+suK+viSzUjSLr2V
         VXn9Z/BMkn7KAzuDeT8Url61KExRj6CkYO+SznWdDcvuYBuTkBw9wvLjuu5axQlr5a6F
         GbNzxoL0f0ZEozCHYFB4B57jD49pYAohx0uPK/GESA1il7ezyHOEWuzDarOkfvnRLjVM
         xlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718522651; x=1719127451;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3+k9sB6bIvCFm1HjBgH8dCg7qh1UZx1fKQ1LomFQ5M=;
        b=FYYjEz2WeBlJ8reMK+PvrzziHHlImr+aOFrVYbG4/rhOOD1Z79yxdkBaf4+gZGNEU7
         teGq6g7fZ1pr4Yi4xlGZ75PocKtSNJvQE/K/iYlbPztPnA8NqxDavHnPmQLwM1PH5Q0T
         ekLp8VqoUNa7e1aCOchb5TDX0sfzh/EfkrEYXv8NMD+1evIikdcgVAWk5NdFxAnobSrd
         /UZgBEwqN/YkskzXGPO0EZaJvyJZ7vsCGIQYy3kXeTKE4CKNUlPXC4DTHhGyxfRnX3ar
         rWxw54zRLvnXv5507+3lFzvU6qcYf1YR4IeBx2KHcXYh83NlAMAm5GWh8zVTCXaL3DOu
         1CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL1wVkb44aRQfuiaYbtrx/H++pJuzxh07Ybc++dGGUWNPyIBW3Fbq2uqDEEQRCTeGHyLo0zUXSzEOEueeUcYe/MsezlB+57A7oIIsVbX1GbNA=
X-Gm-Message-State: AOJu0YyP4PFmGewpu1wZjJpbZe4B8od5wKpL7vW1keNHsJgdzMkakBol
	kUebSmS1TNmFbE5l24XeQG8PPxEvawo6sKg/T7B5Tp+o1xxcDm294R3je91egA8=
X-Google-Smtp-Source: AGHT+IG6FwqrVyI5Y84CmiJBAmC7qtLBsb1k75sJ/5JFgxqCs97InBwD6RcdfDPdrerJqC+hG8FgeA==
X-Received: by 2002:a17:906:25d5:b0:a6f:586b:6c1 with SMTP id a640c23a62f3a-a6f60dc56f0mr429149466b.56.1718522650779;
        Sun, 16 Jun 2024 00:24:10 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f8f6eb3sm320840066b.143.2024.06.16.00.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 00:24:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20240606161028.2986587-4-andriy.shevchenko@linux.intel.com>
References: <20240606161028.2986587-1-andriy.shevchenko@linux.intel.com>
 <20240606161028.2986587-4-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 3/4] clk: samsung: Switch to use
 kmemdup_array()
Message-Id: <171852264936.6236.3386941184729055865.b4-ty@linaro.org>
Date: Sun, 16 Jun 2024 09:24:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 06 Jun 2024 19:09:33 +0300, Andy Shevchenko wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> 

Applied, thanks!

[3/4] clk: samsung: Switch to use kmemdup_array()
      https://git.kernel.org/krzk/linux/c/7666718892f2a8582127f584fdbf5dada59af2d8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

