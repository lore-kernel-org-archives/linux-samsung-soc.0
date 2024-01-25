Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684263138
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706191631; cv=none; b=qJllqzx6iuXwdNvjK+TqSbKd+TNXLm+eqxQSVBDpPu2aJYTc02ubAO0qbbDle6div7Dj0TbRyb7b1qBkx8FJ4LmbbTaNVCgbOJNTCEfyCyUFcM5vTGbwegqUHVYAlRfIpynGp1diHGHmhgVSjeEfq6LMcXjJVOF2jlbikt3pZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706191631; c=relaxed/simple;
	bh=JQ0+STV9AqGXR93rvqvT/Fhpuw2Ch/BDzNv9b9Rs614=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4B6bK45K7rVU5DbgV7ALYf2Ir8AqDGz24T+4qYNsgshrZO53U+4ux7bs3XkhhnWYHAwtlVoRJL3iSMPvuPm58HYTVidedItes0HVKOooVTYJHdppf02Yiy0S/kSqDc9GS5bnC078/rg5IkhHwaDW8RJdtO0yIB1WI94g/s9XKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVE5IbWv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVE5IbWv"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51021d2399aso195648e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706191627; x=1706796427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwJ9LZ2cw3a5KQSrNOlRxJLZjD3460dcBT/9JVrzxHs=;
        b=XVE5IbWv2QfgawA46rNxRLnw5FbD4geYvqIM9vP/7JgyvfPXFhIHnPPoU1zbxgVCsA
         kMMwi9gRqn389wSxxOG++77SVKR4ZOPlNQC23zd3jlpeEfaaQLv/Q5qL9S4ztfUHSkmh
         CwdBIt9MNNzbtP+AdeEhwe6BgZ0GchWruphTCrD4YTtAFyGXO4m4eflPQuk39cLyL6Ro
         uT90tVObiFQWCdEnLBYGWTkbwFea2b4o7gfi9zDwpLWDYk7aVUyGMPxi7FuM8YdBy6qp
         6Qtk/vlmzwNxDtjgBAPIjPsnuAFch8Awh+mwE0B4h6EfSJKWr4PhUVeuvzl9llFCq4sf
         60jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706191627; x=1706796427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwJ9LZ2cw3a5KQSrNOlRxJLZjD3460dcBT/9JVrzxHs=;
        b=Kq5qoxdt2uu2wx8VZ1plLj/VstE8GBH41qcRu+YvgXf7Pb/z99hMS3rzQIQMhb+PKV
         cIlseErHiCZo29lOvinqZpxhp4CEGF681MX0s7GVut9RfndyF/l95o89uFNEuEzYtB15
         4YAL9GKzacled8xtRXEiTeEdjnXA5p5I+HMzuqiN8HoXT4ic3Ymgx3v/WutHovWqHqeQ
         YhAf1jQ0YGV7ZyuXxjunujnmRpKVfQM9N2If24FM2H1VajKiAiJd1CscuiuOF7CUg1iw
         l5ZsAGnxYEVCp+t2wGGz3jOWyOOlbfUbjKtva9UDXogLRP/w/jYYZqM06DV/c/EL1x82
         ohsA==
X-Gm-Message-State: AOJu0YyGCrP5b58jx0X6uQ4P+3xf+CuDMdzawavfplvxDj7GWFwVMVzt
	ZqcA4ff9zkbT17omJMPGEQsNIvI1sM9IAlyvCUlLhq8tbBZYSaFdtk4LJ1Sb+hc=
X-Google-Smtp-Source: AGHT+IHDLdWAqT+26X6zklelfsY1utLIeysKoCEK/sUCxbZZqTR4mecGOTUthh4jQmkqePF94oQcKg==
X-Received: by 2002:a19:ae13:0:b0:50e:9eaf:98ec with SMTP id f19-20020a19ae13000000b0050e9eaf98ecmr516026lfc.54.1706191626763;
        Thu, 25 Jan 2024 06:07:06 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id tj3-20020a170907c24300b00a2fde3a8097sm366740ejc.74.2024.01.25.06.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:06:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org
Cc: kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: exynos: gs101: sysreg_peric0 needs a clock
Date: Thu, 25 Jan 2024 14:06:44 +0000
Message-ID: <20240125140644.3617587-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125140139.3616119-2-andre.draszik@linaro.org>
References: <20240125140139.3616119-2-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without the clock running, we can not access its registers, and now
that we have it, we should add it here so that it gets enabled as
and when needed.

Update the DTSI accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 412d2866dca7..aaac04df5e65 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -364,6 +364,7 @@ cmu_peric0: clock-controller@10800000 {
 		sysreg_peric0: syscon@10820000 {
 			compatible = "google,gs101-peric0-sysreg", "syscon";
 			reg = <0x10820000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK>;
 		};
 
 		pinctrl_peric0: pinctrl@10840000 {
-- 
2.43.0.429.g432eaa2c6b-goog

