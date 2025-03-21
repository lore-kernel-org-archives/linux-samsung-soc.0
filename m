Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFB71D798E;
	Fri, 21 Mar 2025 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568492; cv=none; b=NoHuH/+1R53Twgt2ANtvkqJV4XuXLhpkvYl1Fif1l2Gx9D0bIvNz6RvRChs9Clupdrasgj+628QWBFWzcshXLqaDVtTse3z7fEh4/W5KNJp2rzymOF6UVLHCrVHXVSkvasKodLfGPxFOXihUwxZjljedBgDtoqjtnizwwIfSFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568492; c=relaxed/simple;
	bh=gHef/WiJIYxfSHBE8F247KxYLolP4gheBKJOWI5k8io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cV2T61ZF/Rt3fcSmvWLOLw4/BweB+k28VPzw+9cUbeMPHNMc5ObyQdl2TGZGV+RDJqhihDH7Zf8F4R1DQKgIQWqDnxlt5+mxeEpfa6Xk7MYXoN3l+l71SOYU7rXTbXGwf1JyW3wUuB8AfSgXzhKcaWvnnvtWQ5PP7ZA3H6fXT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX5gO9Js; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX5gO9Js"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39127512371so1406665f8f.0;
        Fri, 21 Mar 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568489; x=1743173289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=UX5gO9Jsm0Nh41Ij4DARZne/W3ELCU5J5NZ2/8h0AW7mdbaTt/czqKhz8QNS6lnTBP
         7fVbFku2R4Y9Rt7BluJrrycRKX7LEP00eJPiV2YR79ycc0M9Pz/BmNbhnvVbkhX8b1QM
         N/CtsJimNRw1RIAU04bIBC53LG28zX/+dgg7pH/QeDUZ9e0OktPoMl6qFH7IKCUfF4IR
         N46h8mGjxo+SKi1f378bnMpknIBj9TFIU9fItdiiJLGN0ia/hKt9pnMbcSixGrNX3QWF
         AM1ufKo5XalNJ5YUAEfrMrmN9moWheq88a9tSypP3PgD/8HrS1Wm1dDBsJzCyBbhluoG
         MZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568489; x=1743173289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=XoE4ARTI0UuRXlvbrFW6qrqvKKXJvECImohH1NO54Xy1hxmGg0CSDvLXwV6bds1Yvi
         3OcGddaV0JlzHWtW0gGgs1VJ/BoW9Z3je3hEtHykgWMoZPsWMD4E+AYKdmrTpc3Ezz5M
         qEPTq8aY84Eq6yiyDMTH7ySU7kCpDXI+n5c7eAJt6XaSdJdphUyz2YUWENFENWjeF53l
         pjMyZU+WwVWNghhvKGLa7rntrLyGgoF7zcZiM3Abxey/9R8YRn//lI+cXBBRVOUMZs+Z
         LPIDepss4IExoPKmykNEiYIYAdPxNYUvnNm+Rm90TlPfOEnwLTJYec11oq1B7QeW1js2
         wcvw==
X-Forwarded-Encrypted: i=1; AJvYcCUMDMBmpZ+MBH79Jn8NyI2VWJhSwiooui7SLRdTyK6nIjpfC1fCf8MKkRkrPwZEQAKzrqjAeeGuIZjfL4WlpCPEQ64=@vger.kernel.org, AJvYcCUh4I1ZtdgrAw+oyVxHAFc0KPLr7W5dOpYaj3XiBcn72O9YsdqoTHF6UTiaBLEFvLcMJQB5+Vx3i2/O@vger.kernel.org, AJvYcCViibzQdGf7Jevqz9UnbXTPF6BZGBbGWEds7uZVxeaFvTQIbE7tvI1mNAiEvaLB3kRQSznvevgmhQmfMYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfpu0wV5hjPjRCpBsOmkTMgqzh+Ta5IdSbs7OT1Onubdq978WO
	v0o9foVGRtuwgBg0qhhWWDUuln8alqHT6xCd2cYnMHY76Pa/+p57
X-Gm-Gg: ASbGncs6AsvgiBT8EFIaLIgu3pMn4nlIvSmN0LcpbvQZfKZL7lgiTMX/yBU8lvnYHBC
	gqlkasJ1DEtiGqtpGKxoaJD//cJJqTfVC+zSrg93NC1Gz8ED6ekC0zrazoy0aDESP+r6p4Yofr9
	gFPLkLT8oA8jPPOdthuN6ZgiUT+JDmPjfn/qP8eVhrMvm5LbTIU1XRAjtTPU/fN0NnEKFJ8jxPz
	zgAdms6MIXIl9C9wSCnxFrFzeKel4EwcqaQ/EUxFEFyYa3Y3w/AZkk+WFMXuPSMrJTsE0AfoEfQ
	aXqycoQrm/OfThaGbEDtJvSOZgURrf/KkGUDKkYTb9MN9Jvagm/6Yotdv82E0uBIdsMNRKhZ95H
	nHil8J83ZBGFNvpEdhzaF
X-Google-Smtp-Source: AGHT+IGV1TOlNM3xng9QbH9wlKQQUk/Hqr0UTaR7z33DFcaPZufgeSbUX/WC36jQ/lzEZqtWL3v0TQ==
X-Received: by 2002:a05:6000:210b:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3997f932f07mr3452699f8f.39.1742568489430;
        Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm2533851f8f.45.2025.03.21.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:48:09 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:48:03 +0200
Message-ID: <20250321144804.1435502-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Exynos2200 compatible string and associated driver data. This SoC
requires a Link interface AXI clock.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index f5d963fae..aa22265c7 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -145,6 +145,12 @@ static void dwc3_exynos_remove(struct platform_device *pdev)
 	regulator_disable(exynos->vdd10);
 }
 
+static const struct dwc3_exynos_driverdata exynos2200_drvdata = {
+	.clk_names = { "link_aclk" },
+	.num_clks = 1,
+	.suspend_clk_idx = -1,
+};
+
 static const struct dwc3_exynos_driverdata exynos5250_drvdata = {
 	.clk_names = { "usbdrd30" },
 	.num_clks = 1,
@@ -177,6 +183,9 @@ static const struct dwc3_exynos_driverdata gs101_drvdata = {
 
 static const struct of_device_id exynos_dwc3_match[] = {
 	{
+		.compatible = "samsung,exynos2200-dwusb3",
+		.data = &exynos2200_drvdata,
+	}, {
 		.compatible = "samsung,exynos5250-dwusb3",
 		.data = &exynos5250_drvdata,
 	}, {
-- 
2.43.0

