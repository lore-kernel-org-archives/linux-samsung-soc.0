Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95141B94A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706171047; cv=none; b=gCqb9Ech91lYcMUJm7Pyhl0fUGpuqJVL54MpWv/DmAzi1PhQOr1jyfsIZxFjLpqvwBZTGDjhLh7DRz1hlPUcZLG4DTsjzZfJhnlHF8IXuI3BUxLtwMjJHewwxwpaeZOmdbwbsdrDPVxlPLOkxGFdTvOUO/dlN+A1FcIyCba2nSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706171047; c=relaxed/simple;
	bh=Um4wnnBqI9yETcC7zi9L6RAIwxqKgYF3DO6pjS3x7Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LjnEYjPi5bKXSK1+9ji/VHwQ78lOK20+CHwQAn/GdoBlnRGkcepmt4wE5a7E5jUsTUEEmoWpgUuemyNlMq8YyIGzURyVs2hEqD9+tDsGfhTVJQJiPyFF4BdgeA3oWhixkPmIoQEh+RWMg5WzYJzHVw5F9NpO77i2alZ2UnL0clA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H/iTapwY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/iTapwY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a30359b97a8so458893366b.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706171044; x=1706775844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwJ5DAWSzWd1enombEwhf2I3bPyYvotqW45eCtT+UME=;
        b=H/iTapwYb2/O/LU9mavOjjtVJ6++3GgopKwYoImRQja9+53yRG+Xn2iLaQ+WEymKFq
         2VDQw3ftBu2Uf6BKHeU7ki4tmJRYYWlc39vBLaU6+vr8VFc0ZcGyh4gj0Fw7vTvt1jez
         KXzKOsjX2uwrutXe9rXeW+0WvTj2JpUnHjdJOwI8mQ7xq71LDMNi4dmFkKxlQcTd7HAm
         +I15LyJE24YQ7c3k8fZIS0Vi6IcmRMHMXnHa4R92DabXX5ghJKG1mMwApW8Y3hmDajQi
         IZT1RY7SPhcVB4+1Wgc8WdBEGpH6o1FjXQ8m4WqaiLLhUi+4iIG/1LhtmquMsqcASYI9
         XFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171044; x=1706775844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwJ5DAWSzWd1enombEwhf2I3bPyYvotqW45eCtT+UME=;
        b=Q7PCMRtFS0dBNvbI3HUKEmahbSWCiHwP1G6BaBoN26Pt0YQF5CtZbx5Frf79l3H6XI
         ZME2eHSo0yxrcapW3q6/EJbIjbZKL9NDJCa8jI6xxzxyUTnGjlcidaVUtVEK6r19sfYp
         fxlqhXykm+qjDDZIjfTky9vGeDlqbjb7hJYU9LH4kkYee0KIBaY2NU4/A/2tUpXpWCdk
         zcE+6IP8o7voOLVacHQXTyIsVRvXvbtaqJk0jxK5lvz1e1FwlErbjpHtkZaSkC4PCl2W
         qKV97odQQoubpJPoQitYpgAczCLf1NlSypVCtAS93JeYX1akijf2cUbhqNQdYroiDVbJ
         9YVA==
X-Gm-Message-State: AOJu0Yx5Dk2ls4ya/9Pf6lAuN6/SLLtJs3RcMHANMqKcA3DrBtE+sVsA
	cFwTuyc/QeFFjqZp0fd+CfYagqz5W2htZleD1Lkw/yOMsYckYkHnL6SxV8/7FDQ=
X-Google-Smtp-Source: AGHT+IEIBlIqDA3FZk5B1PobloccIaBb+mLGySw+C06q20ik4ThKDL78mUfxQl4BIJdzbpDgei1JoA==
X-Received: by 2002:a17:906:5789:b0:a30:7293:e872 with SMTP id k9-20020a170906578900b00a307293e872mr298188ejq.106.1706171043780;
        Thu, 25 Jan 2024 00:24:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906529a00b00a2f181266f6sm761456ejm.148.2024.01.25.00.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:24:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] ARM: samsung: dts: fixes for v6.8
Date: Thu, 25 Jan 2024 09:24:00 +0100
Message-Id: <20240125082400.163935-1-krzysztof.kozlowski@linaro.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.8

for you to fetch changes up to eab4f56d3e75dad697acf8dc2c8be3c341d6c63e:

  ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd (2024-01-22 11:51:14 +0100)

----------------------------------------------------------------
Samsung fixes for v6.8

1. Google GS101: Correct the input clock names to CMU MISC clock
   controller to match received review.  The review was initially missed
   and CMU MISC clock controller bindings, driver and DTS was merged
   into v6.8-rc1 with different names.  Nothing was released so far, so
   the bindings and driver can be still corrected to match review.

2. Samsung Galaxy Tab3: Fix display by using correct vclk polarity in
   display node.

----------------------------------------------------------------
Artur Weber (1):
      ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd

Tudor Ambarus (1):
      arm64: dts: exynos: gs101: comply with the new cmu_misc clock names

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
