Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6004D2ED5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026776; cv=none; b=e+eWdi8OPjy8jemvXpt9XthrOcr+wB2pozpqnHWgljiIv69xiN76ojshdHHZg53S0bkzJmoY6PR1008OmJQlIfEvv3Qwsigi8HvmwvoYkTr2zpXE+RIgr1QI/8Vl3KvJV7lvUVo9PQ+E3i53DZ4DxGogsi7sypVAXCIbxJKNrm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026776; c=relaxed/simple;
	bh=DNx2DsjINuyPqrUb+Ejo7Pkkik27ZEapCFCzu2jeQ40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkdV0hI+K9wJ37+tLjxRbKizte2dcc1ezeBjYFLONC8e1KJI3vdkTuzW+GuzgZX0pBaY7dJRk2ogEU9GLshLJ+ytJ6aoQtsONj9VDDQZkwWmwXyQCO/Mth4rshUvmATdsNCnDUOnS/5w+u0JEEEhPh54b13g0WF72cfoff8OXLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIlWf/X3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIlWf/X3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b64c8311so65353915e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026773; x=1781631573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=nIlWf/X3uoEU5xMFPrOwXxaLTZc5M2MjULKvL1iDqc6ZZzboxDrvBufEx5jwm+eOsj
         qB/BuI8wxkoLvtC4RsOwhYmAxSaVBDWN+dtsUKjWh4fsFREk0ymlkazwpG6YyPB0Tb2N
         pyO/z0Kc5i5noYrZJAt9K1rAWJuyCoLr2nx9pZqC2YHIDv5z5QRTXvIAfkAbKzSVwyvz
         DUwggOL3v3SKvlXXc4w9Bs1NP2HwTNm+RCT/QU72MxYlOhgRDpQuLbvcEH5y2TRCqQCf
         m7NdZqFLcghQHxzawhNyO3hYgOX1GTDtKanMfHFp1teLHV++ZwiyZ7q3yV7+GcQvi0oQ
         vZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026773; x=1781631573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzGCiTeCStiKkPzefQJeYM5JOvHm2x+evqxUb+M6NvM=;
        b=dJWrM4kpImaaJLD+DPfRPcvzPgL240zvjXeZjGjH8pvUFpO++9kZrv0NXbodiydba2
         lr5yDCrPPhbXVtCaHEtO3hkZPlljOLfBNPGvRPdQO6HYgDlCutgB1HnJ88VklVbQ7Z/E
         VFSTRaMV8WqqJ+rrINOlKFCj+PJPIY6vvv0lF64y+DxPSOXXVRb8KaBoTR6w/hBgWfBR
         1dqZ85ku2wci0podIAj+kWB47UqrMkbgS4byBudr1MTN+xIANndt9euDX0j6/hGnOzTo
         RJZ8UnWrVopUXvQLocpGAtvsVh7LlGkx8GTWPs+7hmSRHuFPDKTOgyAhyD4jGKz7/rhH
         p+3A==
X-Gm-Message-State: AOJu0YzudPW9/vGjSI2+AHVBBdjb4MXpCwsR9CIwbf7/T6IFMSyddyYc
	Ha5f9V0ZNwwbW1WjYaZFoeN+tqxOs8bl4L2jfF1oT4pGBC72QaTzDczCFIDPXhfhVaWl/Vdo/Yb
	+QHsIGxE=
X-Gm-Gg: Acq92OHs8WUA54yn/aR/A/3x3P4gd8DL5RUrAR+RWT/cXWqXEW2uNTrMK6D44j+3DA9
	U7KSntCZFkUJB7E55ENxncZ4CxU07X391dPJ/52jGBfMx8iFK4poo9fVvxmCDZhdP1OHGyhAq39
	BtOthFal1LYpnsqOw1DCTL+Fh3B5XsMFhf+ewS9jeNOsouJLLHbWcYSbPa1YUZwtSqrDeYjJ3L6
	QABuX/XKDVS9OXlSt7uVGnxSPltYkF0ZM6apEwsRXuEF0XeiF7xaCxhjCcmgQhrVyHTUY7Hf8uS
	Y1jW/AgJdttV7y87WVqgmgwRC3V4cqWyp3TaEcY3uMMpoDmB6QWZ70saABfetfP6zuhOC38bil+
	nMAzxK0Gb1s6hB7SQ5z8BIIpbZDYk4kYUXBz6gseEsRQCII0Jb2/aZVWX9ex5Ag2CN6EREox4JM
	Bfy3kz9w6HwVC7i2Y7k/5E5VFPG8pBTtDeIdQs5a7JRL//81pjxqKBB134eb+O+gyMR7ZqBhI5R
	aB7qGAnSc3NSINn3ExdeW9XaP6wKPtrbP/CmA==
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr328438815e9.8.1781026773036;
        Tue, 09 Jun 2026 10:39:33 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:32 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Jun 2026 18:39:24 +0100
Subject: [PATCH v5 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-exynos850-cpuhotplug-v5-2-8422cf80d43b@linaro.org>
References: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
In-Reply-To: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
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
index 76ce7e98c10f..6550c3736a3b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -182,6 +182,7 @@ allOf:
           contains:
             enum:
               - google,gs101-pmu
+              - samsung,exynos850-pmu
     then:
       required:
         - google,pmu-intr-gen-syscon

-- 
2.51.0

