Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583738B986
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301983; cv=none; b=WaeR9htgRsm1rGsVhTQDtrvXI3rF0yIpOdO6DbmdRh040M0LTVq/JTOzw9VJfs7QzeljcNkZSHWl70XcPxEf9qlVKh7JUTt8IfWlgndowf+lQMXVtCgO/b/s8jpwBl94jFc1cx3cnpiT5oc3ByJluPJ0ChMSVSMzpdAP7tAcVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301983; c=relaxed/simple;
	bh=WUdMAX8z4QhtVQSfFhWdE8LzEGj91H8aYjzAX8V+ueA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NpFBz681hYunqbR7ZLkt30vsJ2OrpCEO4zurf3GeSnPPxemHmYSbPHhAecKn2/mvomJH1iUvOVdRhdDbXLTv4m2DUyyv2xXoEWC34phtiy8isS8w7JRe2ZTI7e/umM7oKDHCIME4o9g44jIdGlucjvOpUuMNc5rPcQd9A9blylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fio7FhER; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fio7FhER"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so46022395e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 02:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768301976; x=1768906776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oQMGTyMi20OxWQa8x3f8sz8cBzKODyRyWVPXoBWeNQ=;
        b=fio7FhERSGIwBLdjC65oMhkXwbHE0dF6ea08IxfG/xFgnsjCOmSvKiMQpgSSHjqscW
         0mA5XDGM1gem0eUN6+LxMCjdF++qaDkGSOicWwgotXJf1EbP1PIsS6exV7M5Pd0BvlO2
         Q7Eplk1NOVUUicixcuaraQ6IqWApA2nbjTzc4iVxqpgYksTqqJjlesYMxPdFmy1V1n+N
         E3mgXSbbeQlEqcGgfpIsKa/lMLDy3+v0mOshrcVQcUWUwU2szuliC7CzjLJN1o8pAtul
         dUmJIv540AkXPpdL09BrQhfAKIRHqjx1VRgKl6Xm7j/9jCgzGTbUUYNI7AR9e4uLXya6
         NYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768301976; x=1768906776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oQMGTyMi20OxWQa8x3f8sz8cBzKODyRyWVPXoBWeNQ=;
        b=wxhNMt3FHmE57iAoBz0EVxYcjdHnflHm+v2jWfQ7ijU+/7UmRIwOi/DzRL7AwG5rtp
         4fVbgNI4s4Sz94gPEIt4ztnBe3GUWzUyltq85Cw+2/rmZ3qxI5fM/rtgtBKweWzBZEAf
         UM1wiV8awSykBH917l6DbBqcdM+iWJws7I1gtHOrUwJ6/KqE6ILPJ2HRAY85NbyolOvS
         UhoqZ28+MKATl+sASu1xf2eRD6joH1dqAf+KscJ9zYq/pz3/vpRjJW6lGOdGIFgaAg9e
         +pb8zVOlS9kopjXlPeFzYC5AiVuTEOBtREJli/NcSlh0GT8cwXRX9g/wtDVpk+l38X7O
         2y+g==
X-Forwarded-Encrypted: i=1; AJvYcCWLsy3tGvujBUYhgLXJVVVwq9SVFp+E8eCoZTlOVVF5XAosvk1q0NQLRSr0lIEIsBWHD7xsAESo2+0MMpNDFhnh4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bro3YiVllVL9n07rK1oki5HjPu0sjqfK+b+3qVNcP9FTUUXi
	E0IW6ThEkv3uIt/TsejMzWUsh9Q9pIvT3TFjMY0xLtS9thy4oqhc7ZSDMN120J578/Y=
