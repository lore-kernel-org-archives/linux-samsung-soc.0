Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A9D1C689A;
	Tue,  6 Aug 2024 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722946294; cv=none; b=TakHf3Q6KeRVXRgycLAF0Eu3eLDynikm+t8L8l5F8o65JpQDTQeVhlQUBLj71kJVQxaFtsB4SfHkvVhHHQiqnO1lhN/2iVLAphTZMdsZ593qnSgX05nYMEyl9w25McBEuMnvEEIe2F9kW2GG1RFuADFRsHmAfCOjCulhoIfzipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722946294; c=relaxed/simple;
	bh=Fyt9dr9fRY9eNM7k6FcruT0K5N4TjeBkONEGv0G4ZxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/VvRwhf+ceyJLmjp/eXQMcKVqeIECmTZgh2KTujsdJfzvaKJOBkoldOksQhrEvGvr42faxe4ZGhGYfW/EHCw4VWNi1VC/HgO/pQc4yGby+bbgsdmHCg7Sso4oEWtAIS+3ZgpuxgnruHjmjtWw2xA66t8VSxnsJdtq8L0GGw0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1dqi/0p; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1dqi/0p"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ab2baf13d9so905850a12.2;
        Tue, 06 Aug 2024 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722946292; x=1723551092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5rhR3+v2dU7aRSLZ6OU5clgVv9vaFNsSw8Xkl+ANI8=;
        b=B1dqi/0p2gccHb80RRJN6QuHrHmZCi6Ba6xfHnhndg6cqvH0rTTJZtP6ZOWKm+j7a8
         uvJNDmy7WOdcUZvkugTl4YxkS0QmeDxEqCEg/Zik/laQTPtvkS/zfBDMnsZP2utZR5zj
         2PbbTgXAcxDCa2RT1ou4tu7j6LXQrSaB/mHmKqo9igNFfqDbaf//eopkcwvffbKI32/4
         96RQmty/BT4hVl3lRAtvZnko+cBUF8+0SglP9+sibmAY365FvdA//izsUJlm7SLr4CwI
         Jy+xjYQGhdSOjlenrCv0G6x0RHhtwWh4kIY93n5VkIdQfQnQE1xeN10Oeq0S6TAigJQL
         RI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722946292; x=1723551092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5rhR3+v2dU7aRSLZ6OU5clgVv9vaFNsSw8Xkl+ANI8=;
        b=DZXXTBq2VVa77PVfeXJxksbCTrUGq8Kd9wUD/o1cKuYyqcURImNvBLoulUO4mhkzgB
         gaf6XQFQjGYGR1yf+7CJY3q7SgOSK/TdH9JjvtmBkmrvmpoE3VrRtocB/xBHapMEcwAE
         rojoCUZyC/Osglen+Q5CidMG+RxajITkqNIWPPwQbrBbd5YZLM4+0cWoMlLWCha755FX
         XPChTzLtoVuNbCIT3bqgduwWQMa8K7obyfUmiq77osduoJ6aXHp24APJRDEqRL+W13HD
         kqxt02UOMYU/woy7cZalBjLiVMj+FD3o9pRr00gVhNXkzGzyMIkKdIY5fW/b+FZV1YkG
         KRGw==
X-Forwarded-Encrypted: i=1; AJvYcCWxJO8UG/zEbDsITAjIICmJ9vd53QnvT+1HLW7mh+UZpwgBfFkdsAO7D5iG/w03i/xeXjfGeGwTLP0TKRGJ3RYsOHeRJH+9TSn4IMD/Z1S8I6MjFaZ5SgeX5G4NMk9uV2ubdezS74aOSNbbvSH4JCwm29gMIDHlu00fmED4tMYBB7KxWg==
X-Gm-Message-State: AOJu0Yxct6MeQCAnmfn/BdPwF8++sAuiMuz6taAEL6tQi+6GP9UsY0Xm
	IG8RKKjs6ul2WyJDUb/Xh0ziWvZDEsDn/l+/AIpZYUTdVd9tREnZ
X-Google-Smtp-Source: AGHT+IHKiycZQWM8ry1aTxUrTYWujyde4/+GTPOkVnlyiUSddAcd1+nGafJEZOsseae/vrcwtntN2A==
X-Received: by 2002:a17:907:7d9e:b0:a72:40b4:c845 with SMTP id a640c23a62f3a-a7dc50a2e3cmr1068710766b.51.1722946291346;
        Tue, 06 Aug 2024 05:11:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9ecb546sm542080366b.224.2024.08.06.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:11:31 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Virag <virag.david003@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: clock: exynos7885: Add CMU_TOP PLL MUX indices
Date: Tue,  6 Aug 2024 14:11:45 +0200
Message-ID: <20240806121157.479212-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806121157.479212-1-virag.david003@gmail.com>
References: <20240806121157.479212-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add indices for missing MUX clocks from PLLs in CMU_TOP.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 include/dt-bindings/clock/exynos7885.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/exynos7885.h b/include/dt-bindings/clock/exynos7885.h
index 54cfccff8508..4ce86810b10d 100644
--- a/include/dt-bindings/clock/exynos7885.h
+++ b/include/dt-bindings/clock/exynos7885.h
@@ -69,6 +69,8 @@
 #define CLK_GOUT_FSYS_MMC_EMBD		58
 #define CLK_GOUT_FSYS_MMC_SDIO		59
 #define CLK_GOUT_FSYS_USB30DRD		60
+#define CLK_MOUT_SHARED0_PLL		61
+#define CLK_MOUT_SHARED1_PLL		62
 
 /* CMU_CORE */
 #define CLK_MOUT_CORE_BUS_USER			1
-- 
2.46.0

