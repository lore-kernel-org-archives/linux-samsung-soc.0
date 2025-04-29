Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AE822F3B0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907587; cv=none; b=oLnZ6R3kJSnC2LFoEFj+0uBBmj0SKBB3kFPUSnnTPhTmlJ7cBP2UBOzmaMKMHyPCC1djIApj9kPkt96cadgKIgPpCES7pOlduArClH9fGMtRtZsPQAuzFYPSJAu4Vl0U3BIfDN8/GLg/uaOofd5vGV3AVyWUY9zdUpxyPj6CunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907587; c=relaxed/simple;
	bh=RuZmshfx0WMimIm7Tn9iytcwybbaUd3KhINLT19ml28=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VC1yxxzci+xgRsIIjHOVZMv2YPSbSlQlvgrhUKsUhUQeYu7N49v0AVRWdA9r/iHwRP3EETwhZVuYgklOiCfIHc2roebbCIftK/AyURv+R1iL3Wk0B9WOGiga5qpn/XB0TwjSv4xRue1Hd+4ZT8G92/Qm2q3jE/XYfJUX1/YkfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pxPPNgVk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxPPNgVk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso3005819f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 23:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907582; x=1746512382; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFyZjvPBAmbsxn7nEC7C02rpwZ1NH2zXCqf0IPWpsAQ=;
        b=pxPPNgVkKXp4UlS3/CiuLXny6rHNv5fd5eVuMa5NT7JcmWKBXrrF67D5uDTlnaO9Ug
         R4I91r7tG9cVv2pUfiTbl/GXfWsSRLVpwvZl9sYiyngQzcbNzdB/0k5nAYGP5dDCxAlS
         MNuV6+29PjtviSfNCZAU1+QOIi5Hp8+XM2hIoxaWHH18Edv/cVJgybV/DGBntkX1ZF/3
         2EbNWP+Lt154DXmQWff3tUb7SF9vJZBWamNnW6VxOjB+bmLIAPdz3CvyUXz4q95qpFZV
         ikiiWSICsOGHT/9YDzICXUHmjhPJC/fcZBojCTvU7Ui8eaORHUIJ41hrDRQGfltXojm+
         KqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907582; x=1746512382;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFyZjvPBAmbsxn7nEC7C02rpwZ1NH2zXCqf0IPWpsAQ=;
        b=rCj/CHZwCmgEX2wBQXTgm7oYz7FdiSI8PjzwoMN3EzGDG+3tcvqC0DIaxgMyEwVoiX
         N1ACJuvyCvP3upLapXLRsOjw0CLCV9CwPLSgI99UhhAEyx0mJoXTWgMx4wjIFt6aS5OR
         JxQwx1i0D0Gg1WyRjk9+nF7ObUMAqsVXG8XTKxJyrTthHsJYsdeVG0Y1iwTHd/uR4j+h
         r9ES4jKG34LvyOVX2ahX2CCBrOAUCJ8OJcOixVcHNr0PU+BpHCZTMOTW7ui4X6H8nDDE
         5pLVwQ4jpkK1DI4WOzsyQnKVtzrohHoCs8Z16o/mqAju141Hm0SeFgMPexPHLeLwdfZr
         dmXw==
X-Forwarded-Encrypted: i=1; AJvYcCURZ25kmbsCFPSrNr56nr0P6Hv0SfhnpZR5fPl87UpuCyvgrbU+AuZ5Up+A08kBcyMhDEp9AtO0dTpuwuJnxvMaEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9mwbO9zPTyyVqyGD3Tztdy0a93UWO0dvIAZ50NwkQbYKnKgm
	m9BE+FEz+tUGoDv7Bjfz7EObRSLz3HKBzYJQsOzL0ONNloKCET82qwRw7fzcqZg=
X-Gm-Gg: ASbGncu5jbxbzKxwKOFqvUnBxwUyEI516hqCHLPMIrKQOrd2Ra4kWGwcC4vxjpa6Etx
	IRXoMjq66SBwcHByp8wrrHCc9vSaOYGpm0CZFwA/9HhJqTFPyPJMKG26d0H4BrqDPD7HnVp+TJT
	ggQ1loGVlk4V3AhYl7sPt3nwsdQKE5uS063cVH/95d9VZKdYKemsomOiylL+jCO+kunERWXU0Kd
	RgVmDfmD045W4jeecbkEK6HmFrrvRXnIlEflfa5kstUkcbdFNnMTpUebsYR2cp0KyQALOaW0hE4
	wOw+PqXLqQolYmX4o9VsCMN6JCmq+VLF4su8QY3JImT5NT/2mbQWcdJ7JV+FRagxpowCJlU=
X-Google-Smtp-Source: AGHT+IGzg8u5L2WOlzYwTof6+sSIg8lXFgr3pYwOWiVWKlAozVNfU+0kERbCJNCsNMAIv+NpvoSqVA==
X-Received: by 2002:a05:6000:4382:b0:390:fe8b:f442 with SMTP id ffacd0b85a97d-3a07ab8c463mr9060355f8f.54.1745907582493;
        Mon, 28 Apr 2025 23:19:42 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/5] Fix gs101 CPU hotplug support
