Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D5A1A2FD9;
	Tue, 16 Jul 2024 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158580; cv=none; b=G01MNZW8bNOMzQD5SYwQDzzHgyzN17QB6pVM5XrVYvhQj/DoKTHgilvFr8RY3qKB3TYCwp3wtK4XCUhWoAzVIuVTLv0fFXKDX+pkAFMlNGnau7di/XsYruHP19WAIoVg4wP96qiPRgQR2G2WqiGCldQaOY8YGHzJ7NcO1X0VyGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158580; c=relaxed/simple;
	bh=QgWGYzqvHsjqfBL4j0SgJZ5JxQSnDNVwolJTCMyITN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvFNE5OEgJ696DffWAW0rCS1J2wlXO8YuvA/jNuWm9eCIoUp71afUAy10dT/AMi7jHGGM27k62pl6y2zwC1MEr9PE9I3W/d0dZ3X92ClFXscQw+I9qbplS2LA/mAznf+cT5eyGAnHpkmVjIRTLpvAxznl5H5q9I6dTvMmkd0MRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYsZUjP3; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYsZUjP3"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so173802a12.0;
        Tue, 16 Jul 2024 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158577; x=1721763377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdmhceYALpkKcbsJDvNnxErW9Bwb3l3qwVd9O86b7xA=;
        b=YYsZUjP3J5XHC3nO9oE++7dZgPs2QeZLJ8x7wq8eGEgP8EwaPhUYvgfXsHlHzphh1G
         nte9OZiyNPTSMmaI+a6iO9eo8ynDDI9udXC7dLNvXkC2IC1npd2GwIgmwTYmRVY6llTf
         K3h3U2PZslSMRIfUrtReXiwDqkZkoSxMsmfVpA3chiD69O6uCZB127ofK3O1J8HMyFOj
         XBY1Cdic/Mk5eJDxapPLM+yeSnQda8gMXUPLZVDrQzKfciIR+EcxlXmfpEY3h/ZGT3BE
         AX6CuBz8vOxNcChTOnVgPPUluzb+bqGjeHC/Wv9IAZykfvxg/SiOMKttmyLUJxBZm3vc
         ei1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158577; x=1721763377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdmhceYALpkKcbsJDvNnxErW9Bwb3l3qwVd9O86b7xA=;
        b=lSLHWXDUwxkN/aJX0dO3ElDZHZWxLgK90G3dIfUTat97yZtFlAGBvL6Q0610obTF8o
         5nmN31dwnaNg20j5I9pHdmY7FkPlkAPaAb5rET5rQrryKng2WmzUQU73GsSYR9RL1DpT
         lEzCZpc8AzsG7Eh/rQAC06Ym5YLYYOG76kzH0RxUYMi5iB7SquVLn+IO/Umn/VkAJBKj
         ZZV3f8EyZR8feMsFYmzOB8WYGsXavPRSZYKswKGuDxRXXBJd3lDz2asg+5djaTZkHhjc
         cPYn+Rp0KNmqI7XrVLsYW/jq2HBxfk8+FkgiIMZuYlY9SDLU9Fwvtz7kdmsq49RYW5F+
         osvA==
X-Forwarded-Encrypted: i=1; AJvYcCWY8s0vWz40R2jmc5F2Wo3V7b15EaW8flKs5qif79zZNt9R2ewQGd/oWAcuQhVo7Jea7RExU8z63rV2ERFsuddAl6N/cyWVEMx3cE1p7ve+iyAgtRFUC3R66wrYk9K8K2egoQSs2hKGPlzYlgpdlslSFD92envoYun8xwUqrx1dvVavEqKLRfylCJPJPA==
X-Gm-Message-State: AOJu0Yyjm09DLMVSJY56zWxaMKTrTLVRteHOjC0uWoCNDyyXAUZ5VEuy
	fGE/6ELhiW5zUBXScEeWA2JYmgvbpCQ7IFlRKNoWphS0kO8tozql
X-Google-Smtp-Source: AGHT+IGvh218FLNwg88O/PK8HFP5c4wmFuV+wVaZLuf0WdA4vfqo6k1ykFWmZsh9n9V46AYNgDEzPw==
X-Received: by 2002:a17:906:3084:b0:a75:1923:eb2e with SMTP id a640c23a62f3a-a79eda9537fmr249643566b.14.1721158576959;
        Tue, 16 Jul 2024 12:36:16 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:08 +0200
Subject: [PATCH 4/6] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to
 WM1811 codec config
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-4-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=QgWGYzqvHsjqfBL4j0SgJZ5JxQSnDNVwolJTCMyITN8=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsunUETQ1dVc8FKwNP4+eeUj5fugkIRozC1vV
 igRSF+i0/KJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpwAKCRCzu/ihE6BR
 aMP7D/0WPdFsO2koC9szvz/Srxq22hpYb8obGNYBICHfaV95VXvIUO7yej2P93XYB6MyxN4+xPv
 0tRGWFVpkZfnVY6ya1VyZGlnBHdFiEDIngTXio9DiR2quosMa+fpZ8m+NCPGZfQiOUwc6RcALMD
 uARnkFNwfaO4jfWFV46MLO4kTheAz1ga/CMnE+MnqFZt/9eH+qasHV4cvLkmszVmTlbm0xXLfVC
 4/rJRgwcgv/VfMVGIZRp3zjrpTOwU0E8MTBGRvilVAuOcqk2IVg7bps29g0Sgo0MpH2rpA4Vjaz
 hiXpyqa8S8omd+j6s8AEHsuqbQu3J7UwaaYqvu8KRqV2PpsfeRgASmOwbSXAcvwk4T6Ed7RbwX8
 8bcRmA1WzI1IDGoxq82oayH4fp5BSROkEuN38qWinFqkvkY0F0H90yrrNacEYQSof2bkNiqu26/
 n/G3CbrpYAtbdBeXIBtBQEm/+E2QcVnjf95e0YAKzKU+O5vojLWZ8n0qCyPwDgCuGGPYY1igV6S
 H0QRrkusT7PUBfukJlwZi1cXsTK3LR+o/cpJQkWg/EfMmH01pKmYunXh03/RmeSytGnPTzIZnD0
 D3nFoU4mv3wnKQH+jpreCQ5cEJchKxtjOtKllQ0LnSlKqB27Wrx44mhJ/rZHtG1lC4V+shrn5QB
 EhTXzlmz3ie6uVg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

In the schematics, the MCLK2 pin is shown as connected to CODEC_CLK32K,
which is derived from the same 32KHZ_PMIC clock as Bluetooth/WiFi and
GPS clocks. 32KHZ_PMIC is connected to the BTCLK pin, represented in
mainline as S2MPS11_CLK_BT.

Add the MCLK2 clock to the WM1811 codec clock property to properly
describe the hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 45003967406a..46bdd0681afe 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -535,8 +535,9 @@ &i2c_4 {
 	wm1811: audio-codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
+		clocks = <&pmu_system_controller 0>,
+			 <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "MCLK1", "MCLK2";
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpx3>;

-- 
2.45.2

