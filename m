Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7B1A0BF1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727195; cv=none; b=hQ8apJ6OoP7Azi0SIQKnJ74WcbQwiIleU/lrGDmLW690g26lhtkEYN2A6gfm4WrqDEa2WWpq+Y1vbwT/8rnb8Fjfc4zuA70y/CSiwvBfn3Mq3fWolSZUEAFfqoazib9rdY1xBwBU6tNmrsSbt71N8j6LNa2gM9LY7c1Ovsu06Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727195; c=relaxed/simple;
	bh=rYZ6f8ke4/CgAKpv47zNC1/8drck6P5HXuC4yvBfoRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3Z4ZFWljh6wciLC0LvJmjD2GFUpPlj31W1J+pSYWlexdzm4UGAfBEdER1pidleUQ/X+lF4L1cb+/X3GY2CgwH1NGEHxHJj8ArOXo9xis5tTcwqAByoThOWVqPF2B38lQ+uT5TwT6v1cqZNJTN2LoqdGzTBhczAwycdG7VzSc/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVMiWs+n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVMiWs+n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so30347005e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790727192; x=1791331992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=oVMiWs+ny7QHSYQ3rAgqrvUaO7wGDex8E7nTySllWBT1FDp8sypk3gk6wyiE3h93Bw
         14xtmhlxR92hn8nZ/eqIifUQ/VJYO5ZcQcHqiaRacMF5lwNAhRaE26euhIQyR7gSC6re
         ekQfT45dRks9GxfnJlKB/vta+LWuGV3jDeiDZrOEP24B8LqrNVea003TLzeT9MeToZNT
         p5yNmBVfOdcIIQUH1ITDRsntjRux7pg++szmmK+bcya5B0ythJj/HDZYxt0gE9nCq8eL
         MgO2OdxOib5VXkqw12zO7RvAAxAFPHLuLXNHK+fKKlon6H0g8O0yIM6Osi+1VPwEdYxN
         VBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727192; x=1791331992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbNhV3sGP6oWXmNCm4cU9gjHDsysd2+OUMzLU54oMEk=;
        b=T4E+EFTO3cC4oFxXGuJGi34cs1qKS9HGoQr8xwfDZyUzuv5BLSz7PBHytvO+jgHX7f
         +H5eUrfXSEgVTqHPidVMeMlnXhCc/eKpG/purJKfD91bDgCTPzn/LCoQetmsytDz4S5Q
         l3L/3Y+LiQ0kp44NGDPeo/eLi5pmpNxPT2QDy7wWDUL4qxaO/6aKbxrfMjmNPAkqoQFq
         v044wLEcg9H5HuXA65zXWVJzhYi0w8JifTZg/NXozS1JEdxTXVpeEfRUMfQbEQmLRAzA
         gODHhiT8wLyzKtZf6GRJ9BmHpcm7q9oXsomN522z0vTkjRDu2x8/8b6YyxItV9eFUKvL
         uEcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXUyOCvXb15EK0Z4cXJ2mwl3um7IfVAiXlMdosVrbxJNbVjK2qddYYXA2HNft99b+Xn1la8zchU+gfjOUomUK3Ug==@vger.kernel.org
X-Gm-Message-State: AFuF++m4jC/xMVbh9G+KsphmbDx70bJl8YnjPFEJ4+RczQDqWxHY+q1L
	iBJOxKeK8Tu5XGNO8t3bTpdyzaVaqQXyD9OpZ0untbGlP8ZkeSqnKHO6H04bXjuxRAo=
X-Gm-Gg: AYBFou1FCMb2/o4+Jr3Hec7VuzNHewj9C41azWROL33sBWCgYC/CN6+PWkAAmXDmkNn
	OSFagJ+sWMflQkqw9hMKOkMBJUG0oiyrs+UgJJ8G0HUY5QeUM5zzKoKnMtEKa1PixgslPAQqOpK
	peyuAJW9yq38vmPt5cvbTBMXfq5JT12Q1OMI46X7eIGLAFMegyRkmWODyGP8Fyx5NuEslxsb9kF
	/V2iZtH+yxE4DKEtON6sLzG/jfcZ2z7K28MYJSOOKbdLbN7B+TjNz+Ys5hFsYuVtR1VqEC2cWyL
	EcMLXxHG1dt7Kp1nmnQdbafx+BtAXD8sX5/Ej+m6KbTrPanwmK1zl03jcEIl0lJalUARYYWIJNw
	nTbGd3p3sXIQlVmkksaTAV4DlW22/JYTyVNPuvcLkYN9lvOFEQxNAw/Z9SAzFdfaJowJLONmbvP
	B5/On62/U7nX+Op+DT6xB2jPeMfGt/L/syIOgqG6vVu5HX+BLAmUgQk918+Ef5FT23BIECQbKHw
	riuZ9BlOTFNbkpN1gtb8mdd9a59u6mPZwxsX5r5rAJCXyzspVSPnhSWrXhlrg==
X-Received: by 2002:a05:600c:8b0e:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a015028f1emr11800335e9.19.1790727191701;
        Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a89ffasm6320635e9.1.2026.09.29.17.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:13:11 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 30 Sep 2026 01:12:57 +0100
Subject: [PATCH v7 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-exynos850-cpuhotplug-v7-2-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
property for the 'samsung,exynos850-pmu' compatible so the driver can
obtain the necessary syscon regmap.

The Exynos850 PMU relies on a separate system controller block to handle
interrupts generation, similar to the hardware design of the GS101
SoC. To ensure the hardware is correctly described, this syscon phandle
must be explicitly provided.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 5bd39876e3b3..7d58976dccc4 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -196,6 +196,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       properties:
         reboot-mode:

-- 
2.51.0

