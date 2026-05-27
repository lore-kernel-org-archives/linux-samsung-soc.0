Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C128D8DB
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779916140; cv=none; b=odFYS8x4YSlZInuGdPlq88goMPDQ4xIZvxnwqzd0FbwGoJDh5WOKWKuhIbw01YQndtHgV7sevFH93tnSwg2he8n5Ne80FEVRG6J1JTdZ0IFatnAjVMjwsK+MGBS3cbudXHyds92PjHZlAvR6hvQtRAkTPi+jddS0BJ1387u2nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779916140; c=relaxed/simple;
	bh=j6wFuV9ThpOiYYv2+F20SQy9uhrC4cWysfOvCPDsdn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u3MTa9HCGdEWopbT15bku3/OEdLbPWYgUvNvbadcCUY12flxvDJFJfuiRfYvUd0Wt76PQ/m5TeDjszswIFNvSY/O565Cy0nR853iT/bSnv6gXts9d6Kc5uzplh41RuCWnXj5OkphQcM/Nn0bppnoqtLvwSHEYy4yBGdtxfarOWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za1OI7nA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za1OI7nA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso45322955e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 May 2026 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779916137; x=1780520937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=za1OI7nApO8qrcrKVgaNRYA/rhCmhytxvsFuK+utVti8NLC4g2ubtvU50zCxNYM6z4
         es2/eY4PZe7WLkMFE2dOJ4jzjYn3OJAmrkAncz6/fvV/JAviIp6gDVwYYmN9UyomSACY
         C3t4/5S1k3XTBT3EPgLV65wEsg40w1sA03FS1X8zUTUw7HmArEJsLqpiIaK+6/FOgaJW
         aw+Ic7L3vyTBe//3l+wmhnONm0WjWW6L7KRZP3TXHdpfK3bszKxtQX9oJNgtlSanHqSg
         YDUpiD6UZWe2T++utpu/nqTeYN8xSA8HeGF8+XcxvMoVJwrBol+9C4gzx4R2uGiHmDtQ
         1Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779916137; x=1780520937;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwGOVfYvO201sEUuE8/pQvxXnipLjm8iFFFY82DZt50=;
        b=C3KJpwvi9aqVgsxwgJFPRYmozQ4mMFAqlbFIZkdfVKm8V7W2s8pKpx70iNu5KsRmQH
         AtLT5+8Rg5WC8WMbe8FCG/0Ze30Ojf9hPjEOf49rCzAs6geYXvd6Bv5IZ5w3J8/5if/3
         SO2422JbxGxoiCU3TK7GYvhAuyXCwnjA9m+880Q/pnpSj7trsrGVqlyrSdRNxUKnTBJF
         mXtjR/8Tv/Zi/EE4oxxo3zSOpNzlmBvQ4CwNi9lguQAhFHEkDOs70NKCAbLMbuWjSI3/
         jcPpT+43FcajK+iXOEGZTCUGyH6rOxkzyC7bSnAk6new1NcU8LWOsM+JiZPkY0ZMJwAQ
         SapQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R58eAvefDNltobrPUlSJzwFrp/1X9qymJ3uDXAzJIDoWDNcH3VAFEDBRuruY9nGPnFQFmT57AlTTHPxciUI/cQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDisX2LZKjtfcxkAj1FsaOOV9YUlUz1L4mWFQDrCb7BpGwX2G4
	MdhlM9Dc6uAwwI3+Udq1qveBNiZwcxitKhDZRBkv+BmUKBcW2w6WgsIMMjsgiQEp6xE=
