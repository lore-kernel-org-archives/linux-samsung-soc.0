Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA31774E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jan 2024 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grYAbEpE"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7a9f90f34so534011439f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jan 2024 13:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229729; x=1704834529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFylEVwz6/jxQq1ZweDsmHVwptzQPuyXfUnhxAJ710k=;
        b=grYAbEpEGE+CY/lcVPOfo1nBGvsxD8gVu/PNJDxGLdxkl9JO2ttuV88LTUkBL6Nvu+
         NDF4w4L2ULGkrLijFRY+PJ9FqOQwcOwgH7o1SnrTzXrh2gfX/nI8eyCeHlWwXbJ2WXe1
         yzIBQweyAEsgllUrhRDkcgnbHpf4Er2TQLN0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229729; x=1704834529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFylEVwz6/jxQq1ZweDsmHVwptzQPuyXfUnhxAJ710k=;
        b=mdpatxVJR/5fdj+d/vknYgfEYSnK6P6rHzw6+TGj+/ewwWVcs5ZxsfYHcAld7akeiw
         wvQ4pHlBD3NZfBh9HTJTPGW+a7k4TGGVvQVsqLsOdJ5vlawFwQB0vBrFGCzVJ5R+nF8K
         ZgqH2Mc8B7XxYlz2TGoO6z1WpgiwpRLhSUvDWelG6YRwOKSSNigOgCdMnCFWmOGQLFd8
         7kBLSDkE7rjjB+eEaJNsHAsseQTDY6df+IV/14sbREidLAaJFJSIl0BT/fZ7zivdZGqZ
         rl1+RRq1FHIPt3iexhg4X2DXSNywupyWPEKZaFq1DLFNfy8fnF3hutV2+q3s2k6AhASF
         HQRA==
X-Gm-Message-State: AOJu0YyzLMKNbzCvK2f6hm7hB3gPYQP5J1icxNyUDiriUbLsnNPKAld9
	V4D894CCzkU3EkO6p0+jPDrNxgeDxEfa
X-Google-Smtp-Source: AGHT+IHEJbHth/xM3Ut15mQoMsgLsloOubZy6ZZ76RDsFpY7YTAqNzQUU9yztAFE3PAbKB9V85o07g==
X-Received: by 2002:a6b:c342:0:b0:7bb:cc1:a3b3 with SMTP id t63-20020a6bc342000000b007bb0cc1a3b3mr7901421iof.21.1704229729647;
        Tue, 02 Jan 2024 13:08:49 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:49 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Subject: [PATCH v4 07/24] ARM: dts: samsung: exynos5420: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:31 -0700
Message-ID: <20240102140734.v4.7.I06b059021de1bf6103e60a73211f078f2af75d17@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
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

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v3)

Changes in v3:
-Update commit message to provide details of the motivation behind the
change

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

