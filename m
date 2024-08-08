Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCA18FDD4
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128180; cv=none; b=h3200Ic3WBUVo0RYvnhmZfJUfpzdEwy5WrrpUPTwaS041HB9cMPSNkyc/4xDHb5Thu51emz3b4vXUeZzA9J906sJSv28Lqul7U/onHa2BVpYN4j6aAZI70atoBqeb4lukrssTTv/ozzTyjgum50Le3k6U1LfZ4rb2YOd0nSfN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128180; c=relaxed/simple;
	bh=e8jx8xmkdW6YnrISThEmwGeUauedgdSxxNVyoc0/+CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlgRI2bPVH8yWyIisXBktXOtSR6+QbBDQSH9TIMIVDGHYz3zEHZyvvq6aeecHwboi2fkufedtWB8kynxEChq/G4eKtnpfymV2ivdLF+n9iTPJwJO2yBmRsfiP9kvKD3ZiUduvAyFZF62aJ9QbM4Ent/RW7p7SQCkOY6UvXI1Eg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUTK5G3D; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUTK5G3D"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so138300766b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=FUTK5G3D5244foWSmIIoswonTq5GTDLn1JZS226/QDy0pMKAB9Ixl3ghbQAPlQE2rW
         VKGVfkwaM4aSV77HHRzCXYWUlCsMjBc9UpeFZptmRNfYmV5ilYlphDMy+TvsuqebMUEX
         +TM8p5EibHX/7FGfmV0z5WrRUN48TA0dlk1ZyR+RtdbndMVmDaprn/87Mwn+KI+ewavC
         hL+I3WB3uvJLehn/eBJpILT9fJ26Wh5q6V5DsU52wL2uIEuT48UiwFNQL0Xn3Lw18K2z
         p1Zen3+BmUUbmhSWVVW8QKQznZ817QGF344B8t1+yXOfChvcg13RE7oxypyK321VaHvw
         77NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1BcegJWI56BA/X7kHTU13cyTVS8Z7HSnW1uFBI1IcY=;
        b=IQHXccWPFIk9TprHVpRUCZls91vKzsvVgcIVg8/YEPRx63G/7GmviPyQ3FsYVXBCRK
         YAwBvnZV7oWX/MOiQS/BjvOSTiG2vK0i2CEINjUuXINLV9yEko3s5g35xj01kj308YSN
         Vg7nju4CK39hpu+7daLGxdPFn6qwogNs3+Xw5LRYYYJ0N5rddAwNKo7VhhgIUVqrQ1o8
         bnt/pXP9QT6uGbE43t29Eep69FhzkNCqfxGeuXZGNV4ZEC7pJHsv7Z1lPO7g/0bRDMhF
         WWfT5PH0DnduwXaKYFNktSQHFOeQwrOSruEHUq0W4U/iOk6T/6H8s1D/DyxW61r6T5Zt
         MuzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVz2ZCI9kPf/vNZZzStVNCmw80qTXH34OFmHGba84Dyvx2cK02Wb0SVDdnfYo93oWOtrjDK1rwKQ4ZaSNTRnw+spWyM1MI2gMDdTZwsx8i490=
X-Gm-Message-State: AOJu0YwxAgfY+T59sgw1fpDIFCQ57Z1wVvGCOAnvmMMVABLqg20K3ZPt
	jK2GTeWAjOJEg3CFuHBrIpmsnbDEVHk7i1cso2H9xP4Ptsbu1W/NlOIivIfe2viJ1peFskK5jqM
	O1jgnow==
X-Google-Smtp-Source: AGHT+IGEjPZ6D3mw9uu41eGOe1/9dd+KO47dw+ehD6I1DSyq5FPAseWCyaO5gOFwMq0QnQVKVDCluA==
X-Received: by 2002:a17:907:72d4:b0:a72:750d:ab08 with SMTP id a640c23a62f3a-a8090c32551mr185430666b.14.1723128175435;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:56 +0100
Subject: [PATCH v6 15/20] clk: imx: imx8mn: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-15-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx8mn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..af7f4c6b51e9 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -603,8 +603,6 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

