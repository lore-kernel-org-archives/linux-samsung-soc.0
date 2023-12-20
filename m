Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AC94CB4C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Dec 2023 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jY0oCY2Q"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7b435966249so7760539f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Dec 2023 15:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116514; x=1703721314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06i8yMe3unqllEnKE3Q0g5bmBjz7Qwg6DF0FrSTHOkw=;
        b=jY0oCY2QW6zKPDJqJpJOqXHd3PRfdue/GA6fECqXaBquJjPXOnp2KG3IDeRaDEOqcA
         0LUz1TlyIn7Kl2GW4tyaE7Zt/ZQx8F6LYees8joXLw4CthNDOQ+wn5+xuf5HZ2Hr3+G4
         oL0/U9/1YLZH4UlA2l4CkVqPxDv7pASHgwNzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116514; x=1703721314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06i8yMe3unqllEnKE3Q0g5bmBjz7Qwg6DF0FrSTHOkw=;
        b=lAwtwgiCfzsKgkjISLBODYXoVgb9F4CToxMi8GdVNxzDAQtXg8PYabWUfwbCRpJv35
         YlhLPiEXEpcF3OuAXtHqC/xzCWbxyUO65U0XSAb0gRICoEhZ+zjH+Bs/w2jQlsa26xCn
         mAW/G8pnX/9fQJTbiZaNs+MQ7jp9MH0J+g0UWJrwSpF2A4bBIgHVPbAeZZYhJqrgQ21w
         1xh1RieriaWboMJYXFXST5DCXqjVzNeR0I0JYgS/yigPBJR2Vt1q+TkSFThyxYYmV7hg
         uE0RJ4BPsnmISxVBarKeJFx1ehL2xuf23uCIsek40Z9i1QP+/IYKovz/b6+hu6/QrRoi
         gk7Q==
X-Gm-Message-State: AOJu0Yy8V52WpYLRCA+ZdcDdl9hToQqihgv8fXHd5HGs1FE4DaGnnVG9
	5bH7q0hzAghH/Aoip7pQHR2Nng==
X-Google-Smtp-Source: AGHT+IFtNsaq0EzBRu4Ew+8zNVmj75dDLgrwZJJB/sP75mn6dWM7HXO8w8QE3J+d103cQRFMUtPPIw==
X-Received: by 2002:a5e:8b0d:0:b0:7ba:7de5:609f with SMTP id g13-20020a5e8b0d000000b007ba7de5609fmr1200517iok.38.1703116514370;
        Wed, 20 Dec 2023 15:55:14 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:14 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 07/22] ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:21 -0700
Message-ID: <20231220165423.v2.7.Idc995ce08a52ba4c5fde0685118ddf2873fc8acd@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
index f91bc4ae008e4..9bbbdce9103a6 100644
--- a/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts
@@ -949,6 +949,7 @@ cros_ec: cros-ec@0 {
 		reg = <0>;
 		spi-max-frequency = <3125000>;
 		google,has-vbc-nvram;
+		wakeup-source;
 
 		controller-data {
 			samsung,spi-feedback-delay = <1>;
-- 
2.43.0.472.g3155946c3a-goog

