Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F78514262C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125791; cv=none; b=c51FSBscKDaWpzAxarToq4i1SXyiPOCVDu+PZp5GkXV5IGtIj6tDNs1tF41JcWEZhJ6M9mR5nk5qg63JqTdFOGXTELobUTiKh2GF8gRKfnZyEMKgDeez3k+lt8fgba/3lTrYijAXFAu60FpIgZ4ohP8CmPLc1kjpGEB3x3t2QZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125791; c=relaxed/simple;
	bh=+UavbOojFmAIVuDGknU8MaLgwR7F3N2h7Re+qQZJ5JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwCDHvfpniwB339XccnrFO0lxxspW/Ab/NVDYgsEVhgBFGzifl7pdXnioPJ7o7hMRQx+GxaE9V836snh4/Ix4IMKOR2ak2uhZdw6dj9nD7uEs5+3iZlGqciD5obE1yjzLxSD/qa7nNE98KIYg6IcMHr0jX/N3ofKRzmWurEBNnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrW6Zq5f; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrW6Zq5f"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a58872c07d8so551599866b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714125788; x=1714730588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=wrW6Zq5f2XysW3Cr0yx7n2ctr7PF3La/pFcXX1cf3uSQoI1YCLgAJAldxyS9t+D4Fm
         GoDdvmquLTIePuSANr+JgRhi8nq73X5F1WZsv+sw3HeP4Oy/OiB0LpXGIgpMZD1Biz5T
         t1juqnPzs1j0hYA5S27hPH3h/0COcrPR+Ss9b8ousOVK3LYloX4OIBTDIiqroxL0bk6X
         +82KuTSCn8SCHBviI86ugYMrOBxMfdc6FolXkFVdsKyB+EZy1XxbWgiJZkvKr9JjJpT+
         KdBgN47XVt1GJUI6kIkS+P0PjWfNUiQDTu+FeB+WS9oLDIDXf9Pp2hzJk8HzweAlJs/Y
         k61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714125788; x=1714730588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=PegcUd7NWIQQogfzcOaPxYQwdkxCDaH0XoFeGobwnzStIYIk8Z8NcZ+X7CP+tANHw+
         zIoeKxAcEqSP1Ur+wt+86VyB6i+e8TjcYuhbO/r0TkjUWNe+3N8LKxZB+T1c+oBO/Agf
         CKVlslCwuL5gy/0I7KrW+cLFJ3ug7dqcP6aDgpFFdyd5Mg8J3mQDVW/QAPh7VCylfa0d
         WpdrAXaAZF7+xEzoyetmQ76igcRKUdaZaiQ60FHUE5Q/vKwHmfkvDXNOKP4x2xXLWjsf
         YPQaOI7n0QJQybE3JhGskofLeOM71g1aBJXkjYh/HgwTWkcqF408R3oonVswbqD26G5N
         h/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqXmrWLrYhiIldhI5oggdBRO/bwmk/6riDaO2uG3wVaBOVdO6ZFYbP8TLXrxwleN4zjCASY+DegpHOK/Yg59E8hTgEU+DAgUwnWNnVpUo0Gww=
X-Gm-Message-State: AOJu0YwVywd/qzVPO5dK3iuHDNWmWt5viYl1Kv7XdnExfywi6CfQRfJV
	VkMfrZiUGvnuWFup/a+2rWfON8F73fAWnVH8c5kcmDWeF+JZ8DCzemwTT9QyXzY=
X-Google-Smtp-Source: AGHT+IGS1CqfePU/OREWF0dZiT7OJGWZIxQ0mJbOO5ax2VXkTQPuTDnboio1m8aEOqQ2N8v0LyZhbw==
X-Received: by 2002:a17:906:2b95:b0:a58:cd39:d166 with SMTP id m21-20020a1709062b9500b00a58cd39d166mr1294793ejg.9.1714125787821;
        Fri, 26 Apr 2024 03:03:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm10417289ejj.218.2024.04.26.03.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:03:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 26 Apr 2024 11:03:05 +0100
Subject: [PATCH v2 2/5] arm64: dts: exynos: gs101: enable cmu-hsi0 clock
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240426-hsi0-gs101-v2-2-2157da8b63e3@linaro.org>
References: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
In-Reply-To: <20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Enable the cmu-hsi0 clock controller. It feeds USB.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index eddb6b326fde..9755a0bb70a1 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1247,6 +1247,20 @@ spi_13: spi@10d60000 {
 			};
 		};
 
+		cmu_hsi0: clock-controller@11000000 {
+			compatible = "google,gs101-cmu-hsi0";
+			reg = <0x11000000 0x4000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
+			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
+				      "usbdpdbg";
+		};
+
 		pinctrl_hsi1: pinctrl@11840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x11840000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog

