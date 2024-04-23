Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE1142651
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903590; cv=none; b=DNnqDeEaVJ0kJAFn4yGmw8GE+Nr/6WH+7XQIe7SZFJZaI2y51BPrU3EmY2+KKUQAc8MijrQZjoZIuvYLGJpmKaHwptiTWTYjE9scVoGtbKUy94Xd+jmcrtRs7gmSUDNIhlMjGLRzW1jWTnUVnEC7Izs8zN9sjyXAZDbbGKf6z0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903590; c=relaxed/simple;
	bh=O9JbCQMTsEdc3RpE8YdCk//UJvo94xhIq8ZtAtz4OjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KysDJJZ5h+xe1UvYzfvgIfa6BLdrob3ne0STu1R+gkwBqg6BNdb0t5MELTWM0JJ+2E/XFGgfsP+D54D+5oYd8xemV5RqjdNjms6EEQZ0RVM+I3YToZ6Jl2jxc0Ol8UnrFX7dnTDcUGw0woY+ryQFkNz4HvZmqfoukR0J+DW53wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKZsi91W; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKZsi91W"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-345522f7c32so2909632f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713903587; x=1714508387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4vOKvRCallk5kGR2Wbh/Tn3Hl0el0YNKiGA9haFVMA=;
        b=pKZsi91WahOATcShIiLRcHGwCci1BbOrkGYAufPHUTR7oNzmUOFKcKticDQ+nh4fds
         h+6G0FcdyFAeBWUQXhkx6+U4B5sEV2JueVpkTHtDYpFDmkTepdmAVglEShWb5K2Q/wFc
         VNwmwXHoy+/wXZ1ezD4Myq/sdo6TUaQGpo46JKoLqo+CSxZHRiMYEIGZp5Mevtgw1CH1
         DOa4QP1rzoODvjg8O0o0nxEDuLROF6hh1GIXoO4IZrrgreN9e7KD1TkTfc4m45FHEZuP
         rb5l7ZpG59kuEwLh5ngUjLpgaCKfhEyAzML1pqa30JQ7aCqdryLFmQHDNu7OrSDKGW4H
         j0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903587; x=1714508387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4vOKvRCallk5kGR2Wbh/Tn3Hl0el0YNKiGA9haFVMA=;
        b=N72CYFTBagwEUajZ2VH2G3F6UOlnpakuQoF4wYwq70qPC4COkSowc4ttz6I+4zFhe3
         oB3COIKAJm4N0qhRv/gvf/ACxrRXT5yKVWiUkjo+QtqJdp78b4hIT8NFRwenS+28CT2+
         lGKMoSkT2JsAKpgQ2pNgAxdj6dyU3AUWYH45cbREnhPz/ydI8JYk4SIXXxJeplxSGDWd
         1cYoAJ8wNXBbHhl5WWYtctOieW8a8tBjqbLWCREHrkmpFom7duOdQKRQsd2nWSkI8hA5
         W5vXyO9FDY7DHEGkm5mm5ccyhFGvqzmtwARDFrTKf+jdpWV3+VLnSNnmv++PMz67N6x9
         Ks9A==
X-Forwarded-Encrypted: i=1; AJvYcCWQSxM2NU3Nh1IKpcQh2aKAL/QFchvnfB8ZvssxGBlz8mYVFECQQRFcYDNiB2F4d2Bcz8WoLMOq8gk7/ZxGKbiT5Yn+doJPMelGnFMS05YKxoQ=
X-Gm-Message-State: AOJu0YyN//W9ikuflPiRC39hdc9Qlbd1f0VO40McoJ7GixrkIhIYuwiz
	bMWJP7xXqNgGaiOKa9hWKwQhv7JHbSHo7dzCTPAnSJU/hz7tUtBa/v203jTCMBs=
X-Google-Smtp-Source: AGHT+IFY+ITgeee3a+C5KSYNk4HM3XF4Psq3axU8IwvLxAQYs6W6bvgmAlGVlqcAphnYYBlae8wbfQ==
X-Received: by 2002:adf:cc85:0:b0:34a:75f1:c36c with SMTP id p5-20020adfcc85000000b0034a75f1c36cmr179194wrj.61.1713903587154;
        Tue, 23 Apr 2024 13:19:47 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709061e4700b00a52244ab819sm7552431ejj.170.2024.04.23.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:19:46 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 21:19:46 +0100
Subject: [PATCH 2/2] usb: dwc3: exynos: add support for Google Tensor gs101
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-dwc3-gs101-v1-2-2f331f88203f@linaro.org>
References: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org>
In-Reply-To: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The Exynos-based Google Tensor gs101 SoC has a DWC3 compatible USB
controller and can reuse the existing Exynos glue. Add the
google,gs101-dwusb3 compatible and associated driver data. Four clocks
are required for USB for this SoC:
    * bus clock
    * suspend clock
    * Link interface AXI clock
    * Link interface APB clock

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 3427522a7c6a..9a6e988d165a 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -169,6 +169,12 @@ static const struct dwc3_exynos_driverdata exynos850_drvdata = {
 	.suspend_clk_idx = -1,
 };
 
+static const struct dwc3_exynos_driverdata gs101_drvdata = {
+	.clk_names = { "bus_early", "susp_clk", "link_aclk", "link_pclk" },
+	.num_clks = 4,
+	.suspend_clk_idx = 1,
+};
+
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
 		.compatible = "samsung,exynos5250-dwusb3",
@@ -182,6 +188,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,
+	}, {
+		.compatible = "google,gs101-dwusb3",
+		.data = &gs101_drvdata,
 	}, {
 	}
 };

-- 
2.44.0.769.g3c40516874-goog

