Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E421A45D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526800; cv=none; b=Cd0vyq5AyqYL4dYpBhiKJj6hUsmbzcKfvxv6pntPU3FZ+o9O6EgyJ2FBNnPnLsnoipNnkb+MYm8wvLKu0qmhz4QqGsjhQFcAfVTMaNlEU6V+bSoVqHnSAL7caGUsXttRd0ZAFgaISBsKS+lHqFPC318MEozL3LT6cs+h2M130R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526800; c=relaxed/simple;
	bh=4QeWTXypptQJXSP2hw72WicyVT12KyhEiOJC2dhD6mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPZU7dwdvue+E+AyZMzlzxOH0SMLOhj0rU98EpoYAsXkMUeLfq2yNqXuKjz3MEETyXi6z6lFjKexh2t8MvfCfjEg8O8aYrQGXqQ+aF8pc83/TrfXHR1r1hqvdcWM9LQzRFJLySzMPLZy52zhfWOAaPeNWp0TDbzBfLbg/d38c6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y2yYW7JQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y2yYW7JQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39d94327297so173538f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2025 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745526797; x=1746131597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idgVGL6g4QaZWwBvT7pD7vd7IkM4X5ShmrP8Se1lMVw=;
        b=y2yYW7JQUyirdQS3zK7xAjyaIl/xp21D351k7p5bhQjnHgspU7DI/RY50jXCYpb/In
         WM/W47bfdwJi7j3UQJIl6kf2FrNaKN97OkICpzw0QVH3yMFHSN8AMxm1paqDuU6S2Yyz
         06ijdj4u87+27maAS1ZPEz+Wej1HrZU91EEslcWWb3+Ryns1VtQKzvC669JlEn6cwlYh
         njVumXc+tkwBCmQXfHPRNHhbyLZDF7EtOH+z1LomYKMxUkAr15wzloF+tXkzozS9jZkp
         38/SsLJy94+R5h4TMP4RsYerbj+a5gsv5ahhlXZUMSRCSZMx414DL7ry3CQ0e8xzcR9k
         lRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526797; x=1746131597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idgVGL6g4QaZWwBvT7pD7vd7IkM4X5ShmrP8Se1lMVw=;
        b=vTag1iQ3rOtt7Vdp5UMA9at5AFlakiq/yos5joGDkt0FGmDMI84oc8DzR+BT91hrwP
         T3FtKCkyhUaKu//alG/dNWQKpqiI3ayrflZ3LMPHFHZCsDvUqyjMiqPj87PEceghxoW8
         YDNsYXYhsoXE9LZGnAXLJy7pSF5ZqZvdkJnuUu5AdKwLW8I7JWK8/N+YXBO7ZjODIQVA
         YevKzedktX3u3rIhNEJFcNAvXwp0H9wrfHNSA6G9snIYUdRFZoCzGBIYyxYDdlhRUVAk
         JCgQSALmyPXCm5cQeUbdDDhM+7zE0I5xqCWpIdYzWLbf2IZ2JqrlVYZ+hOqs/OYKbwC0
         wGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoAMYzQm9xo/WuUlbDD07XgFC7XQ6rNTXJfeKyB5XNEc59+fgLmT1hRSm2hHqTjUQWKEQOFgA4+n55NRPOR+C/ug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kuuiEIk/846/vJeROORWgbVe6hk4+3XUwZwhN3dLB6wudLRH
	lwEJ8f3ZMseD8Ym3E51BFMz6+PKiUh4WrNEFuChn+hcwXSj+lFcP+m80y8dB7W8=
X-Gm-Gg: ASbGnctIR4HbA5MipTu7UIzT2SdGR0VVS/DgkCpNbMS0tVjqYeroKSnp+OjZqaeoOiC
	97Yvv+QxqQNdSTm2AlgnmJ8Lznh8VJciGgnwVMU2J8tqStkxxDoI77EkOUvLohiZgMdsCK9Go2Z
	BWX6K6qqwPFrkdyRG5gyy3m0Q1JZbXN3icB+u3mno1BLGiExcnjzeVQsDTulHFjaU1Qm0Adp2Fe
	7MceasiaK1cvdtkd8uCqJ8V40HYFdekwGiIGCjkEUCbdcnDjlCkiBmWjaCEnUj3WxtzCR5ctD5K
	c/EbOGd8IssNdAyIWPONSJ43iwQ1Ao6POVwkLZuTtfd1wWHfOw==
