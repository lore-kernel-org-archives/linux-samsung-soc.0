Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5DA19C546;
	Wed, 23 Oct 2024 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675088; cv=none; b=kn1FMr8C9zMCtV+4k5gAKHrPCR5Ki97IiRgWnzJKzwSrYuKz0KGCnvPDJnhJOokUmF5orenovXFsQ/b6gp5Gnvs7vk81BsqwfuOcJoQarO4B3Si3KMDZTT/ybmHVc5DSWecz1ePHEYTE3Sx77ztmj5tBSmSEWQbJ+Y/QsxJvWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675088; c=relaxed/simple;
	bh=tN0cqFzyLFUJ1rP82IUJqgeTyWJszaz7oPfAHimUN7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUZhKOu0qsfq8jOUp9W4m5zBqOin3oXVfg5Uy4n0LoPS2IixaFjvQACTk9D8PC337FZUSVOmonG/RPiPFUc0t5H3br8N98jEoNBmd9CWUgL3H1baFtVl/JTFWzZ9lv60Ymr8PGVS2Az2lHtZ5EiRa/1edXsgMhohTd4a5/9q+2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LW2jvs62; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LW2jvs62"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso1026749966b.1;
        Wed, 23 Oct 2024 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675085; x=1730279885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfSJ3goGyuRaHJXch2lqsHfgL1Ebv3D8AvFeN2iYsaQ=;
        b=LW2jvs62Rcg+Dmfe1YBjCgh7bUbiQxjMtEDJhb3tlBA4e9ML6X91LV+Huq812k57KW
         FupQmZWQ5E36xfPCATNllHoi45lNs1HPV5luOC4HSO1jC9pKI2OUXlDrxS9HIjWUcn6D
         HhSrn9E3gDIRO2avOy+F5uX+eitCizQENK4ItGyDLSTMs6F1Kea4jUAMQJ9eY2m/S22w
         XImgDns2ciYHXHjOtiEyDHJv4Jt732k/PtAIci4+B7GIyRktOO49fvJNDZ/86rNom0RQ
         IUhrPXFbs9YYdntm1BYRI9/2cBehUvj6v9l/gwjIIiNOZg3Yua+b/kOWpmFaIdMQ+h1I
         GQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675085; x=1730279885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfSJ3goGyuRaHJXch2lqsHfgL1Ebv3D8AvFeN2iYsaQ=;
        b=dK8rqVk8JrttDBbPxUHmOXfK0kpvx1CS0a//vnbw6aD9Mxg5bHz3wMG5YtgvxjQd8Q
         XA/bgy5DLvxAras1BpVzubpR8Fk85GTdvCAS90RCCOaxYGu2pinGngkzJBzMLtLhP1Zy
         ZoUEIWIAOt2nLCzD+Hx1BXLu3FcJOPlnZYdVFTRjgsdxA0tneyKlkZHImOfTtVz0n/wF
         a4NiavZmc/mdE8T5mWU812TgVZ7wZd8I9hHVoLWNEVLBohyd0SUGGJ4n131vUz/w9whU
         BMFPDFt2S7m3VNSGc8oxDkR0MVbqYETefuFTG+HkSGgp1d2tU8+RjlVGkHppsyq0G6FY
         wjRw==
X-Forwarded-Encrypted: i=1; AJvYcCW7rXeo/7kN/Em0TldpvBUaRtVlNGv5jk9juAB6vzhkDUCgVccFCiFcN/tXJjJ4+weYfgSnREjJLMEF@vger.kernel.org, AJvYcCWgQC0piyjMxakT5NgjXr/5lemu/mQ2iZLCfROPyxmcWPR/vuNoupHJrlzmhjr0awvTKmFZjL65hdNEVEvR@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDo/V7H/LzitsSkvJzx4I8lRtfVB4iTspDN+FRvtpQJ660CDb
	a01EHsrOmV1L0uLGM9FT/7nwu3AeBEKQqSotNy3PaY7+Q+7R9NAn
X-Google-Smtp-Source: AGHT+IGYWODJQDqAaPTqsDeOmTzV4/QsOyea2V6dUAxZoTfvJg9cVb3tOVnwjU1Btpto5hYmv1Rgog==
X-Received: by 2002:a17:907:97d6:b0:a9a:3fd8:9c95 with SMTP id a640c23a62f3a-a9abf92ccfdmr176955066b.47.1729675084716;
        Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:04 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: exynos8895: Add Multi Core Timer (MCT) node
Date: Wed, 23 Oct 2024 12:17:32 +0300
Message-ID: <20241023091734.538682-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCT has one global timer and 8 CPU local timers. The global timer
can generate 4 interrupts, and each local timer can generate an
interrupt making 12 interrupts in total.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 54037b0dc..e6c8a4966 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -169,6 +169,26 @@ cmu_peris: clock-controller@10010000 {
 			clock-names = "oscclk", "bus";
 		};
 
+		timer@10040000 {
+			compatible = "samsung,exynos8895-mct",
+				     "samsung,exynos4210-mct";
+			reg = <0x10040000 0x800>;
+			clocks = <&oscclk>, <&cmu_peris CLK_GOUT_PERIS_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		gic: interrupt-controller@10201000 {
 			compatible = "arm,gic-400";
 			reg = <0x10201000 0x1000>,
-- 
2.43.0

