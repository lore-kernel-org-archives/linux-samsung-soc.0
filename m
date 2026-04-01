Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E8A282F15
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019121; cv=none; b=tLENgj//9JKBsT7FkqBHpaasMYEPKnwKd/aUH8NROSKRckj+1ZWFdJeK62ewgiE1eQMxwBSzCH/R+9rX8GkU3iwKNlVehZUgMaOjCuLp4iYkqDyYUXzRnw85cUN+5U9U8/jKgI32ZN7rCVZj0LX2ITfHPSn/UvK6X9U/GWN868g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019121; c=relaxed/simple;
	bh=o2O4dSavHuk4W7rvfyYbGAafzKHTinhRAGTAXvuGCwM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F0qEe/FnKV1YdGxTNh6NsbIMe5Swin3DIG2d6m0RygGaKhHOjdiSFo0Zp6GY/wf3o5IycXhUyfbeiLwUqn8X6Whv1iPnR/uKBkH5tmC/0TZuzzQ08S7UdgdCRcI2ROi4kF0joXjMFCu3yjvnZLAKfmoSrhEx/wMDHtwyDeyR+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUSJMmpN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUSJMmpN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so3711675e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019116; x=1775623916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TTpVNm6mKhuRORfvWFehpqSJRzquDpB5/uvlMx0PZ4g=;
        b=UUSJMmpNg5egAwJacgJLkKD4Bjt8Mp7EykVKH/W8KIbcLl6D2+1sB2pssgBheZHnPx
         E3DnKsgihpROJgw1DZSoVIn17YhYqJZjDWIDbVqHdu8X22qGH+8ZmDkwKcLR8OdLDyhu
         vkKlsnP1OTRI4MXq0bHMMup9PZgBLej6ywzYavToybt8rMumeXAyskpRGe4HsbcBy/uD
         UQyrLAxMvw8Zn76Cv0ivLhxFzfqBTKEN6OfjNFCZnJHBDIyEYOXuagTv41s5fmQcNGB6
         utbJAU0d6jH4CV3ST6C86Ez0q4ohK9w++bxkIn27rbyOH1tpc5TfvZaoVBeyxIJAaGgG
         foCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019116; x=1775623916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTpVNm6mKhuRORfvWFehpqSJRzquDpB5/uvlMx0PZ4g=;
        b=Hf5VOp/WVDOK9oObiqTpA4HvvUzTsDRbqwkSqnDG5qJ9hRj7SD1D+0zSgCD356dVDr
         NezFCEuH9TempzlF8iml8vHxGlLXkus6BqUl0T9ABQBB8oRY/TZjjfOoubI47oolt83i
         7nTIodLbl8E0yz+CBSl3OftHTu+aTsv73DA9hZx5nMTuhD7f9E+sFRmXXIVd/pfTMfot
         8/bDHxVI06rzWmE/7nIK2+HqjHaOEMICydNValvrj79OiRtxoWkXplAemn83lbQLgaKD
         HwZtPwHAqQ+yn3npVUHvsVfw5szCMc00o5pal1nY9fl6OFYJe4wl9MhZ7VPcwCjDY3Gk
         xrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLJvexVn2pUryTMZtSwX8ixz+VqLBQ4cIrS18B7ruUFzJNeFNPeH6Q5viraA1h7adRPSBFWXZMocoq6e7Dhu1ymA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmJZ+2lRnLlNjRqpOYXLtMyb/2mfGzYDpC5fBMccrglXUcqa14
	4aZG3harxUIEiHNfa7Wc1obWtsCic92R7Z4OWGEqc9c5KmbIrCJdkHgdNRG7s5t9CvE=
X-Gm-Gg: ATEYQzxy6zWhmYtzgjVqwZRrJwu7uuZ3pF+PINW9mwBaYRClTlKVqNSSEZKL7jma535
	qMRta8oAyfXnlYp30y5ZteD9daAHsyG79V0u7kEXr6d2tr6e5gI9OSzTgDs/tNxCdd9QkJtOUfg
	E/oKnjB+8bf929uGDzfPW7LK+Vq/1HicWUOdnV6TFr37yXn+gTNPA+sMZGZVQLIUqgyfKl/ELOh
	Qu5iKAnm31tNOBMju2vwIfWON3b2lSCmjWrePGQwViocT5fA6ncUwWIPofpKdvRhPuV8DpZyCZP
	/Nr6eNQi45oo30OwN78qSyPuhM9xS4nUhpnWyLaOw5OUlvV+S4lc9Xvm7I7FLpKq7jnRuNrgeVT
	y5y1lPhGS3nNVefCIOt7lmSObKDkIDwA6zsu7Yoso57u6AnbqtJRXdqj/am2zS8Zj/5dmV6s7PM
	xr+hnlSYfl82xOwfZ78HLLqOjcIskpU7LdcTnyax7mG0YySUqCPua/yXQBOdvrm4jLalZBnNiTQ
	rtwg3fvgGdl1zb5Hxb16s3ssKY=
X-Received: by 2002:a05:600c:300b:b0:486:fcc7:6811 with SMTP id 5b1f17b1804b1-488783d24aemr64522825e9.10.1775019116310;
        Tue, 31 Mar 2026 21:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:51:55 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/7] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Wed, 01 Apr 2026 05:51:53 +0100
Message-Id: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGmkzGkC/4WNQQ6DIBBFr2JmXRrAFrSr3qNxYXSASQwYUKIx3
 r3UC3T5XvLfPyBhJEzwqg6ImClR8AXkrYLB9d4io7EwSC4Vl1Ix3HYfUvPkbJhXF5Z5Wi1TrRG
 tVoimb6BM54iGtiv76Qo7SkuI+/WSxc/+CWbBONNi1MODq7pu5Hsi38dwD9FCd57nF3fwzEy5A
 AAA
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

(b4 forces me to send this as v2, however previous version was RFC and b4
uses RFC as v1; but I don't want to break b4 tracking and b4 comparison)

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it.

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one, introduce new samsung,pmu-intr-gen-syscon phandle.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series was tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I do not have access to a development google Pixel 6 or other gs101-based
devices to verify. I tried to implement it in way to not break anything
for gs101, but testing from others is highly appreciated.
Otherwise, if it can be tested on a "normal" pixel6 phone without breaking
userdata/android there, then please point me to instructions.

Will check sashiko after submitting this to see if anything can be improved.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (7):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: add samsung,pmu-intr-gen phandle
      dt-bindings: soc: samsung: exynos-pmu: deprecate google,pmu-intr-gen-syscon
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add exynos850-pmu.c to Exynos850 entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |  24 ++++
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 127 +++++----------------
 drivers/soc/samsung/exynos-pmu.h                   |  32 ++++++
 drivers/soc/samsung/exynos850-pmu.c                |  78 +++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  57 +++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 245 insertions(+), 108 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

