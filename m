Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7213626E6F2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 04:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238852; cv=none; b=JfqitmevEuhPKjo5d32hYF8o+kYgu1VMXlCNOZWX99ev8UZJLuY9yplCs2GmslyCp2jYgLmp8aoKZl0Ou0K0PQdBvom3JgANbKH+XDl/BWYt+Cmzx+XGsX9Pom+aoHtkd8PPjo2tEYG+s9OC8skKTzKrAmHz0AVjB2iqt5leOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238852; c=relaxed/simple;
	bh=NF/qmdhWCjpqkBvOLZ31n1hI4ONAkar+Wm+ahERpCrM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pACvK5T0OPPx9XiYGPM91g6rr2VZa/pTUPaES7IjDGoi+QEkcw2LU9Cpkvvx9fRPjmJXyYY/l7X1/7xxwvk31DnBSxxU9sgCJnthdQWO/EcDdMT3D59ecfHH8VfVbqcW0JlwP4S/dOEyNzXGwVgfO4D48YRKLTXaBAn7qGxkW9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeDGigb8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeDGigb8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cdae130cso2288895e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2026 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781238849; x=1781843649; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vvM7pahAjxlhrr61LEyDzqcCT+Fc1a/WkHWS05sPsSE=;
        b=EeDGigb8AYUgBjsoGX23h0fk/hCGhXTozbHvYihhowfM6muU6bf/I281KstmcHRIOc
         8l/gAUOf7+Wi2GxMctZAkTDxluF0kNbufsZoTchme0Bnk3ObtNKhZNkGafRrmYC3PwqV
         hpDCgy2mFL2Lfz5dfZjoX7P+F1j+g3ukfT4rjoWQKpS45pEDTr5rkHBg+K0keizo53BI
         N4U/Qtwez2zFsUrDH5OYV7/YmGPC6f5FHoEqJ+9tWpt4oxwrgQzs/Ra2bfDDA1WZ9A/+
         GXFoO63G65kuEB8UXAgjYY28YY8jpYEqGVqjsy/ZuY+FeFpZP7gVmuYPG1TRFrkDejtZ
         NuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238849; x=1781843649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvM7pahAjxlhrr61LEyDzqcCT+Fc1a/WkHWS05sPsSE=;
        b=ItRRqe9s0O5rC1xCdNDa+rXWgiroWaSAND9OOey8ZS8nsJRZaq9OiiIIk3fLTmp7z9
         we8dBnmBA9iRcQ2wAyZUWLP/ODQvcJOw8dGUWTFTgObSO+BAYohHQjkjTeg57ZGm6Jqq
         lPrxObvnJuopGHnlwcnIsn5/XhxY/Sywtk4blFgWWKaRykF94l/FWkIE4lgj7VW66Vl1
         fRB3KrjP6UOvbhmIUE0MXj7ZJMM7zdgmF3yjfGtEoZG4u8dpIT/RLeOw/gPipeCaVchM
         NWYICg/345KbnlEG+5QVTzWDhzXq/9smzDkJnyxIQ+VuUcmEZXY51LK88/zYNLfofoAw
         FSqg==
X-Forwarded-Encrypted: i=1; AFNElJ+WoOOGN6uViWRbp8SvkDXB2Ux/pk1x703uZnL7ubyjKxEjtpznqO36PXWL6ZBkx/BBtT3gFowz6EASiJUERPzm3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn77fqnRPCmrrI2Q3yghkPf7peixAvZwpd5RgnUz0yEY6EKEjp
	NcYHF1RUj0gqwlpM/uCjPmvxRyHU4WQ4ukSz9KLNAaizQHDyQX6SfGX6cGxMTHQviWQ=
X-Gm-Gg: Acq92OHfmwiElhrRJ+q6d65hWsGv4nrAqIPLaqJQHk2U74Gj4EMzaeyDPU4ELP2kIgy
	Mn+012+Oy+z1JzVH/UXZJT4HhT94FZYuOd1eFQafBwybOzE2LNGEoY1DzhX+KlBbupEX/R8YjY0
	AL8RXjkH2WaTIkB7TPCDuLPkHNhJmhBI/0kVc2a7oZvITde8x3ahgsoLkzioLyUqILbXvvGiijX
	SZ2DkBEvf24c16D7j6DCV+dkgiotEcFn3FTbJoqIqCUlovn+AbRA6Y2rG7f4GjAhUt97Z1rI4za
	S2KOFNUNymPPQoBivk6sRarh173/qiSBDbFQkxQZVOxPqTMluuzw9bIKiu2930gwA+Xz/lI2bc8
	Wk8tfCO0Ur0ByuA24pvH4FWoWzDElijqV0gpaGjOpgiNTakSUjus1iDRv2O7fCczTHLmkVQtsP8
	TnYugiIPIyvItdH4dtkJmPWAGZ9PcxW7UL7sB9CX4Xw4e8FwkQ8IxCBkeIZql9HUyiaV8XbnCev
	a7qf5BlJCL9FgDb
X-Received: by 2002:a05:600c:83ca:b0:490:aef9:aa3b with SMTP id 5b1f17b1804b1-490ec523ef7mr8700565e9.32.1781238848787;
        Thu, 11 Jun 2026 21:34:08 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83da91sm36134865e9.10.2026.06.11.21.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:34:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] ACPM cpufreq with fast_switch support, fast path xfer
 in ACPM
