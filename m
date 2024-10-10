Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C5A1C2424
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550509; cv=none; b=X4+KE5zjHz4Vrx1P8+tBoYuZD32CuC3jElsGXs7J0n+5t5n/8VbullnQuLGfEs4vJEEBYR3tlgShZ/Sk+1ziTECdYKG0oMfHKP5bFJOvukBdEL4eHVXG3PtWxG4p00FgUWBZuyLmKZyq5FX4hnAin0vQsfGs6/5CYOaGqmcWK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550509; c=relaxed/simple;
	bh=DAPSm/hVLz3ijVUhrjOE6QLXIASBKZCEsq0noyvklTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liD+HzrRtarG1bvFzBg4W1kE6CqLm17VZ2U4S+YM0ycgBwa4nz4ZKT7zaa9wkBEFrF+SmkDynuYgnNJiRNKRcGCtNpb/hT8bstFt6aPPcF93BPsgFCP1K1kW7cMBtu+AYC2SyNJ77TXCTq6qmhsQ5im16nBXYas03O3fCihWk7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cz1W01Zz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cz1W01Zz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4311173a667so1090795e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Oct 2024 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728550506; x=1729155306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrycbDdKyC3E7TIP9ThkxwNY708wBJiiusjj8WwNBJk=;
        b=cz1W01ZzfUWuR9fsus/Gol3pcabUHqqLqKZLdewIp/fOiKT6j3456+j/Ur23OVkhG1
         +WvDsEtShkkoIor1ycDm7DKKcTas4DvHyVVZ6UTT8Uq19QpPm9jMvqWGY4nwsy3LAKml
         eAorEoPiB7nJfT4pKEGbqISHUhHdsztqbSNjx/kIr5J6ihtyimSjTZqPlCwC5x2cs+I8
         8xqhmuptyyd4pdvR7tzNqptCkGaxA+QMjdB5iaNMlnS+S4Wzo7HXNW9bDXf+LbUY+HAh
         aOLmp1h3wQ19hIL8TGlGzIM9as3jKp5sLyHGc3UTzAs0DUS10/6qOMNbSoUA2Oo9/8Yp
         r0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728550506; x=1729155306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrycbDdKyC3E7TIP9ThkxwNY708wBJiiusjj8WwNBJk=;
        b=ROorza6SbINXsc50VguUPjiCvB2ar+xCQHRy41sNBuORMN57Lx4ROJwlORlLYi3BgB
         D1xRzV6oLmAyxylLkB7mVCjhxn46dVbZibxikoe7OWjvM6c6Axmy1qAUSFjiZ8AgLwba
         0SPh+4D3i4CHZbOzWLbeby7tscLkUmIi9jdkdmo5xYr+xZIALLriz2i7r/twB68keXHn
         l4sk9k/PTMoFNVOsfh2caAQfFKXUSEm1bI3/5Xs3c7DVXvZUXcdW7fE9ruEYzT/+xTGo
         o/CmIplYmBietthP/0JQqosDZTEEMgVgt2JWQk5gDt5NSoOfiQtBcHXohPxpdHj+EBDp
         tNfg==
X-Forwarded-Encrypted: i=1; AJvYcCUtJaisKgnyWh4GTBsF3ItWgjGIAPDEUbG+46jHVEgGvX4rX/wanAOf8I1A2AKu3yXt3gDfJLfa2nO3miaRFFp4Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFZ9JMJpVQ3s6NA8ss/65uT3d7VSBIhL5iqrHUovfEfYczvbwJ
	yeNKgY5VFmU4rKzt/lOYmzEInGUXFWT/MBOfEYT5Ylcu/2TbADuvh9Yz6t+6SSQ=
X-Google-Smtp-Source: AGHT+IE+XisM25TXSMRumwkRzfnx7ug3YKF4W65ELHrKE0cNsyxjqHzTzMSSWw8nejs5fu7CQWuVYA==
X-Received: by 2002:a5d:47a4:0:b0:37d:4ca3:310f with SMTP id ffacd0b85a97d-37d4ca3320amr425550f8f.12.1728550506310;
        Thu, 10 Oct 2024 01:55:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bcf5bsm902012f8f.32.2024.10.10.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:55:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 3/3] arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes
Date: Thu, 10 Oct 2024 10:54:57 +0200
Message-ID: <172855049021.142350.11192744984413757568.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009042110.2379903-4-sunyeal.hong@samsung.com>
References: <20241009042110.2379903-1-sunyeal.hong@samsung.com> <CGME20241009042117epcas2p2335311cae816f9c92b15fcd28b56e413@epcas2p2.samsung.com> <20241009042110.2379903-4-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Oct 2024 13:21:10 +0900, Sunyeal Hong wrote:
> Add cmu_peric1 for USI, I2C and I3C clocks respectively.
> Add cmu_misc for MISC, GIC and OTP clocks respectively.
> Add cmu_hsi0 for PCIE clocks respectively.
> Add cmu_hsi1 for USB and MMC clocks respectively.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes
      https://git.kernel.org/krzk/linux/c/ef1c2a54cbc7d9446659115c3a61e03f97ba4a57

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
