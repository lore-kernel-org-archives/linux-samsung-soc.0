Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5711124BBE1
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184858; cv=none; b=oVPZuivihho/t8o42H+hmvJzTTFeIbvXTra4eeWCpuKt6+oD0BKTkzUrMfbrd+d1e+tF12W5Wl+R8gbQ5l3JsOyb5LN6F7v6CFBk3J/ABlU/FGIStMS+e3icHNTJUdncf2r9UCMSAH9UBqonOAQfPhs52uPBaRX4+ozdMo4AudM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184858; c=relaxed/simple;
	bh=AX+tj2pc687vNkVZN5TutAUbLg7Gdpmi9ojtB9nuDfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W59efCETh5cyO4BiZAhGW8rYsu7lG6D1cCcB57c0uKQUmchxp6rdTeJF6S3JLO1gGVj0aV/eg8oSMZXoO7+XZtP+GgEqhLR+ijokvwYg02THVVwJbsScaV+iq0QfWpAmWR7cJTExbdrGHnEZhOw8hgeT3JowdLcm+mcZVosMcLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fsGQM0ia; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fsGQM0ia"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390e3b3d432so4573655f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 06:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741184854; x=1741789654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=;
        b=fsGQM0iab1r77Fk9fRyhdjjBEX+wwBCm6iX9osRfWtFLEFWQZWfUL2ATeFirE5OYcx
         rJBj+3NjwR1nz8xC60n0Nd6RpJAZ4YF0Rk3PIDsrX1osdJOxQgvjQK04587zWH1Q2Ysm
         6pdZx4x8+JtEocwOgwoqYUlfPYxLK4dQ92+TUSOnNIag7E96wsYUETsuWuvOyWdDIYSk
         HudTcLgf9wcpstOZJ/g2N9OBpdhc8jGKIf9cKJvIJb/763qk0TuSms9FDzPrnDILpm6C
         GC4Rsm69ax/sxNUNarMCqlaNu0W/V51C8SM3bpvVNPPSnMUkWBVo067Dd6QpMY0fTr6n
         BMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184854; x=1741789654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ7phtAchKalRzfMPp/9VjD+dUYfNbAqpxaF13GODMs=;
        b=ZU1BxWIDfTHr50aRsiG6jmLei9xhQd+5WtXSKn/euEU3XxdSjaYzuh1O0GvKo6YVmz
         VnIVAyC/3hFohnfk/X14GwOALUu4LPU7lSINyzslQUskzyweJUsbzmZcVA2bP7ELIb6R
         VQB0+wBqGw8EHpH8rqAjB430hblAp1lCSq8c4srZzQr9AF/tQ0VH0/p4DWtG+PgwqL4t
         vwCgbZXu6BlM7oAQSW8oYLBeLKREoxzEogvytlLiHrAH+98J4r9ijWTwHBZLqQkmvJqp
         KZ3zqFFwt6ww2vHuCpLP2E4IMVx8Dp8KApv7gNL/Doq3bBXhlJzH6NJ9JbhzwaLO+ia0
         Fcwg==
X-Gm-Message-State: AOJu0YxJ19qEePFwRZfzvX3F1+nCv1pfNAb93pcKDRbp1Hool/dsUiTk
	S3RtkisjXy+8ypbzYMwmXkvpy7pM+gXDGsQy7FblxHVurOPiUCT53ng0FCg7QTU=
X-Gm-Gg: ASbGncu9w8UNVUJzLw2O4hUxQh27tMrDKileeRE6f3e9CRZLo5UDTRsx95GE9HscXqK
	ZijVnHKJ0cNN4nUjR5xmwiVw+xtXMLqyRoAmgZqg9txKCeYWtWWZ//PxBetA1gYIYitoD/aPiUh
	Xg7SsMr89LjdJElUSKbtIiDtoC5M+UdXeHYMjCeTcunEROyqPGaqu6oduoYeXAHnV2Qo5dv5z3E
	tEOSvcLusf8UFHYWx5xEiYfWVJLMwgjw8fOXR17jzE1fE52oUhEsCGv/+mfejg2iHuX38rQSgiT
	BEZPie+PWsBC0k14UpGts4WsKX89cDUJdQVjkow5LkS9AHRkSkPpWQ==
X-Google-Smtp-Source: AGHT+IGCYa2sszNld+5UXNNTx4iNaBRX4ci2aOzVOLyC2rHLFiTrvLpSwYOYiufBagELwGqLV6kyUA==
X-Received: by 2002:a5d:64a2:0:b0:391:13d6:c9ec with SMTP id ffacd0b85a97d-3911f740312mr2628688f8f.20.1741184854656;
        Wed, 05 Mar 2025 06:27:34 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d906sm21408096f8f.90.2025.03.05.06.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:27:34 -0800 (PST)
Message-ID: <ac6ef67b-84bb-4679-a344-07bba50e054b@linaro.org>
Date: Wed, 5 Mar 2025 14:27:31 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: Drop unused clk.h and of.h headers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
 <20250304-clk-samsung-headers-cleanup-v1-2-81718e38246e@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250304-clk-samsung-headers-cleanup-v1-2-81718e38246e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/25 6:45 PM, Krzysztof Kozlowski wrote:
>  drivers/clk/samsung/clk-gs101.c          | 1 -

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
