Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FCF37CD4D
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2026 05:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328036; cv=none; b=CVXe/dzlWYdgSL5mcchP98iD1ivtnp+dw8xh7I4TigrTh1VEB5g+HL6bmFOGsCZAQ9UGFmpqXyQ3QAaYdj+Wr/HaP6FTLIhz354XZY6Hm60OiQ6YCH4BxhMenq0ggRpXeqAsY3765E7od4XFTS0KyMQvY3fQn3KY05QXNvoickc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328036; c=relaxed/simple;
	bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqMuTMvGj12ZUcEXrRgbHQdUwVFW3AlJwHCGEht0CFYn8K0n5yb+rRnB0RpzSfgYbHqyt2r0IrJdru42C5/yc35Qzvwgh1PYUOgcm6sIuOEVilU+sVHmAPf1gtl0zIn1XA7TdI5k0CFa1D2TWCGMkhKiR+6wuZ+bH3Yr8aP75lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKXMCJsj; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKXMCJsj"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59f8a140a51so1004602e0c.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Jun 2026 22:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328033; x=1781932833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=iKXMCJsjLHILUcNx/4bq4kEcAsZyJfsVl9Q+y/KTuevXdFFpADPZSrKj+GZVjAQoa7
         knOlOwFEUQKtbyMsGuLLXamVZlxN3vRN23HXhwfnZXhU2p+tFUP6310y+aoCBCIo8+4m
         0wvZycY4TQKD0HZnDmvI05xjb34nLIXHpipd112mzAcAMQx3xl+z+uF5I7i8yJEze8/F
         5SFP4d+TbRkZ345qTJssk+BEhJ9oVy0/sURdPy5afL3TMT4Y6BEdqKox/kAO23WndMxo
         PNK7G9c+Lt/bB51Jz7WJOOSKnPX7QeZne4Dxem/kbOzooHY9n2eeHX0QJqZyC1WNU8ok
         MypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328033; x=1781932833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oh7XZBRFNF3Q1qZUCiPu89RvrIopBJKwT1Tf5U0uHtM=;
        b=dM1KxU1Dtsk+h/trDOm2aT9QemVsTgSEmRZ5a7aUZ5hbpvQu85wmOpvyscabaUzTYQ
         Ry+qlFhAlg5MesZHHjShSWZqPaswofNJUluNnf8QYW9Y7sizugCpLkbYodEPqNDhRbDq
         8qv2Vvxqep0w+yCGq0PAOPfacPLl1KyXz6ZIMK6nspdcsqtI/2mddXTkfADvik5k5p8o
         BtyMszPGNQkQkCmHFMzcl4d9dB7HixIwm2E7U+Epq7GA3k2PgcsoZlkckNFUcisgxB5H
         H6qO3Vic8juFi+aBEwqJ2KRgaGqTiz94ufI2czD6ECgjr5w3Zjx0nVDEcmMcmB2YeThO
         gr6g==
X-Gm-Message-State: AOJu0YxDn1NckkYHCYo9H9FogrDhv20o2scHXsQu56Ingi89HIAEfDa5
	n7cxFjY+vJJMP0qV733OFWxD52G1573nx0yvjANcWJWIPmBx9oanMITP
X-Gm-Gg: Acq92OGHJNFhL8RGrZygHcdS7ZAluyLz2Nk0KXb+atTEAiHterdTkbyKUmNe3VZJ+Yn
	2/EAVdD8nCrcsVvQ4Gyo8LDEIRoaQ9M/LXWj+bP06tDZX7fJjULxthhmQxpHXD/ez8vjVvrgEg7
	7jiv+ogfYVPhgsbyGnK3mfQpkWv4oFj3wgl41EfkBtG6T8YLzc8NCjSnhStU8mh2BbodC+LNoZ8
	aAOdP+qV7Uo49pYmE8UFRL9sSgoL3H43WpeLkFkRUNcDdlRD57f/CBqG52GJV0xsfq+bL7LipRX
	HPoAR3fBzQtp0PeiQCRtgNfuJElvc7DSGsIiuePfQ8RjT3Vk3zyB5TuvSlOic+QLYursh8lj6Xl
	TBD3mJSIU5DX75Me5YI6nT7fTMuUA8Gqykw4Y2WvHQNwGiXVhTdhk06jRJE/mqO+GJykyO8f7In
	kE6oqysJj4z+zuuaEUfzvzVXMT/erFKJkTQb8a/HQ=
X-Received: by 2002:a05:6122:c90:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-5bb6c077aa7mr3940480e0c.5.1781328033130;
        Fri, 12 Jun 2026 22:20:33 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:32 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 00:19:51 -0500
Subject: [PATCH v2 1/2] dt-bindings: clock: exynos990: Add
 CLK_GOUT_PERIS_TMU_SUB_PCLK
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v2-v2-1-3dff7ade75b3@gmail.com>
References: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=704;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=miTCy44j1JAsbaJrI3jZw0x5PRuDRN+dSbWd8toHM6M=;
 b=X/BI2YKdcMP3CkhiT3eTACS7wdsMXf/M0WGqng7um4bnMC6SnlomqHBfhN9Xl3HP24McjUzZ0
 YwRxI48IP6LCJz590QZQdK+bnFu9pnakOSW8Ptixa5+TeMbengQLGZ4
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Add the missing TMU_SUB_PCLK clock ID for the Exynos990 PERIS CMU.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 47540307cb52..c06f591d9d90 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -434,5 +434,6 @@
 #define CLK_GOUT_PERIS_TMU_TOP_PCLK		17
 #define CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK	18
 #define CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK	19
+#define CLK_GOUT_PERIS_TMU_SUB_PCLK		20
 
 #endif

-- 
2.54.0

