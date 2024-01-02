Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF771798F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jan 2024 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxKC8Bg1"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bb0ab8e79fso312767639f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jan 2024 13:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229730; x=1704834530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iih8S9CbSKYXK6Eu1V5z5fk9f7rCImQ6DnJQzgwRsXQ=;
        b=NxKC8Bg1E9loB28npLQy86G1Uk0jberzz0pipqr7NQKvJ55wAfFyIo/RUlTOuhxG8u
         jQOtXZm8zekL6yMFVXzNdqAqdEDBIxF65VbIf9DGIXLYs5Dz0n1Qr4cPnF3jb3NqdZ55
         Sb4E+K1G9ILQM6kDWcB0LKl5Ru1vymvI/M29o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229730; x=1704834530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iih8S9CbSKYXK6Eu1V5z5fk9f7rCImQ6DnJQzgwRsXQ=;
        b=Z3NRnq3ouCTTUMXz1V3JFi2ZvuWCivqG3AzhyIXYT3IunG88HBllg5yVpoYL05mSsD
         +Tf9ilxR4YIGHTBMWcXOeYM5648ii9UpWxQhF5gZtzRXNnPKBtj6+KIFxsszXE6nxIOf
         P41g2wOR1eQAL/3J7VZfiilXevU5yB4GuL2cdBeF215Yuw4dNhftIebXsZnWQwmv98Vv
         YFZPlnKh9OBuqCAE0iI49/6i1sDpQd/1IgKYiQzFrItZjPzf3OtqwGrP7fWr0X1z/f27
         S8V5p5arOrYC7nXi0cWiQhCE0gUXitKeDqezctCs3hINs0z1u85y/beU5t0PMKwoBo6Y
         Az4Q==
X-Gm-Message-State: AOJu0Yy3SzyQb7I7uEI9HL9ub8CW3mXM9H7SGG1HDoLoNmmMDlpj/8HY
	tX6ycWIbOkkpxAV2TtOCRa/Gi45CB4JL
X-Google-Smtp-Source: AGHT+IEGMyFoc4xM4Z76PcN9nzKX4GmQlxsOK5XWY9+A3y0Tt67mNC5lPz5MkPwv5iXKSvpSPmJo2g==
X-Received: by 2002:a5e:a50b:0:b0:7b7:55fc:7d4 with SMTP id 11-20020a5ea50b000000b007b755fc07d4mr24457360iog.18.1704229730619;
        Tue, 02 Jan 2024 13:08:50 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:50 -0800 (PST)
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
Subject: [PATCH v4 08/24] ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:32 -0700
Message-ID: <20240102140734.v4.8.Idc995ce08a52ba4c5fde0685118ddf2873fc8acd@changeid>
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

