Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4D4CB30
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661137; cv=none; b=k+v5LDO3xhV4PPG8s+nwvybnfP7NCumZWnd5jUQygKg83f6YvJuAiE/ENkga2ZcWSejMdsp02q/r0dL+EwIjWU/bCmpqEoL2POyQBzcnbHkTIm5bgRhq8cgrnIqe+LcQ+QGwDRi+m+fr22SrOqucUeTX89/J+jlkudkP64L/xc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661137; c=relaxed/simple;
	bh=kuYDD5uxgaAqiPArwaEVu4dV87lteqd14/0vwTxY710=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trvUwK4eOgfrvMxnAfAX1e/llZWSmfK5pHIyVshzMrkT6GRERUcp/H+piYEySuRE6KETdyO7IX7gEA//61JB3Eyly68+DR0tPnAtky52VVaNOfx0S5VkENzzf9aDrDZLxQMJv6CHnEK5g0H0Jg5bc91k2f7RyuuP7yZeEnbXask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyCBprv5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyCBprv5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e86a9fc4bso7731775e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661133; x=1706265933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2al3iBNQhWlEPx3zO71H97w87oPbBhC1wsAJyE/YV+Q=;
        b=HyCBprv5hj1T3vMbgBjHtlb2CTbcrtZMsEXtSdPFtLEEx4ZZFqkGHMbYkOa1mQNG7Z
         EBALnaaspBl7HA1bvpn1qN6szerWEIYciGc8zqScRvq3+GGQYUFmE3WMyK55xKm0oRu6
         cad1IDrU081KHxtalNev3KIXopfkWyA2tze8Z2lfD73e+MQ6jSujtXVL8sjcyfzhHuNY
         GoQBbUu4LuC14bsCtp4RRdDCTIiyKI4yFWg0m1N+P4rT32db4hExV7I0mBwZKe7Z+dbb
         bi3g7r+KPzInc8vCmSmVfk/+AfeHQTBv9+jxtDUamuWnNpjw90O+1Q4wN/TAJDSx1wKx
         GUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661133; x=1706265933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2al3iBNQhWlEPx3zO71H97w87oPbBhC1wsAJyE/YV+Q=;
        b=aFL0uPLN4XISqM/1JHd5f+xhY3z7fldQRRR1qYkXPohXKXetIXLB/6c1pmn5Hpzaja
         7FZl+hyqVFm10bbat/kjEXmrsCAxs0+LsKrXMIu+xhHSNc9KpdEdv4VPj2la4QYB9cvx
         2CBK+H3bc+PcWV7VD+g3JGX8GbpmdasSTWjG+2JhoYR/gXJru1EFLRNuw1itzz86/l8a
         Mx3CkGounXIY1MAMsaY0zQzYUjPWKy6hvVvDLDOypn4ArB+/yHotOcbH8UwyX25RHUit
         oySg9f4/GCHJfBZ/f6/NXeSBVtXaoI0BCcU1ZOBcGmMqeS7OuwBO25+juSlYGMpuCynt
         rBrg==
X-Gm-Message-State: AOJu0Yz9eYWAW26zUrAAS6jfjoeiUdvIZuqQW9nf3efL7CDqG2IF3FpL
	7h/tnC+P0arKiVF7RrXFzcavWhmsscCIpqchf7hh0ja5XdB2WP5UhXA/mJw6Db8=
X-Google-Smtp-Source: AGHT+IHXRVDj6Z2rHedmVBuRLxryu4//t1M2OscXjxE5zCpuJxJ49smSeqRP5ESmOv4g6vvM9Ij/5Q==
X-Received: by 2002:a7b:c412:0:b0:40d:7d62:80ab with SMTP id k18-20020a7bc412000000b0040d7d6280abmr1306238wmi.117.1705661133590;
        Fri, 19 Jan 2024 02:45:33 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:32 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 05/19] tty: serial: samsung: add gs101 earlycon support
Date: Fri, 19 Jan 2024 10:45:12 +0000
Message-ID: <20240119104526.1221243-6-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entire bus (PERIC) on which the GS101 serial resides only allows
32-bit register accesses. The reg-io-width dt property is disallowed
for the "google,gs101-uart" compatible and instead the iotype is
inferred from the compatible. Always set UPIO_MEM32 iotype for the
gs101 earlycon.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 7a1b1ca82511..80b8fcf9e025 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2809,6 +2809,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
 
+static int __init gs101_early_console_setup(struct earlycon_device *device,
+					    const char *opt)
+{
+	/* gs101 always expects MMIO32 register accesses. */
+	device->port.iotype = UPIO_MEM32;
+
+	return s5pv210_early_console_setup(device, opt);
+}
+
+OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
+
 /* Apple S5L */
 static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 						const char *opt)
-- 
2.43.0.429.g432eaa2c6b-goog