X-Google-Smtp-Source: AGHT+IE5Mc9hxBHCR2InV+3GYjWm+yX48MSznxSGfJQ+nJnypxIRQDaL1uLviaLHAXTFGuG4bu8Mbw==
X-Received: by 2002:a05:600c:198f:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-4409bd77f64mr15358405e9.4.1745526797180;
        Thu, 24 Apr 2025 13:33:17 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm797625e9.33.2025.04.24.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:33:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
Date: Thu, 24 Apr 2025 22:33:09 +0200
Message-ID: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=4QeWTXypptQJXSP2hw72WicyVT12KyhEiOJC2dhD6mA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCqAE1H7molI2SrPDwvMlO3UDSVTRVDm+gevDd
 knoDzWIWGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAqgBAAKCRDBN2bmhouD
 11FzEACRaBawm3jRXDBKOuAGgA7XIz7w2537aCM6EOBi6nKWKvWSPJeGtPKK+sAXHBvWzom7pxw
 pdsqKgUW9MVmcs6W/nIUTPKdyy78eyx4luOQLpXbNjQOTY1qoxUWJvF4Niwaj4oqlobww//yOo1
 0sQs0QbiLddmFdBjNdaLj1pPG2ojQwnsfKZcfS2G8IXqnc6EYKw75xkwoazdQvrdizqmJ0C32Pu
 Kcb8qYpr22iEqmc+rpKZhGoz7Pe0MSJlYwNuMsd0JhtEm0geN2l8b/bmqXrNGNKZ+CUbjPKcldJ
 ad9h6C2syO0/kA8akIOy9kM0VPb6nDup8gqmxVHugYGvVP3gc4R16BNMklOV3GU0f2+BKtmAHOh
 f0EdX5gz14N4wiE0Q2gWaNYRxdORLjPrx1MiJrnL8E/8pE1wB0K12jIKIrsaqEN5B6hOpkDIbno
 jE7+odrH+wztsqozQoDuzPhA+Wn/eRpfwSRNeb691pM2N86mbE6UDaGEpzFG5OJZzEs1URFPMUe
 Lr5k+RH6GmaB3TpoQMjoyACrwkIqglxwZAoFb4znIBOH7jtBVKJ6fhxD51HXH4TVS2IuqcwCuXb
 B7+L3G37ogeJzckbACLv6cRtBxByNsMZxrxhv3NekNF6FuCpsmhQqae5r3GM3YDSxbdIa9NyUUi gXCBG3mKlOq5AYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
prototype:

  exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
  exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead

While touching the lines, change the name of device_node pointer to
'np' to match convention.

Fixes: a8dc26a0ec43 ("firmware: exynos-acpm: introduce devm_acpm_get_by_node()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index b3afb2069fd1..e02f14f4bd7c 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -677,20 +677,20 @@ static void devm_acpm_release(struct device *dev, void *res)
 }
 
 /**
- * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
- * @dev:        device pointer requesting ACPM handle.
- * @property:   property name containing phandle on ACPM node.
+ * acpm_get_by_node() - get the ACPM handle using node pointer.
+ * @dev:	device pointer requesting ACPM handle.
+ * @np:		ACPM device tree node.
  *
  * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
  */
 static const struct acpm_handle *acpm_get_by_node(struct device *dev,
-						  struct device_node *acpm_np)
+						  struct device_node *np)
 {
 	struct platform_device *pdev;
 	struct device_link *link;
 	struct acpm_info *acpm;
 
-	pdev = of_find_device_by_node(acpm_np);
+	pdev = of_find_device_by_node(np);
 	if (!pdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-- 
2.45.2