X-Gm-Gg: AY/fxX7nbrHh1B1KHkLa/pEBQZYX7iRkcr8e5yzlBsih2NH2BWNLP3eg00zhHG4qIlv
	DQeUPnAUZva/BmU9TdkRqIgNvFjD0fsU3bjRImfEblc7QWAPyoUSQGRe+LpjRsxjZPMGJAuyWho
	JYcoPJhEPXy1T/eNnVH9usNTxnCGo40+V9g6naZkXC9l043uGGK3xXTqd9D0OY1bJflI9Z9urhC
	k5ztNSc9wds8cf4wDjvlpp9+hnXnfTQ11h0jSFRCuqtKwHbtRtjwpecAqW9YqlB9bUT0TM+xb1R
	ckz73j1jX8pRaEw5+sDPkQA2QtqNM4otG40BCMSBuGfo6nGyC6d/0TPAgL8Kp4wNrQObnmtEN3M
	F7RdRT1qikuKEeqcmsllc+fbDTrk4DSGEpO7GwQc7MjBQ58ktppgvntlK7TPlZWBQ3xa9Zarvkq
	67PxUa9hWqa9QTlo1MiMZKIEfEY5kAWilRyXElib+rWdo=
X-Google-Smtp-Source: AGHT+IFn1dzqQ/D+0QCf5k/jfSxOt6mGZYAi0NlFjRq6667iKCclfMYVXNjtvPWRLhP0JCbSG1j+yQ==
X-Received: by 2002:a05:600c:6815:b0:471:1716:11c4 with SMTP id 5b1f17b1804b1-47d84b61379mr229758235e9.34.1768301976084;
        Tue, 13 Jan 2026 02:59:36 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:3454:384:9eef:8e29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm43729881f8f.31.2026.01.13.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:59:35 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 10:59:02 +0000
Subject: [PATCH v3 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-dpu-clocks-v3-5-cb85424f2c72@linaro.org>
References: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
In-Reply-To: <20260113-dpu-clocks-v3-0-cb85424f2c72@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=WUdMAX8z4QhtVQSfFhWdE8LzEGj91H8aYjzAX8V+ueA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZiWP4MHYOnVwKJEasNjKHdnZaE44GyYpHQ0eI
 GH3W5ErJ/uJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWYljwAKCRDO6LjWAjRy
 ujQ8D/0egS4XV5yKcYX3dsAb/ybBt7n2mTIbl+uUqSkgvnQZ4m5Z72v80opr2qbajInKVtXcyIh
 Jy+EKJV/MQ8kUT+Ptz6K9lt3BGqpy/ENLkUpoMjRI62kaOEYMC4NbWoUBh2hm26kW+V78zO2bwK
 yiuMYKmrlxrH2Qwl+JOSGIfrXHuXfVGGe3afw1hqcSD0e4GQ9zh7zWQY5DsyIt0GEGx/HInusG/
 MNVzUo+EgdqjsLETTL1QCGQ5krRshz0FwxSCzMr7B6NYmpq3uKQpFHed7712dMqirj4O+R1KkKy
 cE66+RPBeHYdUFSa4R38rYgs1IUOTZcPoVeBlOoZFt1+bGldxxdWpvqownj8/iyxRXACvPX/dn8
 IxrbtKDgzsIOfiukT8wt+8Wu+ziVTOLPI+EyL9NObwqKaSDI5GQhAj6hZ7o3TzG4nMINEv5T9Y/
 MuWE0zWmQCqWzDVMAHoQXQSVs2Aw8bl5mDs8YxWkzSs8OJi9khsmtsCqP/AikzP+U3p0u/IZnxW
 I/LFdJc5Rx/AxGlxcXwUHZUR5F+QZUnMI/EoIyhkZb5FqWR0juEfUzntE9T8NhEtHuvlhHPJjFk
 Eqkvrwkt0CWt6izsAwwvdftnn+0Dmuv3JvmY0CIpEekqibusF7gU53gw20iP6MmSU0RUEzmcfYf
 fs11GbJxI6Ibbzw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48f3819590cf8c05d6bd7241cfed8720149c7db4..d085f9fb0f62ac2f57b104c20880e64d885d0bee 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1815,6 +1815,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
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
2.52.0.457.g6b5491de43-goog

