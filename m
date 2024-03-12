Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B913C9D7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268280; cv=none; b=dW5aKhDNTOMZ3HmXzLiSmtOzVAMiDaqDnSXirJCNz44r3ziZd5a2NNS/ykJTPT6K5qSxVon9pIgDwYWMEzO5atWNmps7QjHqYPZl7PBLu9DaKNuOA6eQlulAYz+O1nEBwfMWqfmA1kw1mrImUXBcjWlmoZyw583bETACIbiztgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268280; c=relaxed/simple;
	bh=jPRItguT0rR1AOyh1nLuIc0iBEuYZWXkQuC/EHQ4T74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+U+uBvGDvXPLppT/BaNiDOLpqlk85arTOYnIKgFsuR3izrj3Dwmi0+nkGCmsMBhhDP0celENI218CCFXSsPpgLIaE65cyNyWqM0vR8uijpeGsGwsb2pB2kHMsOL2ghtPK4TbjmgxBDyEQPUMMLNpP5IKEa2PfI03CucR+ksS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ci8DnB7L; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ci8DnB7L"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513173e8191so6215793e87.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2024 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710268277; x=1710873077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svwNxagQwUw6dGin/+/wtaDz1N/51/WVJ4l0bjMuiYI=;
        b=Ci8DnB7LdQ9i4KhW6/SicTb7YrO39XcBcjFoMgPHZ2rdygifsW7TLLikk5UuhUw89J
         7bmZyotI4oC300OPwV4H7XhOForXKKmZfYRN3oCPo76wdBzCri2cjvy+ooZ5Cdcfqd42
         kvkTsf4tb6Rjj6bq5VWWQaPosFV018jh/ySMgCxz97rHlUX33FWPlkJnSM/L13c6t76M
         WlqTp/cMgR7YQ8v7PRAyMx84Y/pRldanJ+lT5Pq+91mkOVYaivmu2yPvx+x9fShoQPzv
         gdkpDWr9C7m3LoDIZPu1Wn9SXqVVabfBRtt5e5pUfwiFaw8YGMfrIxXGKQAzjoEPoz3q
         W5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268277; x=1710873077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=svwNxagQwUw6dGin/+/wtaDz1N/51/WVJ4l0bjMuiYI=;
        b=sEFB2w6fUX9nPnUqDRLAVcBdBZLYT0ee00wSRGwdFbpEW/LW+Su6Ovco2TK+BsgcAI
         VedI+knrXimDyfsN9ivDMg4gLcP9GwTdmAvv6QRnhmQoZV2vGnKyyZ3AVIzKUSNTn4mp
         s0/4vp0oEEa1W3RpugcSPrSZVBb82ZS+cQnETloBS3w9o7VvqQIvPuXYGryhF+6wdB2j
         y0xhZ2+vaDE+8XAZVf3bwlunRijupOZoNZui9uxGJ45T+LFIxuSINBLXUWHryYjdCZ7a
         7gfJtL+Nt3t9Qm4MHzcuChU3736usKbgZte9CJt4Hz8Gx3CeWeihqlMr/GVr1o7iK0ld
         hsVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0IOubkQt0UbyGsu5mNp+6yPqPkhpXm+Df57ScoMAUmmHSUX9Ys3Sog3UES0uFGzgwBJpoi3w0GF2XAdXBr97Vzr2lEM4xULz9OJxmeq+ghNE=
X-Gm-Message-State: AOJu0YxmhDOaZWojyNwzzV11dIUmCUmxFhhBpviDXs5DiYINbTDkrVBZ
	fBTyG9A4Hlb0sHDxjNpt6oLWuHo4LuHue0nZNXFex1j0ftM/9ho+LLDz9zBb1Hc=
X-Google-Smtp-Source: AGHT+IEF10AZsbMENd7cz4Aw54PnuDNioiumgrU6CGWMx3XlMQJdOVqhqLJjtt+YrwpVYS26zPiP2A==
X-Received: by 2002:ac2:51b8:0:b0:513:c1e6:3c54 with SMTP id f24-20020ac251b8000000b00513c1e63c54mr723525lfk.11.1710268276944;
        Tue, 12 Mar 2024 11:31:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512060400b0051329001f53sm1661012lfe.54.2024.03.12.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 11:31:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Abraham <thomas.abraham@linaro.org>,
	Kukjin Kim <kgene.kim@samsung.com>,
	Grant Likely <grant.likely@secretlab.ca>,
	Sachin Kamat <sachin.kamat@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ARM: dts: samsung: smdk4412: align keypad node names with dtschema
Date: Tue, 12 Mar 2024 19:31:05 +0100
Message-Id: <20240312183105.715735-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312183105.715735-1-krzysztof.kozlowski@linaro.org>
References: <20240312183105.715735-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DT schema expects certain node names, as pointed out but dtbs_check:

  exynos4412-smdk4412.dtb: keypad@100a0000: 'key-A', 'key-B', 'key-C', 'key-D', 'key-E' do not match any of the regexes: '^key-[0-9a-z]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
index e16df9e75fcb..c83fb250e664 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-smdk4412.dts
@@ -105,31 +105,31 @@ key-5 {
 		linux,code = <6>;
 	};
 
-	key-A {
+	key-a {
 		keypad,row = <2>;
 		keypad,column = <6>;
 		linux,code = <30>;
 	};
 
-	key-B {
+	key-b {
 		keypad,row = <2>;
 		keypad,column = <7>;
 		linux,code = <48>;
 	};
 
-	key-C {
+	key-c {
 		keypad,row = <0>;
 		keypad,column = <5>;
 		linux,code = <46>;
 	};
 
-	key-D {
+	key-d {
 		keypad,row = <2>;
 		keypad,column = <5>;
 		linux,code = <32>;
 	};
 
-	key-E {
+	key-e {
 		keypad,row = <0>;
 		keypad,column = <7>;
 		linux,code = <18>;
-- 
2.34.1

