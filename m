Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E923C8BA
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Feb 2025 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943810; cv=none; b=fpedsGs9PMxmPh5WRkCZC28hGSNOXPZlgsFotZm+wPfQp7PDFPc4KA7WUaXFZe7CjetvalnPM26JAMJqzbrgAkJESAdCTUPvmuQjV6UA7TwXFLW2fIMBuYg0h0mSPWlZDTdAPPFPrzH0ZAw6KO3e3wlEkXZbcJdGgxUnlKTkh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943810; c=relaxed/simple;
	bh=pYolsvKglKk9Jl9llzXxb7ekkcAK7LRlmIETEtDeUxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sL7BpHCF/jSzCDeMczIl6WPwe2EUZP+V5FOgaHZuvzl4hOsPLrlkLHzzWl7pwN3ahghFJVW4UFqREFo5hpcrmNnhPXJ/aaXgP3URHS2lNZPOrq397r6kt/Tq9M0qFnwttTogr+iWYAsaliGUKn0Hw3tCq0O0x/NMXDhihY6p+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bxe0Wcm+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bxe0Wcm+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so69709f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Feb 2025 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943807; x=1739548607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lniNSUn6162O5PDdXje7jyIZ/reSQ42wbs2b2Ye2MZA=;
        b=Bxe0Wcm+BEcpAOrNcVIKgSbswFGeWaRAUpXSID+8gDqqpvqi5AHX0PR8C82Ctao6Hg
         PYVc7SDv5BmEZKFa13CDOrfddPdGNPRHzP7DQ3Y7BjkFxMjf7qQR0+WQ47ZgkPvix+WZ
         SCeVekrUPVWSLXyvjyCGsTQ91crhI09zOHpFbtVxmXArxg/5ftOR4pFkmQjocjfZK8o5
         fArq3SbNyIyhCdFK+fphihnvp+zVOQZ/g6kUOMUiZUP+VN8kwaQuvY0AuAPQ7Sb9NzDB
         lC59lwbdtUmHdaDJ+QWaaoXcC7c9hyaVQQ0CcgyGWgGeXmWE3B5qnMP4e26FiD2WIzh5
         5uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943807; x=1739548607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lniNSUn6162O5PDdXje7jyIZ/reSQ42wbs2b2Ye2MZA=;
        b=r8dENYMPt3f5iliGnNWMgx/irTjO6Zb2PhSitcWQUK0OjnvCsOoLTTyC4l5VQKecbS
         umun+KukAAk3V+YE2LED3LGAnuHOkeGtOCgVOyIuhak0g2hDw1yyl8YhgmvFdgGqeCCy
         RsL6CE+XiyCy0p9gQAhxHQxPQlSKEKd1DtLnisRQv+Wir3b/I4hyeSgX/2hZsOHiIU8V
         HJjRwgKZJaTRZJ4ipeAxFiY1dqJDqTg6trQz4ms+I9ZLTQf3iWjTbclnLMZ/InrY5Xbw
         yd0Su+QMsLS8AyhXsguFpr7pRLjbYVGRtnOb8lyLOpa3dVs61RLNbCJ4IsEfZfEFiLdG
         34DA==
X-Forwarded-Encrypted: i=1; AJvYcCVtR3PYXhMHPuBDpdSY9atEMbdpvm2KfcKhWrkL83oIVWSUtE5gDCW5qwZoI7wzfOaliS47P97To1wKfsnAjtKLeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2p/kCYMb0lchh11sjioqP7vsA6GN7bYVcMGvonWN2LYZhh9VP
	mrvsrLQKo6amwykCc6MAUElJpeOWlxcqSKkhBfWZf78lpMIkP2br/PJUrUd02sE=
X-Gm-Gg: ASbGncvIImeFvtTU/yuWYI5CrSRjOx3KGlb6vD7LoVwlwFxNfOZZuBesi3i3IGcwK5X
	0/f+/n2IEpbubx+d1/p5C0s6utCGK+u+WI+JAkoTmLGgd0BAfApLrUn84LT96eIdhc3P7idIhOy
	OSOM6aOoqKHDSfEKqok3dGrflx6vay8+FTnQYCgrgK0+NlZWkvN25tO7id5mE4VkH47AVx/zElg
	ky/CH+/hg1TdjQ7roBLGJpB0U4NGofNpx1JnNFhqO8E7MSXscuOogXPymmX4qx5NFpsYb6C3WEj
	csvzhYFy6iw6CSLd4eONNWnxFXDYEgTkhOLNu6Jn2A6V8BQZMylt/gaeDfa9ebiBSu2UrDo=
X-Google-Smtp-Source: AGHT+IHi8rK+1gm4ZytmYt85/APeyehBbsrxKAffiG9SmO0U6k2MkOEmbX+kpklIstUrpkqeHLkOtg==
X-Received: by 2002:a05:6000:18af:b0:38d:cbc2:29c3 with SMTP id ffacd0b85a97d-38dcbc2310fmr1909394f8f.33.1738943807281;
        Fri, 07 Feb 2025 07:56:47 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:44 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-2-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1282;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=pYolsvKglKk9Jl9llzXxb7ekkcAK7LRlmIETEtDeUxQ=;
 b=HnSbYgmTkBKh9ZEimff9jE5hKC0fcClxXqEW2F9dsY5a0SY6Ul5MRx0rc8W8ndKqIF0ff2xTI
 /aGvzXwNFs8Cwta+kPFRA9Oe+eKp77wt/V2H2oPsj0NJgHfzj8zwQzR
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 798ed7b4c4c6..25ba262e3b3c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1448,6 +1448,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;

-- 
2.48.1.502.g6dc24dfdaf-goog

