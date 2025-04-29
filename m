Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4932750FE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Apr 2025 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907590; cv=none; b=MuIYawrDTIR4u96NmbTbT7ApFqfVsG/QQpHyWH1TFXaPCxFaaMfI/kiheLpskEN3vP69NsPdQXSN4qK2mK/rs1VxbOI6rWtHUM/M9tlm4IjDm3Ed1sgFI2iaj6OqNcl7okdufKi2TYAKhU1CBL+Q9tFaGuDidHqInIJe3l2v/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907590; c=relaxed/simple;
	bh=IaWY7tcMqLqpKkGNb2+Er9XE4UoUasfxemcbzBXbz1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oiiAe+ATHIQAinrVXvWSp6qZEu1GG5XRi2OTeKl0wMK+6TErPYKRxQFCekZ/Js/SgOPTLB6KCh19uchOP8FG3Ng/jjhg5VkF2lGo0eTYUKZri5Thmjc5Pml/ukrn5tvIu9iiN4gr5otX+HkXUZlv5HnYZMjggdNx/8IXoPY26bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RXUPghbq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RXUPghbq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3801362f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2025 23:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907586; x=1746512386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J1y0j9xusCEdQGMutlBT7sXepSuuDXERtpBDgORlLg=;
        b=RXUPghbqrFgOHLqWGAYtVDWqxCkLTy5HlpYyUJ8IvlZYvcGzI3+dXQ7sUpjy6AzeVD
         RHhzGdPE3OaXjvxAGf1N6G3rFWiKqm5ATLnXRoVXfZibwXexMT3kcMVhYd6XOmuoQzkL
         NGUj/lScu3VwZ5BTbQq8B5426wnYQrKj8xhdvRpy8iy85O0PVQw7b9K6iRYh/uEldGhC
         RagKLBlNckgDymkFPcr4P9dyU3EDdSPHERaa8+RDvq7IkW2EU4Cx5DG6uMX1PAoJnUun
         /hcIlYmFyaHlVDkh+rH398dOUbd+nXWsiNm2ldx6rGdG5wVD5UYHB3kti6Cg5d06Nmhg
         GgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907586; x=1746512386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J1y0j9xusCEdQGMutlBT7sXepSuuDXERtpBDgORlLg=;
        b=NSb8zQQmqFt0ytJbaxSCN3e4+O3FyjeAOSykBZfJqviYrPqYIwIlhtQHnwwMo7chlP
         rowtSuW+BBiGXgUy45IQKc2xVsAGM4sc1eZ14bnPECCmpnQ5dtcgkcU8pdG+AHig7gkT
         kueU6b8jt4uMox/rm9dlbGibzyjeWTJAxjDKQuPd5PGrAtUZSKqWe4P/087KXpRCTCve
         34Tba4G3wXQ5wB4tPoslTNKV9hhOyQrOAeIOEqj9Jvs5VvzlxTUEXxkqcSg19y5Ct3gA
         6iWoLeLSNdlVwk3BJeolPd0J+0igvBqg/CWT3HVqKl++lG6agKv4jWyA3EOngvS8BA5b
         q5rA==
X-Forwarded-Encrypted: i=1; AJvYcCVlQYy2AZ0NCDQ6uYbF236S3uHyKLeGP2rJsrMu1tN1+Zf8JleQt5CpZqXFSJ7alf7thXCdbzT5AAxB6ATyGElasg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweRbIvRP5frQZaEdJi5EL95mY7kDHZxqMYUkOnGYriB4aGksOj
	x9T6pKFwvsZRjMQ2vRRg+LgmTKE/4b/SZaWGbYDWVFQ1aVMYVGlaeoFOWHgdhFs=
