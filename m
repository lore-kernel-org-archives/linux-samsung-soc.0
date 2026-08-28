Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2473BBFAD
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2026 05:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895418; cv=none; b=RFfVV59zoZpYVP0wHRD3s+MXawCnJ1Kqi3Lok7Zsh14UjKbeN+Kgy+iR3IKQ4BHRqIT+Jgl6DiOGn/B5vdQBrgIEPmnC95OuD5OJcY+18tW+9vAi9hcfnfr07zjO/u8Mr9yALcpzTBTFdjT4E/ql14Cc6CAdo5QFptsCsKKzwkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895418; c=relaxed/simple;
	bh=h9WfLuWGKcerM2wWkrGVT+9/+JdZZk4v06cpnrS/zhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W70yi0sA7mEnOXcNT/uyQZoZ7LOTiAokmhwx6Tiisv3ZvV3354nc9zoG4k2ZkBdlYrt8cQ4ErbwDpeV3rfK9bjr3lfe056rpKXau8Pr9oiy+ywTq0uyGvnIPEgaSvNhiOd83OV6J0CCo9eC9e35waxX0gy82kSb6SDMqUOaQw8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eCFHy8du; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eCFHy8du"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4798bea72f9so372284f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2026 22:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895413; x=1788500213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=eCFHy8duQqW9Nw6tj5JCp/3ibe6/kaiGlyks4jnM1AscOQS3dAHKGC3wsoJerLmUza
         Z4xzG5GuO//IB5ttdKsG4oI/PyWPZUr5EQPP7CvR6tQ+2pfuk3DIpT4P+/ixI73icmic
         5NiH4Vezt9iIG92QAd6rGJFLFumVvEwlm3mUPHNf5k3yTdldcyWqShdnlsLZMcNUkbjC
         +mA5ZxtNQ2xncn12YPgaDyiIqxgPGRGVqarIRppEe76JqnAtLHJQe4wLA+nLgA99xete
         2zLF+ekBKMzM7s832JWB3AguSWCN1X7/osZhwnoBBxxe05GYgXLh3Xl56YfMlZFNEVyu
         QC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895413; x=1788500213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKnm9/fmrIQX/p3UdIJ0P7OVm8nkpUuAfCjDFGGmEKs=;
        b=isrv6d6ewTBTH6JUGzcuoNP/bgrCmZgglVFD8RN0KJ+ftIiCNFeRlVh/dEEKJuciyd
         /weTqhN0zRH9hQXXEaSoaqn/bpy/ruglw17ELNyfBPwH87ecp1MiUkYrQz5eRIg+qmS3
         YDpC7L0UyM6NycZ4/3XNe0LEkkNak/d5ayjtAtN1fGaoUWQ4tluxBUFpIV4U2bgdHX42
         n9oQQnLIMQ25AC9hZlZrXnwEBLjEgSpoB2bxM3oDrnwelvCuHPfHtwSgH+A+4SKQU644
         kYFJbqqck0XlyxEmgKy1WasMtIzRoW0cQN/4sNMt7TXBH1ilAOSsCi9rx1s3UIRg+LkN
         L1lQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbgQEhtRwCUCAj6GD7ooEwT02xdcmmMNUB8+vAt+A/I3YipsQT9nnHBzXDIU32pUAyNSy73J3H23fhPwRyDIMs1A==@vger.kernel.org
X-Gm-Message-State: AFuF++k+fQI97IfR7BRicN89Hnr/10Lt4nIPTamPoEn22rxSU2dr0vAg
	8HMEitcH4dQzKhB+oQg29T2n1/PfxeFDa22+bWH3IhBucTFmFzku5y5qA0btapH1B0By2J4UE/x
	x0naw
X-Gm-Gg: AR+sD10j644ZMuavWDxbUjmn2KwNixxHQqQ37bERi68TW0kum3mT4wa7eDNaZfWpZDP
	T6mnYeRCw4twsmdNMAmyT0FONd9j7LioByMm4R/AHqu0uj16/D/I56uEeY/D8MmYzhNk3zDyQeb
	OcUgQVhUaJSRppCYesBw4Fuea90HNKGBz6ovMCDGshpVVSrKdg7oYgS3iemgjc1ueAiAYY0Zros
	w52eLWs2RGnO7vrFeAF1DyrvRGiv04z58S787Mo1i+l1xY8a2HN393Bib+RE5SaQur7K68g8uCB
	XAlnNlXE3oC6OHPzSTECfj9dOtO8nhzSP6gMFwGBp1LWU5e+p/yMuHAnbfSi7YFnlqnsaFdQ+Mt
	NtS+KQLsaORRmHviG7ASxmqVXyyMmoXC+8T1fuWoSPkVpAliNL/7/hjlDcucanBUS2fGi2ZBlFZ
	0Vl6bLaRj2NZm3y49wBvWx3zWrKU/yCLNOpDpXxuKMyOZCpFhHLqMLC6MD5GaqJ1PRRkhFkRNMN
	CWbAHGHnNAWMDK9+82i8AQTfvXZCbXo+ln0o4xp70RT10ZjHDG+
X-Received: by 2002:a05:6000:40cb:b0:482:f0dc:e647 with SMTP id ffacd0b85a97d-482f79f3328mr4351967f8f.21.1787895412837;
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:52 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 28 Aug 2026 06:36:46 +0100
Subject: [PATCH v2 1/2] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-1-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

The setup_cpuhp_and_cpuidle() parses the device tree node for the
interrupt generation block via of_parse_phandle() and decrements its
reference count using of_node_put() immediately after fetching the resource
address. However, later the intr_gen_node pointer is passed into
of_syscon_register_regmap().

Fix this by declaring intr_gen_node with __free() and removing
of_node_put().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index f5fcdde9750e..efccdd63e40e 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -409,13 +409,12 @@ static struct notifier_block exynos_cpupm_reboot_nb = {
 
 static int setup_cpuhp_and_cpuidle(struct device *dev)
 {
-	struct device_node *intr_gen_node;
+	struct device_node *intr_gen_node __free(device_node) =
+		of_parse_phandle(dev->of_node, "google,pmu-intr-gen-syscon", 0);
 	struct resource intrgen_res;
 	void __iomem *virt_addr;
 	int ret, cpu;
 
-	intr_gen_node = of_parse_phandle(dev->of_node,
-					 "google,pmu-intr-gen-syscon", 0);
 	if (!intr_gen_node) {
 		/*
 		 * To maintain support for older DTs that didn't specify syscon
@@ -431,8 +430,6 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	 * syscon provided regmap.
 	 */
 	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
-	of_node_put(intr_gen_node);
-
 	virt_addr = devm_ioremap(dev, intrgen_res.start,
 				 resource_size(&intrgen_res));
 	if (!virt_addr)

-- 
2.51.0

