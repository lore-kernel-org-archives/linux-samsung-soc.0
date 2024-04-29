Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF0240853
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389346; cv=none; b=aOjRAYS6uKrKe85r2ViwYfkVRe7KQqKIfO7HjHUr3SWO+YL/UO2dMyFwo3ttNmmhZ+iVeAN5JEIX81DODt5wxyqC0Otgl4AXRzYx6cH5clOmMVxgJrfN5DNdvuSK9O+f0kxLWgfjHmzfj45Of5LLdonZbe5rwXP5tE5JBNaMJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389346; c=relaxed/simple;
	bh=2bBWeKw/Y+4Mjf1rMVzvCAaya5L2mkp9pQ+MhRjpvLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hzZk+3lQQkx1Uc0/u+YhFi1l7pmiGQuYJiOYDJnKa0cpeL9R2qjwVbq90KhJ9NjQ77tvl9hr85WHRseTIgxJ612nYWl1OihwVwv/zxu9VuZyTZEHkZTKyzIVeHE4e5YsujEn4hruqeI6bpwegIUb1WwnLjsBzZYHnmGXT09vnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/zGqOmK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/zGqOmK"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dd7e56009cso56170961fa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714389343; x=1714994143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHjJbBAINE/uHYfzybf0SNljSNHWl/yKpH52w4l4aoE=;
        b=W/zGqOmK0Fe8UVaPP3aTXX/g2+G1zzDf6IHY006cGhXUjUbI2RX4TubyWQjMp1yOEY
         ykS8m6I/Jty0H+3t4QOKq/nauQTlDTg8XcfXXn+7kMtfv44V9FFFYzBiIu2rglczIhx1
         mAKnkzmIk7DBkpOUkUSncw9OGIcY5DyBfAGrk9omPz1X7hQv8zqgFFmeXtescOszHBfH
         ZZTBOJ05aTLWaNfOZtrpyman7rSCSih/2/ZiORoAoPUmDZVkDvDBVx33WMrNsG8eeAPF
         RDfRJIyHRNGkvl6ueCbyVSvl/ptfPkUJIiAm+GiN4esMlgIUHwOW+aBqcZof/RJxlUce
         /xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714389343; x=1714994143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHjJbBAINE/uHYfzybf0SNljSNHWl/yKpH52w4l4aoE=;
        b=sQ8Q78WyTMJltFcKQnHoA2GhNYSScxlBEHxLNHF5g4JzR7UBA4kJfqfEzoERrLX0CV
         CVvuwxkBybOODvuJRkR6kL8EjyQVmW6NgUsTdTLa6hhC6kPitpn3WKf63TSJK9/MNwfd
         ItIh8GmGWl1Dg29bKgzhydkwb0neJhOGvYqlVs4KEkfP/7jnWP+WIsreMmyPQVSox1Q9
         B7EPpIpsFEtrYcshCPJ2BfBHUm9pfQuINfgUhfqS8cDXRodYzk3D27KWfDCS2pZMyymt
         aPvjdntp9C3NPziFrJ8JyowAoDek/o1UNyt2BkMw7zGwq6gVjvecQDpaoqvULNXcIgBK
         72Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXt/ukPkUP1kE2ZJEJ1AZLtVC0dyJRLo3JFE0Mg2Qi4k0VaXf1z17k6iHW7iIGHn7EFOpUAbhj+DmyVNRjyOYrDCNsUlH808hQEMJe24RZCTys=
X-Gm-Message-State: AOJu0YxubDV/hyP/QUk4jsH3Ye6HdVmicCZD9xfqmayAiP9MoePeSHQn
	BIH4wxCo8548Z/2YSRSoFckCPVmeF3OOZfpv6jk6OyXJhNFl1m1XTkUcRm6DhX0=
X-Google-Smtp-Source: AGHT+IFv7qguIVE7775W4L3dzsBVXBiC/Y3AMssuKVMJHdRZlaNoXrE4DcONgklKCs0h2HeB4A7w1g==
X-Received: by 2002:a2e:a70e:0:b0:2e0:c689:f8cd with SMTP id s14-20020a2ea70e000000b002e0c689f8cdmr76395lje.29.1714389343208;
        Mon, 29 Apr 2024 04:15:43 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:550a:b373:6b8:63ab])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b0041b434e5869sm16005337wmq.43.2024.04.29.04.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:15:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
Date: Mon, 29 Apr 2024 12:15:35 +0100
Message-ID: <20240429111537.2369227-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240429111537.2369227-1-peter.griffin@linaro.org>
References: <20240429111537.2369227-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This has some configuration bits such as sharability that
are required by UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 38ac4fb1397e..09044deede63 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
 		};
 
+		sysreg_hsi2: syscon@14420000 {
+			compatible = "google,gs101-hsi2-sysreg", "syscon";
+			reg = <0x14420000 0x10000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
-- 
2.44.0.769.g3c40516874-goog

