Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364864C631
	for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Dec 2023 23:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c1Or9FTp"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b7d55d7717so8988439f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Dec 2023 15:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116513; x=1703721313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZeDaLYJRo5zLa/L/bxhfuH9rT1XYjT6TiTC8Trsii8=;
        b=c1Or9FTptFd/J14gVUcRsVlsmwGZznif5GSbnzqdbbWzayd7SAhmqVt2uaXSZonXOx
         ba4XBfFBsDD78bhinCkcL+TLH+e4wiIjDAdbqu1xE/cZIpnfiMJusBnEnnU2z+IFoLDI
         JjH8vntTQsG0nx+LY68xNe+s/QtB5MdLnSkR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116513; x=1703721313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZeDaLYJRo5zLa/L/bxhfuH9rT1XYjT6TiTC8Trsii8=;
        b=QOufqU/DTAf9UixMyxlumtH9xdZh/wemRpiNh6obHJiHthTPY225Q8jb7bde/FxPYU
         gErgtm6ZWyDdh1D5yiNtp8MIZERyoszJkcEZ989JYsYlMTz8LAX84LfTiVU5kqT2bf9U
         atg4G8WabvOMkVqSz6GnqBXuftP6ZfRsLwBJgOpj1OZkRaPvbmeYvrL4B3v68MOGGD2b
         Pf65W+BLc+JChz2NXaRiIkOC8WViKjv16Ur/n7Jm/00BQXH723J5UEFZK0UfkWCJsEyw
         fbf4ld6WepAh/X8sols4r4cbGOB4K99PQmdsnPkLoy8WJZmVlVi5coeFhGTwAA9NpmQ8
         jH6w==
X-Gm-Message-State: AOJu0Yzgvy6sgMLyL3xZrCLkzL0ZHjUcGuaPYAmA0EJqzH7uIhQcc4Ec
	lAKhnPrcPY8Uuk+K46R+7iwKKA==
X-Google-Smtp-Source: AGHT+IEk8m96lV9iBV0InAWBCJf8FPF2Hlzn006lTcKeoi8vAPlF6SmDvyTGDOc2BbQymmk/iA/zow==
X-Received: by 2002:a6b:c417:0:b0:7b7:d807:42bb with SMTP id y23-20020a6bc417000000b007b7d80742bbmr5876797ioa.41.1703116513408;
        Wed, 20 Dec 2023 15:55:13 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:13 -0800 (PST)
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
Subject: [PATCH v2 06/22] ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:20 -0700
Message-ID: <20231220165423.v2.6.I06b059021de1bf6103e60a73211f078f2af75d17@changeid>
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