X-Gm-Gg: Acq92OHiilsqQ2YvyN9eHUi3DGF4AjLBiyl93k7Q3Opb2c2cXkRdgVCKJwyM0Mv41Lu
	dz0cJDilV4WoBNe48e9JI3w/Elj6OSxDawlp9fwPSKOzNHfkXTr1xH13c7NyVPEPLzsTxD8hx2o
	udf/KobMOCoNWZsWm2hDIixSg7f13eDIu/wyvzMCfyBH86f/ikeU/Aeb0phO8+FFPGujOr43ZSv
	va69iCHtmG04qXoHwI8DHspia1wd/TEjfoZJWXV9FKtWW0yxh4/ibIxgxqhKFRf8HtoTdGaEUAc
	v/8mtoDGDoNDwNg0Qxn6LpsPXo5qBaW0xnU6InuP2GDmIStZorX2sWTWmFH5vrkiJ1n1WBZGfG0
	7uB1WCRU/9BthIfupvOTRW0v273DrNB1cS6DcIlfez1ij6AB+7Z3pDJcroGwuIxGzqTdyTQWc2E
	NJNmN7q7UbKMC+rvnWeKtf9K7dmigk/Ky8KO0j6dPVX6djW3hHsVyWWwh5iZzy91KNkowHsBqBE
	e25Ug==
X-Received: by 2002:a05:600c:4f53:b0:490:7136:ad05 with SMTP id 5b1f17b1804b1-4907136ae08mr166302985e9.31.1779916137581;
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3124:1301:985d:3d5a:fde7:e337])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a2a7esm8894393f8f.20.2026.05.27.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:08:57 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 27 May 2026 22:08:45 +0100
Subject: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF1dF2oC/x3MQQqDQAxA0atI1g3YOCr0KtLFqFEDGiWxRRDv7
 uDiL97mn+Bswg6f7ATjv7ismvB+ZdBNUUdG6ZOBcqrykmr0uPhPR9xEu91mXKLonmJDClwThRC
 GtoA02IwHOZ55872uG8KlVnBsAAAA
X-Change-ID: 20260527-samsung-pinctrl-maintainer-24e722444fb3
To: Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=j6wFuV9ThpOiYYv2+F20SQy9uhrC4cWysfOvCPDsdn8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqF11oeZy9qBNJRm/bBBlN5oqdTNhD+u/OcJlpE
 7nz7tJGHqqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCahddaAAKCRDO6LjWAjRy
 uiezD/9RiQ+SU3hWpIFufpXvMquOn7fTgIPsWh1qTpvzmvn//E2LOCyUwHfpvOvpeTwe08c+H/H
 s3L8f/MrClZ7biqYXvxf8uWRfjL8Nc7ww8pcGc82wc4e2pSXumJsjiZl4hFcFaLxVVTB94Kovko
 GRqVBSSb+UtAA8dFfw47sguk9M5t90T7F/ixhn1mkAIXBy2RnQVV2QEXOu6wwkgzOp6faciW61J
 N9ATjWPukTOci3t0IdgF/tN2p44ilGsBTyqgJTqRXJ2wXZ+huHT6VNLj0YFYL3wdAXThAsO1e07
 iC/aVY6FtSJ7GGV3GkL5hPu7dhdx2pL6Jej7xOwhyFHEgrfH7Gq3Ye56XHyNkGkKPbkGlM2yTjN
 lP1bGjKwgDUbtwpxJu/awzKYN4lQWXcFuxZ9TScje0CAZECK2AamqT7M5RWCRfhJLMoT4Y6UMYg
 mdRmns+ysMHYcHG95Qw7q6VJh0s0/H0cRJVYJjakrU51S1zPVez5f+iyed4Gr4GwtNbGsjG4vZi
 b2IJfG+w+ABeakd9GrFWdNSx/raKFbLg+KdrvumftVEwpuG/DlVcUEmzZwQRH+nBaZt7n0XLtZz
 sabWY12UGFj49Bsk7+nfI4S9g2NHieiSeJkgntWWiFp/6Bgy6uVjRLALxLP/Qo1ujL+/Ms2PrQX
 g5yRRYdlL4yBTFQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

As Google Tensor gs101 is based off a Samsung Exynos design I've been
working on the Samsung pinctrl drivers and have an interest in helping
maintain this code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
This follows discussions with Krzysztof about expanding the Samsung SoC
maintenance team in the kernel.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..69ad1913a9f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21298,6 +21298,7 @@ F:	drivers/pinctrl/renesas/
 PIN CONTROLLER - SAMSUNG
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
+M:	Peter Griffin <peter.griffin@linaro.org>
 R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org

---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260527-samsung-pinctrl-maintainer-24e722444fb3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

