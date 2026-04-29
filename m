Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF8390CA2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494008; cv=none; b=YqNQm5rlpVikLNE46DWWGq5qL30+3j7vNWHuttF2Ic2sLm4LNWqliMjyBoh2uWtxMYDCrQ1vICx+ri9jhSSnioHlfixENb2CUiyZtTRjGC1a9gDBYxWOrBH8Jh9oLg1iyOgQzf/g4o9VTBfaw6GQ6aks3xT915NLIREV7rB1X7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494008; c=relaxed/simple;
	bh=cgdbf9ulAMpYKm4T38h1CZ5kKIIJRtVc7aJ8B0WV//U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zr01z4tC+7X0hcoa2lrZ9jBENdNKCBgtQSb/q1nKwhWBsDg0d6tOWBrC/0yH5+0iY7HiTi/yl6n9k5HM8PwhtbnbZdRmJr60+9FE7rhiL+Fo2RZuWU9dnnutieSP/h4qPzyIrKSG5/DDXL3ClxNZTNJ/k7ui8m9x57zMUO4WSRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=neUrdDDZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="neUrdDDZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891f625344so2163385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 13:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777494005; x=1778098805; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mcl9hUvY34FgeniWwVm+TyCioqlD+gxNdeIUe9rxqOk=;
        b=neUrdDDZ2AYizeqC1mg3DKnHn5mCrpehyJh8I6xot8/sm4ZDISleWxPlnqS/qwXTIj
         uJuxwv7NqRHMuhLt5RAcTB2Tp4w/V6QuIXgEHR1GmGo0L6KpPCzgCCvKx7a3269v/A7m
         j2WbbM06TUhdQmGAmrIDtIltHjHqvgm8IVdTD/mjJg97nFclfgyKTGcKn9Ae/zsZM2R/
         wsNj8jSq9kE4IXrNEONH9uqyw/eA7DcTZdBURK6vpWuR2JGUISvK1OHjIrFpglqQ4Bcx
         1ODguPcGL7q0F0vWGbK7OLPqewQU0OFgcXw4JfYjNdIYICC+igmLTqFTpB9ef5koobMs
         3vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777494005; x=1778098805;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcl9hUvY34FgeniWwVm+TyCioqlD+gxNdeIUe9rxqOk=;
        b=ekFL7eWCM6gBEWMEFXkxe1h/fqRUaf2soVtdTSHF1/+7bKBE4wSyE3aQFNbPMM28qF
         XyMwUFvuvv6/o1UlmptLOHrnv8bEvpdNBekrHaPuoGLb4at+Lk0RgdWfn805EnoJ29H7
         lh3EYeMUxtzYKbmUirXvuTBC06/zLCF2uW+RQaqmlu09zdxh+0xukTemdyK4etbCUAc4
         N0weuGQb6mBdeKM9tgF2TaFv+VmPV3+/RETbwaIr91x1DCjGZQs4SQr/nVLsg1hfNUrU
         TW7JlVT0B+YlCYKQA53XEhx0TLIA/MJNN/UOAEH74Xyrd+5N9z4KMf1G9byWN2t390ho
         zUdg==
X-Forwarded-Encrypted: i=1; AFNElJ+tT+qEBaebyMqR7fW7ofvBhqy41L3anTvJHa0QHm6Jl0mjr/B8Fse6XBiJZBmf98Nxon8H/WjfxtG9K6QSSMB7hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9J1Q7Xp9yEOD+YAgOLz+T87Ik/9DL1KQQU+RdrT0cBsYgqUvY
	miEj1uiFihZu/fPvtgtfZKeh+EDIVCWIRJZgcLmviUb4NK92QYzfH/hDqBbXlCJ6GtE=
X-Gm-Gg: AeBDiet7uVatnqjBUEfWyDFjlocHe5mNtUhi6om8+Bogec0WUH5OXrboPuM2LjAvxx2
	62I3mXZIgpM6+gG8+P45VXWRNwiQHDyLPYRfja8PROnktizy3nBfPW6PvznD1H6jQoDkuJp9Uun
	jD+qqilluHxiNQRjbyuCsD/uUWuktXqOP1lFYVhecPZkhqn01gbegvbI9XIDuZ7wcxo24eJac8E
	lm1XFIpZhDdrPkPC6pAGGJzOZjyKcSM+Nzi0uKxg1OJsgfA/lmKZr+1P5KbtvwjaOfbqA7Fv36P
	EKhxFR8+U9WV8+G93Bf9Eb5ii1i7GNIn/ka0on3zW3XAKNXNJC+Y3FNmtC+4vX1YKXg3yU3unXN
	1tlbjk4RyfI4ow2yZgHfPnUZsnHrLrat9vUPlvvx3SlH8kfGfVbfCFETAXIbqM+jO410zYwbFea
	Qx0waXwpkBhBM78BWsjY4ly5KRhfobpf+mFvk0h0i44ABygb8/Fdb4coayL/j/yIRwrQJ3RG4+w
	/yCLCdEbPKqPmuF0BkYzCCQwz4=
X-Received: by 2002:a05:600c:a013:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a7bf98557mr78026385e9.4.1777494004845;
        Wed, 29 Apr 2026 13:20:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b901a15sm58061355e9.1.2026.04.29.13.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 13:20:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 21:19:50 +0100
Subject: [PATCH] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-mbox-dts-v1-1-7f3ad27ed4f4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOVn8mkC/03NTQ6CMBCG4auQrh3TH8S2VzEsShm0iaXYIsEQ7
 m6BhS7fSeb5FpIwOkxEFwuJOLnkQp+DnQpiH6a/I7g2N+GUV7TkCnD+9CHJCwXfhBnaMYFVjcK
 rEBUrKcmPQ8TOzTt6q4+O+HpnezyOP1oXOyw4/YPNwM3gwRv33CZs11Er20pJJfUktoXGJAQbv
 HejLqbrmUG0jNTr+gVlPGPN0AAAAA==
X-Change-ID: 20260429-exynos850-mbox-dts-c9b9e7336140
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Depends on dt-bindings from:
https://lore.kernel.org/linux-samsung-soc/20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org/
---
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..47c9293c54c2 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -305,6 +305,15 @@ cmu_apm: clock-controller@11800000 {
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

---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260429-exynos850-mbox-dts-c9b9e7336140
prerequisite-change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898:v3
prerequisite-patch-id: 093e2d93cd4b6f0ade6f9ff0e3b773e47017f884
prerequisite-patch-id: c2e9212d341270a2f2a8b6f3695711bc3b6ff2d8

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

