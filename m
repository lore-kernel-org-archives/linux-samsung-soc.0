Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C502D29CA;
	Sat, 30 Aug 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756571326; cv=none; b=XW27LrtlAfO6KetUXz0tcI6sZEEbdVTJ2VSKezWGWi6ZakAJ6B5Jdq8qacbR0z9DbrhP4a1tKnokKEuwL8YZKV+PKaXsV/jOGoQkuWTTxXzlkFQkiM7/EN7ewNLsWQRFWDZajzpIKuso77oij9XYu/PgvATiVJlqIFBPHIKaYX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756571326; c=relaxed/simple;
	bh=04MZLdRvtv3dYSrEKVA7n7X4qOcNIGMw9F8ZkaILBxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bp6dpk5nkvXRIgCT/PebYUQw3LfWC2b05YDG0L1E4o4YAAI5akZFfK3f3sybko3j2DB9OjNTlDhQ0/7K7tpmVVi443gBcFfoHqECu0M1/7FYgGb3DNwfkMRqVvIfwDUSaEBm/tuRlXBLrL0AvOt/gl5FWjIeOmj7D4sdQXiQP5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9qXpBN5; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9qXpBN5"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70ddab8117cso25568196d6.0;
        Sat, 30 Aug 2025 09:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756571324; x=1757176124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txsD8XdG7jmCwGb/J+YdJXr7ibwZf+oef5Att2NCdBE=;
        b=O9qXpBN52Z6YYbejrfX7TFSELapzUfS8uvRqgyy6jetJvosc2L2UV1viuZcOIi25zO
         rEk8O11dxKF0S0oqZyQObJLxfx3zcGXSdefViEEX920cPznjQQjVzAMdRQ33jrhl5zRo
         giAUbSwAlRGQcO1eXjuD5P9Xcqrgzz4P1uECRXjIRwvpXagv/lJ4fELJvZ7/C2nPEWK2
         XiydYpFpen8CgtuzcoUUm4xi8BobKJbQFfWeXMm6L7bk+JxsJi0fLb/0jlltYq+KtOFw
         tx6ujD3fkb3K8ScSothEYTLeDSNWG0C6Bo18a0AZOoNymKcJ0YNXwwo0yKeKkUj7gbmt
         pAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756571324; x=1757176124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txsD8XdG7jmCwGb/J+YdJXr7ibwZf+oef5Att2NCdBE=;
        b=MU5eJE8nix3u4cjFRRryan8W8OSEbLSwrQhfnRgr3oozUEHnyahqvNoSWA+c89BaVi
         Yi2YirN0OSB+WZHSn5/wTiIeAlhlbFexxO+tIMMfK4IuTMedx604jS4FNWMFvQJIYuq5
         72fYmOGANv7JLserhpGyHA4pIYSe1qUKaeT251kQ++CjpRpfsO32Cy1GOMEw6sZgL/CJ
         iUkIzV4N8e+dTGbMFg1KDm0pcHZ9hc0iCyM1orFHf2gtOvPmKyWRxJ9XluROUPSUT4yB
         TDluERNq34MdfSjqVxDIl/uQdGSQIEyMHwV07EN6bxTXV2+lKQJZimO96z9LXKGfxGvQ
         74Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJ0Q60U4ig+lJNAv3HVwC0QOPao1znaS87VWFy4vYjDdEThrwxPI1QIOIxWRS9w/6yS4AXRvN15XF@vger.kernel.org, AJvYcCV9uQUhYYmvwoRGIMODcadtsIScyNwT+I3+JdZKtzRhZ8TcLqER+qUfC6L1/nAFACdgtO3yDdUef8yF@vger.kernel.org, AJvYcCVwypi/ByiBU68YAI05juakbcd42ZOibiTGoV+TtUYwpRlv2GrNwAbpJUzKNuaU9xJDYcceTkTQ2bA+04Ce@vger.kernel.org
X-Gm-Message-State: AOJu0YzGAq9k+sYGvQ9GzwrF7wF6cULAujDlUAfMxpbHAe+xcszEQ80T
	Uh1gvammy6YgEZS/b1FygxUnTCSsvgYzL3+4O21Rhak0w3POBaQCSE+n
X-Gm-Gg: ASbGncuvAoerMizz+r3pVJhCcgRxGTBzCz3hGRcjMkqYLjyAbceCCyNIJOlYsY+Agm3
	Zi2brQnWuZo6flAjv8OkgOxqM76K4duKg6ea9FZ9bqRFKiqsd/8bY1IDNS0x/jsThCHu0fH4npC
	KLQei04wy2GIG6LKLCnyBHn2/zpxrr1/pkoky0DwYP6+p9RS93RN2D7YtxWtuhS8S+lhRtmPHDo
	h0rzlQp8Z74hJQMvZU/Y1Kl9TOXSXA7S848C/2AUelRpukjO2geC403la0QErX7c9gVNgGQV5Zl
	6lTsVUQFo1rkDPTIJNVISz1shEAyKyqiRA/FmTTpPGmiu5no+a0aBCQdvg3yIh8MtwUA/LgXVMT
	/TQ2asj7VSC24PUclZ/Wm+JYfRVe99I/GYUFc6kE=
X-Google-Smtp-Source: AGHT+IFJJeL+E4p9zNxcv4dNk/C3+irfjMXEWrBTTh3+6eE1/B0cpnnRcCgGc1M5nqa7Q28tjtnh5w==
X-Received: by 2002:a05:6214:411a:b0:70d:abb0:2791 with SMTP id 6a1803df08f44-70fac88a6c2mr25148226d6.32.1756571323750;
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.195])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb28b5a26sm8110786d6.64.2025.08.30.09.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 09:28:43 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 30 Aug 2025 16:28:41 +0000
Subject: [PATCH v5 4/5] dt-bindings: clock: exynos990: Extend clocks IDs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-fix-cmu-top-v5-4-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756571319; l=919;
 i=wachiturroxd150@gmail.com; s=20250830; h=from:subject:message-id;
 bh=04MZLdRvtv3dYSrEKVA7n7X4qOcNIGMw9F8ZkaILBxE=;
 b=aSAEvIpGXqzUd2y38j1q7ddgyOtKqqD82eO8ZsEzv+81Mv3QsoMnm6TOP3BDfFmeM36Z7qusH
 GbtyJYNZBajDXdB9Zwt/SHySAhyqqtQmhGIYSvpYyuiZRrMQCIj37Xe
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=rxHEBGA1eos5vQkPC9SlkEPD6sil9F03N6bc8qmUFrQ=

Add missing clock definitions for DPU and CMUREF.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2822f1c8e5086a2fc0bda783ca224812..c5c79e078f2f60fdb2c0f61ba6e7f3c6f2fbe9f2 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CLK_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1

