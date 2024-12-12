Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83822969F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019255; cv=none; b=cUqeJ5k5KJrmHrPdC0p//00oyg29GTvS0vFmfdY4Hqdy3qmKM4jEGeJwD7okaqAXZSAOguO0/jP0St6eDIKVPRA0HWXfBrDK0rENU5SakPUR++j2K2ixLTc5oKGRx8CntMz2Qd7oPe/7AJOWmDmXWkChcjdSP/ibxcDodxLiIMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019255; c=relaxed/simple;
	bh=g9Y6c/Lu4XdnwvVgrnVv9tKSFGDPtKMBC9QqU0RCKUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPxyJ6mDiiUVAiNUB/dHbMLWVJ13lj3DmAV+JztnCcKL8AY/jfz0RehOvQfhOavtG4nwWYh2xC9+Cs6bAWBTX4jB8NdR3uUuXF9OPkcHFYVoU4pMA7yHfFl8iylmDs97NUC/9meQhvbAyFRAhgcWffIIPfLRKsxiW1eNVxBfHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7mg0IcI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7mg0IcI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385de9f789cso603103f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Dec 2024 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019251; x=1734624051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oL8eR/tz3ZIpCfja0LO2ssPcqKhJCh2en92mW/OWpZE=;
        b=U7mg0IcIlNEQuvGd21pN2PvtcuyIqrA9uo8oWNG+/N6Kmm/pbOruqIQGLUIdvI/kXE
         uqrANBIzr5MoAOSJk9HzPn3uCJaC5bkkIXmVR+pjyB4C3oERamdbq8SdgJKa2214HI/p
         sSnre3MHwvJk3f6xS1FLjCyNZ4HI+uV1w6CGAS1mglImc245szJ5+lpYMUrTdl5ijsHj
         BO1X57cOUP2rPoGcOi5kwx1w41SHyjeXr9Blajn0J00IVcy6Zp5eaaBfP8ajpQoXwHfy
         T5CJTnSeSoYO/ivPNqI2t7R7lZbvaNYDi+bgilpdwXHhd2MaBxBID/EJG2JeeBno76AK
         k4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019251; x=1734624051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oL8eR/tz3ZIpCfja0LO2ssPcqKhJCh2en92mW/OWpZE=;
        b=CvpzUYN93js//247TaKF8nimv4JMxeGtBfQWXSdn0aDZz/KqDIt21NifaVvQYQfaVd
         nj635VKWsvNP0y0nGmCbGnRI37pP+QXFP54HsVG8LOaaa4yV2yerFx6sesKCX2koZhxH
         +j1nxNu69nuMXO4VyGhMEFP0jEpXbmBsf6pEGgNfwFZbw60HBJqjjAEnqKzuSo9jjr4u
         NIlCm/U31q5ij5bsURsP3LWRuijgUsgbkmAz/cIzWBcL29wviZhWF2PgNlJwd3hzu9zr
         47Y9q1wfmhRr9GL3X+BBZZRkNHAJZL0xAsz0r6Nq2BgFZLRZjd1jfX3Yu7TK7ncGpjbs
         Hc4w==
X-Forwarded-Encrypted: i=1; AJvYcCW2KWqp/jp0PyoEkeSbjXswjwoegnyNDR8Tt+oV4wVT13q+n8/BI95etVmXNESUv89p2+dYvHUnuwlGjcNHB0DQWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06Z1w9bSYwXupcmsrryEb1PehQW6VOspX0IH4/hAwqoocrJET
	y5v8NW0Z12iPiTFOLonGbRV3Tr81DRZA8KsoLXTDVNnUkVch7AdAjwPbe6nnanc=
X-Gm-Gg: ASbGnctt1b3jKBpCkQEThCwhDSTL+pFvgQndh5/JLLysFMCXOt+F62fqrtbsLKmSuVh
	pGTmsPWvZYrxCiom9a44gwLOXApbKE8UsktdRExM0qEM68bME66y/hSFa9wk5Bl8MucEnqCfIMu
	anET98wSIVNW1MqS+eFymUEJ6TNnNaWeKlutfWOclGJ9jLZ5efHMh6ZzLpkyPko5J9Kwk9hccMU
	6QwQKrs4nR73RN2jFWGChbIsZMMHaFGBLK+aUBCKzvBjgZYuWTeNrhZH+sVuqJJwm9nTJUEGsfj
	+MGfAOt9RvjbD+AgGLxpSBOfVHRCN9JCEA==
X-Google-Smtp-Source: AGHT+IELIxGohPpZyWs+kDS3Jy7c+lDT9602oSXSeH7EbGUTFSeHBff+tDxvNYOauQEuqumTsB12pg==
X-Received: by 2002:a05:6000:186b:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-387877c2690mr3555724f8f.55.1734019248941;
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:38 +0000
Subject: [PATCH v2 1/4] arm64: dts: exynos: gs101: add SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-1-91b7a6f6d0b0@linaro.org>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g9Y6c/Lu4XdnwvVgrnVv9tKSFGDPtKMBC9QqU0RCKUw=;
 b=pe7nkbrj20qSYnrPkOzt+GqPA7lDUyR+IOiNPFAd4WlYXzbH8ZVMKRBtJ2AJ6BEWj54kNiXY8
 XhWrSTkps7uBOgZLxbruYT2X/DmIRHZ7qF4C+mnzBjagKE9cPO7q4Im
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..1441e9a252c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.47.0.338.g60cca15819-goog

