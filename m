Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4E1494C1;
	Sun,  4 Aug 2024 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808557; cv=none; b=eok4uoNCiu5X5jtxCGnFfoqCjW1T3mf1yZo26sWME+RSX0BLfky5zrEhQeqWH+y6BdnhEL7oXSBKYHevC6em5BqREl3Wu89eUdbbhUOc4qyeSM/K/9rxmyq7a1oBZqB2NVUBgIFOE+b1+DvVe013J3MCa7l5FUb+pod7J6U4TE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808557; c=relaxed/simple;
	bh=iG9PZzihT2CWtwlyrF7+awf8YPX68bP/Q6A8dLj3B0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YojaGmM0Ur7ScBoI/OS1pZn5hwxOvDndU2HjM0HTEKroaogFNcaO8lmiebUJSC1Ffh0rOCOZ17/4RJEjcwJQGFACMBxzMbNSUr8YxlJfSMSfxKF2a83hAwhVhYIy2d2mpu4gaPHTW6R4IQ+bTh8gj6oVDlckIYemVnh7PGDoYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcQIxm9G; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcQIxm9G"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-530d0882370so206510e87.3;
        Sun, 04 Aug 2024 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808554; x=1723413354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mrhFPOA10bN9OR7jponwlQQntJxF13+NNdEHk1/zbE=;
        b=gcQIxm9GqAKum7S6qYcXmNEYUCalQHAIJDx0mWCgfedewLW8xiZ2h+3XFNU7pvrjjf
         x+US7rtBQITFmF6wrvqzqsZ4uGyJJXkKcyVy/gRNUQgGF9KO0GmqkNV1R9pMmmH8lD1i
         GzSt5R58DKefd5Vw/Kvck0Yof8cUMhL6ni2pMeBzE7pOUK+6BoobLL8zUwJqKhkcu0P7
         x5iPTOnKTUzSnMv57UkICY7qPa5inRGShXW3ahpX1cV2y8HpiPI/U2P1tuzFLYeBC/Ri
         Es3v2+GAKRs6h1sW1dCo+HT/qBZjQDD2JJBYoOCUd48qWUU1vAnm0ma4tHInqta8wwNc
         FSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808554; x=1723413354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mrhFPOA10bN9OR7jponwlQQntJxF13+NNdEHk1/zbE=;
        b=FbkQUj7eZqWtzViM3c6+LItjsmHYwCffa1hxQAA8Aak6Q3qiyzucKHRDsVQdksNqlf
         lLR9JmZUAytjDLjQaRPXfweB0l/XpcwxnpQlxERB+I3XVkDWk+KJ8cQdKCGJcRD4Cda+
         HdJ3jnVG1GsvLcqX4NGvjbsjDK8E2YXGhwetSfEcqu7A/mo6QtvDTaF6W9zQ6Jd7xj/K
         eYmJ68dZFG9xwnw2zN+Duzah3UBiTz8e2rRaOe7r+r6d6OJH9g4mfz9QCxPblKiNXWKp
         v4viAw3ySq0bmnTCT2wEFfT1ItTYDUyu9QVAbadXpurA/HK2PEh9Aiu8wGQxDow151Xi
         Ee4A==
X-Forwarded-Encrypted: i=1; AJvYcCX7fgQNw2AIKq0wq5Gp7gLFXkz1n9yROGwxvdiqAQX6Jto1d/eYRYnxS2jqMbV6jB9wPdG0NhDP4IXfsKpzJPnoHGk259G0Ah8/1bA7rF9rgXFjx+dYxwdmM6KQkcwMvPVOQi18ZsMTZBh0YC5UZfqrDVsoTBEN851Y3jtzEpohQAB5Qi1igazKxhDF7e+tfKNqIoqEtmnL7BRg+fQw5Rpn3IPeKmVEQC7c7Fclmz8ei/tI62JbhRgOGWhAsEUXKRJ4
X-Gm-Message-State: AOJu0Yx2D2kExcCsRPCnCDzDgQC5K3TR43lFjA3bmoFHa9tp8ot8kEK9
	Ahz/bn53ekYg/N4PdlBxfQaFaYT5BcHxIamUXXTpDHNPftpDB2sS
X-Google-Smtp-Source: AGHT+IEGWbiEQg/exi1Z48CX1tnMKkyEbNXIAJdnBvBNQOjhcm8r0tNUiJsfxT1egdx0cOSk4VH1ug==
X-Received: by 2002:a05:6512:3f27:b0:52e:faf0:410 with SMTP id 2adb3069b0e04-530bb366727mr6856914e87.1.1722808554282;
        Sun, 04 Aug 2024 14:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:55:53 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 10/13] usb: dwc3: exynos: Add support for Exynos7885
Date: Sun,  4 Aug 2024 23:53:55 +0200
Message-ID: <20240804215458.404085-11-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos7885 compatible string. As 7885 has the same clocks as 850, it
can reuse the data for Exynos850.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 9a6e988d165a..5cd4dc2e0a67 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -185,6 +185,9 @@ static const struct of_device_id exynos_dwc3_match[] = {
 	}, {
 		.compatible = "samsung,exynos7-dwusb3",
 		.data = &exynos7_drvdata,
+	}, {
+		.compatible = "samsung,exynos7885-dwusb3",
+		.data = &exynos850_drvdata,
 	}, {
 		.compatible = "samsung,exynos850-dwusb3",
 		.data = &exynos850_drvdata,
-- 
2.46.0

