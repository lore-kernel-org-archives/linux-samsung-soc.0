Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4110A23
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bk0PBuj3"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3600dc78bc0so3263425ab.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 11:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703618529; x=1704223329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEODyyeyprVfJRUjUtUcn0PH/jJY9TEHe0bos5Y4zHc=;
        b=Bk0PBuj3zKTP/LArK9YDe0mv7GUIt00/gfVPl240ojZ+vU9/0kiadYnEJLigw2zm3Q
         qQNm0qsp606kFMaXFuIQcYYrzpMPBeJ4FhODDBD7JOVDLILC3Q3yaCls3e4OsBUuoSww
         dVdOd4u0aEMWydzzirDdbT/0XUdhXnFiH5P4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703618529; x=1704223329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEODyyeyprVfJRUjUtUcn0PH/jJY9TEHe0bos5Y4zHc=;
        b=UTOEhVOxJe5EprqKhQdqx5SiHxrkDHyEAZblV49V8bBpzv/joR5brnqzv07AxNCZ2y
         nrFUVNh5TNMOUfdWSkQOJPBU4w/R519yAO4U07Q6ZHDJEbN8j0ffAI8h1rl28MaPnkCR
         3FXRF8MSCi+TjCBfdD9Zy2z0djwZgjMRWyh57Huxw59sPm88TfG3cJ17BY4Ge1qOkaPn
         O/7cXF/3hvMVk5vCepJw7pN8VuxgzBvm40IU1T1ZkL3C3aVIUlS1RBpX5KDMgQocZPb/
         kx6oqOydxBHM3VD0IGNjE+Ui7FhtHhmL9bG/nXwcuqLMlFOwp3qbeuAzYy4sjj7YF3MQ
         Eycg==
X-Gm-Message-State: AOJu0YxwVrz+qCHmyHXMz66CrU7BBKy8ajLYr9rUU4F8XOAcqlc+kruV
	wm8dx5+ZOcuLKcSbL/QsAIofJSOPTxjB
X-Google-Smtp-Source: AGHT+IHa/0vFINH4R7TOUcFlOypJ6/So3v6QYpByaNG5AzpKzcz2ODJE44ZeU7zukq+ljzKdNZ5lIA==
X-Received: by 2002:a05:6e02:1528:b0:360:17a7:1f28 with SMTP id i8-20020a056e02152800b0036017a71f28mr963152ilu.15.1703618529143;
        Tue, 26 Dec 2023 11:22:09 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id gw3-20020a0566381ee300b0046b692e719esm3207609jab.150.2023.12.26.11.22.08
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
Subject: [PATCH v3 08/24] ARM: dts: samsung: exynos5800: Enable cros-ec-spi as wake source
Date: Tue, 26 Dec 2023 12:21:12 -0700
Message-ID: <20231226122113.v3.8.Idc995ce08a52ba4c5fde0685118ddf2873fc8acd@changeid>
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

