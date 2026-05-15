Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC23AC0F1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 08:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832447; cv=none; b=NjimVLK5u2UMN/ncgoavgX3lwZ88JIUJ+dkg6GYGLJ86Ch89yj2If+beZ5K3kzkjUDQ9K6GLqpJb8g4mG/CT1004VUsFxgRNNF+vj7/5dA3aaRjVYe6HaRV8ci4oNU5I4ay9sfZxp5921Uujq5nK6VG1+ivcM2a6upG4yWlmA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832447; c=relaxed/simple;
	bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqS8EjpTrYhn3prSoV78LnuO+08SOQPu5bCJ4l6Dmjvo5C8m6k9M04jkBJLhaiVPzwoiQT3wBCAc6ofTTQNcSmOJ78j2jL9zSgz2KMQU3EPMD7Y1DQCnob/sOzvGYRDSnFletLJZvAGXxTEFsSbGU6WAKbRp5L60nHnB1GEAfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gyufspwc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gyufspwc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so385953f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 May 2026 01:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778832445; x=1779437245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=GyufspwcjQNRqQnWS5peKqpJq9HY2hgMsYqr+16b+YUYEhBJI773Tf52WJoLzKBdmo
         jS190mLk61q5433HhZlKQSdgvoHjG4pa8oLAGwbkuTDvMTnoGqrgM9EeWH7MFGWt8iGx
         5XKJk0WnCDVK/32mdjx43Up1QD/WFiJzi7TDMPTj2ZNIzyD7CTzQXu7QD1Fb7U/uV39N
         ZA4vQ3JLmOMCrkiqYzVa5F60coZ+UVLBBZfDi9aoLbdHyexYUoHLRXWUR5gfXvCdPqy+
         EXAaqsttEKtKrlx6QZPxH1+NekIUrQISM0W+XTtew7QbG5bY4QZC0oeAl14/WhFkmnDi
         Qt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832445; x=1779437245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V6I4GZCvQ4hrO105EvkXgSgt7ay4sYDZs2i7Ub+jlc=;
        b=B6tbORq6tMcIoKsNjnLqQlx9xQsGuPplG+urCZQbR2T4gVDnqYnTaoQZjXufrgH3bR
         Mf2Pmw6wlK0w62lv4UFuO1Xk3y99sQZ0UCgTfZhNA7IuP1NT5uyqkezQyvf+Sac05AM4
         msJaL45dDOex3dvfrajPOJxljY5OqEBE64cCnKAjFxWaWb9H1efsM4IxLr37kUm41LUP
         k7vqafCSTP0FK6GxB+xf2syHvvxugFHV7T01OL6xP1g4BwR3OlRzn61DgW4YXd0f3hna
         yBC1ivKfQh+z4h2OdNh2dfnxVXvIqmCakiblZP9lC/rMzblnJeg1tJEGReA1MN4PBhbe
         CVlw==
X-Forwarded-Encrypted: i=1; AFNElJ8Nv88cauezCYVxu7pY5KnCjtoXish5dZh1Og7WhxdXxhl1bSHkjbDyifQkcd+G3kG4gxfSBFp0/DxdJTfYOcqYKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzjJwT8RHIylYwRSPPAxiZ/0Ffs3x53G179xsHLarXVZftO7jN
	q8pwBS80MDsUAkBmfyP2hKtZNFkh8+CDoIXPX+EBot/v3MC2K8IxfmlK+ciy4eCA7Xk=
X-Gm-Gg: Acq92OFrQ1DFlLeHdqpohue2S6rkbG3ClbNgn/ax2SG++ORLP740wg3XIwZ4EyChGnp
	isQvDc8F7nWWTjXPujXL8NUQfo82Ev0NAkPLTfjQAXKOhYmN9BoJTZiNP8dyz6S3IQy96hVy4Yt
	yw5jdPw0dKxL11jzJAJinoGgfNp+lPCfAxRoqmxzMhIbc1PJeKmHVthD5qdWyweW31Yj4+kvC5W
	Jl2RdM/0pwQHJQ/QTaQI4Mx7AOlgh7PU3u2ngO0AzhrZ7Fs0w/eckgdStEIKOBXxdq2TD+8lkjp
	U/GznfTiEWi1WWxlz22JCGfcTxKW7P+CDmKNFSKQRRj2+ej5kn67fGU92U4+hoWxUXP1zJWKUl8
	BQbeXifMm1woemxY2LWkzVEo4PtBDJBGuzvTgznjiq0TFeYQi2BiPXFShI4qELJnSrySfGyb5Tg
	orGsJOlEoOncpF0j/m6XBbfTG5IyccCx6RRDbTIHnJ9wU=
X-Received: by 2002:a05:600c:5010:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48fe5388407mr35383865e9.12.1778832444691;
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm15226925e9.4.2026.05.15.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:07:24 -0700 (PDT)
Message-ID: <cf52c805-a08d-4184-8520-4aa126360b6c@linaro.org>
Date: Fri, 15 May 2026 11:07:20 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm going to resend this as it seems sashiko couldn't apply it:
https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

Cheers,
ta

