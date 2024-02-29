Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DBB7D06A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209228; cv=none; b=Xo+IGcPVStyM4K0WpRXCmLd6LZc4XsjZafws5t//8NqpUAZ3j9IdqCb43kmA2Q3hMrmT2jc9SHRpJ4BLy9OLOxsUeMNX0cwKCrnNiqB+Om8wXD6m7mPz8C5HekCBJTNdnNv4OFuYnUDReFptcWGESpuJNbHuNz6ZJwaudemsQ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209228; c=relaxed/simple;
	bh=t3T3nzjH4yLLDmY7ceHX7NGlnylBse4d450fwq8jtb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k48Rmcx0A8eEjMWerQHdxuUiPXbpEyG2J2LTbKRNGVYyqASUPEVulVG0otcE15+BfIKlK6ePWctH8Ln/hllzKZ10sIG+mP7lqNQaUcznGmaFZZueOqvHSaA07JIpMRFY3ioosIxjC7ajNew00kljw86vizPmGD6wxLVxYex+RkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ilk7y1Ov; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ilk7y1Ov"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d311081954so3685831fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Feb 2024 04:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709209224; x=1709814024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vjzIB8u0IabtEYVRJzJAEQ3mD04zR5ijVvS5JF9Y6Y=;
        b=Ilk7y1OveUlY0ZKrlqvJEaWe5T/tj7y6oJo44TZTslt/xnoJqIa+n1MY0WclZ4mmyc
         M3X3hpUa5QiNeE3QeKQb0TC7S6rvMANtidry8Olyeh557MXnn3RMMcP4B0xc9lIL0EGA
         vyz60EyDhVHe9bQmCIfKi4SFOroaGAOCzR93dT8bJob1a8LOIGHtIjIJ52oyC7WTCY82
         uffywOrceg1isdbDcNvSpqSV7O2NL/EPgO8MEaZWG1WyDSqhn+YGieDsjre57CNSAlH5
         8O82IV70dm2JvyCHkVNTSjE4rTk6VDA6WNXcZbpPisni6SrGzZ+JDjdZXS+wCk1o2rhL
         B5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209224; x=1709814024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vjzIB8u0IabtEYVRJzJAEQ3mD04zR5ijVvS5JF9Y6Y=;
        b=IRRgCamT1QaTLTXHx/ONpcB1SdNEciuNGgW7rzV2t1af5rR8y13D+iEb8Z1Jqp7JIc
         KJlJkm2Wcc82XmqNKH1KOmj+9CsEpTMVEyiUP1JB0TdfRwMyiGuiDVOqSVyAXiQrskJi
         uwcNBHJXfYRWufMLV0/TJ6SaVcMNbpwolpA/vzerc9c3f0BDahC/AzxycRbtgdUNlhfU
         N9yu0p+THEf4lwlGoSDEQa2pVZSdXbW6U5eTigoo6XfBUDxIIDB8BNeS2vTj0Iobnu2q
         k00hsYONKACgr6sD8Ue2SlQhzG8PcM8nA4JcwAIZ7nNBQZTKnNmNOsDF6XnJ4180xXtK
         fwUA==
X-Forwarded-Encrypted: i=1; AJvYcCUW9YNRCQViou0uJM5h3yvIQn1xSjP9QoiIPwpT7YftaVilraAMLCgxXw+t7nq9eKCi+APQ+F0Uxqk2uUarKdSBGfDhTRY/1WfO/xwJLMrFyXE=
X-Gm-Message-State: AOJu0Yzf29JYyQjNVvUAK0MLv4mi6lS3F6Pkmp/ys4sVYdNI3wUpUY2Z
	oVMDh6C8kqUURlx+Je/LPiEZDL1nDtUeSy2h0LzOwruAyDmSyqHeBP7Es7TrkUg=
X-Google-Smtp-Source: AGHT+IG8n5Uwvbvs8YE19xuHslAxDWVpeTnYjInoghHURNZKQMGqmCLjO4J8AQclmPxxrOwq2z/Afg==
X-Received: by 2002:a05:651c:19a3:b0:2d2:6c75:9a67 with SMTP id bx35-20020a05651c19a300b002d26c759a67mr1670331ljb.38.1709209224600;
        Thu, 29 Feb 2024 04:20:24 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5009121wmb.3.2024.02.29.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:20:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org
Cc: alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Thu, 29 Feb 2024 12:20:17 +0000
Message-ID: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce nMUX() for MUX clocks that can be reparented. There are MUX
clocks that are dedicated per IP. The reparenting of the MUX is
safe without affecting other IPs.

Follow with 2 patches for GS101 to propagate the USI SPI clock rate. nMUX
is used in GS101 to reparent the USI MUX to oscclk. Tested with USI6 and
USI13 SPI.

Fix USI SPI clock propagation in exynos850 by allowing MUX reparenting
for the dedicated USI MUX clocks. Stop propagating the rate change from
the USI muxes to the common bus dividers (dout_apm_bus and dout_peri_ip).
Other leaf clocks (HSI2C, I3C) are no longer affected on SPI rate
change. USI SPI clock range remains the same. Exynos850 patch is not
tested!

All 4 patches can go as fixes, since they fix the clock rate range for
gs101, and stop affecting other leaf clocks for exynos850. I don't mind
however if K choses to queue these for next.

Tudor Ambarus (4):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
  clk: samsung: exynos850: fix propagation of SPI IPCLK rate

 drivers/clk/samsung/clk-exynos850.c |  15 +-
 drivers/clk/samsung/clk-gs101.c     | 225 +++++++++++++++-------------
 drivers/clk/samsung/clk.h           |  20 +++
 3 files changed, 147 insertions(+), 113 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

