Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C173803E0
	for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Apr 2026 04:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775019127; cv=none; b=o/VMIxYVIq3Orl372CpPxzm4bgO3ENtQJ1Alt5neILP0fXOEGwUr2om7S4Z6Oqh/Fz7PHxf/6sd+D3v5uCNBNBAPFQ159V2/Sy5auRNWbB/IbXfdrFQW6KGq/Vrh5OxyBLktupzJphdIZamMBRRfzpS+rsLWHkrcSDf4SH5w6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775019127; c=relaxed/simple;
	bh=QuHfV4CORNsNe6cBsxf+zpBEKlLEbrBU4YRbW22vQQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QC4tyggcqV4aL7k8ZNakgQCK95H8RRrgJz+KQJsmQQSmo4Ft70ob0gWwLMz4TxrIn1blI9VWia9KuYz+n7OVFtlGmfnnaMDKjPsIz2FDbILmSHMsOa49baThNWKiQ/MgKaHVRO+gqUShSMmnkHRe1Dy3pxsiBlpodr50lm78rn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQ5Q4XmV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQ5Q4XmV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso18127825e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 21:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775019124; x=1775623924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOW9GJE9Tg53d/rO4Iwsh1y7xwv14EVejMuPlQ8bsTY=;
        b=IQ5Q4XmV6DyN5SFdQBLEJofrlxreHWZSKVLT00qdM0dZvWLP/sZ1Y7lQV0YNDMHLwn
         VnK5ZXlbOGjtaLmWr6FV/+Yyv6qBycKz8a2z8KxorlMVMc7CvMt5F9w0QwtT096hT0XE
         oFaTDGoS4BLAyaKjOwFD3VOkUPlzL/2Shnr51Ew/WK1r+PUfj4+djFh1iNC94RcvJ/Hv
         /TBuo6K9t7SD+a7NoNLkDnUuKkDLTVXPdNBVYcKHnfVybsxok/mOec6bH0mBLJYuGKHQ
         mg2wcTt4Rm7pt8S/9Fmp5hkQD/hAmnHawbOeObpfLlb51gQ5Y26sSInCJ7boDRFioiiY
         yvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019124; x=1775623924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kOW9GJE9Tg53d/rO4Iwsh1y7xwv14EVejMuPlQ8bsTY=;
        b=AR3TOmHZBcLXaaKnDYsmp0iHh1Zd9KDijhL9hIYYbHIFxxVm/EgvERN6Oi++fkma2E
         T9cOXQmLDL2pB1sj0SOQVyfeVHphytSz+AngH/ZVN3C2qQKHBJsvGaNpdmpFjq72MPI9
         kchDSvy3N+8EQ5hzxwOQ/rAbuP8bvYoc6qlqBApZKgURASVgGJL/Vobb3RR5tRc67Ugu
         EJcYxJNINKv2zVUp2tJJFji0QHwFCaJ70A+UBCJPQgZmAtx2wW/hWGRITClvY5PZcvt5
         1HYhgsJg4eiNI/Pzc/pEc+4mNYCP12WvLU3f0KxAyCEr/bYq5IxZWl/UvgzaOci2WBGN
         Ix0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtMS6CAc8PTBBgxhAWqKakzedjePAN49aYDJ7ZnHMz28dSfiHVFjGJB7D4f/eiWR8pr89mCY1DItMdtRTfIesXig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ub6JNkM2aVt40cCvv6yNku5VravGANVTfpMVkoehERU1jNae
	xJw1OTO+hyqO5T13oyjJpDmcwPn4s3R7NQF7DJ7FVnZMlu7TU6k3YhQpYlg+ExHlyQY=
X-Gm-Gg: ATEYQzywt/HqbHjUIhZw5S/04JKgITfUTZwLH7gGTtd/L32tCJQHqEbYsbohasp7drX
	rF5LsL8QV//LoAArnxYssLxF6TQ/ciben6Fa0754jMrE0sdvK+DMCTAcjsjkiGq/cP/XncTFOLe
	4VF4h3HQrMx7t+NXSN0wazF3SyBpkO1jOsnYccSJY5jjwjj3O8yw8fxW9b+foZ3iKsDBrqX+v1O
	LwdVbVbm85dt/4qA7WByfcAt1+Os0XBmE5lgBWyPVazq1/8i1NL8jgKaqMNjzcu/JJC/OpOK5JE
	lg/MPtTmwDcRH5qP464ZpH95soqabSOFIuheWv1aP4/S/OvmE0jJexFyciTMOKRDbSuFZRcB4xD
	U/xUcnU+6rWbUa1XtF5irCsj2iQ/xuztLKnBKGi3g5sWWBdgVAjx2CCvJxlm+vdWEhCfCRmF49l
	v3TOxlICPtdy7mK4Df3aAzChvrSS7ktI3yuppLNNNgswHTWRPjAFl+xHFGNcJvYe5ctheH1/j0b
	lARjPU1tCyopZI4
X-Received: by 2002:a05:600c:8708:b0:485:3dfc:57d with SMTP id 5b1f17b1804b1-488835a59bbmr29153805e9.30.1775019124159;
        Tue, 31 Mar 2026 21:52:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm32986442f8f.23.2026.03.31.21.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:52:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 01 Apr 2026 05:52:00 +0100
Subject: [PATCH v2 7/7] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-exynos850-cpuhotplug-v2-7-c5a760a3e259@linaro.org>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
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
index cb55015c8dce..f5cbd4d86226 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			samsung,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
@@ -224,6 +225,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0

