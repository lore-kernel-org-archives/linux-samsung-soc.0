Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB71A371860
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041327; cv=none; b=T+Wz8P0JGD8wLv9LV+rG7UmwUp4lrZSAAOk0S/kllebjQ12siTpRlhyqPL9QsaMXnugtbDCacaokcFhCW+xfQP8Y4Yh/6twldm+dD2cGqnQJbH2BS4ADrtfZie3o9TKfRuBYtDwV2HVaNOvl9EqZGHVaiCSL6MX3FzdHbqESWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041327; c=relaxed/simple;
	bh=3crEO+O89xHnAa9Qv2tmtZDwzd9lKKYN3FD110HX30o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHOyjN1MfH/Fq8zir7nOa2+4FYkhU3NMBSGSyeupn0MA9QGD6/NaisXsLPOl6rB7S1a8/4Mk9TJ5iD2sQwfpqJAr1/cDaUPucxUcLzEB2oIArJmtXiiRu+d6tYeSxcxbGexlWn5n+eVXgf3ZSBL8ZDI2drDR5pzgSuDaAEAkOSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgOF4B5F; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgOF4B5F"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b7c2788dso649516f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Mar 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041324; x=1774646124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=ZgOF4B5FaSPz1Yzvyzuc7Ux5dMGXo05DfMNTRmd0+mi3YN1CJL678AfyCH4KEZto8Q
         X8jeRwqTlQgu3FQPyItEEXlhhjKg29s2hGp5dUvetzuNyjSVwVs2rG/ash16cZooWLTE
         WlJ4Z0ifpMSo39N7N5qJKEjJ7KR0DnE4WvgElluk/vg0nIEjFPtV5+PsnxlhvHPtae5n
         cVBOZQfwaXlkjBmVvrT/Z4rWj+mijI2COFGiVkdw34dITMx8McAqq18CQWFmYZjlrwOC
         9rn9xNP7toW2ITMdkK6bVR5+sTo36mBAWcn/h2Wnfx6Bpz0CAiAuXs6NIRwdfScmuFu4
         yu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041324; x=1774646124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=qkmmOV5PF7VNwfSYTi+eCsP05rcMwI+0HlC/FV4g6Q4QRcKNVYkXZ/OwaDiPv7lPj6
         ml24VcbhZm1KcnIcXEn+cqjthIv+N2d0xNHQa2EwwYqCtxIa9vkJs9K2eYZkpn2gKXGS
         RKSIW6WT9ucqGd/+Ydb+oMvnzoqpKaZmhrsiYnLh9fLELYJpPDo2FJX0iiqU6mIIeL/4
         fcofr9rNC98XXHKyQBe47u79ue/GQorNXMReTtyW+fyT5FMih0W2ThUS0EwLC+F9HtYn
         +Ot172jpNIw3qzT3eMkuZpdIy0MvCuGJ61It0iArRbpNus5gOeK/EYCmdDCo3fdq5+z1
         bR8w==
X-Forwarded-Encrypted: i=1; AJvYcCUG7HqAFqWTWunKYbqMvjebEtotL2/NzgpRCisDi06Mfc/t5xuGtqBCQECOPvvJcwfgVvA23M11ZTG1Ql76hzoQlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwANqh3GScQw6nGAibSK1N6pAzEkqfwVoOqU2cECr5bHkVJnFNN
	10uVxo0d01SF60hZBAv+QLsAE3OFAIQweLuLnQdiFwiEkbEaDbf9FMUKpyq4ElH1dZQ=
X-Gm-Gg: ATEYQzyo6dBIw2uSJVySYpgr3J9gAFH0QwiS9bEE8hL73pLRLy0MLgOow6EIBuksmnz
	amomiYUOzB0THLceFZQrt4VfaDCJf6SJVEWAdFG4FO8kV/+/ZWgrd2ZbfDwJKC1qDJ1IZ3Ak9sU
	uGhDJbWvm5CQHp5SRwG3XqDYTiowuL7zdzGlz/c4PB8JKayTRfltzfq+OWjCh+j4C+y7274CBnR
	D72mLZAHj2b1AKPGncKJIqBbioeGZt3OLuNXz9ruP5UqI/EV5rFkvOcDSyK6cnIfrQ+61NVDY2b
	56WRgjzvSRqWtY65grwoyEmt8uU31HezNfI+PIzb3OFHA3W18uzm5XUhQGqf1rtor+k9+2Juy3f
	t1KHK9qKj43fwrvJi05S0kSlLQv0AN8y/wdMRmywbE7e6YqbA6kZVwrrgCI4u5+4HCelnBIKj4M
	AtxLpUuLidystQ68LjL/1HBVonVin4H8WoUhtJF0YOhhau0HWWm3A7+dOhKs+/2KFutPS0CTH4w
	3YDaHxas9Oz++E=
X-Received: by 2002:a05:6000:2dc7:b0:439:b811:11de with SMTP id ffacd0b85a97d-43b6424312cmr7695087f8f.7.1774041323743;
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:17 +0000
Subject: [PATCH 5/5] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-5-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0

