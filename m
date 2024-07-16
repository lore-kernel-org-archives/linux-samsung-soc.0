Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6881A3BBE;
	Tue, 16 Jul 2024 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158583; cv=none; b=hDgGOuAxvBlh2h9VjlvEYzUkteE5hhvhbqoZD730dDdaiALJ575A/GheECzxmRUCseerOppQK+V6tev3lJ5R7AM/4uYdcALBUIz4wR4AF5cOlDW3mrnlN1+M56Yyfnr96wnLM6k/kRpuuGXHbz+0EXju1owyRtDSGs8XjOlIsBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158583; c=relaxed/simple;
	bh=gmNe8B6uth6imzyutrGatOa49Roz2puyZmdeFJT1hWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdtVS3PvnMnTE1j5NDHSFC5Wb6z7fsG4eE2/bQudCib8bAPb9YC2y6lY1puLIHBnV+ZfefUkH/5vC0udn9tx/k0gKIEPFIDwEKwBcqvbTd0/hsTzPMYAEuFCBi8QBfDIero32RVKArVLmktXHHoDareNj2aZ8gSmkZDEsoMfLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Akc3y2xJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Akc3y2xJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so173909a12.0;
        Tue, 16 Jul 2024 12:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158580; x=1721763380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Y/figLPPb3s/kHpaYIzIIgybALHStt8/ZowYexI4ZQ=;
        b=Akc3y2xJ6t6kNbkVdd2S0b8iey9W42uPHBp4GAcdjkOT8x+YKQMa8LNi2DdZDWE3h8
         RAP8NUmwmJzCd6x2wcdgXxzsvOos/DYyYtDpBKHw8oc6SmCikavcRDUkdFXcSkUXcGXE
         o3k//n/pZJ5TkhrMq2rgZok5RdVUYrkZlPPLqWYk6VEU3df7TQm/l+3RrSGmMJMK+rDb
         kdHrwYJ7MR3hDTiV+RLRyTdbddEt04xRIEGxhikZd4naBZyUFw7R22a0K9iel2nC53Sr
         wCOssbFk3D+VFsJhcWqyswg0Iozb2omwgKKwbKV1M2k/sYkvMTX5t2fcoCj8ZNsdhqFl
         N0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158580; x=1721763380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y/figLPPb3s/kHpaYIzIIgybALHStt8/ZowYexI4ZQ=;
        b=doadRSt8k+yvPQodeIC1wKNofH1Neqr9mP9MfYYkB3liBfLH8b3YrvLo1oIzDzEi8b
         mYz++/aCNllaj3O1P2QvHu56DlVNWjCVCF0BnOIXqDWBpXTko9cHrqJhsTQImtEK7ubg
         6vndmDirHw0XQRow5lcfbQzfV5F3oegFULsisnle/5TcfY89tceklnHj7/qqoPt3XIO2
         b5tUwRTHxu9OXuXnQOjuENE8qGNmuFc9E0C9QZCtqoaTjO6XaCxVIv6NpWgeMHts8htw
         6yxC8IlK5LnsLm7AGnirZZxSSiiGdvvPcsJEedVA5fmcVEst/2+RUXf+iPB5NGF1lDN8
         cXsw==
X-Forwarded-Encrypted: i=1; AJvYcCW23MUmXUReyhWx6DAvwS4uFS2iTynsOk2LaUBTaSagGQRYMUab49oxV1ljzE330iIF2HQO3kwge8wcQL3sZqpaEwY0bMqw7rYCI+UaQt2J6m/O/eMrS2zMsIEogP3UyXO1i1Tj5ViJUMN6M0ojov2VSeC3+FVejirsr+PbRN+XV6lcVT55NWuqp+K7xw==
X-Gm-Message-State: AOJu0YzYaymyqaiyWlYb2HIutJtAhMcRf1MTg+lzzhA/vAfxYC5hgKk4
	AEYGl1pTDTg1tJubaniwMwJOmZQ/b1ovJsJacxtSdPQm8mbcUj1/
