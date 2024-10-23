Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CA21662FA;
	Wed, 23 Oct 2024 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675085; cv=none; b=JjzClYnbsoVkAJogjZkvNdrhNsS9QZXez09LUh8gv8b8Q7J5GXfp/yqSLvnmbDCjGFAg11yPQSdGQXgv30XG3QDNzD6nW0CVmGBYBOC3Wr2vuKH3TlD/mw5UihFSGBU6G0/puB80JZxG/MgzR/eqrBjvZbB7z2BisizBKZ9Ia54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675085; c=relaxed/simple;
	bh=8Rv4WFH5BolonSWNzOjQ+VAtCd/024cW4LRNeEUwTXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQBejYaDhdNZh+7DdbnCxn83gbEoCqrCfCtsjPM/UlOaFMYVhordW3gjF2uN0Yt58B82NJIuZbf+dlSorWpC+IO0qOhtCre/azlrzRUtXFWKcKat2Avk5728bpm5O5TwexZQK2tW47j9SC4AuLKu+JZrQFDbvvUFdAYwBABtr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Crz8qzc+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Crz8qzc+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a850270e2so673681066b.0;
        Wed, 23 Oct 2024 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729675082; x=1730279882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF5Xe7iQLYb35u4BeSJAYQ0TqAMFI45ZoGY+KeHBwBw=;
        b=Crz8qzc+yK3tbvitFfw9/7CLXcxvXdEniMco8lAJCukoq2xa0G6wG0ER8fKbhS8gVo
         XEI0F4GJb6I440MKejipE1uBQDzYpbpH7/iQ5y9nlX5J4KYSUSRQJQGh5IFgQcBudm3e
         rv9D4f+cHNyvMdDhBxHhaxGHsbQBFFK/wJOLWiEEkzdmS1Shs1OI5ddvXVmlQk7AbbF1
         Wxo4w6Tb0BAYXj2/7R7qKf2zaYsuSozjeNlo/7d0xbsT0UEEllGRByoqHlLC2KQSAjcU
         FRA/VOodWU72bgBrZSIWTofys25MWMFKVNWvukqueR7UfGiwRDT11Q/UwzMe8jOPwIwc
         jWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675082; x=1730279882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF5Xe7iQLYb35u4BeSJAYQ0TqAMFI45ZoGY+KeHBwBw=;
        b=LjMi98u/vbfTG0PQ9Gb+MgkuIMZqZupouiaLvt5x4/QV3I9SZNkat2mqg8XVPbpOVe
         HeeJVgm++t7EZLxe/gJh/EDJG/8/D3Jo4ppXNl+cipI7B4yz+CtZT6U9ug/NubpfS8fW
         Jido0/ULTuR/PyuU6+7tLKCAPONVrW6/nhb9FJoXNdCrr+uKLk99lLZxEpNTf5Gw6lzc
         zN3K8MALIs8r6JyWpPcCjzwTeOwQriolLiavbxhbuzSYNw28JRTFyCPzeLgs9LDzY/OX
         xSdHiDF7DLZIldoBs0mhBfvKlmoB+OJsVds9utV6zjhYNRiF5T3ks1ysuOxILPpbu0hu
         ytxw==
X-Forwarded-Encrypted: i=1; AJvYcCUxmhaulrfiULi+ApvNUSE9ApJBLsYTolrbEBu2xk1vgVrphK4SvKpy360N5f8QdtIXlkJqjaj94RUu@vger.kernel.org, AJvYcCW61s6sk2leog9KkbjSgYmSqgcIIDKLtPcBT5hy8CjQAqofkQ991SSadqRP8y57nbnATYtXLsmP1fZDuxDe@vger.kernel.org
X-Gm-Message-State: AOJu0YwuANaSk6UvD6mNqCcBnw25XuiCQ9wp1Cmms2wK2FajAZlKm33r
	fXfuCaVGvnjO11IZLYkCIM2Wqwb/MswVBIWQA8C8nFwJhT07a/Eibn7YdGkL
X-Google-Smtp-Source: AGHT+IFZFkiRyZCTTOggy6qIT3PwCb7eOhX/wvPrsD6BpgLkVRZY6bAlpANckZmH2/IzBf+nDKpzYQ==
X-Received: by 2002:a17:906:6a28:b0:a8d:439d:5c3c with SMTP id a640c23a62f3a-a9abf851b96mr178607566b.8.1729675082225;
        Wed, 23 Oct 2024 02:18:02 -0700 (PDT)
Received: from ivaylo-T580.. ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a913704easm449177466b.107.2024.10.23.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:18:01 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: timer: exynos4210-mct: Add samsung,exynos8895-mct compatible
Date: Wed, 23 Oct 2024 12:17:30 +0300
Message-ID: <20241023091734.538682-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like most Samsung Exynos SoCs, Exynos8895 uses almost the same
Multi-Core Timer block with no functional differences.

Add dedicated samsung,exynos8895-mct compatible to the dt-schema for
representing the MCT timer of Exynos8895 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 774b7992a..02d1c3558 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -33,6 +33,7 @@ properties:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8895-mct
               - tesla,fsd-mct
           - const: samsung,exynos4210-mct
 
@@ -133,6 +134,7 @@ allOf:
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
+              - samsung,exynos8895-mct
     then:
       properties:
         interrupts:
-- 
2.43.0