Date: Tue, 29 Apr 2025 07:19:36 +0100
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhvEGgC/52NQQ7CIBBFr2JYOwYGaq0r72FcINCWpAKBlmia3
 l3axIVLTWbz5ifvzSSZaE0i591Mosk2We8K8P2OqF66zoDVhQlSFAwZB+XdGO0dQgcqTND7MQx
 TB2lKwTiNUT6gtU+TIDNgbS21UKJqKCPFGKLZtiK83gr3No0+vrZ4Zuv3v045CqrGpj61R14zf
 hmsk9EffOzIGsr4kVdUYPWbHIu8ZRWn2jRaCvySL8vyBuHNM4NEAQAA
X-Change-ID: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=RuZmshfx0WMimIm7Tn9iytcwybbaUd3KhINLT19ml28=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG976bf5mwHz8je/RtwgP6enUETGQ+/11sFwd
 G9ztnqgr0yJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 upJED/0euGHEqK1Y6ppKAivCbCa/3MatUq0YyXDb0CCelsbCJFnbI1Pi6hWJExhx5UYK64lvIMW
 GmFozjAZD48cC9MBvoTweUds2QFBKToCjzMvhHlIBIjUrOzogPze9Uyr9hSD4miZCwu8+gqY5f+
 FTK/ZJRKVMQ6eLEb+cACcLWHIC6TEaNRnb7XpjDmkPbNOPzGmIq+pTruJDRPiQwEVGMX1TOUukJ
 r4aAZOGtcgGcXUk6XJ86OYx01cNBYkcSSaxHffjFJg0EE31laGnGuQLNP6JRPUzsa8Bc9vHclp0
 awLE9X3ubQ5CRXHiSqh5ahOt50NNIdnoBBImX9b/3Xu4p8elNQjcdyzQAuFpQDEYHdfDWL3Y6x8
 6yAWT6PX7j/HKWF6D8ZwGTFGI8ymfQZgjMRYLFHwHVxnJKBIEq7UKpLPPh4UNElqfZKMBMlB6KZ
 YnwwMNXF+dn0fQWSbr0HRhBav1uU1Ei6nuCsZ7h6ajZRo8YcUZLrPa2lBGOyoYahi/NdLp1cCZN
 OSuT7Q8tIypLXtfF9hOBs5wpBfg2Y/gV7aDDs+VlK5kOZdhgaPgM+Fzntl9nUjT17S8kovnIkhJ
 SsOQKQ1uuZOtyg4Mxo6pT0z86yCQqLIG52iviGixThe3BX2h512A4H2lkWvBXK+QkrP9xORYnV2
 NI4mJ1dZYDEAjtw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

As part of an effort to make suspend to RAM functional upstream on
Pixel 6 I noticed that CPU hotplug leads to a system hang.

After debugging and comparing with downstream drivers it became clear
that some extra register writes are required to make CPU hotplug
functional on these older devices which use a el3mon firmware.

This series adds support for that programming the CPU_INFORM register
hint required by the firmware and also adds support for the pmu-intr-gen
register region which is now modelled as it's own syscon. With these
changes CPU hotplug is now functional.

It can be tested with commands such as

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online
[   15.880597][    T0] Detected PIPT I-cache on CPU6
[   15.880638][    T0] GICv3: CPU6: found redistributor 600 region 0:0x0000000010500000
[   15.880685][    T0] CPU6: Booted secondary processor 0x0000000600 [0x411fd440]

This would (prior to this series) hang the system.

As more of a stress test, I ran a script hotplugging CPUs 1 to 7 in a
loop 200 times which also completed suucessfully. In addition using the
recent fuel gauge series from Thomas we can also verify that the power
reduces once the CPU's are offlined.

Note 1: It is highly likely that similar changes are required for other
Exynos based SoCs using el3mon. For anyone following along who is
accustomed to looking at downstream Exynos based drivers this replaces
register writes defined in

drivers/soc/<google|samsung>/cal-if/<socname>/flexpmu_cal_cpu_<socname>.h

Which are used by files in the cal-if folder and exynos-cpupm.c driver.

For the moment I've used the GS101 CPU inform register offsets directly
but these can be moved to driver data once we've established other SoCs
benefit from this.

Note 2: To ensure older DTs which don't specify google,pmu-intr-gen-syscon
phandle still work. The driver only issues a warning if the syscon can't
be obtained, and the behaviour remains the same as today (system boots, but
CPU hotplug will not be functional).

Note 3: I've added the bindings doc google,gs101-pmu-intr-gen.yaml in a new
google folder as it seemed odd to have it in the soc/samsung directory, but
it's likely this may be re-used by other Exynos SoCs that use APM/ACPM.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
- Fix  $id, relative path/filename doesn't match actual path or filename (Robs patch bot)
- Link to v2: https://lore.kernel.org/r/20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org

Changes in v2:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmu-intr-gen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor (Peter)
- Link to v1: https://lore.kernel.org/r/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org

---
Peter Griffin (5):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 ++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  6 ++
 drivers/soc/samsung/exynos-pmu.c                   | 80 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

