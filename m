Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31A1DED4C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040489; cv=none; b=Mf+aTmOq4VCVr89Bs3843FX9smcR8yN4f1c830CqcTHpACISZD2PSgkp2J1SMmS1KA/NOWGOK//xuUnmvIghA+cTJlSFHPZ4Oh1ncBPZM/kyOfXn3WGjNFUXz4Ph+NAZ6PWxq2hjGLOq1SFNHkCjiBKqTTsZBCFKJFNnWxMLaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040489; c=relaxed/simple;
	bh=r9mqtQbvHpUswv+RMdbgD3FsvcrUibcGXabhqOtDVoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qiTbLeV8Xjh7WU51LyBYt+F0O8uJl27sbc3zt1lQx3Bb/WdiZixKW8dFyNBwECANoWs18wzIidh7alnrFZUizmdcXAcMCyphdyo7ptBBHDSywrgppZhJMUepVhi/Ybmz6zT/zZgN7P3zSL67ZSKSH8k4YlwfCPdaXOQJcX2gg4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySx4ajmI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySx4ajmI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4270a072a0bso560950f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761040486; x=1761645286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJuDFRRuSHDHUNQgyFQLmeRV65OPg6adZAytCP4ys0=;
        b=ySx4ajmIEzPEFJ5cQ0bCBG9oZAwASpUuu4zEZMceSFJD/ii3ke7THN6Jhj6kcnqEuc
         k/QlPtt9d5EaAy1RiqUm/VNI+rDfft2CvzCjkXhzK8OiIzs17QqHTNV039BLIrb3fgFs
         6MASnF7F9EE9Kch56y+jtYqsU57nrZ1w/bW+oWqprMp9/uh7zlVAqmAgl6V90zK1m/Vi
         RkxuGdEnKBef6J0zKNNJRBLjtd2A9M+MuqAV3zJJsE6dNAvXr6AVk8DcbmmW8mDxKXn3
         BvBI3bx6LWVsJid24MXspKKfHP27BTc3y0C2FEzfreoUtOgbx1p0thQFOsiAzrgw/G3q
         gUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040486; x=1761645286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGJuDFRRuSHDHUNQgyFQLmeRV65OPg6adZAytCP4ys0=;
        b=cfKU5jYaUb4Cw4x3u/gFs+x2iDOEpJFp0t2UMj6LEeGDuH6V1pgunM0V17qT4dey/W
         dC6dDQSQVjqXWDtgWDOFC1luRXyNRXBJ0BxQgsbMBycokdtydYYCvccUf2jCAO5clLwY
         Y3l3NS4LSJj9N24NDnYT2Yrn1XJK9gQfuaj76MV4x76V1Id2uxWAIebh9FC9+45L4rMI
         lo+SE7szkOdR7pv/lsd5cXCDlpibs1+FVO+8R2/0CcHZgW8R5BzTfDWMSbhRHsXuRO7N
         ICVjj0pSru1RrYeA8fyB0aiFUw/ItW5/G4e/CSggeQnsGkzbVhBEfTc/dRh2wZ3ZqnrV
         +rVg==
X-Forwarded-Encrypted: i=1; AJvYcCWkKngbgPBzXediKn3/v8Blc4l3whc7xX2P1g6teSOfKZawuWp4a5KPzu1ax4bg4pES9aF1au5pE5toYI6RG8yrNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzovhUSahK2h0FYFYh5sqQYK33EaOjJBK6ZGyxH8DnV/x8wt2Im
	2ZmBDUSucXGBnvrNNNyF4j/P1HyxZTPS+AC9e7TD53U2ldLwJOsfc9OoXKkcfCentp0=
X-Gm-Gg: ASbGnctOOhj/dpXRvnKxSuRF5rV1nUQOEBjhsLoLChsMdAR93nIsP1lBTwY4G35M4Et
	RN/ltzrG1SGducrBFZem/DIe7zCayeanZvMADcIAQQQUcuD7qaZgR1EjaSaEDshRSHbncNc6lfq
	T7ZoDb2fpHmHOLRMlgBdPz7PDZ+GagvmNTX+o+TdfmFkAkAtnEM2AY4aFDN99/Sfx661vyw6aOp
	I14BwUz765V/rtAmtoWDoHZOBB9BWmTD0dco9SzGP3neDWHRMH36C39EEpUcin4gW4ZFhwFOof3
	KGfLOyef+HxXIf/GzokC4pvZ13/I6XBuuGBvZM9NjSerszudXZpRSJjcsP0krv04BuFE8UGV8sx
	93oPVMBYeQke/D19qeHSl9cVLm3epvu0S+5/w92K7hiMtrmOv1WcFcJ8lkHpVCP+Rixbu+J8l7j
	OiP0xT8FNOnwKG7LeBMoRuWw==
X-Google-Smtp-Source: AGHT+IGWw71OlcYgXji+89JG5Sz0DKNTCPD0GYaCIpd2i/j7WhXpZlNWd4iMSirznEOwKDsUpO+ZUg==
X-Received: by 2002:a05:600c:6308:b0:45d:da49:c47d with SMTP id 5b1f17b1804b1-474941ec4b9mr10231385e9.0.1761040486310;
        Tue, 21 Oct 2025 02:54:46 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0febsm19491256f8f.6.2025.10.21.02.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:54:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: Update Krzysztof Kozlowski's email
Date: Tue, 21 Oct 2025 11:54:25 +0200
Message-ID: <20251021095426.86549-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Krzysztof Kozlowski's email address in mailmap to stay reachable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 8a19cb96f448..797eeb6aacab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -435,6 +435,7 @@ Krishna Manikandan <quic_mkrishn@quicinc.com> <mkrishn@codeaurora.org>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski.k@gmail.com>
 Krzysztof Kozlowski <krzk@kernel.org> <k.kozlowski@samsung.com>
 Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@canonical.com>
+Krzysztof Kozlowski <krzk@kernel.org> <krzysztof.kozlowski@linaro.org>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <krzysztof.wilczynski@linux.com>
 Krzysztof Wilczyński <kwilczynski@kernel.org> <kw@linux.com>
 Kshitiz Godara <quic_kgodara@quicinc.com> <kgodara@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 04193ceb9365..13fed9ee260c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16196,7 +16196,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-B:	mailto:krzysztof.kozlowski@linaro.org
+B:	mailto:krzk@kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -21165,7 +21165,7 @@ F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
-- 
2.48.1

