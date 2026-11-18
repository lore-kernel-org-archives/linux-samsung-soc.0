Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009911;
	b=i3ofamAC0uYTxLWPR8yXjnNRf1jfrTw6zVNRF7aBciT+r9jbZy2a1Ntsptkjl+wNC6Lv
	 lvJnMq7DvvqQfj7mH2TLNqYVpCEV/bzjCYER2gFCazkkzxmxbNJ+kUHsh/Ifau3xIdZiZ
	 fPEyFa9FCRVWLaw22OnbsWzY0eRveo1gn/ZiCflBjjR07Tkx5mweo6ome9qCT9uFalj1b
	 PSCZGH+wBo0eYx1Whr10GeigfujT1VHTYOhUZzFfLGNJTD/5LjCQt4g7cMdBER65nOR3K
	 XltE38CexBuaY+WUZQs6VTrssxevaKJNOjYXMECOXZ21TfYxFqTl0GGItCfGB4Bo5kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HUF/PiY/f+/s1GZtbGWRhctQRnBXulbhgqm2mv2gHGQ=;
	b=RMJNb6XMINTm+4nU6O6GGUO0A8EB9M7Zy2UL4uKr5SkzQF37F9y0iC+vnOHZY7oTJURX
	 cO8JmMrNfLwSVyqWH3RhLCh8lwYTbSEMTteiDbM+O9ZG1Q+Z0CAAHqyKAMFdMHlhLUlJo
	 G4+A4bWHO9UG/oqzjRxyrqjHLE3wEBJB/PYc5GSJH63Yfgk9mO5i4EEXaHpbDnnM0vVyi
	 ScYgn9t16YAP0O+M80DocP71l02ANq22kjoL6dDu0oYB0K6GkFbgQifXxhdLd8SBix/A3
	 5H3CI1nKhX9rUE7g1NjOI8DSmMzp2fLT1YlobNc7dCbbq1KTepUdeBiriyR8OqGEI1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q6Hk7fXm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F7606A32A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 13:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q6Hk7fXm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so7804715e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Nov 2026 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795009909; x=1795614709; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HUF/PiY/f+/s1GZtbGWRhctQRnBXulbhgqm2mv2gHGQ=;
        b=q6Hk7fXmsBsuxdjkDkBlv44AT1bT0hm6ntzIs4Gw0Cae8Yhikcl8UhS+ywrJYx+AvQ
         K5ol+N/H/5j8wdixMc4x9TyNrNHRmu/Wdfh1uS5O6eZ3b+hPsl9AGYXkxeaEJa3qfakk
         TeknNRDyFdwkE3qpeNvSGXkRXqKINsVq8/t3CKi0G5GY8CTsJR3mgiBArlSylRFFhLoa
         JlKU0WlosAiOkF+cc17Mqd0KTNOk+2uzGmbRRyyIgszoQD3GOAtn2EitFWGZTSeS7V+d
         qpnI7LvKalvqxTx1y7DvC88do/03arE2+1fmeEu+aJJL6HaXD0qVH/0FaGXoxVJLoGBe
         h2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009909; x=1795614709;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HUF/PiY/f+/s1GZtbGWRhctQRnBXulbhgqm2mv2gHGQ=;
        b=mEerRY57sDGU8WcfJAFRj0MdWjf1UnzJULft4GjLRWUDIjEmm7toud9YQTSIuCDiTs
         flnmu9VOw670/u1AnAy88Qjoa90sCbblNXXu9kNC2DACxfmmuOyHRyGn5iC5U6i2HE7v
         Qd5pL3PBqISuqVt/1T49jePhHk2/7C2wu9D49Yz2KU9FGGkN9So3hmKMWgvm2d/h6YTs
         sYYHx5voxI9ddtfOq3dmkEB1ltVOAKFI3UKZaZpJqAcVejw6XYjMMiASnKXybRz5Ckcw
         Fbz9GcdhrUeZ4TgBlx01UnC0Tjt4J8ZsgI7VafvwWownXvdzs0UvTmTvW2p0luNCYf5+
         AWaQ==
X-Forwarded-Encrypted: i=1; AL+hErE8ReQOBOk3W69KsNWN7NIDetFbv9oHQv5Vu1znx+E9Py781SBRPf94ztZDeBN7FcEIq0uHFmgYUEXj6L702TEQ9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/09l1gWrWiJNZ30KYuKCg3C7n8R7g3VqkGMGYq8bxSBw0DMlK3
	Nc0yIQXnpavrCKEP2SIwf+qLV37WNfqMFKeD6bJsWkHOkBj7FpEk3srkSrNrwSJUHrc=
