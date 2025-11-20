Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4C3064A1
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672791; cv=none; b=s1Mo24MXHnblxAUEpMwzdANj2jP+TjRvYHDKg5I9uCYvwQYrHhMfSBnee7JG7uUNxvRJZVgQ3z0DCM71ZWtnYu9eWtRcFKScO3yFr1xoX/P2lUwkD7GDev2BN2fU8nyMFsmWEYMzf/HPDP3kRlGncbg9d8/jipj4CmvekPG8YRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672791; c=relaxed/simple;
	bh=aNCzham8+aVa4ydfofiJCpY6230eXXu6sfYAAe0zyFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYOydC9swOrtfRlCOeybyn/Sm7BozbefARZuSuUBXBMRpRazU8lAu19jA33EdSIYJhAZt9SWdcysp4lQv/o+r16whGF8jYIUIrjnarqWPfP01S2Rrhlec3lhEWn3tif49ELWuPHIJjgxnGGHZpZZ7ebCY1c57fNVopDULmuyIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrkGHTJw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrkGHTJw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779d47be12so10789725e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763672787; x=1764277587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr/XskJwABWEjaSIE0O5A6j6G7kGiwuQg/lwCc3XY9w=;
        b=yrkGHTJwfyha6n9pxPdVG0RvPterHAVbnHcS9jQp6R09X2kr6b2vnhwjYNV+UPUdM0
         jIuadVa7x6u6hgPoR2+oOfHWRKCy8qAVn+vJm/+XO/fGMzryoc9HCR/58QJi4onCD0VM
         vglKXupEsWODIfIZj1GyZ0bFxpzE+09CmkxbHXxZmwsQoLJK30jHStMF/C1hrzlG802b
         y5PYOw9NyMYSNI+nVhyqs8A+LXnDHzXo6n1sAt05UalVXAL0oF+AwT89TTNp4Wzn+mgs
         cpQD0WOI58JPhfk6A4zetPbr6omxPffhqdk/GG08Fa1GR4BdhpCx2CVEYtdVG+ue1LRM
         1QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763672787; x=1764277587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qr/XskJwABWEjaSIE0O5A6j6G7kGiwuQg/lwCc3XY9w=;
        b=GYwSxxw+JHZfi+8FUx9gjubTYhykzLwY1lcjQK6swT8EzPP1E9MitM1RfjPYM/l8Tj
         DgZdQpvAjpLVRxyUk3N/MhsSWgc262mx9qIxK8BfTbYwGvrYy1usg0Kko0sqJhKb0N6U
         YuomxundHC4V/UFAMaOVrAe5TBlbLnFy+6Vt72B1FWMoqGthVouuqETcaamA86RLHtIk
         U/zbQCyKRf+IIJgQe4PbQBJ6pxB5Mwk7akN45cBXRbbyDuEHZN/N8Losky/H/MI/HVId
         Zaybull81deYMUjf3nxe0XARm3J7gS8mjNk4a/oipc64pEeJYRum4Gmo/2eqmU1RBxoS
         EaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG5r/0t8oixijJ6QZTs6StukIhtVVRf/dNKCskyKTZWWGYOKDi1flHFrdnlXXUajUwRgLtPo2+GxsGQMvI9PerKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFZlMBn9TXTXih5dIqcahdWIfedAWk8H47VSvlDyMp2a9xAG2
	kqY/QwxWQvKlAa+D2xquUkah2oGcnBHevpGr+VgN3/7H3HidZAI/35l3QFSP5LrzhyBtghyMwgq
	7AcDLO4M=
