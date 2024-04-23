Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C55103D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713882671; cv=none; b=MgcteTA68wpB+xgnED2T/SlwXn3SBV1NdyB8IwX4JEe4zp4HDzJ0E3cNltVN0cT4aEY7R+U8tLwEbWdCLaVH4B3XyqHziCQ10jRud3mrAnv9AlW5qLYDcDopODMLIAP9PxCzBUAuzmHD9GBhSyGdX8jP0aVNyxhO6v8vAiiE5CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713882671; c=relaxed/simple;
	bh=+UavbOojFmAIVuDGknU8MaLgwR7F3N2h7Re+qQZJ5JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2YEcCbj8lPFLT8Lz7z5QZnaHlMRIUK3lxT2R0IdE3s8NrBXAFpCVH6SD7WvGMItSvcL7OjJRIbpPjtrwhpBhNSSy+cW8ZKVn8djf/umue69ewFHrBR2SDrUw6rj6ZFRYXtn6O+uN7ihiHZXNPVa618gTwQ29NzZSgA8BfDehTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOs3Jeb1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOs3Jeb1"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57225322312so628054a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713882668; x=1714487468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=uOs3Jeb1PBkFtWHue3LJysWPE/eiRq3MCNKtsJxYiuc7IaJcbHK7/KErEkfvXtLgxL
         gFI0NuAzJuSCOzl+I01w6Wn3b9GistRxrPz2nuTa7g3Pu6tF2WBY1FB/tLJsVKed2dl0
         v+M1sI40R28l+M2ckMburiyRR43YBJx6qHf7AcjSNkXwXkIiEDpBMYywSRWN777x5iZU
         bJamRjfIZBhs7ytAWOyLS4h5JOi7UFf1OlCzIFnRmmvr9rdtQc8PiGrs+2/84UkjC5/y
         qAyYNA9QiiTltRX36BP/DaUeigB2ZkuFHe440azSRtN9aBKBAviO6o+bYrUFIqwEij+S
         lu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713882668; x=1714487468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IDPH8aO0C/CgFOvGahjdiLNFhkL4WdyF17UbMtaO6w=;
        b=QqWYWxnwcQJs4Pp0mAQ2nM7PAB9iL9o4kksxL9uD31B15aM2ltST4dUNPTXasAOi9p
         fCMTOPbU1b/UGpw/slZW3+xRTFjsV65MTMapkod4SKJX1ulF35IaAuAdmisOmZxqiyrc
         1jliu3L7+Tvd8kpvQKz6mpz/u0xQ5eMHiTYxraIxghErMBwl6GlXenGqTeB/YZOSPTpc
         0T2438ThG94my8wejUV14PJ6RNKqJ4bz4oVjy92dEBpQymHkOPYlb2giMDCmD6G0TTis
         T6Bv/6dZh4T607Vmsn9vcbgLYcvynZKLP9SY1Obvz1Y8YkNaA/YeUt2HG2CUdEe3wakZ
         hpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgtTDYc4mRpr10KsQV3iH6MyXtVAvNOalti2ipohqiL9Uk40YLoA8J0kb0jPQxdLjdwkyhN4vaVtIJ3RstLSPSlCpcB/GLcv2OukaEOkh+Zk=
X-Gm-Message-State: AOJu0YzPYMO3N/rGnGs9iEA6sypAC8MiBdAfOyUA4rMozzr/8Os/iZ7j
	FCHBUHhJ8y1MiJHSZL6MVtzeVTduQvSQeoNpDMdoAtniJINAWxgDuygkDfBgxcs=
X-Google-Smtp-Source: AGHT+IFYZf3kNXrbsNynZ3gGf77a9GhwGcDNyKdEdv42OO0DXfASpzIR/lk0VyJPU+3cTv810Ziq9w==
X-Received: by 2002:a50:d5c3:0:b0:56b:d9e7:1233 with SMTP id g3-20020a50d5c3000000b0056bd9e71233mr7620642edj.32.1713882668343;
        Tue, 23 Apr 2024 07:31:08 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id fg7-20020a056402548700b005704957a968sm6708099edb.13.2024.04.23.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 07:31:08 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 15:31:04 +0100
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: enable cmu-hsi0 clock
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-hsi0-gs101-v1-2-2c3ddb50c720@linaro.org>
References: <20240423-hsi0-gs101-v1-0-2c3ddb50c720@linaro.org>
In-Reply-To: <20240423-hsi0-gs101-v1-0-2c3ddb50c720@linaro.org>
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