Date: Fri, 12 Jun 2026 05:34:00 +0100
Message-Id: <20260612-acpm-fast-xfer-v1-0-1aa6cd2268ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADmMK2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mj3cTkglzdtMTiEt2KtNQiXQuzZJOUVHOLZCODJCWgpoKi1LTMCrC
 B0bG1tQB8iyBQYAAAAA==
X-Change-ID: 20260612-acpm-fast-xfer-86c4de78c20b
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

The series implements acpm_do_xfer_fast() that does as little
as possible to make it usabe in atomic context to eventually
use it in cpufreq path with ->fast_switch(). That's basically it.
Cpufreq deals directly with ACPM dvfs instead of going through
clk framework.

This series is Work-In-Progress / RFC.
This is currently a working prototype, but I am sending it as an RFC to
get feedback on the approach — specifically the ACPM fast path of sending
messages. If ACPM part is no-go then cpufreq is not needed.

Known TODO items:
 -- rx/tx channels locks rework;
 -- initial frequency fetching: Exynos850 firmware currently lacks a
    clean get_rate, so the driver falls back to dump defaults until the
    first freq transition.
 -- potential mailbox channels re-implementation.

Any thoughts, testing, or feedback on the architecture would be greatly
appreciated.

This was tested on Exynos850 with example of DT nodes described
in [1] and [2].

Dependencies are different series that adds Exynos850 ACPM support:
-- ACPM mailbox support for Exynos850:
https://lore.kernel.org/linux-samsung-soc/20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org/
-- sram DT node:
https://lore.kernel.org/linux-samsung-soc/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org/
-- ACPM support on Exynos850: 
https://lore.kernel.org/linux-samsung-soc/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org/

(the above dependencies pull some other series as well)

[1]:

cpu0: cpu@0 {
	device_type = "cpu";
	compatible = "arm,cortex-a55";
	reg = <0x0>;
	clocks = <&acpm_ipc E850_CLK_ACPM_DVFS_CPUCL0>;
	enable-method = "psci";
	operating-points-v2 = <&cpucl0_opp_table>;
	capacity-dmips-mhz = <250>;
	dynamic-power-coefficient = <70>;
};

[2]:

	cpucl0_opp_table: opp-table-0 {
		compatible = "operating-points-v2";
		opp-shared;

		opp-130000000 {
			opp-hz = /bits/ 64 <130000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-182000000 {
			opp-hz = /bits/ 64 <182000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-247000000 {
			opp-hz = /bits/ 64 <247000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-351000000 {
			opp-hz = /bits/ 64 <351000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-442000000 {
			opp-hz = /bits/ 64 <442000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-546000000 {
			opp-hz = /bits/ 64 <546000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-650000000 {
			opp-hz = /bits/ 64 <650000000>;
			opp-microvolt = <625000>;
			clock-latency-ns = <500000>;
		};

		opp-806000000 {
			opp-hz = /bits/ 64 <806000000>;
			opp-microvolt = <656250>;
			clock-latency-ns = <500000>;
		};

		opp-949000000 {
			opp-hz = /bits/ 64 <949000000>;
			opp-microvolt = <681250>;
			clock-latency-ns = <500000>;
		};

		opp-1053000000 {
			opp-hz = /bits/ 64 <1053000000>;
			opp-microvolt = <706250>;
			clock-latency-ns = <500000>;
		};

		opp-1157000000 {
			opp-hz = /bits/ 64 <1157000000>;
			opp-microvolt = <737500>;
			clock-latency-ns = <500000>;
		};

		opp-1300000000 {
			opp-hz = /bits/ 64 <1300000000>;
			opp-microvolt = <781250>;
			clock-latency-ns = <500000>;
		};

		opp-1456000000 {
			opp-hz = /bits/ 64 <1456000000>;
			opp-microvolt = <825000>;
			clock-latency-ns = <500000>;
		};

		opp-1586000000 {
			opp-hz = /bits/ 64 <1586000000>;
			opp-microvolt = <875000>;
			clock-latency-ns = <500000>;
		};

		opp-1742000000 {
			opp-hz = /bits/ 64 <1742000000>;
			opp-microvolt = <937500>;
			clock-latency-ns = <500000>;
		};

		opp-1846000000 {
			opp-hz = /bits/ 64 <1846000000>;
			opp-microvolt = <981250>;
			clock-latency-ns = <500000>;
		};

		opp-2002000000 {
			opp-hz = /bits/ 64 <2002000000>;
			opp-microvolt = <1050000>;
			clock-latency-ns = <500000>;
		};

		opp-2106000000 {
			opp-hz = /bits/ 64 <2106000000>;
			opp-microvolt = <1106250>;
			clock-latency-ns = <500000>;
		};

		opp-2210000000 {
			opp-hz = /bits/ 64 <2210000000>;
			opp-microvolt = <1181250>;
			clock-latency-ns = <500000>;
		};
	};

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      firmware: samsung: acpm: add fire-and-forget xfer support
      cpufreq: add ACPM-based CPU DVFS driver for Exynos SoCs

 drivers/cpufreq/Kconfig.arm                        |   8 +
 drivers/cpufreq/Makefile                           |   1 +
 drivers/cpufreq/acpm-cpufreq.c                     | 195 +++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c               |   3 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  14 ++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 142 +++++++++++++--
 drivers/firmware/samsung/exynos-acpm.h             |   3 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   2 +
 9 files changed, 361 insertions(+), 10 deletions(-)
---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260612-acpm-fast-xfer-86c4de78c20b

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