X-Gm-Gg: ASbGncs2KlieQyFAicfCaYdCjhOdlPjKKorVNxtwyhLgR16OYCYgSwThHLEjK43O5MD
	9xc/3LNXClVM1qG2oEBDL790EDngVlUSMLm4WCfdWtSK4Es4NPnr64NDZbO7wuRPwX1GkhSG2Jp
	RFAK5ZNs0ULaFLFvlLebYYvhmk4gAZdaWpSwhHEakNT7LPe+KRGL0Z9Xt+SnH8Tvg/2dsC3NQMK
	C8ZNQyOQ6LVmIHO5ynN0/NegPlgf7LH4cbmASlJcHgvZAC11Gul4Ik5NyDaTQkCpP0L7ZAkOLDt
	/Z8ID6PU0ZdQmDIyhVJc7Wm0VHxT0ZEv5r2YpvnlHoUJqxai3Ea/zacCe3KvATK67QYBHqAYZuK
	i+oy2RO/tweIVySQMyOFTSY1KTGt8X4z/eyjFbm59n89pzqMA8HNRZ6v1fj7T0DwdPcAMp4Ysd/
	7OgBXoe9BYWxPGk97RSIKIzF7x9OrRkioLZp+8QJY=
X-Google-Smtp-Source: AGHT+IEz77AFQRfOz9D9vMUdFJ4yGf63OlGCx9aS4W+OUx3VSIJC3ZvMc8VWi7zfzOHOEQpRahi04w==
X-Received: by 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-477c017512dmr1362985e9.2.1763672787259;
        Thu, 20 Nov 2025 13:06:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e5b6sm7321287f8f.1.2025.11.20.13.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 13:06:26 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 20 Nov 2025 21:06:13 +0000
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu
 dt nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-dpu-clocks-v1-3-11508054eab8@linaro.org>
References: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
In-Reply-To: <20251120-dpu-clocks-v1-0-11508054eab8@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=aNCzham8+aVa4ydfofiJCpY6230eXXu6sfYAAe0zyFc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpH4LLBaSMM+CzWBnI+jbY8yriXjZIgzTuqgBbt
 XOueJtJHVmJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaR+CywAKCRDO6LjWAjRy
 uultD/9/WEZe1LMumFGfEPAYEzFSldfvB0k+LVj0rv0zPwwvTx9bWMSMphDpfG/vtDnRjDlqHq0
 lVjj0ycrXuuHr8qSj+CfpWyJGAgMOX5Q6zyVPqRIZSFZZ6GKXhhlOpJFMiX/EefDQ3R3MRHTqtm
 gBN2qVq62RHuC9N6ML/tpDy8FFyZowi079wwudvgH3vMIxzofB8uDOco2ZmtLvuB3ljgsvxqjre
 S32IFyuScIqC7eGNn6cZSOO6wkNBMQ+8jE8JLcUyCEcfQt/MSSG8AJtzVRPHm3H9frQJ9kxvt9u
 pPtPiTzDev4YVKvj3JuP92W2fIBDa+w76LS2/qXOtfeVMLYzxauowIOoiuIT7pdX3KBcw//+G4F
 wZlpQQHKfQ0emHnE9uy317YaAp/8Bn4tNq5VvJnIy4MqUnhE+3+W3O9gAziK4CM7ls4KrkyaNIz
 yty3Erw/zBNTmXn+XThp2u3tMi+uyKczmtBJVAVJI202nz4CihHA2N2DUscKw54L4ev8isGmM/+
 4ZrOzOQGkcbk6daBOTfGxx8xe/6mQEvjVp0eFnIpSxYz1fgl7zi5iGcA7cjdGGjJhdJYtxbC3RA
 tWH3oYeUKBM/Tym1qSnnfWUt8f8NXpVuUJSgyp/M7h69CXLd+qezf2g+Vaj9rLeyW64suoUKNBH
 GIJKENkgYHs92ag==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c39ca4c4508f046ca16ae86be42468c7245561b8..ac326db437fa8fe437cf11167bd8c1ce5c2ec186 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1798,6 +1798,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			status = "disabled";
 		};
 
+		cmu_dpu: clock-controller@1c000000 {
+			compatible = "google,gs101-cmu-dpu";
+			reg = <0x1c000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_DPU_BUS>;
+			clock-names = "oscclk", "bus";
+			samsung,sysreg = <&sysreg_dpu>;
+		};
+
+		sysreg_dpu: syscon@1c020000 {
+			compatible = "google,gs101-dpu-sysreg", "syscon";
+			reg = <0x1c020000 0x10000>;
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SYSREG_DPU_PCLK>;
+		};
+
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
 			reg = <0x1e080000 0x10000>;

-- 
2.52.0.rc2.455.g230fcf2819-goog

