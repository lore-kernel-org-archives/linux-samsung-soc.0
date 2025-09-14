Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5EE248F65
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757849390; cv=none; b=ArgkY2tPNaP+UnQTwMLeZeu/ZK9bi4hJr8o8cHjRgZPOhzqC8ELlXnNKNbpIklgI30lmsqSoOJ7R1vLhvhMGWiXTOsnKNxHjPOIO8Rzhkdj7vNPwJjqQiEXfxF3M61O7F7J6hMu9erfPJpPhClLUX9Bu0S60TaGm0TO4t27vgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757849390; c=relaxed/simple;
	bh=tNCkYEchRdJ7RVdGf0Ni9Ay2pzie5WwsNtik9+z3tJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YiqT3ySgY67UGYCxfqstARJhT029uhN6L4XRf2WqV2g9muZxBMQU5bBTPPzEJvoBw2A/A4DdVBbM3iiWMi9RXfd7JegRMU9czt05Lxkgtb6a6S7kOsF0lUgSc55/pNmTSjvBzeYHcvlv2/+XOPoOCiunxm0KaWXG/1iYfFdJSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fogq+P1K; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fogq+P1K"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3e98c5adbbeso201972f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849387; x=1758454187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kWbQjmWNj90FslbkuEkjvxEvCWQssax8cSBKQRPyJ0=;
        b=fogq+P1KVeoOdwmJV/S7jESkSLViUhpHfp/5U01BCbsu/w0O/n7B7I6wAVGSbz0Rpz
         bO9iVsEWjidrwTr/ihdZjNz0bldArhpuofuwMSF9f9U03eQ/GHfu+1vmyyzcLuFzP/gC
         y8Oa4IHDRwh4SqkP5wsbhPEMYbi+mTl8rb+sA8s7HAoAVikkKCmM0kUahR5AwOTW8q0v
         EKRtjxYJf79x/bm8k2Zadt+pp51KPF0t7DzoI95ra+IFfZtJ1vnaVrN23xAeJGAOJbcD
         ERLuJFepjara+DfJ0HUjuOLpzA0u50rs8Jcp9YJrLVUCSoRgmn6ptinAErXAxsOj+b/S
         LanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849387; x=1758454187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kWbQjmWNj90FslbkuEkjvxEvCWQssax8cSBKQRPyJ0=;
        b=RSjaxHXAQc7pUlgPOcYD6iEbEec8tpiQ8iUYA0LIhMwS7tvcYIHV3y5xTfp6NCjBrU
         SZ6EX6IucBHnYP+GzEo+tUyElSTcuUi5SEBAm94fhH40G9YshDsmHHNMzrIl1eUucj9T
         4IyVkL6wjFXEsB0txxj7SuUNpn0myzboKQXhO9RCAtK6oJTux4iI58nTTMgQAKZV7SzI
         yuGIubdzuRVQ5niQTq0JtrSluL18viWZmJ1/5QiV1flKOtlDTkrm+TBElQ8FQiGbDf1L
         CpE3cNryp5Ok3IiWl4/031bFFTvcfycAa0yEdRNHW02f/KZ7xNWzriPZpNs06/oVJDwd
         KdFg==
X-Gm-Message-State: AOJu0YwiIvukKrOodHC/pW2vbvyRAA+erV8e4T+5KHBBImuIF0GaegOF
	WiZV+QFewmXivVfm3HLzSikoDDTdMJpSy7ofUdgAvnOshj6YZIt49hXF
X-Gm-Gg: ASbGncvFnqS4st4E1oOLclT5AAH20zOviUmC0+FsxSa7/4fKySStLQJfXWKLzpt49ld
	AyFMV/tvRprz3zv0OjUunK6vgVRE3y3c3Lmhhm/5QsevluzRqdiCsUR+Q9ScPewBNTCgcffeTUP
	EJxLCFupFzst3nTFxyh7LyCQBMIK7AyYSHmXTJw7FlK1jZgVEX5T90oNAVjEFbPC1PxwXfK8FoZ
	C3vl2VtKiwBfw11pXdZjFp94ZaTZTUVANfcv9Ybvvcj43ZN0kIhjdVjApxOMN7XZamP6tuM2l/k
	LBJgl3Z8fLczcp2bCU4hzGf68JryKtKLSQQTc19y3G9VBZWSvsKEBAdOIQ6Vo4EriUfwa/qfwPh
	g7tZ+WOkAjkHaRmmAtkvsQ6qS4o65lUWWDZ8yE26V1x10NC5cpAt76FTONUCwf2vdMXCA+PBldA
	==
X-Google-Smtp-Source: AGHT+IG39OXL5GbVP5YXCrtcp7+pGbdpdEB59AacbRvXYzjADaHt3PlBFvUeX/cNMkHe4IVaRg1YkA==
X-Received: by 2002:a05:6000:2385:b0:3e2:4a3e:d3cf with SMTP id ffacd0b85a97d-3e7655940b6mr9199096f8f.5.1757849387391;
        Sun, 14 Sep 2025 04:29:47 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:46 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-pmu: add exynos8890 compatible
Date: Sun, 14 Sep 2025 14:29:40 +0300
Message-ID: <20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add exynos8890-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index f0fb24156..be1441193 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos2200-pmu
               - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
+              - samsung,exynos8890-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
               - samsung,exynos990-pmu
-- 
2.43.0

