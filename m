Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4134204697;
	Tue, 10 Dec 2024 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733853746; cv=none; b=bQi97ep6Rnr/KXtXs4D1XxLJpvaf9q2J++AyWCg6SSegv9jq8r5Ktlj0LutUM9dXDhrbBSArjmGweoqp4eYiF5msAnc498EOUuRXjl3tHVSpZmVJ6ptbjp8XtZX8sbSJrblljOS8wqiKGU7qPF56KkcJ7Z6sx9ysNNxvSHb9ucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733853746; c=relaxed/simple;
	bh=xYTWirSG9lXulF69kTWDPS5Ka2Dkau5p1JPwDtQ9c5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kk9nGAl1IXy9xZwLJq4wdhleniOfpa8bNd7L4HL80snbp1pzJA/RVBFNgx997fu7WK5TooSOjCJLMbOY1MxPZLYaRyFo+5Rf1GAW/EmuL2UO9qzhorRMHmJAsvyx7kCFzxTpWEbuDFnXUESnZj7ICe/cQ/qQDcApq1lL8ot3g0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWLQ3z4P; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWLQ3z4P"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa69251292dso407203366b.2;
        Tue, 10 Dec 2024 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733853743; x=1734458543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+9FqYeeAENGrZd8cytmT4zJKeKkGEh69WKTjOVo18g=;
        b=aWLQ3z4PAr6iCEyVfvul6F+rrvAG0QqGSP5hVltWGMdIB8x4v5uZGOtuLwd5fFbfVD
         BFWa9UxYpFXJ0vGZoysGe5QnFYrv797C+vwdGoCNkLR6DDvdzoLVEdiptvQYbJ6DBLT2
         4LDRGqm/ssb6nSXLNdSnjarYer8bKJrfOAA//mjkRsjWG6HT7wE7l5GnYWV+8V2Yz4Dv
         0ueYu0nr1FvhwlXk5q23a9nungCTKujyRogM45gmEbAobB7GRGSxFeLWntZ9nFtlPABN
         p7Tv+0nZiZ8hcscgGNVq0yrgMBOiTz5U1bz9R4puXuJDWhxtwFtSYAlHLqeDhJlCTJDx
         ybHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853743; x=1734458543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+9FqYeeAENGrZd8cytmT4zJKeKkGEh69WKTjOVo18g=;
        b=SRZc1nNfXTmgkXIO6+1qfk/kUX4DKrPOdWTsBIOdGyWwqkgY+z+/cDSwMdXFXL800i
         vMtMRGw65HJ+vxVWnZSHVi9z8zjwIwHeEOKMUNeiGRytDfFJNf63ZvSKE050kxKyfnAC
         W47Rb+b3De+DIw+RltXNtOQfkUsSwlTKy5BVTBDpX9ZYZaBzUxF0VYDbAp46CWGsIxOh
         lKgaYo5UTpSmUi79fqPzfkDqKT1h/X+BiGHhxmFFG6teeplqDV1uk97tXrX1wgtPCunl
         Cw2T/NLGecFyifnyb/Fq9k5jkOSeCW6EI1ilCkC0RFO0aVPROXRKl+2YDrgSmTZTop1r
         lHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Pd8ZSFKzDXE8J6EoDlVMUszpH2tQPhIn7hCU01sYN+sFhkxgL9uzgbrjJknP/VKwZA+3XK4/aLdH@vger.kernel.org, AJvYcCVs1Unpqjxtz2QNU43d97eyO8Bp2RCljKTEqyXj7Ei+Y68nPat0QJJegG9OexZFfy02Vp09dF4sIrUKXBa1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54kjVKRNSdlNjIvpNJVTWCuF6sB3+CCjNS26rI45DxZoUBoMt
	hO73mQiyd7wOHz2TAZr1HWMcXw0pbUZv/X9/0/qFGSh/UksLJp/c
X-Gm-Gg: ASbGncvlWdu4rRjI6NQzkI9Dp0JL+ddiWa9ykw1QWtnO9VI2cRGh+Jzmgp2KpMwEk1w
	5JcJgUAE8boMm++tyHkENS3FrAyYM2qhJF+E3u1dh/pNlAR4np2hQAHDRnppNiPuO4GbJ0YpmAp
	MW3ahfujrFJdY2DJFW1vUM0kMZdfRQWlzzYFk7u4ubKnTrLObSFyP0428vGIywV4g1grC/kUJNx
	nfKzu+AbQ7nKn0U7BKuEKLKNO+FL3MubkFzSeKP1rEGHY3yiUFTSp56YoL8EzuVtbqG5ulrRkEE
	Y0OWZQrhNOizv03P6nu5bt8KDplP2w==
X-Google-Smtp-Source: AGHT+IGQmiQFDU6Ifm3WpLzcxbuQNWrLM/dWyKQdSVJ1aQJakM+MmE9LVunH33Z/nHjWO9mihVn+7A==
X-Received: by 2002:a17:906:3184:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-aa666eb9dc2mr1033264366b.5.1733853742664;
        Tue, 10 Dec 2024 10:02:22 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69448304asm276347066b.45.2024.12.10.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 10:02:22 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: exynos8895: Add syscon-poweroff and syscon-reboot nodes
Date: Tue, 10 Dec 2024 20:02:16 +0200
Message-ID: <20241210180216.398165-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241210180216.398165-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Exynos8895, a reboot is handled by setting the bit(SWRESET_SYSTEM[1])
of SWRESET register(PMU + 0x400) and power-off is handled by setting
bit(DATA[8]) of PS_HOLD_CONTROL register (PMU + 0x330c).

Tested using "reboot" and "poweroff -p" commands.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f..9eb89dd19 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -388,6 +388,21 @@ pmu_system_controller: system-controller@16480000 {
 			compatible = "samsung,exynos8895-pmu",
 				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x16480000 0x10000>;
+
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				regmap = <&pmu_system_controller>;
+				offset = <0x330c>; /* PS_HOLD_CONTROL */
+				mask = <0x100>; /* reset value */
+			};
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x400>; /* SWRESET */
+				mask = <0x1>; /* SWRESET_SYSTEM */
+				value = <0x1>; /* reset value */
+			};
 		};
 
 		pinctrl_alive: pinctrl@164b0000 {
-- 
2.43.0

