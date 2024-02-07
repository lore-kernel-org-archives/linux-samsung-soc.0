Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CD480049
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707320310; cv=none; b=ScuHIOLu/+7AKYhdIfzi8A6uOpq1CZrhkIbC3UQy0rXr4HrJD49Jgqif3lZn76e8QbbROzoBDRXNdY+0jRbV5euZ5Q//uE2jjRCR+OZ/oLlBQbXKXmksalW3JCgvp+tb9QMs1aaM7h4ziW23zPPEcsDPU+YScaImI3AecA9dieo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707320310; c=relaxed/simple;
	bh=ZWJ2fuksDz8u5TB6EH7M/D1Xg/5ySwPXMM0tvokLEYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asH0nTXPGxVPlQbmCzqym3UURtXtJxox93xtkQRwVuZyn48g1u1Xv7Ny47/Mglsp4QxHZkwoqVC2zGJghtnyEbFDQmaO0A5yJ9RF0esohKccEkGkQ2TQ7tnYuif3+o8VLje+E9nPU3PJO2pApZBGqARWWLGsZcHnxvNV4qHzHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QUKs2XCl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QUKs2XCl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3394b892691so462974f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 07:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707320307; x=1707925107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7lx4rrfuIWnW5mJuPPkI8UfAuAK3avv4ybgNPIN/64=;
        b=QUKs2XClvMH0Cp/yFU/czlwtOKaywMtvttYCfcLgxuaIrctFHAbklk/Kwc4ogIY9x7
         8ZQ2T/HwS3T+eY8TmYXpu1uE67rjQT5TDLkJ5lISWJBIZ23Qrf9BSX0TPiL8ljfjpoDM
         PSBKdyjDv9LP74But+WwUJtV4bipVDXPT7pceWUGMdh33UENJEJkvKDFnHlzl/l69nyG
         Si099ogPRx3yrChn8IAsXdyB+AB9PULWr2aU4AaWZ8ARwTTZo6wMm/vcDufkh8OpJBZl
         aVUByQBHz30ijZSLQiZxMJfEYIqUdpNgk1YfRukuxiZtCbOpa+STl6HtyuLQOKrj/QBc
         e4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707320307; x=1707925107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7lx4rrfuIWnW5mJuPPkI8UfAuAK3avv4ybgNPIN/64=;
        b=XE4QXSJ1+0/r9n100gll1gGCX1m2guo+HKHWRaL7xJ/kmsz7Xc+zoc6LeQbkBoxza5
         FtYAxd3tmc9ikl0hVmEex7Q4Y8UXLDDKf82PsL5QcUO+ee4H+6vZ2W90Vp0J4PbEd8lH
         8xTsBl8Y19Jo/pQ+PNW6xU9NAQ/vluwJM2H/uX90y7mPb4/GZcDnev79DeHr+FTvvqhS
         uw2//vshNFt4tvU4kFHao8VQH+fgPmKDRw6Ne4KPtX3HIenCSefWHhMU5DgxOxVG6fGw
         2StB7W4bd24kV8XCN/PXjGEHRKhhFsaWU/o4kQ9/PoM5/9QbM7gnCjURG8kE+to9dj4W
         jWaQ==
X-Gm-Message-State: AOJu0Yxh0/LfbCjWSpYIVXDKxFQidodTmueP5JsK0ex91UeG5rOZgoZV
	cWD8JZGo9HUU8LZBNxUVJowfilJJxRAgnuZ49fAmoL8xydiYAj9LJ8ewKBnLYmg=
X-Google-Smtp-Source: AGHT+IFhCskKoeqkai1R18bRIczhygPyUEH2tFh0beZoCJLAb/0BPzw+H3RyCqbm79MxZ8gPLd4VvA==
X-Received: by 2002:a5d:4989:0:b0:33b:fed:656a with SMTP id r9-20020a5d4989000000b0033b0fed656amr3545820wrq.35.1707320306993;
        Wed, 07 Feb 2024 07:38:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAhCrtzpTfYcQrcrJFlM2VE5F3w0Xh3sTuYS71tndlrLEa8xoTqwD/tR0xgXEO8Yc7dwoKk3wFXFpE7wsudXGjv2yfS1oOHK/N+dEP8welOaaNXsl6f9rU/qCEk50BYqcInoAtZQi3vajtAijgceASeIIH7heuIgPT+B25cPsXhoBYI9iU+6HKQ9DqTrGZajA7Qc7+2LubyqzLWx/fU0WZ9PicFNgAhbnQsxFd7+XrdYdfxt0eNV8dnogR2BSiLC+slp7GbPLmjekXEDffTBCVIX+HxDrgIIDUz5brcygFkUcJ1Oj4wmdQatw04cJ7USQMOBpehvFQ03Y/MkmHMyMur4tBF6ur8WoOkixDpY4fXWWcVd7gKUxliGOhymYfITrzGlpqbPhrMikIgjYyswGuFFZ7kykq97GNLNZDsvHcrrliaa7qU1ZH+0T5SQEXXKvzKLWJJTlZrUMbFJlRaXYPFre36JNDav3lDJ2xexkL8to+7PsuOavf2/5bTYUy2V/p554KazMO7xmp6VZtu6MEZKG/yuBdR7dOH7/sTwIp15vHs9Y67g+lCeHstodhII3z9Gfjo4UlbZ8r98kNdnn8PeJF5AxWmPafn/MmkRu5nPejqeTwysbdNG9bFwv9MBXsJBqoJYMLowpfnw8ZTeEkun/cIAqnBg6k9WwJg5olzAs=
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b0040ef0e26132sm1307678wmj.0.2024.02.07.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 07:38:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/7] clk: samsung: gs101: add support for cmu_peric1
Date: Wed,  7 Feb 2024 16:38:15 +0100
Message-Id: <170732026218.120770.1198714836508934799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201161258.1013664-4-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org> <20240201161258.1013664-4-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Feb 2024 16:11:39 +0000, André Draszik wrote:
> CMU_PERIC1 is the clock management unit used for the peric1 block which
> is used for additional USI, I3C and PWM interfaces/busses. Add support
> for muxes, dividers and gates of cmu_peric1, except for
> CLK_GOUT_PERIC1_IP which isn't well described in the datasheet and
> which downstream also ignores (similar to cmu_peric0).
> 
> Two clocks have been marked as CLK_IS_CRITICAL for the following
> reason:
>     * disabling them makes it impossible to access any peric1
>       registers, (including those two registers).
>     * disabling gout_peric1_lhm_axi_p_peric1_i_clk sometimes has the
>       additional effect of making the whole system unresponsive.
> 
> [...]

Applied, thanks!

[3/7] clk: samsung: gs101: add support for cmu_peric1
      https://git.kernel.org/krzk/linux/c/2999e786d7e9596a0057d70098e339d59d7e72f9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
