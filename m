Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D315FEE5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642714; cv=none; b=s0YN4gK2eVowmYkrk132MPMjJonNuSwg9A+CwnuK0PHbr0pbeaHjCobjSZVhWKow/TN3LBaP7Au0K7PK4kApVUWW9knKOUUgUtWK5PqKuGb5w0ehpOF2bSsHrvpudGHbAt7yn8aO34gQq/j9MpdpdcpVm4hsnBe3qHuFAIyLj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642714; c=relaxed/simple;
	bh=AXj5xyhwdOO4s77tUdNDGtt39AJJbxu8vLQQSjh3xY8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PDOOdKjMt6GRq3/Ol8UMX8mPRU1qiiBFHHwSF4u+mIv+3IIkQTH/G7nZ2/4JREsjYdu+iCOhXNJlmQgDhvEgFswHTbDusVdfUTU24UXabtNASvTL85yI2YAxfjBBNgnPIxAUHiOD85AxfjFCnYKOFlQpHcu4sMIiNq9kiEoeM1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7liTucm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7liTucm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f1da33826so630197166b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642711; x=1719247511; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n98Gf1QoxzfH++bimpxXb9L5Kij/wsP5fmjbedlrR8w=;
        b=b7liTucm8ajfXj979SAF0VzJ9fjgqxCKlwcA5K5XmN5RN465RZahKSOEiYQEiSxzIN
         lHL8ouZScTLe3ENhI45qQkQIEouKNWA6apQVR6WrZ2Da1VJQTn4kr9HM1PLBeSSTv0dQ
         JUrtRWvZge1GYNKE7yz26l3YfU3CXYbpM6Q3ZTTmJtYTNc/BMUAfoQ/jDSV76SfBMBK/
         oYvpTBn0y6cgh4126e36aq6HZDc0lSyZluc0C6EDuAskDhSPiL1F6zIacUMkQfEC2YqW
         ZWJLXD6029FBTtY4soO/2fle/s/0M2b+ERj38vycXXdDrgX3bi5jlSzlEr2le7poi0eB
         b7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642711; x=1719247511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n98Gf1QoxzfH++bimpxXb9L5Kij/wsP5fmjbedlrR8w=;
        b=SOA+AUK7OAaWZJtk9Frc6yVsP643qe2ORCg2vsb68uB42MVAwnkKJtivO+m73ZZmWL
         p4BxQ94nfvmHDiz41c3JZRKrzlVYwnzt+5pJnTpRxkEU3/9iDCJHv4CvFCcB89ETgMy0
         yj006WdGHgCF2uBCYjRDy8UCr1j5JG8xxg9TPDHw82i57msSJhxXL/+yWTtbEsp+0qjy
         RvvLwYtZk+/gII6Y3lIbZXkmEIbgbNgv/KJYTciNMukuFkAvDg9WcVAvb+IpRM+mO6Po
         /zvqxj3PWxWaXuZ3SPA6t+ICLe6YPOpMLUiLIX28/LK9fULkjMpAbTu+HjUptGX1Aer4
         OjYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsckcELVohnOCJN5VSS1pd5HQRq/3AT2zbllaDlIId5fFsB8K6McgCk9A2l7DnAVE0rAeLuzfpeEhokSUGz2mAgBtDk1FvK4mUE+fIhep0MV4=
X-Gm-Message-State: AOJu0YyM54Y5cvzOOhwaFCg677TuK3pS3rzubHO2Y4t7SJaYOL/QLaA0
	SLDF1rQI7E/vyEGvNQ5qAIdIWC8Fn9Y//JBLUEgRqKENXnKA3JMzPHashcwxXIM=
X-Google-Smtp-Source: AGHT+IFz9rgPfOCwN4argHOrGJaAixRDxqY1TJ1InY0YdhhmRezkVjZ5t/SkJJWmVGTuERMkcdfvLA==
X-Received: by 2002:a17:906:7fc6:b0:a6e:fdc8:ae45 with SMTP id a640c23a62f3a-a6f60d170ccmr821932366b.1.1718642710471;
        Mon, 17 Jun 2024 09:45:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/6] USB31DRD phy support for Google Tensor gs101 (HS &
 SS)
Date: Mon, 17 Jun 2024 17:44:41 +0100
Message-Id: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPlncGYC/3XMSwrCMBSF4a2UjI3kJtGiI/chDvK4bS9IUxINl
 pK9m3YiCg7Pge9fWMJImNi5WVjETInCWIfaNcwNZuyRk6+bSSG10FLxZ7J8GmbeJxDAje0UQis
 9OM2qmSJ29Np611vdA6VHiPOWz7C+/0oZuOBovbPKOGi1v9xpNDHsQ+zZmsryww8V/HC5cn/qQ
 Buw/vjNSylvKJ6wwuoAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

This patch series adds support for the Exynos USB 3.1 DRD combo phy, as
found in Exynos 9 SoCs like Google GS101. It supports USB SS, HS and
DisplayPort, but DisplayPort is out of scope for this series.

In terms of UTMI+, this is very similar to the existing Exynos850
support in this driver. The difference is that it supports both UTMI+
(HS) and PIPE3 (SS). Firstly, there are some preparatory patches to convert
this driver to using the clk_bulk and regulator_bulk APIs to simplify
addition, while the bulk of the changes is around the SS part.

Dependencies on other patches:
While there is no compile or link time dependency, for USB to actually work
this series also requires Peter's syscon changes from
https://lore.kernel.org/all/20240614140421.3172674-1-peter.griffin@linaro.org/

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Roy Luo <royluo@google.com>
Cc: kernel-team@android.com
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>

Changes in v3:
- drop patch 'phy: exynos5-usbdrd: use exynos_get_pmu_regmap_by_phandle()
  for PMU regs'. This is not needed anymore with Peter's syscon series
  mentioned above (Krzysztof).
- drop those patches that have already been merged via
  https://lore.kernel.org/all/20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org/
- update device tree binding 'reg-names' (Krzysztof)
- use clk_bulk and regulator_bulk APIs throughout to simplify addition of
  gs101 support as preparatory patches
- patch 1: add required but missing regulators
- patch 4:
    * make the register access clock name(s) platform specific and avoid
      use of devm_clk_bulk_get_optional() as we want to be sure to have
      retrieved all required clocks
    * fix a whitespace issue
    * slightly rephrase commit message
- patch 6:
    * set unused callback pointers to NULL in gs101_tunes[]
    * implement missing regulator support and enable power to phy before any
      register access
    * add more phy tunes
    * move PTS_UTMI_POSTINIT utmi phy tuning to before completion of POR
      sequence, as per datasheet
    * group gs101 related symbols closer to each other 
- Link to v2: https://lore.kernel.org/r/20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org

Changes in v2:
- avoid having nested else/if in the DT binding (Rob)
- add missing bitfield.h include
- Link to v1: https://lore.kernel.org/r/20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org

---
André Draszik (6):
      dt-bindings: phy: samsung,usb3-drd-phy: add gs101 compatible
      phy: exynos5-usbdrd: support isolating HS and SS ports independently
      phy: exynos5-usbdrd: convert core clocks to clk_bulk
      phy: exynos5-usbdrd: convert (phy) register access clock to clk_bulk
      phy: exynos5-usbdrd: convert Vbus supplies to regulator_bulk
      phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  77 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 958 +++++++++++++++++----
 include/linux/soc/samsung/exynos-regs-pmu.h        |   4 +
 3 files changed, 893 insertions(+), 146 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240423-usb-phy-gs101-abf3e172d1c4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

