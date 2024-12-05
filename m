Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEFD225786
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733421728; cv=none; b=p+tVBNi85meTD3VbumDo6URpbGnH0B/r271EHf6X+x40pNTle7AjUkKh3OzzcYPSchb6YLao4aF82iQ6B53XCRq6XUGrwxqlzmx9HQ+86lFnddGEaDWlmkwZFsPBnZXBMHwgSOGXOIH5vqyADR9DouWQA9njUjqckYw7oeJH6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733421728; c=relaxed/simple;
	bh=dlMuW7aHH3sXo8GJQzvMEdKqOSxun+0YrH0hUFqmXK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9LZSBltvrwHzB3pDw6pKh8VMPd9bHgmRDHXLU/iIIiaS06uOOT9ktcIA0JluQNlJ7VJpk05J9G6DvpK+Fv8RNT3+JOt+ifPdTxwr0U6jxYY5tKgNW7EXZIdUY5pgGdPiTELR6f+KaBFcqiO28WrpfHOW0TCB17DEVwZULUn+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GsBP90Tu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GsBP90Tu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e96a285eso741327f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Dec 2024 10:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421725; x=1734026525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUhzG3caX9aWXbpAIl+TsEC4KHzPHOePfY0vBdmRaDs=;
        b=GsBP90Tup0DQtGgO1Apm6K21drOeWOqV7zjJyWzva0TVXp2NkLVk5NBLjax+adIt2O
         faqWnDGye38ItpaHSS81LPHGGwxv9bvfm+fCyvjYJPQDQ2M7UBH49Zjc+7qhPmTDdNHm
         5vusRseGmAQs461u5qbVOsrhB+v6iAl1Mr1z8787Wfuf0jI6iqjmh7/WlbElKbVUS3IA
         jFq07UBwgFow0EdiZnA2XX68eQtDbfvt3rFt6BvrSoKJjUvV3la9knmgihYiKTz3k1/v
         /tclNEBt1Wgoq9t0/NA+Y5fR1lfX+Uyt7Ro7uEfuTow2PjQzz5Ed1TwdNUtBOayN0UsE
         dH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421725; x=1734026525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUhzG3caX9aWXbpAIl+TsEC4KHzPHOePfY0vBdmRaDs=;
        b=c0XICrLW/6swEyMGm9+W87uUTdYJu9MLuefeJaq4sp887OrlAQ6xEhc4tznQ3E1dZ1
         fF2IdqwMm91HDbBtQhXYD+Y7Xyxx9nWWBdm9vhSEAS3b2MrP9atbV6/C1bYaNa4OR6/W
         BYi9U0SZBUGaNElmuR/v+GibXANWF9PNJcwqJ9KQrdE4+gEofMoTAENLitPFB5yYKXPG
         F3HL2GrlL6tHCiiR97xDpglYUhHhYI0zOy6na+30KxIfFjOFv2pyF4qjAi99+jojBKng
         9Xj7eoIo09lNTLVCMYaJPlzoTWsVDZuIo2Wc/ipMWPA3EnrQv0amLtEOsR/u8wHzGEMt
         azfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXljUFB/ozQF0j3cOy+30SZHmhfiDyff10WILn/KTQZEvIUHAhtvPpCULhD/g6pTTMU3OoYo/uL2PMYLzELJ5rvjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmEyAua+o0De3Qf8bBba3pipcvc4OgcmA49VTIZS1iV4sLaxHy
	tsz3gfDbw1Nlu5j9GEWZEDYnKK0DSomhljJVT9H/9y+64ZQ9WFhsmy5m+vuTOa4=
X-Gm-Gg: ASbGnctbO4MlFpNTn+5BiAVS8pe1yzUgtgJERfc1lWXMEpv/naKfx3Iir5v5UwCeUwJ
	iCqvGVzDr+BVeEr/Mw8ChIcrbGX9akRSSeKmcWicsJEN1dKjPx00o5jB7TWQwZuUpUH7yM0qanB
	kB/rpMbNqhvomE392Wm/qoq0vX9Y9cFqFALWMAym/jNO1kU/qwVIt6rCKfijBfKUY9VjJu9T/bf
	0rrwj6PULT/87gGxBMa69FjDQlPHTYRUBy6nr+k+wXZdwc43bJR/OwO2Yid/KNnI2tnhCuvYXAQ
	FatXEYIfHilDinVPJDyoRk5nQ3ti+WTg
X-Google-Smtp-Source: AGHT+IGmIVnSzknE9WcSqtMq8Jlgijm5XW+UPlAChDtBhFcBlLYDYS+u/7aO8ZXJh83ENw/Haen6jg==
X-Received: by 2002:a05:6000:178b:b0:382:41ad:d8e2 with SMTP id ffacd0b85a97d-3862b3d096emr17492f8f.39.1733421724972;
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
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
Subject: [PATCH 2/4] arm64: dts: exynos: gs101: add AP to APM mailbox node
Date: Thu,  5 Dec 2024 18:01:58 +0000
Message-ID: <20241205180200.203146-3-tudor.ambarus@linaro.org>
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

GS101 has 14 mailbox controllers. Add the AP to APM mailbox node.

Mailbox controllers have a shared register that can be used for passing
the mailbox messages. The AP to APM mailbox controller is used just as a
doorbell mechanism. It raises interrupt to the firmware after the mailbox
message has been written to SRAM where the TX/RX rings are defined.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1441e9a252c2..0970f6fc1ef5 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1445,6 +1445,15 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		ap2apm_mailbox: mailbox@17610000 {
+			compatible = "google,gs101-acpm-mbox";
+			reg = <0x17610000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <1>;
+		};
+
 		pinctrl_gsactrl: pinctrl@17940000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x17940000 0x00001000>;
-- 
2.47.0.338.g60cca15819-goog

