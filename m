Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62680175AA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706171148; cv=none; b=Rav8W7lsgOvKaPggNQkR8QY+/jEJ4kvqe65EDkW+HwvxJM7tkgse+ZN30t6XKw0AzPbKaa8hOQX367n+jqKBUw2F3uWOOhO9OigX2oS5uePkZjbeleIlNwiYnj+q9Z1tJCUBmEGHfYSzPPyr1F3QrFTtiyG+KdAh4hA5lOakmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706171148; c=relaxed/simple;
	bh=i/YxA22uUKOt9Mxj9tEsMSlwM/ZWHky9Kq+vcJ/LWt4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gHWKLPNBw/M4l43cDMSk59nsfetJ9tkZBGg00NPF59aNZMMfFZasFVP5YVRntZV3AGSZx5aKhqg/ZTysO2sZVkPaVoC/ToXzt9kHwf802RhWrw7YWrlExUKLfm7Td6Rn9fOevsoS4FYg97prEVqfKUsm7c9zfu6o+CmrHdmPWl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/ieXfko; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/ieXfko"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a50649ff6so7112328a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 00:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706171144; x=1706775944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKFVClDiXcnUwHJNQzSINW1Ng7JFz+zFFzQPZ1gOOKc=;
        b=W/ieXfkod6mQubBPhGn/Fc8zscj3NRsAJKQ+QzmVDtCfB//UKulecQO4mC4OkEf848
         0HPZt7NVt7wMSa4Uq84yITJHCvu99r8zKSVTyWCCR7cepFD6ic7GC83f2E1oWvC/E5Cl
         xGkIdUxadssjF9WWWm3nvASMKZWiwWdZAxlhd8Ylg73A2Yr9DVpkExttBV3OdzkZZUEM
         oYJnIn0h/vVMr2JzDSM0a1bzough3kzkNEoFrlvt804MEgkx/jsQVAH+LIFa0XcLjQ/D
         xEx7WBKDGwFkhjFAwt1zm7ViHjcBEIMbLZUnZMYDRpC1jgj8AzC6EalHkPCt+j/rllwM
         Hjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171144; x=1706775944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKFVClDiXcnUwHJNQzSINW1Ng7JFz+zFFzQPZ1gOOKc=;
        b=pT0AXsDtwPluCmw+N5Uw198ZCs4NtlShV5msGc2gf1C0qRcqQTchEiZCX/cgRlI92f
         +ziWM+mmX1ZQIsHGBotHYVfgU2nha+TpPKazuuJtYjLQNi88J4tjxgrYhVZc/Tr9agwc
         0tDCLCpoRZPJsvcfzz0NRoHLuZB5kwXVwnB4m9uot6u/+fQHdnxsOoyu00TmPsgbjXYT
         0R5o84CLZqTM6LSu0XQ7jqASa0aT4f3cn5l19WSOucEIB8mMyODOdqDyhv7gyzfShGZR
         TWyCE6wEqyUjEALu7afONFc5irNsfD/C1OwcrxTY+RqTcs3wpokixPOkPo+0pel5dC2z
         zYZg==
X-Gm-Message-State: AOJu0YxhCTXBi2uGchARpOQVzpShTWgTtnCunasSBzS+111tDRRfdR8n
	PoYS+KuDPXutjhF7BjoxrbprYShxplV8NB7L7CXTN1mz0DvJjmduq8RqHbwUl5Q=
X-Google-Smtp-Source: AGHT+IGqQUtuSHWje/MYMaxTD+yDmIj28Z2QSF4AwCZVmw49gair3JT/qApQTITIOCjJSVbrKkf5qw==
X-Received: by 2002:a05:6402:45a:b0:558:4a2:42af with SMTP id p26-20020a056402045a00b0055804a242afmr362809edw.10.1706171144554;
        Thu, 25 Jan 2024 00:25:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id el3-20020a056402360300b0055c82e27412sm2486010edb.75.2024.01.25.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:25:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] clk: samsung: fixes for v6.8
Date: Thu, 25 Jan 2024 09:25:38 +0100
Message-Id: <20240125082538.164262-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-6.8

for you to fetch changes up to d76c762e7ee04af79e1c127422e0bbcb5f123018:

  clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names (2024-01-22 11:40:12 +0100)

----------------------------------------------------------------
Samsung clock controller fixes for v6.8

Google GS101: Correct the input clock names to CMU MISC clock controller
to match received review.  The review was initially missed and CMU MISC
clock controller bindings, driver and DTS was merged into v6.8-rc1 with
different names.  Nothing was released so far, so the bindings and
driver can be still corrected to match review.

----------------------------------------------------------------
Tudor Ambarus (2):
      dt-bindings: clock: gs101: rename cmu_misc clock-names
      clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names

 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 4 ++--
 drivers/clk/samsung/clk-gs101.c                                 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
