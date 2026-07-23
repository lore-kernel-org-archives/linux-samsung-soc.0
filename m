Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0939F448B9C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820595; cv=none; b=j8HN1pL1iYnenjRfBXFYlBCnvr0+WWUdU4oPgPx4CaUBNaN9IZbM+DNeRCAzyZqjZDz27AbdsiAIL84ZXv2bUt9OLIclRaj6qr4qVjNLxkHG0806cY7BjDIXnbpmorjz7F6pk2WiySRX+pLXs+mH43sRkMJaPx1CRZkfF0Nwhf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820595; c=relaxed/simple;
	bh=nY7f/xi5spwo7DlssABmzO20KeyENz5Bn4XAuA1GjC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiFd3pgmaOyuia3IeaPF/c8J2BTMqOiMpmYTZl5fg5KQIXc4A5Oc9UnQku8lHbTNnr4A4TQd4U6skyLvBcNyUD6b1OaTHulhPhYSJBHZSQEiU+qpLrRwhIF6OaidLijFgFs/YdP0GPC/rQNpi8F8/Sysj2H8v0ONgwo6QL8tRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BssekyzZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BssekyzZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso4552905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784820592; x=1785425392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=BssekyzZFjioSXV45QJkceRNhUlXlQ8iysc0tSeLmVidABUE0Lax9AdBmSOSomA7s0
         on+nyy4pyJ4PskHf+zA8f1jPkSz8rOdiwS8Ao/VKoBky2MrzQjt06yt0N1cWWc72bRh8
         b6e+IQabixV8yieZfVxIqEKFlakRGk/xGWzl/f5AfPgYM7nv/CDb8x4P4fIWUR+DjjMZ
         O0oedibfBkCOnYj/1Xhuww6OH8gCP4uxoZq5CQMJj0MD3ECl9zr/6j3ORg2ymMvumV5R
         XC9OTsagTNRHqns7zDyEVX3c84vdI5GZEhr2PhbxDmRpxTB9DIQuTOSkOYd03zApbRts
         7p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820592; x=1785425392;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MUe6DM8qKQE5dxOolqQrw2XXKMs3Lh0VGlvHRgfEXo8=;
        b=Va5w7frODIeImT5vGqfc4PDFih13py+f8E1XtKk7pwD1YGT0kSHbZj+l+vUdAdykFr
         hNP8Rhhx0/O8p7KYI6xgNZa8opO0FjDeMPPkTuKC3FsrIJ2RbiK5vOMB5srWblz/z1PN
         glRgAgmWMEC9aWq54SQBP6ww75F8LBidgloKRv12ro47zQs7txNnt3z7KnujAtCrFD5K
         8vMj0L0lkykdv35UYgC5M6BpjtLF68af6rdxcZnyYd/vw8K3tbhPqC4oEPdcHLLcd26r
         OAN+G3Nw6XaTLNsEl57kBii/RTLqYEMICi8mhK2fqyfqjsMQsu7200pROn99YLq5E6vY
         KCNg==
X-Forwarded-Encrypted: i=1; AHgh+RrGN3aSzD2rCmwSSUzqN+5Mlt2QADbGO/kmf1CsMPWOGNv/CgwbbOHLI8RWyMpRIZM/LELRzolGxA25zygAfJcVFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0bq2PbDsiyVlrIbpvz5+olbms3tcl6lH7ylzIclxxD2x/2T3
	Je0HbJzKIvxQLBKnEk9LsLEU5JO0+PUx62XPWpyK0OAz8qXi7dIwvl1rJT8qQT9Z2rc=
X-Gm-Gg: AR+sD11n0oWvIyJDE9Vz4dhckCB1jK2/hrSMiC15ja3onTE1cZ4DK4sJH1yFWvNtsl/
	ieUbP2cNRxKP/ksPT+yaOpjx22QsFrcyyj43BRWm+WH8WEsf2qUUALZSLBetxbKlqZW07p0Ntsk
	c6Yb2t/xCgF/u5Cyubc1ZXhDJ+tumgX4vjzGosiy+9Ooeetu/snrEGSs8COtXx2mUwaLAXukwq2
	RFNpwhoU4Q0rl9XflZPinmmiSi6lu1NC9jVa218FggAiv1LVt2qrkz9WeAV1D9Mf+7nfSeGrl31
	JOrATcHNipWpYWfj8bTKwcMI/O8jvRO49Vltif3sJOJrwsxo9shkDADTZ5mdLZly6irjeE2oWxh
	H+IJPAgaZ/v2ng9GWaPr0h5ub9uR7GAw8WsNFpgylqHui99MxEH72aBWu5mKiCkdC12qmuhVUEX
	3+r5m18wEAaHYZoMljQycLbK10jepT/fJt6carw79Bp9OAps2J5CHG6D9kIMqLxka/gg==
X-Received: by 2002:a05:600c:1897:b0:495:3f28:3f19 with SMTP id 5b1f17b1804b1-49573d21a4fmr26094335e9.37.1784820592056;
        Thu, 23 Jul 2026 08:29:52 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49574653f83sm36952525e9.0.2026.07.23.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:29:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos850 ACPM SRAM devicetree node
Date: Thu, 23 Jul 2026 16:29:45 +0100
Message-Id: <20260723-exynos850_sram-v2-0-c94968e52f42@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGkzYmoC/3XMywrCMBCF4VcpszaSxNZeVr6HFEmbSTugiUykt
 JS8u7F7l/+B8+0QkQkjdMUOjAtFCj6HPhUwzsZPKMjmBi31VZbqInDdfIhNJR+RzUuMRmkph7b
 FRkM+vRkdrQd473PPFD+Bt8Nf1G/9Sy1KKFE7a6qhdkNty9uTvOFwDjxBn1L6AoW9qw2tAAAA
X-Change-ID: 20260413-exynos850_sram-ca1200b99e82
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Hi all,
this is a small series that tries to address comments provided here:
https://lore.kernel.org/linux-samsung-soc/DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org/

Due to lack of responses I went with an idea to update sram
bindings to add new compatible "samsung,exynos850-acpm-sram" there and
exclude it from having child nodes and not required properties.
With this the node becomes a simple one:

apm_sram: sram@2039000 {
	compatible = "samsung,exynos850-acpm-sram";
	reg = <0x0 0x2039000 0x40000>;
}

The ACPM driver will just continue to parse shmem phandle, so
as far as I can see no updates there are required.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- small update of the initial commit message
  "Add SRAM node" -> "Add acpm SRAM node"
- new commit, updates dt bindings to exclude sram node to have child nodes
  and related properties, this adds new compatible
  samsung,exynos850-acpm-sram
- Link to v1: https://lore.kernel.org/r/20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org

---
Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      arm64: dts: exynos850: Add acpm SRAM node

 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 5 +++++
 2 files changed, 7 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260413-exynos850_sram-ca1200b99e82

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

