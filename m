Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4501DEFE0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201784; cv=none; b=mzoAuEIoDuRscVos7OgK+47B9PYKxBaL4Xc4XcoW+YGk/aT1TOMiJpKtIzYSKR/D5cf0oBsi3b87b81o8T1FwUkMKiJa9M0uZIN7CMZC6BjSd92zB5WC5DgYCEb84EoZBcvDYo5/lA2URThgWNhWdayMKIzFo78/5iyh0mvL6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201784; c=relaxed/simple;
	bh=YXN8hyLuHQAhrc9NEQKCCoyB39SPARw+nLAxEXiu7nI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JUojjZ1EeqeYvz3k6B9/DVWqm4+AuKEiK0vT12ZrShsCBOprf4n4fh5juVS5J3K2xMBuae5yjIp1xgVMiHF3Ro64gIoC8JE9+yCJ1P5PabZouwFYWTpaLAOMaqDYf4iivwCoainou2onXWo0v9iwIk44XTOFWSqiGcjI63kZLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HK//WSce; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HK//WSce"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bca8cabc8so3338725e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201779; x=1741806579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=HK//WSce+NmDOQYZFWgdWys+wby4qnHuMCS5n2Rjuhcya/4pyAFjzGvs5I7CHqcRgE
         CdjC8VZtrBOxUae7KZZencwDRWQP19KjHX/vZq3huCisginCQiNtENcOekHH07hNIqzJ
         LJ4zTJP7zNZq1zYgjGiL3GoqrMvxLH21LKzY49aX+GhTEesCBsuJZ8UrGDIskynoyNBh
         xJi9ViscitYAEmuX8oGV4TovYxzhZnDInwFQdkKQwDhOOVj9LkbaE8zuqY0sHHZLQSN/
         bNy5xVFVNi7KxJamVYw4htiZV8lyWq80236h7UAguTCICsfrDL3yrAlC5pUFMhz7yR0r
         2MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201779; x=1741806579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=pecA2bxb01fmAKGa7R+kIAKJAUlxtjyM4fXciWJm893+gXM8Ad17PBGBYp3sgYkBrq
         nYdL1yuLNkTIyGOPQtxvDRZDtyhkrR3z4s5MpY7wbC0Bra2EfkigUsPvhUISLzFWm5i2
         nSerj6EvzqkgNW2GQnl2XnOv1uVjwoYkKNwLR9IvOTJrFK+3F5Lb8/mGOC5RWfqSabdX
         47lCGdevWaT2wt0goYmQA5W7lYY9oed/vhcV+AfokLS2Hyi1TErRyU1/eEyWuXB2Kpn7
         kHt6Cus9vE1eMP81Vcv4pwmySdRVh9UYyxGcS6w8vWO1TfCPy7IShNlOsyiPpGX7MV4F
         xC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRwILw2Fq7o/Ftj24Rf/1ZNCE4mmVSl9fNijUanTSNVP4658GhIcZ6CL9S11w1SfBVIyYfwi31693BXtb9Rb9znA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBjGGndrOOAFMYmHcrCOu4j9y9qmyV2GE8BjPWK6a2iPGtzyaZ
	YmCTf3bzuq+dFgPtfwtKQHP2qlrHPnT+R4xLnLmvmExB1x6ev4umXxF7o9GQjcwpUDCApRXlb03
	jLRk=
X-Gm-Gg: ASbGncsEWLqwYPSSEoEDlNdPZB8lIjbg0FGCYkJ1kLECnh0rmydaVWTCURhLFkvNHWz
	T2tld71CnCdAqAtxgsgKJgmA6YjHa9PMn8JpLhXl7Q901dpipdx9nKrUU2rQwdtrOr+pyQFrf+U
	1CbBJZFV99fdn+4WgGjoFPNvN5cla+djY2WPVHvMbf+Vjca/B7VHHqyzpScKN+1S4NK1Fo8P2/P
	yqrRupjWHAcsRBXn43qgYaSMpEV+21OTXA/q94falg8fojHqcvpUbfmuVE9GhupEN17V7TgWOsu
	uDHYA8LPjF2JrJeH9V4FUlM/g+Y5cJZrJAkemJg1vcLRE/CgYpVYs5nAaGb5
X-Google-Smtp-Source: AGHT+IFrSoo3gOE5FHktH87GAqLOOH8zzQprfwlqJYQydb/cjo2MTzmjtJwGHriaXSDaH9mOaM27Tg==
X-Received: by 2002:a05:600c:4750:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43bd29d8578mr15177295e9.7.1741201779287;
        Wed, 05 Mar 2025 11:09:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eb1sm25628705e9.31.2025.03.05.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:09:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
References: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: fix synchronous external abort in
 samsung_clk_save()
Message-Id: <174120177454.75135.6216013717633178470.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:09:34 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 03 Mar 2025 13:11:21 +0000, Peter Griffin wrote:
> EARLY_WAKEUP_SW_TRIG_*_SET and EARLY_WAKEUP_SW_TRIG_*_CLEAR
> registers are only writeable. Attempting to read these registers
> during samsung_clk_save() causes a synchronous external abort.
> 
> Remove these 8 registers from cmu_top_clk_regs[] array so that
> system suspend gets further.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()
      https://git.kernel.org/krzk/linux/c/f2052a4a62465c0037aef7ea7426bffdb3531e41

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

