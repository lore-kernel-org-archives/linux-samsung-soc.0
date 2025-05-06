Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102E1DED57
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 May 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565067; cv=none; b=ir3S1k+012B90rIY7kZ6m0WraQ79TBdR4pYMX5un41Pf9mC8NsZm+a6xAZ2SRoIYrtxXIoTwsDkduY/FlkWegKbwmk+7ypDNNfmHpjZLqDwGxsUDyQIrb7RG3yl4QQKVyDgrv6zOCzCHHlzWZK172a/DIlSz0KDV/hLjXDyHy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565067; c=relaxed/simple;
	bh=4fZ/jxB4g1jcf9SVpmhQ0BzBoZuH09GvNuVPULW3X9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmUYQe+bWxXorf9wRYcAznuSz6JevDhDDBCasE1dpJlPgPt1DyVeXXbxDGoS5+xlZyUUrmiGIGiNpQg1JIBakbhQdXG8oVEfMAD2lWtoNlSxohFV3x9MokHWt/TX/37Pdx/dscFFbk7IufCD5UWIcioU2DWqG1OTnHaALu1fsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdnZ0Xih; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdnZ0Xih"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4036542f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2025 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565064; x=1747169864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w20yKHQ/VSVhNuC8t1SVSALz/E/ETSO4xbDb+FAhbzo=;
        b=BdnZ0Xihp7b3c/bwEj2QCsvB1jPzisW/uljemT8/SAu895K4D/6PDQuqUdLfMsy2Ce
         US6UP+bmPnmD6gDjKjkxxVeqQPCxuL03ZOynOofUkp77xpBas5ZgpUG/S0obKqU4qZoW
         Hpth78PwXzfQiAQVd3Jjh5060JhwuBczUIQVeSQ1Wpr9Qo0mz2eoPUsjSqK5XP80jVuJ
         wNYNGbjmdSvCRkO7pNLPDEYuFpFoAHZ92CMuFTnFyXpRTcVw1Y4WnvVeIltQ/SOB3yCq
         GLCuejDjJfO/v/o+0M8yASmNsathAN7tOIV7th1PfJWy9z57N8/+lbi9BSaN8hCZuisb
         owOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565064; x=1747169864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w20yKHQ/VSVhNuC8t1SVSALz/E/ETSO4xbDb+FAhbzo=;
        b=c11THIdXSk4x3i50nDyQoVncrmmsz/j/p9c1HAWO0yWRFDr+oIeMVNNmZqkeynMb2k
         TxuWk/pJ1fXCJOk93r99FU6x7VKmvc84M0QiSzl/OKoT+caWq9e8CoxinFVEHYMw6Fou
         kNSrfQII/vVw7XFkmuIrAi2Ov8gxnUgbWtVb2FZK6AS9cdoy00IF1kkd7DwWdJcv4wjY
         elll1flVMphcdjoSV1hzN5hrT5j/AbcBqBx6b4++Nni5BIR9fez/p9uLssZJqpBrPjXD
         J77OTrZewmP63jhOOF1lbqc4scnpgTK8yW+IrGXEUArYnIfWE786ZtJin27PPXyyWIEx
         h3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW9QpikURMQyt5wkH0R8labZ638rzdyrVNiswGskCWaVtdYkw250trqE7lx8ajad258677ndy27Cg7MhFbECZ0KGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxveDEMymdbduOFuY/6scml+AN6X+chcdJrHgO/xTe4hkOMeh3
	AGf6BZ3++2vumNxFP4w6LGV8vEKP3UoW7JiqPgo4474yLzV6rnhxHxiLZ4CXFs8=
X-Gm-Gg: ASbGncv8xk3yMisleD0fx41g0JJb4f6fSvrbxpQSfm3joCwqqFbZ1WM0drU21jfzI9N
	g0eshWkHltfKt8H9xscUH9U9otXwhpqFu1K70r8zDyWtoxmLLdK6mZfRBYXe3BE7fbTVdT11PwT
	SDzsfGSVuYrQ/CWVHjC7AErzE0hFKYkBzajVIFILnsPEEDcp4O48SrcKO0afnfwKSmsZUQ722bm
	OTq9HYimNkU9FYYocB64dj43oWTL9IrsdGh9lGMBUVpa9YuHOxALsx748RnoRfy90PGVLrj4nuh
	JAY5ouRPEaFNuznfsEY/C1SzLZrIIIv9MqeHw5AcQHeQiS1fI6kUSE5Lfww3i62MUIqNE3w=
X-Google-Smtp-Source: AGHT+IEHZ0blTjnSlV/EPtId94yuTdz1C0toPOnIazWac5TNz+KDNfJ6QwNDagUaD8y8nOUEcFWNqg==
X-Received: by 2002:a05:6000:4308:b0:3a0:8c45:d30e with SMTP id ffacd0b85a97d-3a0b4a29b29mr683571f8f.35.1746565064232;
        Tue, 06 May 2025 13:57:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:30 +0100
Subject: [PATCH v4 4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-4-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=4fZ/jxB4g1jcf9SVpmhQ0BzBoZuH09GvNuVPULW3X9w=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne++5M5tw0yZYXWJclTcP2v4BRbsiSJlh/WX
 zPJy9E3VG2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vgAKCRDO6LjWAjRy
 uuQUEACh5qGJv5Dgc9udkLYbNGA/60GYzyuVZCZzlhzGuB0KXzN4PNcnph4oyIVC1wYr6O31VtO
 5XOH0vwMt3WLDjvHMK0YwNMxjvdwEJqTvX8vgvvIU1NODDV4yCJG4paaniAcQHm7vvUM8kOYoP/
 lc+9FVCg1MXUI48lBjmtdFLbyaaPkxYc2QyF5XX4sAmQTGYAwIM4ZzkAwpnT6CF3IVIBfn+PUob
 Y8lUeTTQWrjLid+xtRUBAcRwVSv+ta/NA6LV05vtWIva0o4xz8627ThmEwT1E8J0kLQ6keS33c/
 LKSGdkfTPxcFWduBPheYdQEhTQfKYfCd680sroltfBxkUFmwBr+EypVQg/QDy+NHXEmJFfKsv6A
 kQswAFIAWkwMczDOEQG6d3RAPCJ5ytVNnxrfkyLoZC9f18X9OWGS1CsdhrLJIdBHe+MzvjpQdaN
 4UEc2JeLzTVvqHdF7JmwzaJD0kpAsH0Y5KoYE1g5M8rao1cbV/BKoaq9gAMF5BVt82+Ug2cowpp
 7zTqxRz7NN8KPacP5TCxyWhmPMqCGZ3RQsMjyJFkcoiXMjPf1kNjH1qikpcEUOWlD7Uc0Txvlwq
 fG7B0croRb5oXv9dQ4h69jOyLUN/77vDtLW2Q1JgU6bYsdjI37+XrDCfJiHlMcMPn/Ogh3XSG1N
 /r2HAItloyh+hBw==
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
2.49.0.967.g6a0df3ecc3-goog