X-Google-Smtp-Source: AGHT+IEgR0gO2kVHw67jn9MHScnPLSYzwngg1WEzMHzlNyJlKTRwCPzPu8j392nQzdSsoBYWezp4ww==
X-Received: by 2002:a17:906:1619:b0:a77:a1f1:cfa0 with SMTP id a640c23a62f3a-a79edc7d718mr250465066b.36.1721158580267;
        Tue, 16 Jul 2024 12:36:20 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:19 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:10 +0200
Subject: [PATCH 6/6] ARM: dts: samsung: exynos4212-tab3: Drop dummy mic
 bias regulators
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-6-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=gmNe8B6uth6imzyutrGatOa49Roz2puyZmdeFJT1hWM=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsunUO9bcHJkl56PQMjjECvV6HOYFHntV7hox
 owtw9Nc41KJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpwAKCRCzu/ihE6BR
 aNZ4D/9OMWYjIM4siS02olvXVt/TL2u5qjcrrx0v7kqRCmhyXB8cjDzo+rck+tdWUZMCdPigs1W
 q/LoEupN9pqrZh2SKS6VSUGYEPISNIzS5YuzpCKAK/Ik1r6vjCD1qc1nWAlYEQHrOopBC0VPF0H
 sE+ZAjQahIpOdUlPoOW75uDLzVRbLpAYIx4ngs+xmF2AzlST5/TEXVt1dHMY01Ds5bH0Wo3X1ds
 iDzK2s/LK3aOyYVW1v19jA8DXQ4wemq6h4spO4MWvEA9i1+RRDOoBbYiEZns7IMYg1JHmN/H1ya
 q9Qc3gzPEhVXxRGIQCabKBeUGYNcylIKeI0MzlBhBsUmO0Yr1t/EYmEIeU0DynPmosMfeDesS6x
 VlKuQA6E35Zan7swtP58COTHuwsQh6Do/ddZWUN4LPrwth9dt4fK+My5MfQm7eF9epfuTax0i9t
 7rQpPrOpa4Lm/+du0KviaxJsMKNa5OR7EKyfb7AmdzwlC3eKmWdacZt0FpA5oyt6738YWXb4q2l
 m70tGhqHR1dKr87JJv80/lcp1xIBU/XMHc/hMHuEr/TT28BOsrQ/3jhOufF5q5Wl34bNaOR0oWT
 zVGrui7OAt6JmbJ7e97hL3mqoWtf+ljy905xUtwexpZQaxmAZ6Kqci6sAKCmfjP+RmuAMbDYcFJ
 c+f0clsAUj4BAvQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Add the samsung,tab3-audio compatible that makes mic bias regulators
non-required, and drop the dummy main/sub mic bias regulators that
don't exist in hardware.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 2f39f3c0661e..a140f86d399b 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -286,20 +286,6 @@ display_3v3_supply: voltage-regulator-3 {
 		enable-active-high;
 	};
 
-	mic_bias_reg: voltage-regulator-4 {
-		compatible = "regulator-fixed";
-		regulator-name = "MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
-	submic_bias_reg: voltage-regulator-5 {
-		compatible = "regulator-fixed";
-		regulator-name = "SUB_MICBIAS_LDO_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-	};
-
 	earmic_bias_reg: voltage-regulator-6 {
 		compatible = "regulator-fixed";
 		regulator-name = "EAR_MICBIAS_LDO_2.8V";
@@ -310,14 +296,12 @@ earmic_bias_reg: voltage-regulator-6 {
 	};
 
 	sound: sound {
-		compatible = "samsung,midas-audio";
+		compatible = "samsung,tab3-audio", "samsung,midas-audio";
 		model = "TAB3";
-		mic-bias-supply = <&mic_bias_reg>;
-		submic-bias-supply = <&submic_bias_reg>;
-		headset-mic-bias-supply = <&earmic_bias_reg>;
 
 		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
 
+		headset-mic-bias-supply = <&earmic_bias_reg>;
 		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
 		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
 		samsung,headset-4pole-threshold-microvolt = <710 2000>;

-- 
2.45.2

