Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2851206F23;
	Sun, 23 Feb 2025 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311770; cv=none; b=FFXrgBOrHm9vmlBXm1jAo8wtiL03icBC8fb6SEUSnDjeNMzz4/zqjdb9bqXVTVUFJKfA2LjW5wlMpoZJ33z9lrKzUJyzfPf8OLRO1I9OqwjJKnG8oihqbBqKL8JayWbW74f3H8jk2eMFp+xNPeRx6C/TlXzKB5zAV0TZROvTAhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311770; c=relaxed/simple;
	bh=CFnG8ErpXvU35KlccJq/LsKC1MCEnVyycw4tteBdqYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIr0nqC+Wn/YLhUTUCLWYOjGJHTmKKj9nBFMvP2Qfc16pssOhtude/iIMR4jDHxl66i6tKYzfRAc1/4mRvoxQZZxVyplzeDnJB68XEpyjia/wq2jTvdft9hoXrf1nmccNFxPO4+atW+qh3uvJtCPl8xqwiCwOTC/ZZBNrYVgdZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJfjVotu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJfjVotu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so1817952f8f.1;
        Sun, 23 Feb 2025 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311767; x=1740916567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=UJfjVotu+hRvG8TfLq4jlumQ/1LvmZeUAlp36yaYJbw3VD7oghvvkPcehtubGDceyZ
         xJMxg8h1AQQdsB7BxQxJRPo+qaQsF6gA3pNLhYaj62Eocq8dY83sJbe6fJzTpe/L4P35
         k2oGXY6uohCoPP6F7TCLo/+yGrT2+tUWoVMqdwK6CSw2+0y5/foex7+oGuVXrrtozejN
         wVFTF5MGbULCXDl4EPNnbB7JHXDXZ3AJZZIRkPJle7Th2Urdf/O8FRmL9vf4OwnKcm/w
         s+ebPjRi6CH3wQnCI7Y0l2LTEUS8sJkENZYrLyLwpc4n8/7YoDkKpcm/aSfCdwn2Cq+0
         HZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311767; x=1740916567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EW+FFkohFLZUywRBd1iermeEhpJS/y57/9ZtdC+gJsU=;
        b=tDhQsP84K22eG8QeEVriVoCifSk/33NcCcXHsMiEsVbOtM1MoCotzubEdY1UXZ8nMN
         Kzii/lfhS3D+Jkh3CRM6U4iwdxNdhTe4pvE3mUJKRQUcpdAmVAfyJdqnsgbSrUJHT+lI
         y+VWQs7gkpWW2KCowLmi5J5dqbN5Be9A5K31/Tuc2jxOg/vrCyNh99bkRjhVeGjXYoze
         YW88CMJTpxs5u63c6/pfVRzXRCvEhMkWPL0IFPM39ORhwmoJ4XC1PpoZVAu4EgOET+np
         lOfjMjT2LL0enny/YB4Mdady9nhKdLK065qxzqMqN/Pw5boN0Bo48z76vnWt/l3Xtugh
         t6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZAKI9HlDiQwrEQDMIkRDHszz1lHnBmWIvAJHuI17b0jZhAvlJVQkPEV3sEm2BwNR9hhl4+16gmmfkvgwY@vger.kernel.org, AJvYcCUnvHhe599XXxEx9UFZnteV2L3r7gUuoHE6KlBy9dVZUTjGwlVQikA3vaf8xkHMLbsL52P+TWkBySi6b+igySZzj5c=@vger.kernel.org, AJvYcCVLSWoi6rBvOiQljoLQZyERsH7aJxvgm6VhWAkQ3S6XY2k81KJjEkEBvQj6wYuXwGBFWjH5F+6lihI2@vger.kernel.org, AJvYcCXpA1hTx/wPY+04ed0b2764yYpii7n/N4oxsmDC9ttGbqkHe6mdfQh7EXGYp0Nz74qlrDyItQIR8vH2@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSN9l01ibtMV+ikNOnkF4IuopADYwecNgArq9twW35DI091bK
	wz4K8GzBB/v/8fYu+uI3CgM8hT9u8W6z6GAZkzHrH3oJcQmefCna
X-Gm-Gg: ASbGncsxA0FYHMpPOOx0VUNHwWdZEXqKadqk8Q3tsDA9rKKm0+DGl9pY0QHzhqHpxva
	8ymu/xTVWPG2XpEvunByqLzx0SM7J+T39xgJkVj1yLUlGSi0arrwEMWRwEaUIeRxh9xM1A2if8i
	zfQNIa+xVuWze7YXVWdJqzmdSayGugQQ4AHQlW8H4UPJeSLMtJk/eKLIGMUwPHxeeB2LgN3m5Y/
	kuv64pyYCySYbT1FaqhmZ3KEwTis9xJwu26o7GfzzovAThjZ5SDPYELTVjwGGh9DuC0bG5RHM3K
	X3vfObF8WnUnsZBM7l7nXSYb1CtBMoYIHGUuFwT12UM4lrlG3UhsjQgoZ9uZfx2YgqFdpIP9VtM
	Jqg==
X-Google-Smtp-Source: AGHT+IF742hCQ7cJ5xDelcBpDfGSrEG/tAg5hZn1AMZTpe+zEbgF58ci6/ytBUM0Umrmp46SbBO00w==
X-Received: by 2002:a05:6000:1786:b0:38f:3e8d:dd42 with SMTP id ffacd0b85a97d-38f6f0d6ccemr8801456f8f.53.1740311767249;
        Sun, 23 Feb 2025 03:56:07 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm28861189f8f.71.2025.02.23.03.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:56:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clk: samsung: clk-pll: add support for pll_4311
Date: Sun, 23 Feb 2025 13:55:59 +0200
Message-ID: <20250223115601.723886-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pll4311 (also known in the vendor kernel as frd_4311_rpll) is a PLL used
in the Exynos2200 SoC. It's an integer/fractional PLL with mid frequency
FVCO (650 to 3500Mhz).

The PLL is functionally similar enough to pll531x, so the same code can
handle both.

Locktime for pll4311 is 500 - the same as the pll531x lock factor. MDIV,
PDIV, SDIV and FDIV masks and bit shifts are also the same as pll531x.

When defining a PLL, the "con" parameter should be set to CON3
register, like this:

PLL(pll_4311, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0, NULL),

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 2e94bba6c..d2b5b525c 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1460,6 +1460,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll2650xx_clk_ops;
 		break;
 	case pll_531x:
+	case pll_4311:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	default:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 6ddc54d17..e9a5f8e0e 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -48,6 +48,7 @@ enum samsung_pll_type {
 	pll_0717x,
 	pll_0718x,
 	pll_0732x,
+	pll_4311,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.43.0

