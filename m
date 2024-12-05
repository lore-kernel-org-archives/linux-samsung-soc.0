Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887D226EF5
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421729; cv=none; b=JPEt+8krgViPj0akqBRxczdNAOJ0CH40TEaWD6Q3KeedDdJRm+MmKemqI3xyKZFc2d6hMSfDP9uj527Vq5V7baRQKEgYpzIZuahj5WB5254F/vxHXrJfJBw6f2mdyk3fEWxZfFPvgJum4JmHeDOmDaQocBq2njUEm2/zLN2/UfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421729; c=relaxed/simple;
	bh=nTCkQn59kD1+YTP/O+jZqWcGW57TZWMWdFPzGNuprc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDNOp6YRWYBXsRFqVrOJCPaAugBkTagmY8J1Y1qv4RoaK6oA7ib1mCNgh5UsOEoUMxg6+5kUUQgEHevmOJlKFd0PS1xw177SdY9Bml0FAtWKrCu1U76KSVcD9hfpY4LD3s2Xtpy/t7K2zpNa6xU663R/nCvobixkLhvI646qwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Us+U91RC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Us+U91RC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a752140eso8624635e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 10:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421726; x=1734026526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPhM//wJrXG51ke59zvjjRItTECJ1az2JzHOCc8Yads=;
        b=Us+U91RC/tIYwFlVSiEVCkjLupmul78ifiCAt0lVxnisEPHCzyWNFjQRO+u/IJ1g17
         2w0X2AHDSJMBiDkBUl+HPqAFfJ3XTULUzcjfmu+ygxQFMPs5nbFxuDV0ay9O9hIczmnZ
         WdGqAdR6BIXHPcpvA4WcMsWuQhW0y56BQJev0MMmW2POTeZlmSwoIlWN3xmGoIEHq+0F
         c/56ckhI9b1f+CZoafsGhzzNrAASQ1PJlIb7mkIL/7Zynlgs0BsMmEnewQ2eDXg4nrzI
         aXEbgV7ecCayeulfXP//Ygc+5sC2teoIxt0u7mMS+fUGkjwfv6dSCR0SkLrxesMTEgye
         sAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421726; x=1734026526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPhM//wJrXG51ke59zvjjRItTECJ1az2JzHOCc8Yads=;
        b=Mje7iZz+LR4cvRB5seoqmzyWPyKBWo19hamdsaBvJBTjOOjkEt3dUsl6tJAmnwwC4T
         vRdF3xDCCig1mfDHzkWMW/wUufrFMpkVOlPzj5p4PBz87+P4NO6VeWO0FS0Wa9cBTImK
         lF/egSkY8gwAcQrvp+2q4CVi4yHrMt0pJpFY9SbKNoE7jvdDndaf5HkCPrzBl8QNP0Ve
         t/EyjFfmDiBJcPqN0rURZPWSi0rZdA18cesr/KRf/VkYIB2sJf2gF7OVs/4Wila+lRkj
         yj8vxh0e+aU+/fuOV26QCQGNsrYSJP7ff0FkL8fDTTRIGA2wXuAZ2SXonDu6ivdYbWgD
         B9Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfhuPEJApF01KVKRNpx2zP7NeKFW8esNx0VvCSdrzXEW2JzKA6FoiSAZVO7Xi1ru9uXkm6uuUBzNU1aMuNbEtxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVidOldIofaMHfi0OjDFkyrEb27kac2N656AFDrvvldAo7fZEg
	M5nl7LD2O6TMAeCsv6BhJuIg/eA0LAbxsfloT0m4tRL/HvRFmts+H33fmgE15rU=
X-Gm-Gg: ASbGncua/e/Hn6C8tpccHdmfxJtuS8bkm/xVA2XCL1XX4gSGDeG4Z5Wpn9hXgA+fTBN
	rNLUeQw57izoPkzOhTQVdHSJVP1F3s0P8CAuKF1pqmwOiRddACjwSKYKy7IfPrQTeowsL5O8tGp
	Kw7RVvCnMIXSp6a7o5WePPXRLYdfhYi1/NcFRccG1gjzecsPhI3RwnQS8MVS14qPXm9y9tjm4kF
	Ycl/cns0Mdkzk0otLcx7CdOQUZ+t75u02XOy4HUVNkHZqEOe6QcgN9enQmoiSjcVrJpXqyRQJWL
	VVwuoVaVMxBPCkxCNqpoEFbCKoU9L7R0
X-Google-Smtp-Source: AGHT+IHxrmKnYhkbCeS29d3k6ksOUL+fr3q/QtXJQ6fFRSknvcyUZjZ0xuVckzybtdhQNCwqXZo+yA==
X-Received: by 2002:a05:600c:4fd6:b0:434:a9a8:ad1d with SMTP id 5b1f17b1804b1-434ddea64a2mr2257205e9.7.1733421725765;
        Thu, 05 Dec 2024 10:02:05 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:05 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
Date: Thu,  5 Dec 2024 18:01:59 +0000
Message-ID: <20241205180200.203146-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACPM protocol node. ACPM protocol provides interface for all
the client drivers making use of the features offered by the
Active Power Management (APM) module.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 0970f6fc1ef5..ed9815194f65 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,29 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: acpm_ipc {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox 0
+				  &ap2apm_mailbox 1
+				  &ap2apm_mailbox 2
+				  &ap2apm_mailbox 3
+				  &ap2apm_mailbox 4
+				  &ap2apm_mailbox 5
+				  &ap2apm_mailbox 6
+				  &ap2apm_mailbox 7
+				  &ap2apm_mailbox 8
+				  &ap2apm_mailbox 9
+				  &ap2apm_mailbox 10
+				  &ap2apm_mailbox 11
+				  &ap2apm_mailbox 12
+				  &ap2apm_mailbox 13
+				  &ap2apm_mailbox 14>;
+			shmem = <&apm_sram>;
+			initdata-base = <0xa000>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.47.0.338.g60cca15819-goog

