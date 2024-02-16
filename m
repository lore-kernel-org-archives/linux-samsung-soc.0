Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B878F12C7F0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708092305; cv=none; b=ONxzFB7T+kqU5vIQ2ZWOMAyhtvO5RX9910NttFObq99ksZ2YPLnH6YyFm9uH5hew+S1cwP1g37vgS1FFXKiA9Acj8u9EDH7BTmRyq4RRNbO6JDpbfctn5s7Lf+4MqDyQCYnHDYj2MgBcmZL98z86IUuqv7VxXEw5ZVwdAvIiQSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708092305; c=relaxed/simple;
	bh=S9ObBQzYVuHAYhxgjzcEipyH1kHqp28U2gCU0ebksac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRi8Z3BFbgTX0r9E4A7CFWghyzDEkbcIboOGMYXlwy5sgAZrnfOnc04DA6pl2xXqGLbAQ/RVj6hRzK0GpKXPnEhjvke6ugmOOGBrHGlOcmBXhdj2LcdNh8E6PO+s7QVr/reVhmZSjdK0tV9+3z2oq2AVx6KRe2RM7kEQjNBZ7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihkqir4E; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihkqir4E"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d0c7e6b240so28063761fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708092302; x=1708697102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v2msNXgl5RHuPphj5KBMCkDajVznlUfP/afxgplpAs=;
        b=ihkqir4EE6LrbjtNcLzGe8tVPa+DL8XkHK+nkWOni/JWcdzvhhWazNqoqJWDXZuLSR
         UVTEVP5DcMaetAYRg/0JwmcxTxs7By2kuLRoGbsb2V8FBsrwCYkTKVrT/VhWFL9kVlZh
         xZXV+0CaK4oH9tcWk3cN6aWftodpBq14Xo/XBjm2fVAF/GQbiZG/0Kex2qYKhcj1K5C9
         YzVOcmS9kXD8krnABm1UxdyT9fO38SiFadHQeQ1rt1jGDADgURLjCPz8zA1WT5kZ9pZB
         ycREtgsgxaA1PytzPnEoO1RGP6HbuGtGqRBJT5X4A+xvhu0hV2L6zQdUTLBAlXdq2Zsh
         urKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092302; x=1708697102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/v2msNXgl5RHuPphj5KBMCkDajVznlUfP/afxgplpAs=;
        b=gh7kuBupeGGsaSuDKIjpBrZ/8eRBOMxeP7lqlLGRHUMDIjM67bXtnYCILBQ1bROj/U
         CvdXEE6gP/80lpHK1yOXN3rZY/SdF5g62UyQl/BOuiA9igS9kWUEdjWXQsh4niESTFHK
         G4AUc6xTGl9/uXMAhJVt9AWya/R93gh5787q6MMjE1I2S3xw1PA3hC8L+H9Imqmt/1rQ
         IHxgyJ+IkUwJ64qzCRvIJvoaexcLd4+tTLapGjqZgIatourtSdjz5SR/hM3MJyXlWwyF
         g8kVDH5W7mgg2qLWq98qIYUoXthqj8W6si2KTU0IIRtwpQhPaV0iRMBzcubVu77C6uqG
         GgZg==
X-Forwarded-Encrypted: i=1; AJvYcCVpKj35NlAOTVhCQw/N5lrNjXCUf8e7Jm90sRN0ox2qPwi7DJh/wkQQTvyyJK1jMWpl22vqBkC7+Irm2nhZKQDTPJGlNSo+f5URNCn3eoaU3cc=
X-Gm-Message-State: AOJu0YxO8h7bY00g9PyCJgrNAVVMVByvekljCqAEVWGTnbOaqM6XNUD1
	ShNXT+yIPGNkgOjTpqeRqYpNF37RBU5TsZvgBqDbO7wd5O1F8TpDJk8gIGobH40=
X-Google-Smtp-Source: AGHT+IHLhKN55xXNcr4Qf+H/L/Y6F/cf4HESGkjS3taK4mPtI0tOKK3/xuOIFtwCp9VREBhceA/Qog==
X-Received: by 2002:a05:651c:2116:b0:2d1:1cc8:6ea5 with SMTP id a22-20020a05651c211600b002d11cc86ea5mr4073121ljq.5.1708092301998;
        Fri, 16 Feb 2024 06:05:01 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id az5-20020a05600c600500b0040e4733aecbsm2516628wmb.15.2024.02.16.06.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:05:00 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 7/7] ARM: dts: samsung: s5pv210: specify the SPI FIFO depth
Date: Fri, 16 Feb 2024 14:04:49 +0000
Message-ID: <20240216140449.2564625-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
References: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up to now the SPI alias was used as an index into an array defined in
the SPI driver to determine the SPI FIFO depth. Drop the dependency on
the SPI alias and specify the SPI FIFO depth directly into the SPI node.

The SPI nodes defined in s5pv210.dtsi are not enabled in any board file.
No SPI aliases are defined, thus choose the FIFO depth using common
sense: index 0 of the array for spi0, and index 1 for spi1.
No functional change expected.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/s5pv210.dtsi b/arch/arm/boot/dts/samsung/s5pv210.dtsi
index ed560c9a3aa1..3eba870db73f 100644
--- a/arch/arm/boot/dts/samsung/s5pv210.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210.dtsi
@@ -161,6 +161,7 @@ spi0: spi@e1300000 {
 			pinctrl-0 = <&spi0_bus>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -177,6 +178,7 @@ spi1: spi@e1400000 {
 			pinctrl-0 = <&spi1_bus>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			fifo-depth = <64>;
 			status = "disabled";
 		};
 
-- 
2.44.0.rc0.258.g7320e95886-goog

