Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555C22DF8F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Feb 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847304; cv=none; b=jPvERWMnEKIBwaM960AUosj72I/ZFp2cW8bOwkbOcj65couZ7LxAs+MEuCvtQp49blVEWBsdxIHVE+tUE//36NM4jhV2b1bTTK0m/8rHD4ckNNvfYcbFXGVDiGSeu8jiObwx/XRVKkk9Qf1XUh2imveteclpwtuPnW2olYS5loo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847304; c=relaxed/simple;
	bh=YTG9xptoyrfZ+iyT/y9FYepYTHdoDzEqJMV6IaGD2nA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZpT+75YJG/h/Ew/GFUKalBWaz8trDKJaCkRhzKqqoCHjUcdHqS3abDBMYfFrD7aM4eNR0w0MOCy7FOLNcwWiY6lZG2f8FHTgeuw/1qgn12rPoQQpS4gG4RChfK80FOYdI7n4BlN9/kjox0udad+VIIeXBUjKmS/xk0rnO+XTd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOS1BBfY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOS1BBfY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab744d5e567so164516466b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847301; x=1739452101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=cOS1BBfYN//KiGLWBufrTnguRCX3wZkZRsbaqke/HyD21ibt0gziHYBRPnjuMUSHDC
         dpbySd3bexiUIGUr69zRuY1tlOGRDVLlYn24C8bsCvBB7R67pZ8VlN+vA8dXFc+Th5h8
         8LPzwTxZQGG/tSgCWMnCKyzWSd027utxJCvxpRERDa6H4vzHtNniDXZ+Mbwb7Ht319zr
         AP9EnoNLuzLd3bweuTW9vVMvQdNCVhBOFncbZvb7e3wxmoN4nLspYyeUNfin/tWulhg1
         BfzAmEGYibBSB7uZHDCwzBoooxIdJ2UJPsKqxi0upN1wTFN2oTF9RGUvYytfYM+vCYC1
         9QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847301; x=1739452101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2REuoysCPKRak0tj4nVzCn8fUcKqMMqOYeUqp9AjQG0=;
        b=q/MVisAZBtMybH9Cvb+qnj4bJht3YjVmWa7BJWhQgKW90z7s7j4b7ft9xirnva3Uid
         hPRLnmAN3TZ4yCHGCoEDs0VUypInP3ej4FVbwzTz4ZSyjydVBDDttL1XdxFC400tb3W5
         dfimis47azBKtaUMg6+oKO7i28RH8eON1aFyZT5fHV0tVUwWg/PS6YAYkjgjooo0ckqm
         f8ubeQtgpDJM2RQOLC20pH6CKwmwqp3t0nYmI3AlU+Rr0DqE1XE5jDPuIbFK5UamNSoI
         o7KcyaE4UZHr4gm1gTB5fEipFK/H1JkVfQmPGaSwBszcKQH8qlrCW4leDT2vJV8175d8
         udSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKhd0nlH8fqWPI/zgnuSL6rb7QgWmh3HXf38vL2YJBE6dvnSDQAPHMMrchInehoHd1OOrCDw9rpzqnjgDtuNKGWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn6z4NpT7Xnm2QBpE9gIRoEpFyhq3c7Vq2zfd6uWjF/aQX62Xv
	Fjaqu7keCV1LVDpSd7FWcWPjYN5grWoErucCE0AGdXCVGq3X2aqJUI6qImdhpeg=
X-Gm-Gg: ASbGncu26X4g4oVauq0yclMoXZU0R++TLmDN9C5/W122zSIQBXwiGJ0WgvWMzya6+/i
	c0TcfMtHZxDYll7vaBKji4eXltvpSjQjuOGTPEBuUHWVo6QT6KAgeUhDgbgOJeXeUFOAwT094Ac
	gFT9NCSWOiggpkUIEpZYselpr97JPl+jZ7KDqqTk8JaxTkpcP3c+cQ3VcXE8Qi6U1xQIvZnvJkX
	fieYE7dBwFs3/l2YQbkCu9u53J/kYPG4uq1BhRmFN30gvSX15woRYaDTvFq9wwRe5LsjhW32KWQ
	+egJMj7WmshaoRhaCxnTmjUqUeF7t+PyjWXWAht/qELN9nLprPzQSx5NWm4M7nSXOis2QQH83ZI
	=
X-Google-Smtp-Source: AGHT+IF1BlIvboKtAcfd9MgfY7h0B//QZpwtD6hvZuGWR6NA7xoR+qRJFpfzOckYvT3dhmaj0oJQoA==
X-Received: by 2002:a17:907:97d3:b0:ab3:47cb:5327 with SMTP id a640c23a62f3a-ab76e84c45cmr374142766b.5.1738847300776;
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:19 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: align reboot and poweroff
 writes with downstream
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-2-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

For power off, downstream only clears bit 8 and leaves all other bits
untouched, whereas this here ends up setting bit 8 and clearing all
others, due to how sysconf-poweroff parses the DT.

For reboot, downstream writes 0x00000002 whereas this here ends up
setting bit 1 only and leaving all others untouched.

I noticed this discrepancy while debugging some reboot related
differences between up- and downstream and it's useful to align the
behaviour here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e78dcd506a5c..4f45bfeb33c0 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1401,13 +1401,13 @@ pmu_system_controller: system-controller@17460000 {
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
-				mask = <0x100>; /* reset value */
+				mask = <0x00000100>;
+				value = <0x0>;
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
-				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */
 			};
 		};

-- 
2.48.1.362.g079036d154-goog

