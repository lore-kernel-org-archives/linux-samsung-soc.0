Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EBA245008
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808011; cv=none; b=cXAAKxoqsWHuUgZg/h0WohzQ+iR/LBnt3v9eqBifZ1c1/gi9BCiuWWPOZK+WI1NIjUqZdL3UPGm+iEqCC57PAQGpX2xhTNwf0VF7atbW2B6dgi18ZgCqN8IE08+roQcRMWblO10PSePtnKW/5bdukqctV/+e2Dl5GAWXTRH8E4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808011; c=relaxed/simple;
	bh=vg42KvZVt3grWpFEwkoTaxWeHLF6xTh0VHrTgE6DOaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BkfBO7K44LHRu+Af+HETXUkQY+PCGsehJRm0NmyqJ/YzeNqVeIm1bprkWhunQnX1YHm/f2bl9nkRRlJGr0q6TJDJ2nsTK8v+hhckgn8rYEO8v7XLg8/+bnspdt4jK1DElGZTmI5VB4FqIzxX3kKASDrSXy8WLqU+QOR1o+0nVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=axR7RU/+; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="axR7RU/+"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4557950d23so52860466b.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Oct 2025 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808007; x=1761412807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x00T8hSWTvPjR/PV+ewhXMDM1VtYrlavfAoGAuH1srE=;
        b=axR7RU/+cGPW/Jgs1pfiA0naDKMXwTOHaISJtu96WhpHfbIynBlQ3wKOIqyZFxqypM
         BSJcYXw6/WbifjO6tP9EWBFs5DCqMOd8BmKKzNULTyY43TsOh+jDa0ZrZ3aPzegdlIee
         N2W2Z9Vc/Jf3Hasz8Bbstm/MbFPiMPqP7zzjUfL2sv+hXeAERdgprxPwTIr4toGDvHEf
         SN5C9J2kL++7oXoYEUg2LgR2AB/JzdlHBKw/qyaQMwUKieWCo8oAdmKbzdIt3ocZaOpt
         1lQShfpZYdWF8A1VtsuSW1B5BDccgSBIZUJTzjEX9kCisQQkUXePZlyt1jXAh3T1wmzT
         1PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808007; x=1761412807;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x00T8hSWTvPjR/PV+ewhXMDM1VtYrlavfAoGAuH1srE=;
        b=IbM8ln7+/DUoFOGVtuGhVEhIS2pgJcCPzMKDkfZtOVw88rSq6TLn5zu2JlNOYyxHUc
         iX4ujAKyr3lVxlovh0Ga0vkDAtokb53xffXgfgl5SBa6A6jeuQRm+aTgYuHviza6oDPk
         RU+chuwLDJcq9Q78k+wNa6jS7tHVWgdOrGzCCa0ODe9PEP7166NO1Hgh2InM+LBG69kT
         xATCGi+4/6ti8lXSI3EJloQLSJSBhEsOPAe2K1Zb0qy/48CdWzAbaec5Jm5rhHTR9T17
         67lPPGAbxzu6OpRHG7e2MsTod0Apse/XpoiDuDDmDCiNRit+/cqhjrrSloMhOM8tDDMO
         QT7w==
X-Forwarded-Encrypted: i=1; AJvYcCVhzyYxjSeKXmHHJ9Va9YWvYHF9cIUGc2h6KillnYSDEDyRuuqab2ngy0G/ad9KU7kz1Difjw+6KaKLi3ppaMQqZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrXyXvxr15lpOQx24lbULeEyjudnQVoWhYN03XMMzuRolL7fQd
	Pz2bR8ZcoMRj1IrEuJhrlh5mGJgWPCzjAbTjN/K4z2KyP3FjhINIMahQo8iVr3Kl//k=
X-Gm-Gg: ASbGnctEY/q5AWHATbdtSon/CnNTCTEndGxrp4O7R9S182/Hdl5MsrAi+F5NpNP6fpp
	7NQLKIrWIOkQFsIsLUry85AQyZST4pw8lIBIAPjR1TjiktellEtvPHXgvxS5irxPCgk7y8y85Pr
	4LKGUJYEbXmcBHXw3OYo3msnaVXrKVFfCEnHRKe6peL/lPjptcRR/P7kxTWRMlZTdUbZCaud5wn
	gBPBU1aXrWlmRcFVBGfpKh5jezmvT9CpGl7xFlHZ+yvlrT7dlXjlfKiOhxI+JOSVrtib4d3SAa7
	CpIQi67SfJAhSVVGPkMonrBZGu6tro9JkKxZHEXAUppHJZEdTutVzPNiA5DAq61I29dqJSCqulf
	1g26IBcgfHHFzLWAyRawBebh/Ig1Hq37O2/du8HIe7xxGw3B0Ie0pXpW1jJGc58Zalxf+/xblie
	0FdEI/W7KJXaIzyRAO
X-Google-Smtp-Source: AGHT+IFSGq3ZEBbgPdz+Al3sMkuXJaRZsJGuzuIpXqA4Kk0u8lvyKGkeLN15Xp4kSmIuqK8SKTLelA==
X-Received: by 2002:a17:907:3e1d:b0:b2d:a873:37d with SMTP id a640c23a62f3a-b646f894876mr524393066b.0.1760808007534;
        Sat, 18 Oct 2025 10:20:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Protsenko <semen.protsenko@linaro.org>
In-Reply-To: <20251013-samsung-clk-pll-simplification-v2-1-b9aab610878c@linaro.org>
References: <20251013-samsung-clk-pll-simplification-v2-1-b9aab610878c@linaro.org>
Subject: Re: [PATCH v2] clk: samsung: clk-pll: simplify
 samsung_pll_lock_wait()
Message-Id: <176080800602.47136.11869769472487961810.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 06:27:16 +0100, André Draszik wrote:
> readl_relaxed_poll_timeout_atomic() has been updated in 2023 in
> commit 7349a69cf312 ("iopoll: Do not use timekeeping in
> read_poll_timeout_atomic()") to avoid usage of timekeeping APIs. It
> also never used udelay() when no delay was given.
> 
> With the implementation avoiding timekeeping APIs, and with a caller
> not passing a delay, the timeout argument simply becomes a loop
> counter.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: clk-pll: simplify samsung_pll_lock_wait()
      https://git.kernel.org/krzk/linux/c/d669ec6be0b1965c67248407d87c848b1b7c12ae

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

