Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492F1D9A70;
	Fri, 21 Mar 2025 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568026; cv=none; b=gGZr1Qig/HiK42OO7t6O2q2WPrRuPoJDf8JZSJqnZ2PwU9E9l26vTqwnVwK5BhQjU48Hh9YThwSx8TC5K0RtSuIUV9GR16K2qMKxQVCKaIEQWVNZbclBxD57QLYK40aT/nXqTsPQBM3bBPuMYTbBhDA3GWCPXoQqr0yp+2TykcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568026; c=relaxed/simple;
	bh=gHef/WiJIYxfSHBE8F247KxYLolP4gheBKJOWI5k8io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTRb/imCvDSl9+vhTiGkiUHhxngD5wuBR8OLYZ0Auao4qnGZ309zgeaa6VhMyinKu72iLmXqCk3gYlIDb2QHOle9s9j53kA1H3e7JCITeYEL2PCCy3aXdSNBDIkPHC4Ze4miAi5rGWbIo0G+qvNWmzBhXUt4SmBZM2MoAboXB5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqsZBDPc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqsZBDPc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2067798f8f.1;
        Fri, 21 Mar 2025 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742568023; x=1743172823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=BqsZBDPcm7OXlXxJwne0VWprp2p9oiO22fovQxF5COh0lUJf0JFoBgkhyNxcz1hU8r
         bjGvmGzBaRVywUrqEevQWpyQ1sl4bR+IKtWkiStqIdwMQCbWyoy+t4GeJTspVlMvC0g1
         ngbHSRBnp3IF/KWGWq74s62YS/CH+fYAt9y5eRsFn2EzL3/7k51o8WNl8CeYVYyr7bcI
         QKZTYPFHwhkBieiTmiTvQmg9XprONext//1g5u+SYlEpgx7UfsvyTJt+HPDL8njW6ytZ
         jXTdex43v3ES0c9UYFCYhLD0Ro10ugK0LlfxLi8nn800vQVxRzRXibUGWJLigNbQZh7n
         llUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742568023; x=1743172823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eglGoRr46S0QXsG3q/hnCjtc4IGj4qTm0VYKUvrdsl0=;
        b=TOJ4Hppr2p4KsWrN+BcqrUTaE4IuMjMzKSkbip37rrsRl05pPZEMlxq/KXIh2diS6r
         vwuSDQuUhv9lQJsO+PJMfUL+xPyNlMpD2kARld/u3zNA1vVwwcnCZaOjtfsdta04Gngy
         5YAWLNh9L9xE0wU4uKtA63RT8pdL5/oJsVy02cFN5KxRacHeTJpFa0MycmoyaVLIR/Ld
         bGqeipKE4WJxte3ulWbrHEO2DFsXOTEy1EbBqWpTnErER+1x4I2cbrbYqDkeCrn1cYEs
         NaM1Er9cQhFzhv/xJYooNMOeCk0ulMvn5KydIhrQmyEOxliHgo0brgNGUWgeD9qAeHqk
         o+1A==
X-Forwarded-Encrypted: i=1; AJvYcCVNmxjdTooh4Ry0R2/9DaPXkU2aMzus6IUrDp40A370WbjWmD8rjwwg5wW6qFYtqTbYyBE4MOpU3hW4I02oZr8GwFA=@vger.kernel.org, AJvYcCXmbmgYPw41d5rwo8mkWqTvx93EtMUXJSpLk3iGv/GTtoA2btis4gKMIqbhNhtVmS4Ixbf5u+FEsDsM5gE=@vger.kernel.org, AJvYcCXykKyJ6zjtBhwppfLvbkUNqh3QTjxzhp3D2KFoIjEQm6/seSwX8tPxhrZVCXz/tAFi3w+yzEBL4tUp@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAPhoOhVm47/rVB3LO4ONQrH+dGJeIYa+zYAoG/kwqgLXuQS6
	s//B5oZ0clXz+K/3t/n53L7YcCC3Blos+fOZKeU+ah1SAq8S/Ne8
X-Gm-Gg: ASbGncv7lIBiu9WB9Ceg7eLZzWcA6zf+qTBqMGB3oxoCUKx+BGMUikvnlivWWNMjWIx
	XK3eIUpypwhQDc4sNfMCipNGA4x9HrLHQ+JHgd58uVZJbJR9JL4/haGIZ79G4AFaZ8ZYlbOK/dq
	xN07v+CSAiAISP9GOl211Zs/jtxXP5/i7FK+5i6qe1RT4Ehe7M2RhHCWvge869EniqmCVObxfMW
	FhN/apNt3uhhmI9vPbcBnaWSZl25Y3qdfl0oRKZ5GvRrcS6O75xcat1Mtk0o9RygIh/aC9X3DF/
	JtZrPXMdP5s4DEGhmnOKR0NjBDKucc9y8IpRxe90hKbepxdrlzRAZiCvzKo3iMofdys6z7qMXFi
	BNp5PuGQc1Up+7QaUGrx0
X-Google-Smtp-Source: AGHT+IG09EROY+oEC6yp/vRny6rDAviKeZX0i4uUBWkSOh4NQpHpFy+lKrIENtHAQqslPIXneUrUTQ==
X-Received: by 2002:a05:6000:186f:b0:38f:3224:65e5 with SMTP id ffacd0b85a97d-3997f90101bmr3184130f8f.12.1742568022883;
        Fri, 21 Mar 2025 07:40:22 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65d5sm2557156f8f.64.2025.03.21.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:40:22 -0700 (PDT)
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
Subject: [PATCH v2 2/2] usb: dwc3: exynos: add support for Exynos2200 variant
Date: Fri, 21 Mar 2025 16:40:16 +0200
Message-ID: <20250321144016.1434848-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321144016.1434848-1-ivo.ivanov.ivanov1@gmail.com>
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

