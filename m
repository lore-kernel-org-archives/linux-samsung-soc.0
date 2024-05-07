Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6AC15FA7F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  7 May 2024 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091289; cv=none; b=U3nPfdxusN0FGJxNoX11Ocsaw8FlifWsmBls1qewUJwMIfn/8ri7G1QMlfDG1gyB5n1DNrCaediz3B4myowuJZPYBAiCV8jPBKJwfpHQ0phyA+Wl4kaViagOIkimrBPxqB+UYE+HUjP6kUgGVZxHmieigIgrBoyWLDDGTrM8pTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091289; c=relaxed/simple;
	bh=Pqdbr37s3eqaIoQ5CSmZ2Yuk/GO+mHLRpIesgbXMwU8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OSkiV1mXDxfILpRuWFa25HjZtSTnCN+HL2OM9m8wpNy40iJGFEnQnE5a43c26/5FYiCc4hmT9RXfPt3IkgQhALXYxuTYexpegOXuLAcE2GRT1xj20GTPpKeyQa9mqVAnsQrjM/XwhIC8VACcaBAlkgNSIqnITyOM0T9zax/BPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPEvfYVx; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPEvfYVx"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59cf8140d0so552342766b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 May 2024 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715091285; x=1715696085; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iDIa9UU9YohRPSME0x6hMsrK0cAAO/SHuOJTAMlGZM=;
        b=cPEvfYVxcBrXXS2Ru9wq+6RVz83XTajiNPDCAVxDTvN9nHLkma5SPRHj/QqWyuVxH3
         Sq8Sr5hwlZCk9iMZ8DnZ0NZrBehQ9Cwx58QaNrRbd962owbzd56PStBWp57E1K+Ei+hM
         BgKQTzPULhsRDEpFGDQSPiSIGB9MM59SiGBeE8xTZH3T5E3edJGO+d0w6obBTHflBwf3
         3DjNEuOGxM9Dbqtw7slKvk0tW8RGZ7nBQeeMkIiYQvJt29PDUL8QM2q/UCKKG9FaO2Sb
         32Z0t8EOE4Um21WEyw/jE6iTs1TzmNFtLAOSRwluAVf8R8oJcQiM+nyZHOOn+MNORLpZ
         mNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091285; x=1715696085;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iDIa9UU9YohRPSME0x6hMsrK0cAAO/SHuOJTAMlGZM=;
        b=cpp1xpxd/UT+vWMNdLlpRAp2oB9FNcmYdJpV5U4eK12ms2l1H6HAkrYZ9qXm81dXFP
         KZn7cqUbc62yKs1+WJz0EiSTCn1nh1QeMXgYGGpTJTsRXhEWzF5OGtRGZ1F1rUPCpO88
         a6ZUB7+l/5ZPZS1ab/4/7Nh53EJEbL7mOxBK7dXg+RD/12dQ0gwST6OvJBSVNi4tSiGa
         8GjJw5N2tuLwVN4rrvXev/GPZJa2UHwZDLgyPWu7z5+Z4RBQ0lxeu8ibQ1P7q7Y8ehKJ
         Bfn+MwP+sXBU2AgeUHAhXq9faOsUD7dy8DFlWwOgeYEhKwDiFYhglkn5KMwH3T8g9Gdw
         Dzgw==
X-Forwarded-Encrypted: i=1; AJvYcCWPmELVHzpW1t2gLKO+s8i/esYexKnENOYoddb0qoBVSGzkAJHNd8ILLrI0QOav90KHWwH83J7vT572xd9Jisni6yciyQ7oFCBdUcFgALkNqvY=
X-Gm-Message-State: AOJu0YzGKK91GBjxuGVhyElT8w4S/123IPr3IwS9VsKr5L5bxvraXwh/
	zJziL2MQClJoXLCS3tfJeRqsPQCCo66uMlWkfoyNu0B4vIwbeVBgAt2Jgppa+74LIfntg3wNnrA
	33pX43Q==
X-Google-Smtp-Source: AGHT+IE/MwdnFKw9M2O7xyKn7PZzuL6h8QMv+vTzlYdiFTDL2ZOu/TBbmPYlhs0qq7EIgjDCRx4ISQ==
X-Received: by 2002:a50:cd17:0:b0:572:9962:7f0 with SMTP id z23-20020a50cd17000000b00572996207f0mr8054362edi.34.1715091285631;
        Tue, 07 May 2024 07:14:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id x2-20020a056402414200b00572cf08369asm5621928eda.23.2024.05.07.07.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:14:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/5] a few fixes for the Samsung USB phy driver
Date: Tue, 07 May 2024 15:14:43 +0100
Message-Id: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFQ3OmYC/x3LTQ5AMBBA4avIrE1S9RNcRSyUac1CSSeENO6us
 fzy8iIIBSaBPosQ6GLh3ScUeQbzOnlHyEsyaKUrVasSZdrk9A5PMXisD1q+SbA1rWmaTlk7a0j
 vEegPaR3G9/0A5w1wPWcAAAA=
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Before coming to an agreement on my Samsung USB31 / gs101 phy changes [1]
[2], I decided to split out those changes from that series which can also be
applied independently and add a few additional fixes I had lying around.

This contains mostly cleanup, but also a change to using fsleep() as
recommended by the timers-howto, and a fix for setting the ref frequency for
E850.

These should be less controversial.

Link: https://lore.kernel.org/r/20240423-usb-phy-gs101-v1-0-ebdcb3ac174d@linaro.org [1]
Link: https://lore.kernel.org/r/20240501-usb-phy-gs101-v2-0-ed9f14a1bd6d@linaro.org [2]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (5):
      phy: exynos5-usbdrd: uniform order of register bit macros
      phy: exynos5-usbdrd: convert udelay() to fsleep()
      phy: exynos5-usbdrd: make phy_isol() take a bool for clarity
      phy: exynos5-usbdrd: fix definition of EXYNOS5_FSEL_26MHZ
      phy: exynos5-usbdrd: set ref clk freq in exynos850_usbdrd_utmi_init()

 drivers/phy/samsung/phy-exynos5-usbdrd.c | 95 ++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 40 deletions(-)
---
base-commit: 9221b2819b8a4196eecf5476d66201be60fbcf29
change-id: 20240503-samsung-usb-phy-fixes-8b8b6690ffc2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

