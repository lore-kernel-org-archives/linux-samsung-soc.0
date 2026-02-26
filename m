Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E1425CE3
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120845; cv=none; b=qki6SWYcgFXi54d0HQ2ipF9k09wuLTx4D2T3xddtMSCOKDKAyKY66KrobBtamC3TAt6ty5N61DO/5WqZMJW94mlcjveRHHvGFkZcUXoLqVTy2djKZNgmSsDIh028wn2ftW8BwRACD1jJenrm4VOntlIkcYGHJeHR+ySLhviX0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120845; c=relaxed/simple;
	bh=kgl4foMndEPG7F6jXhp4j7AMJhwvQjtbJ0xHBrZVLj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6e0yQL2+I0JmoZNm+4LmAReRrzw0z6QC11kCKte+GtwtsLr+jGTDt/wHgBq9pbMlo4mv4YtSoOMH2fqyrc1D42brgxpR8M8EfNVmku0YKQlGLEoUiW8BN+S4QQxtR1lr1Cg5UJiXPDmsrl2ROxltT1ZUhdkNiCufMTgnCVf4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRdW7TFZ; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRdW7TFZ"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4833115090dso10632395e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120838; x=1772725638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=;
        b=mRdW7TFZivwe/aX8EUexWG/CkBSW9dxxuLUod4ojJp9JHW3m3d7JdnVUjcUL6sOj13
         RQOHgTueFF3Ye7eibTlHE3UyjFDZ+a2ipY2ck3yCI1OrTpUsTjkAnXfuW6s8yPN8l8Vv
         YJpy+mncTqf9LMkRWqCUlGM7YhuJIjA2pvGiLVFNR0Kh7ArCIfz4Ttt2zvSJ5qh8awlm
         2Sy9/KcKyeTR3811YqTYcrXNafch7hW4pg/nKXrhBjBTCASqF+seJAef+DQdSo57Z1UB
         XQ9aWz7a3SUCMeGdN4DIv8RMx/bshtdhD8xdeeRTTqiJUJBhar+qY+ga7EE9svcKmjCG
         t+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120838; x=1772725638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=;
        b=hTKDbm3to7PZQs0dfcFUhiiXrsYfSfoG/QVuGhwjBFDEi0kBZBZ5AfjKSF8Ok6wYQ7
         nSXYY5/QRs4PM1jbojfufrGqvTrGb1XlvW8jO+Nj3YmTuBVyc8HzLcIyhBrUSIiD1HoC
         bXR3nQU3tfcQkbIMacw5kPuWxaMrVl+VzyI0owHmygtRNzaEyfuWOPC4xvT4ODHQhiqn
         pcEFWmyaKg1rPp7WCPLrHMaWs6j79tQKOS3Lf+RPWP619qGUXyLkn2BLX0RucbZrQdDz
         AKW/HDqiQehW9Z5kkL92PSrDmkw1M5StStrc1DUnJURGTKjFsH6ECXC5iq9naoaP2T6y
         +9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcf8hP1Mk27L22R+C8E0LXdPWATWiI5U3jv1uHhyrPcg0B8hGt0RwlD1NeobIdv+XcG3kiSMWHBBWvIkBK0W+05g==@vger.kernel.org
X-Gm-Message-State: AOJu0YykOD/UILsBX5DnfUGiCcf3GI4pNTvy5MG931PtBYb2mlHNd7dm
	YHeQmdCXeg+5qgT0qfPFPrsAiJpRIzX27eXftVhqLyG4W7Lb+H3cv6qZvWKznjeYZ7w=
X-Gm-Gg: ATEYQzz6isMeRIM7O7vLbE9S+SzV+mmJui2bspm+75XliUqHTMLEF6Y8M26yPOdQJa/
	f6VrFx6rzMEFrLH7A/YwXBTQ9vVTuHD+Dr/uraAfFtPHphGQuimdIpifvpSy4uC9mBsI2CmGY1e
	jXxPGdtZSGJ9m4HCABg2PLl/bhlUGjIjMmrGHWMmQ2kCyuAomsOgK1RxfxLugKOX87llAqdQJG5
	CQ1JMTiXfLyRy0TY64jplHGT0wTLXlpmRkikskAF55MTeVUHczOf8J4hbJhzat+B0niFsgKbptH
	RbNYcETbDq6nmsAX38i2z22m96t2W9p6Aycr+LRhawWBZziCEG97/xfdzkROg8N0DbUz9IZdLuW
	oJn5HZ5ROhkOrFeMOTb9w2KfwIl/l0iXcymLnSWEDq7LF64q3jqmfHFCuVg2jY4rKGEu5jEo91v
	mSdaEwy8jmGNIfZrDrYB4lpJcUxunpcUusVzPzaYpO4+jynkSvkPwKjWlBn/8b1k0m2MEVgO2UW
	OGm6ndRxmP1ekw=
X-Received: by 2002:a05:600c:a009:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c3df45e6mr52290595e9.31.1772120838328;
        Thu, 26 Feb 2026 07:47:18 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:17 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:14 +0000
Subject: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..e3f4fe6ee118 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
 						 IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			samsung,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";

-- 
2.51.0

