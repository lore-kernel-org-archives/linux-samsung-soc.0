Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6EA363090
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820598; cv=none; b=SKU2N/in5mN9wZyBMr04tgIGKmpyDeaxEYnX6dw/g0lw4yGCs9D0yXCwUgNVRsOnzHa8be2hTKTcSsOcQgKfVPNtMpve6QyHAx76D9J74mZtojYM6RYZ+SCHvfuiwrlTJQoJLiqxcx2Dat1Z2NZsvR18Qthlkag6N38ZhJGENvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820598; c=relaxed/simple;
	bh=jwiBqgpS72CTHm9lXAG2OLJMZUi4KFI68Q4tUffnH/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uzZG06V3+LEe7hAl4MO5jUEg4sQ90lNKt2RWWg57dv37tqTqBHyOd2CEn8NFugTWEFn/bi7RXVI/hBFx0ASPPP0nBw+WuG0MDG0VXQnA3LaRvlcOHfcKQXCnCRFXkdTPwIFKqzni4JqOcWoHvyPSK72yx6/rjMe+woPQxHV8EAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkQjpw0P; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkQjpw0P"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so5826665e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820594; x=1785425394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=tkQjpw0P7lyU9bNmNHmDI20/+bNOME+KN7wW1i2eVaFDXe+ps7DAvH+7x1w6A31Hbo
         Ug/qS6eQCY73P3UIp25YjLOMdsmkRqMfpuHRh0kLs4AiFZ/1XgJbTISL5C4IC6jEP8Vv
         yNPp5cfT/f769aPZ8QAXDFF/Xe7WdIGp2YhN+dUncNGyk/PKJgoBTQ5A9Hj/JrZxaTY/
         YvGS+tpNB/r6fv89Jox8k+dYjqEsXhODRxXO0HOF9Do28gErpKnhHhCXMA2VfLqkMeqD
         4hwNGyAmoziO0K2Fx8iGBMN579vmGtA+kWyzk9A+6aWQ6tQEJ80M0kpSTSI8wEEW9YU3
         t3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820594; x=1785425394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvvA47yK9RFkS+3kJ0N4nXWgy3089ah7H4jN9EcLvHQ=;
        b=L8DA9+gyFlLL8oy/oAZKJXZyIPRvGvGdfrMjAjwuUf4yxS13ZBcOnF9VQhIQ7sfAFL
         akq16WJYd+IbZP3D6Iy607QnA6GfIF4KRxUoqg9EQWki2DPd3235UeqTdtULFiNokvHB
         W1ku8phxM6VfdJfafCT+pkKeHxd9v4FXXzWExdk8T9ojsgl/z1sk74ShZLIOvmGw188K
         OYBqklYwYo/sUs/FMeXYAQhs9kKCeGeb4YBTyyPVEI5WPV4PxAzMh8lnZp0aHeGJzHMd
         7Lz9iDZq6ohBQF4pQQIKOXmwoQpM2Ehktxfi2lzoG+AU7L3v6NOeeqZcoptgtk0jOKqs
         RIhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxG7to5HF94UvZyU69H988f7P0h4dhmfY/dJnpS4lMDEb+d2tbqK0S2Ap4nUzRp3c6WKj5bjIr1AvQblSRUsdXxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznewE4YUnnvBIPjUVi9JMSu5w2EBo5xx3gLVQyUDzC3o5JKP4B
	efXtLD3Dv2TrTIToBsx8dMmQnlphIldAOkbpa/SpDM2JmtMzVR0Efh7oJw7ZRFX+oO8=
X-Gm-Gg: AR+sD12ZkMhf6rE4asfudyE1oRzM6BuX2PKfTrDxFnXXuR+voJ4ZWT7RjhO0FYGmgmx
	426ZjsTvg+3yIEPRqKKHZmowQiZM6xoKrGW92G6QZHxiD4m4xnzk6nWgpomKnjR3I/1jKGxr0J+
	4uy0zjYzbqlWM4j3YnjLIvfqhpnEOmSU1cGAuuxfEANduIDnxH6+46oKBj2fMpjCYEPi4UG7vnW
	9CX66wIDihj3eDaozMhk9/tcLkSMhyntdCnSbcSPZQLVmA6YnI4vP0kgzkJTeivTKbGgjQ9X8vy
	pLnQJuPRLuLl5JM3kPqXmouqloG0r3WkeUBQjAZ7IddHthecQmw81cynC+xiGHuRZB8IqeNSxK2
	oZYNYRtX/kXOJylEmDgE5IQXhWfnBnfl29YJgScn/9/jFC7gk7+v+sykI15F7e7kaHVbX0c8DQx
	Rl3ap7QXYFJD+5wHTLDQaS2upIYQoXrZqNtpuo0dq9ZKEI/7eObuen56IgV2lKfHh+3g==
X-Received: by 2002:a05:600c:654b:b0:495:5375:2510 with SMTP id 5b1f17b1804b1-49573cff63dmr26167785e9.24.1784820594260;
        Thu, 23 Jul 2026 08:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 23 Jul 2026 16:29:47 +0100
Subject: [PATCH v2 2/2] arm64: dts: exynos850: Add acpm SRAM node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-exynos850_sram-v2-2-c94968e52f42@linaro.org>
References: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
In-Reply-To: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information and configuration data. Add the SRAM node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..9a8d92aae9a8 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -917,6 +917,11 @@ spi_2: spi@11d20000 {
 			};
 		};
 	};
+
+	apm_sram: sram@2039000 {
+		compatible = "samsung,exynos850-acpm-sram";
+		reg = <0x0 0x2039000 0x40000>;
+	};
 };
 
 #include "exynos850-pinctrl.dtsi"

-- 
2.51.0