X-Gm-Gg: AYBFou0BlsT9Dx520Se5rOKOLHJ3cSqQzIO2oTFIE2akmgtcT/p+CYb5894JnTyyUpd
	kH1AnUzaTg2VRp1/MOUuNHEm1LYoNpFaJFDt+0g0qTRd/Jxm1ZnnYKFgOrhqPQsCySNjVUZfBXe
	GzUXK5VBBO/K3m1shb3ickP+vJaAP8fx8vy4xzBtgTdDmw6eV5RaECXL3w6f8D99bUapr+73Oez
	9344JgkVsBckKmXFzRp27RQoQ19ctj5jtWe+4Hv8vG2o8Xmkh+gwZrRuyvkOQmvw9/dcwhaiuVC
	/b7G1AdxziJnHOsBjXzBEN4DavuBTBhmOxI1kxwHVJVTzuqnEBeB+LQBNSCHsAT9zm66f0NzjCq
	/kez3U7lupclsYKljkP2hNDTEIKhPe5XXrPH9eQIMV17Pg7jynImgM5RNcaG4VialkJDEl5jmOQ
	1ZBnqyw0/CNIc6lVnWEDWfTwjjQ65r5LJmmQ9xeXaJpJOz3TkVokuNfGYcajNvwGWv09xaulI2V
	M4iq1rFBK8NK0wG4diGdAhei4vzakk3QQlmACgw7AWWFeQExCf17U+NQBBeKFlB8JIp5QjvRZpV
	TZTzRtpqXB6tVXNutvgYmPdGe5++57yY10M3BNYmQib+5gbl/m+lEQpzgUOZ9BG/Y4/I0lN5Xkc
	OxTKyjo69tz53pDigcqmVD14=
X-Received: by 2002:a05:600c:81c5:b0:4a1:f720:74cd with SMTP id 5b1f17b1804b1-4bb7da38bd0mr49500135e9.24.1795009909409;
        Wed, 18 Nov 2026 05:51:49 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:80a3:e955:3785:90b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm208544775e9.10.2026.11.18.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:51:48 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/3] thermal: samsung: acpm-tmu: Add Exynos850 support
Date: Wed, 18 Nov 2026 13:51:44 +0000
Message-Id: <20261118-acpm-tmu-e850-support-v2-0-19848c0d97e5@linaro.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dswMCrSsvIdhUegATYQ2LRAN4
 e5W9i7fS/77u4gcLEdRZ7sIvNlo3Zwgv2SiG/U8MFiTWOSYl0QkQXd+gmVagWWBEFfvXVjAELJ
 CkhWpVqStD9zb99l9NolHGxcXPufNRj97FrFC9ae4ESCo3phCtuXtrvvHy846uKsLg2iO4/gCF
 61vA7sAAAA=
X-Change-ID: 20261118-acpm-tmu-e850-support-d10e9018719b
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mateusz Majewski <m.majewski2@samsung.com>, 
 Thomas Turner <tturner@lineageos.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds support for the Thermal Management Unit found on
the Samsung Exynos850 SoC to the existing acpm-tmu driver.

The acpm-tmu driver was recently introduced to support a hybrid thermal
architecture where hardware management is shared between the kernel and
the ACPM firmware. 

However, the distribution of responsibilities between the Application
Processor and the firmware varies depending on the SoC:

1. GS101 (Existing):
   The ACPM firmware handles sensor initialization, threshold configuration,
   and temperature reading via ACPM IPC. The kernel only uses MMIO to read
   the interrupt pending registers.

2. Exynos850 (This series):
   The firmware implements a much smaller subset of TMU IPC commands
   (temperature readings, TMU suspend/resume, basic TMU init).
   The driver should use direct MMIO register access to support the
   remaining functionality.

In this series the patch 2/3 prepares the acpm-tmu driver by moving the
hardcoded GS101 IPC calls into SoC-specific callbacks: tz_control,
tmu_init, tmu_update_thresholds, and tmu_check_and_clear_irqs.
The patch 3/3 implements actual Exynos850 support.

Tested with:

tmu_top: thermal-sensor@100a0000 {
	compatible = "samsung,exynos850-tmu-top";
	reg = <0x10070000 0x800>;
	interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cmu_peri CLK_GOUT_BUSIF_TMU_PCLK>;
	samsung,acpm-ipc = <&acpm_ipc>;
	#thermal-sensor-cells = <1>;
};
and corresponding thermal zones.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- rebased;
- reworked defines and hardcoded values a bit;
- removed efuse_value from acpm_tmu_sensor struct;
- regmap renamed to "exynos850_tmu_regs" from "e850_tmu_regs";
- checked ret value from regmap_read/update_bits calls;
- dev_err() -> dev_err_ratelimited() and return error if clearing
  irq failed in exynos850_handle_irqs();
- exynos850_tmu_update_thresholds() tries to restore sensor state
  if failed;
- Link to v1: https://lore.kernel.org/r/20260709-acpm-tmu-e850-support-v1-0-9fdd58b634af@linaro.org

---
Alexey Klimov (3):
      dt-bindings: thermal: gs101-tmu: add Exynos850 compatible
      thermal: samsung: acpm-tmu: refactor SoC-specific operations into driver data
      thermal: samsung: acpm-tmu: add Exynos850 support

 .../bindings/thermal/google,gs101-tmu-top.yaml     |  26 +-
 drivers/thermal/samsung/acpm-tmu.c                 | 588 ++++++++++++++++++++-
 2 files changed, 577 insertions(+), 37 deletions(-)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-acpm-tmu-e850-support-d10e9018719b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

