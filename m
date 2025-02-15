Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8DC1ACED7
	for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739626978; cv=none; b=hJqiJC3ZaXfuI5NPufRfZQX32d38inloA12C3ptL7MBEzNzn5poXy8HMRTdJQipDHEf9kMewjsB6bj85oO9sytR2/hKy/UAIzx1ONYkDL2yT31sobykfhF+kqVrWPPfN+95/AMIeBw3KMOk6SDZTd+d6Jm9akTaPXZsgBmcJdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739626978; c=relaxed/simple;
	bh=B5G7i3ixrYG9/fNbWmw5bNg42KOUv3/6jvQJNxtOKiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XfwY5Ju7YFwFX5D9f0WSn9Y9a/5ffJNH6MsxMjtDMoTLMYBGOI+dJSl85gwoeBuXCj+wl1NQ+ntKVn9jiZxJnJ7Tes8RUw0+MbzXKs9APXj71IdM1xYTEUw7Fy/cIgvtacZWYhpJM86ViQumW7xFb3Uhc3eftKpWi0BjK1WSLtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtRd1PZg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtRd1PZg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2b3e7baeso277770f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Feb 2025 05:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739626975; x=1740231775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzb9KoEVAxpceRAqAhOtXPFddy5YM0ujKSt02fGNR/I=;
        b=wtRd1PZgmsyreHIrgo3S84qyMn71Dx1kQ9tkOsJ/TsnRimIrn84ihavQ65v2BWfZWe
         8yqEcYXSnNVau1S8pz3e3ZZjfIM4qcwIbQX7E6syiiI9v2UBkLMR73yPav9eUrDjON0K
         AVLQUz78R6hBH2JWfOVoCQtpQvn9KTVKETFkNZ8GvssRGmtUjyQ/ZtDGIlMx0wk1+T/K
         uX0btv+slYZI5DK7pyg6SVKP8RN5uh3V+iOY343rDxsCEjtZT53ed1rRsXq3e9PW7ZJu
         Yg1pfVBOmhHdlJS+6mZarfJ3gAE0QB838HQL6gziTGAWO1MR8Ml7Nd6lcq5nQ0Q8URIi
         rJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739626975; x=1740231775;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzb9KoEVAxpceRAqAhOtXPFddy5YM0ujKSt02fGNR/I=;
        b=mJGACNiEbEK2yMbH7aURbrsw+7TF9wPvOK2txTKNsPXXSVU6MMFOtLa7M9D1b9IDEX
         ZceICQ1+X6K/cuxRf/eKsWVmie4fyaMzQKMX9/O5stpFUJC6dSRQx/9lTYr7t9khwGD1
         KMoAYuMGlRoNlF5QBv5oCdaQZeK6Agnuyunvtw9LRUonQBkDHeUG3IaPORzoh0sVMMyL
         97KiiV00nQa4lXeCQUOxWF/skU2HvMTg4wuNcJYkCZQAszTpFs5YCpLrGT7grU/PTwnQ
         ZuLFOSg0CQAQgTw6SB32J3RVpLOg/CD6Y6o9YPVxDiSZfJQeMldIfYRywTWWATQG1K1Y
         6Aag==
X-Forwarded-Encrypted: i=1; AJvYcCUdjF2GWLdDM//jKms115X2uXYFfXc0RWSFy69rBEW02N9MzlB1KXx3/RwJ9wAKyfg79FFVKxZZ751wOZ/Od4x3fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9A+JKH0qjF8T3XuzdKHApFXdYBo2fhWE7pZ0vu6e+T98lzWy
	hyhFDyTzjEeJ1Hn8+fcJiNXCxizrULgV9iuDzfqcV+gqWskmZkR0Mraz2XfNg73qU7o7IzKDell
	s
X-Gm-Gg: ASbGncvJNN8JnHn/06h/2iRIOR2fZU0MjvNPY1J+ay5yN41KFpEaitiIu0wlP+vBg5L
	Dy0ixwaZ8HkhYpTkUK49xbacHBhDJhXRdSgnO1bXI5w4QiyekYy26TKc20coSsT1ZxaXVCHfkpg
	6C5h3++JTfSrc0z/uxwjhvV0kw5OimnXYHfwQPmS4AmZ1jxjrZhZYuzbNo8+A/2pdSAu/eCo8ha
	FFIsfIG0gMuv+DROD8I9nW2CjAkVpAASZLeWLsQ902MneWdApKZl1F8d+EGWAA76tB6SBAyZhqg
	Zkn8/U6NpbUCy7rLSLB4Mgak48MoXP4=
X-Google-Smtp-Source: AGHT+IGDxXB1E+X6jTSdESQDd36Tzc/wr84k6EKAU8sGUlvYMhjz/DzYT3hbSvKe0KicE5yIGLmyJQ==
X-Received: by 2002:a05:600c:3ba5:b0:439:5a37:814e with SMTP id 5b1f17b1804b1-4396e78789emr14566145e9.7.1739626974755;
        Sat, 15 Feb 2025 05:42:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396181026fsm69929005e9.18.2025.02.15.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:42:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, alim.akhtar@samsung.com, richardcochran@gmail.com, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
In-Reply-To: <20250212213518.69432-1-chenyuan0y@gmail.com>
References: <20250212213518.69432-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-chipid: Add NULL pointer check in
 exynos_chipid_probe()
Message-Id: <173962697359.235665.7938168679485045244.b4-ty@linaro.org>
Date: Sat, 15 Feb 2025 14:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 12 Feb 2025 15:35:18 -0600, Chenyuan Yang wrote:
> soc_dev_attr->revision could be NULL, thus,
> a pointer check is added to prevent potential NULL pointer dereference.
> This is similar to the fix in commit 3027e7b15b02
> ("ice: Fix some null pointer dereference issues in ice_ptp.c").
> 
> This issue is found by our static analysis tool.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
      https://git.kernel.org/krzk/linux/c/c8222ef6cf29dd7cad21643228f96535cc02b327

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

