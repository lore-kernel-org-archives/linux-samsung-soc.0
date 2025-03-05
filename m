Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1617E2620F5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211071; cv=none; b=FUrUCyRFVLoZHmQ4FEFhqr1gAAgTeHfXYvoTESwH+fIYtvLzmYJeuS7bKq4riTO0Ry7saJsTC8lm8yerxoFldvJGeacx6O0NCXKU09nasXf6M54caRcrwXxIvG9UbZmKJ6bJa8PE7vkJd+LFi8+F8JbUFNfQ3b8zbitD5qySGHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211071; c=relaxed/simple;
	bh=89/UGmIYFussasYTXbt+ZbFvalxApAT1GYVTM6AOduE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/qLo2xeBC+P03og5AwqFsIywMWvxPNxhbtYobcvM+8fqsikL/r6xAk1t6y8ekKJBzd/qocM1LKx7oSWtBgqB1iw22E7gA+EI9NUm4nvuZphIegTwMpydXA0lPx9oNJGbExhj79LzsMwrEmjuFytIc1o3LCNlPnxTsdOhTPX1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mULAfheX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mULAfheX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394944f161so8937495e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211068; x=1741815868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvJR/UgWbB0Y95dY5yTGqu0cAZl3JQBaXRQjPSUU2EU=;
        b=mULAfheXT0/Uo3VTFu2W8lYLzmLLdYz82cmu4yUFiJjsIWq3kcOB6joL1YtmADo57x
         i6aJiOVSV8a0EAyY16EchnqWyar/X7sboked1WdbEUj4O+BmXA9xmbzGW37v6/by4CfW
         /uRJSmSYAOBauI7AS0bBJDfi+3cDE72xNnI/5YRmx30E/pjGpkPvEnkQo8yNSqrw2yzo
         sCDIfDSbKtjKOKWC4PItyPClGy8i3mMdx8XQM+PxRGHzsdzkoT9ek+69JPVXpuiNAixb
         rJyudaAbWPlG3Y01+8yg+WS8FEv6rjoLDLTsl+kJY01FQERPgspuae55C4OA86G/F2vL
         nYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211068; x=1741815868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvJR/UgWbB0Y95dY5yTGqu0cAZl3JQBaXRQjPSUU2EU=;
        b=GEEznfbiCXKJYX7Y1P9QV8IUvYkPO/K0GK9ntU7IgqGxRDNrSDRbPY6I96Opd7tppj
         EV26NgsncZ5U1yGONwCWuD8lYGB5bGaJ0kCYKOIphZkkbSGHjzr2n3dl4aIJcb/0Q3Q9
         VaYg5bMrqPGUZoiPH3Drn7UsSAoNRYhVkqIv2TJmVyEbeHniZnUxixS+yKM+Orxo/SF2
         ys7gN3l+C8brCtwgZY+C1rkmzx3ttbilQrtXWBzrJZD0ZAS16P10KGnerOBoYw8cBHvh
         0Wc6wdLe+0HTs0OYXEJuPL4R799u/VzLqLYid8P4Kh5wYoK28/r4VeKHRQBFGZSCMGZ+
         kvkQ==
X-Gm-Message-State: AOJu0YwHzqwvvPDuCN7xSFkyJdkoiq3ZXEbl94Yo03OjKkCNtuR7ajCI
	rgHhqDRp7M2AfeF8em7e7HNXRltEMNKxjnRe4XEEcj+JFeK09mD6gxo76e2lkLE=
X-Gm-Gg: ASbGncsLu7k33Myr0keHjm9ze4qj3OKGbFAQ7DLlhDVYl+WChFVeDy3LGugyfeA5ipH
	0wTZP0UVYZx4AZeN5Pm8mebazXrO0lDIZB48zh+a0GOheoaOeY1iqx+2XRak3sMp/mMBmL4wWki
	n/YfpCzztzGD1mcMdsMdz+iPwJ2HuBzuRxgUxcQ1Xwa9eE6skp+KR0t0LxNKb7JFxJMI4iOpkMb
	qm+PnlvLjDJB4uQS+bp1kLrkPgpoxUu7oXPo7tr4ra001H/L6XRZzrY4uhOtl3niiM7X/FXvUf0
	r7pUoNbDlGc+SuC0Z0x4Da+nNJJU/mxS7rzrsWxvU8+KP1biyhTzuo7GD8O0
X-Google-Smtp-Source: AGHT+IEfiEgY/qQPsjfAHwqPHWvUio4LKVVsu3dARLFG1Me4Rjq1M/OsmWBaW45+uUzbWFMumgrf6w==
X-Received: by 2002:a05:600c:4f13:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43bd29cad91mr16171735e9.6.1741211068217;
        Wed, 05 Mar 2025 13:44:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:46 +0100
Subject: [PATCH RFC/RFT 11/12] clk: samsung: fsd: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-11-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=89/UGmIYFussasYTXbt+ZbFvalxApAT1GYVTM6AOduE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWgWFJDkVQCc1i+yhnz77KxtQ1OR5GmvrUN6
 SM+Gw/BWNeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFoAAKCRDBN2bmhouD
 16FCD/47aZXBychgEdxYVzj4yl6nWtAn7j7AgmJ19ALj4jYRy7GP98BquvEZ/MwMqJWmGuRqI38
 w68R1AeEt4tGnzHAbwLWC1j6aHlUYHJQEKFdcuSCxNqcYz58kednws3q2nlx/lJK8L3H4EbrRN1
 cA5eaX94yDhniAi+F6+c3eF9CKQZjppPlt+Xvkkp5+MKXRi7088qfarLELdHzHS0pkhFfNfGBd4
 ZtjQQFwh3ihgXlxL2ldzAOaf3ZJiDahHSE3jbSwLNc1FwgWmkwk2G5uHTrmBZfQXFEZNpgea021
 ZPH5JvpmFDb63GD4oUaqpKB5LwEhGWqyZyezrK9Z7wEyZT/0N87YWV98g9RgcOn0AHu57cU+kGB
 UoQXmHtf6YrLMhGxEdtZ+lGX3dqeL0Uuqhj8TaoAduRNHmZij5lBQjr1MQbC9sThhJKoEnJK4KT
 d+R7LYdGdWFcpUY0Wfflbf+43xkB0vsf2v7tD7nGedHQwNIS3YxctxaUAYkBOEsJJghHJd9xn4S
 CZNeoJaJimg66/qCwMXQwPUsU85qbAccdoiBn1pJznVrzQJndUdMrUaK+ctWfhIKlNURQ0L9tPC
 QyGmbRa1G3T78984UC65tN5neyDkVCzYj/LctW35YEBODWjaclmdfw5FHn7XwZ+sZakK3dZU6tL
 5v632bqkGzWCMtw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-fsd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 9a6006c298c2a80da0e29aeca3b09cc827caac0c..bc0287c780bfe3a68a38f53f554440b3000b1ca7 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -1794,17 +1794,16 @@ static const struct of_device_id fsd_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver fsd_cmu_driver __refdata = {
+static struct platform_driver fsd_cmu_driver __initdata = {
 	.driver	= {
 		.name = "fsd-cmu",
 		.of_match_table = fsd_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = fsd_cmu_probe,
 };
 
 static int __init fsd_cmu_init(void)
 {
-	return platform_driver_register(&fsd_cmu_driver);
+	return platform_driver_probe(&fsd_cmu_driver, fsd_cmu_probe);
 }
-core_initcall(fsd_cmu_init);
+subsys_initcall(fsd_cmu_init);

-- 
2.43.0

