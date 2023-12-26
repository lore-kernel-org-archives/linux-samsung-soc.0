Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020910963
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lKxoWkTJ"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so205865539f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 11:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618528; x=1704223328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thrF0ILWTbiGFQaiH41yQtWJ81V5Pd2rM8k0MkABtdQ=;
        b=lKxoWkTJ/tP5Ccz3HNM0UnoM+TK+LTRVr9GmxUZK+TzKAdbpKeT1vro64k64+VAD0O
         pFsaD+qJ9rUO9HSij2yaqD0zU7YDSz+y5YOiDPwLPZue/2B8gAySVSodZV9JmoP/bvOd
         fvFknw0VpFuiJ6HCvqCtHhj86sVge+WwnegFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618528; x=1704223328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thrF0ILWTbiGFQaiH41yQtWJ81V5Pd2rM8k0MkABtdQ=;
        b=hIMQqKjpB+O0m9Z/1HxvRFzpqnptlS7SQT7MxFw4zcBsGSTXmMLcFhspeLpjeghfMP
         a7qwTkDALOaDe5dUr55wX3WPLgxeSkxqsPxPIco5/Pzavr/hbKHBm/0jb6OT38pbENQD
         kzZnOn5WT+NVLvLp3Vfhbz3zEE18A3jZW363oEsGoY5jD9oqtrXkJmuBZJD9quiRmDTA
         cA16TBVd1UlictpooRGQfp1+Zln1HyZf+dzYbFro5yKqfs8IYQDhIR6OyYWCBai2Hes4
         uI17S8NMfY8hux7He6pS5LXUg64eNu/gd+zroyzlv35HPjjTqRCGYbB7WO2q7cj5bl+v
         asmQ==
X-Gm-Message-State: AOJu0YwpDSgPMy6m30dlpSP2/QQ34WBYstSLjFIc7lFg9WmdH0QNMCH1
	+lBzTV4gmGxzNXBs0aAL58W108zoh7S4
X-Google-Smtp-Source: AGHT+IHP3cqF61lIxGXtlQrM4I81aWrz2Mcja1UYOJWo/ufdUqAFWvhIXG2CTqcyA9nGB6m/VVxrbw==
X-Received: by 2002:a05:6602:3f8f:b0:7ba:9784:d96f with SMTP id fb15-20020a0566023f8f00b007ba9784d96fmr11764777iob.20.1703618528314;
        Tue, 26 Dec 2023 11:22:08 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 11:22:08 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 07/24] ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
Date: Tue, 26 Dec 2023 12:21:11 -0700
Message-ID: <20231226122113.v3.7.I06b059021de1bf6103e60a73211f078f2af75d17@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231226192149.1830592-1-markhas@chromium.org>
References: <20231226192149.1830592-1-markhas@chromium.org>
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

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

-Commit-changes: 3
-Update commit message to provide details of the motivation behind the
change

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v2)

Changes in v2:
-Split by arch/soc

 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
index 4e757b6e28e1c..3759742d38cac 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts
@@ -967,6 +967,7 @@ cros_ec: cros-ec@0 {
 		reg = <0>;
 		spi-max-frequency = <3125000>;
 		google,has-vbc-nvram;
+		wakeup-source;
 
 		controller-data {
 			samsung,spi-feedback-delay = <1>;
-- 
2.43.0.472.g3155946c3a-goog