X-Gm-Gg: ASbGncuewlbw1FJaKfVvg4y9IcfM0ShTGaQrSXtMlzpXEVG/hnmQx6FNi4ljpYGhDir
	aiXcwcCftGL2OSJqhtndP7wyEO67ghGCJTOMMhlxOeRndkcN559pd0LBb8gY0kpN4GNw4IUoAfl
	IKDO8yfnS9mqldrio41QdkoONwLg9xrW27YqoPe7cbvk4DJXUB4k4Y1q4kwRBkAlBQLVH89mohM
	FBt8WATSZRGVizSB6hUYVF0fQZprxJ+el5mpSC0Go2a2l+fQgObLlqC6uGUb6hBQjxK44/QqK69
	om5Gn3N91r9lKEE0jCtM7+CmCcifOVQR+eJgycWZj38AV8XcjVMSHCkcXZPQJo8kz/JQlsA=
X-Google-Smtp-Source: AGHT+IGZHANJgUSXXTUCKNgmTaHbkPL5ZSTXXFAUgVGHprMJ5PNq0SItX2F9a/mxdybpRLb3hlTLbg==
X-Received: by 2002:a05:6000:3113:b0:3a0:7d64:502 with SMTP id ffacd0b85a97d-3a08ad284a8mr867182f8f.11.1745907586693;
        Mon, 28 Apr 2025 23:19:46 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:46 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Apr 2025 07:19:40 +0100
Subject: [PATCH v3 4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-4-1bcc44fb1d55@linaro.org>
References: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
In-Reply-To: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=IaWY7tcMqLqpKkGNb2+Er9XE4UoUasfxemcbzBXbz1c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG98E/mWar0gec4zKdLIOJk0f4CBzVOdq+8N8
 sKDMz+m6PKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvfAAKCRDO6LjWAjRy
 upepD/9CfAi9gMWNP+Tzfre8i3QEfVw9+FE3nB0W/WZ7KZYj1iNdvEHf1zYDmwuLAZdWrz0erun
 LflTXAUP/aTyszRv1AE+5KS4L/WZBVNvx1ngw4tfcAQmy7vMxpVc/w2C9HERcVJ4F6PT9BdIUgk
 ua4llNq65MYAfMA6xTrOZAGpyFNmHikjkpmcwSPZIhswbdk5qrSDIVdLddND7KX/vg0LKdeEaQV
 S7SlDfkv6c9DnYLfIxV+1mVo9qojm3XK9Hr8tcp5HP+9sew2f0bYqJNvSGB8gvlFcDihxkrzNd3
 bfKUPVug99MeoZEPWN5Kx5P13lis92TLHRRFRyJ/K0uJoWYM/H8ReaaGUfciXjAK3kuLdYE9jvK
 eI74QBlsO6KLLJ2eyoVnc+/OJc9fVrrNt3oH4qJ0Kdzjp4SHroLClpF4O10xFPhYkz7XYfB0xVx
 zYyfXTliI9XJQb36Ax7uDcGMY08WX/nzsP2H7oT/RSiabFTRNtZw4/7zF06F4LazOd12hBOdcHd
 /OG/uyPmOgsS5lcYHaJGCJ87VzPqts8bmsNg8yaOMLJosSNn65rnLN74441fyhJmyfFwE02bXZg
 cB4KS0C69MlZsp97sZ34ep9p87Ox5LMCA8RwHq3OJj1gbXvQOektMyKFNjzeaSFwQdgUsLakLCl
 z8cg1Oj6cSQ/W7g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Add syscon node for the PMU Interrupt Generation registers.

Additionally update the exynos-pmu node to provide a phandle
to pmu-intr-gen syscon.

These registers are required for CPU hotplug to be functional.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Model pmu-intr-gen as it's own syscon (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 91cda7758020563b2c5b5768d8921e87b1f4231c..48c691fd0a3ae430b5d66b402610d23b72b144d7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1405,6 +1405,7 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -1434,6 +1435,11 @@ reboot-mode {
 			};
 		};
 
+		pmu_intr_gen: syscon@17470000 {
+			compatible = "google,gs101-pmu-intr-gen", "syscon";
+			reg = <0x17470000 0x10000>;
+		};
+
 		pinctrl_gpio_alive: pinctrl@174d0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174d0000 0x00001000>;

-- 
2.49.0.901.g37484f566f-goog

