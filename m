Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B154E1DC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661143; cv=none; b=uaRHUUr2aUmnWBLhuK3HrUl0JrRcbuMc0an4p4PK/LhszGTb66BZmHyRqxPMeNwb5XyZYy4QvlcvsK/n/TQwGzLSLXymP9kzfwyAzVu6aQd4ePUt/wBxFLb3Oqq/1194IQxsWEaGZYXmJfUA4eAdwFB+QaMwGFiCoWC6iB2mnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661143; c=relaxed/simple;
	bh=8IodzGZ1N5vxfAuWzuMPXTBW5vzjas6eiKlra3jz4ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVoptIZa8ZDv53ALqlGNSeHTxRWzoNzYedBr/aHqStpt7E3UBRFTepAQFNd4TP56Kc2DjKKkHjcACIfoMK+ax3rTpzQSaE646WKavyha2E4yUBQDdoD3fbd4wAZqUZRNgqR6/loC6VOrArUVgRQ9rV1alFDOSVZEngKUaiC3k94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoYfnBJ9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoYfnBJ9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33921b95dddso173674f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661140; x=1706265940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk+f6DMfyT8RxC2Uq+wxFTBwK9isaqVwqfpa2TVfflc=;
        b=ZoYfnBJ9+EFpi6j/ttlHMPIZ0beXHTh8U+4yhJvsrlkj5U1UIublpUNDUNJR6mnxEl
         hUOEzAZLAYL7edebw/cYmUwGiBe6boE7iqhwEZJ/X6EkjX7BBz2WbavMr4BTqIZLvXdJ
         PWplINFEqNSpdFdI+716B2ZzP3wUZpQyJiGB166fgOZSPSr37EEtnPUoNzTjW7QlDyZh
         DMJFffVCQpoMyFhgNP7hZpvaiFmgo0YSmcz0aJnz85o/yKLZG3WEp9mUGK0qB/8/AcWN
         838gf90nyYiPWAiOggc/8l403tPxSgLFmJ76tln5rEzNTmnDVnEiyaKVC/zbhXAyCDfy
         TfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661140; x=1706265940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sk+f6DMfyT8RxC2Uq+wxFTBwK9isaqVwqfpa2TVfflc=;
        b=Ysq+m8Wfuz/GY4jNhg9ciaQskYEkBYSk77yMhTFWWnQxHT0FVlIbkrK1ytIvd0f9IB
         /wEz/7n0ooJKMSPVd+K5AX8qAE550m+22Pxlnhv8J1nn3ajgFf0ebOD9FdS6e6ZSYeL+
         +lLvTAARff4QU+rZNzFBKpBubx7XoPBMtqi0YZrWH8Lt1EvqA0dNbnG6GcBO6Bh4hRvc
         zHPKP5zX6UlFkDKsi+iRK+deM15DQMzWn+Y+//DZmq9S/vqmxYbPPsk4sGtKOTZLlxMp
         awd3OHdilTSW/LO2sbuJujsu8o2gr0167vz3oYn6rzXLYokr8yRpdQcapafgpjtsDZA9
         FbPQ==
X-Gm-Message-State: AOJu0YyMgejSVIvRz9rRSHpWcI5yAM7Mb/I5YTgTscZf7wHGxuJcrSpR
	AIeF15SvlDDb/qkAbFOnn0WaulQhgZ4WSt1ah91+C4OQgLCZ96ajkN7ecTiORqc=
X-Google-Smtp-Source: AGHT+IG8YnM5QzfuxMFX1zhOVACz3KiL73IJvltttYQcWx8JPktpxDFvbwhDtd+mk26mM/jTJgFwfQ==
X-Received: by 2002:a05:600c:354f:b0:40e:88fb:e8ef with SMTP id i15-20020a05600c354f00b0040e88fbe8efmr417899wmq.4.1705661139905;
        Fri, 19 Jan 2024 02:45:39 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:39 -0800 (PST)
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
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 11/19] tty: serial: samsung: drop superfluous comment
Date: Fri, 19 Jan 2024 10:45:18 +0000
Message-ID: <20240119104526.1221243-12-tudor.ambarus@linaro.org>
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

The comment brings no benefit as we can already see from the method's
name, ``s3c24xx_serial_pm``, that it deals with power management.
Drop the superfluous comment.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index b6d34c9f46ea..4bb75b1eceef 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1295,8 +1295,6 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-/* power power management control */
-
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 			      unsigned int old)
 {
-- 
2.43.0.429.g432eaa2c6b-goog

