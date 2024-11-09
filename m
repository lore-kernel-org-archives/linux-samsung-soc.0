Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159611A286D;
	Sat,  9 Nov 2024 23:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731193463; cv=none; b=YS2dhSW3j08MOxbqOogeHvrhrEPvpzLQ0y0q5AngSFBQABBUz6HOAVUt6d0JcdEqgFJlYjhc3OBkKaS8ZxzqWUZgaZaUExWhoJoBnVtVkVgK+Lx1Vgxb97Su9TiI6rwK8Zq6jRKEQw8Xk8Lff+pazZopxjLHfLP8HhLnAQSozu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731193463; c=relaxed/simple;
	bh=2D1hnxmZSwMbmjn6kACIsJPiJ4UPJcHuZIpl1oR7GEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4NB5cOUOl/kvKTVzNYydNHQUwSQPppgIr71W8SZLnQTaqkiovWcwg99sNRyNcE6FcO9HgEWwKqeAZuyLU17XvMOL3NjZgtyJsqdaMkbge3IjMBuKyp0izgLJyuLVz51At0yNjKiioRMl5iyovIXDZ3LfBDJjVx9h+Q60V9LIe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwHp4LjK; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwHp4LjK"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e9b55b83d2so1425201a91.3;
        Sat, 09 Nov 2024 15:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193461; x=1731798261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYmMJjvbdbMxz8rStxEESpsIZqDsIf4GaLtpKhT3xmU=;
        b=LwHp4LjK9D0q/zw4cR1ImXufZUNY1KHvEteLgh5eIFfkQ7k4I5bQXC2ZB6JwKB4Muh
         036RzkhImavt3/EdaH2kpW/0JCiqPkujKCx38t8t7Wrkgb5Xy/0lVG9jq3U6sxEThSZy
         5eSNz+iEnCDu5hFK805yxMUgk8ZS2ftagnAEUGozrrhitcmQmxQbg7J2QQcwVM+rfRNr
         ycSaLz+bjz+XP7N/D8JiKui0rqvVXP8pGgzGuWsce8qkPRUW2UVXswQ0wHUKKasv2GV9
         tEYusDwV3A5fM64xYJcEmK1nRe8qQTY2hpN+DGg7UTyGCHlTy6ewx1fEqMOfgifqkya8
         xDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193461; x=1731798261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYmMJjvbdbMxz8rStxEESpsIZqDsIf4GaLtpKhT3xmU=;
        b=OCaIe20Q34GGtgdpg7BK9eYNABD+EbxVrvC2GdkUdp/HNL3JH+X7mC11+UgiYoS2SI
         wCCKFLmGortWqXpFnVMH2F6NPN1w5zVT9/4PnQFzO09cRl4R9StSbdmdN2Wxa7QV52u1
         l6VDMwDW58zyC6dWqAzYUjYm7pewyfbBnI6J8+LfnGNwFwuzf/a9CcEw5MFZ6VDU2yog
         zB5OpF0K3qdjvX+HREghq8Nbhome9WpxmKcsLpRMDWzmpi/T4yoggFnsWNLcTd787aHv
         /gk4gNEONa6gBzHQP9VtzTTDuXPSBDFykG1GiW+SC1++HQDE7s5zRYSXtBqQLcf25HCm
         dkBA==
X-Forwarded-Encrypted: i=1; AJvYcCW034BjZSbA4wlOXTDbdamffnlmx+67pxsyydQk8/H813+kLDQotCMJUS2Pkv3CIPgN8Vsao2jM+fx4Tt4H@vger.kernel.org, AJvYcCW6iNgTqGrRHwm9vFwampVylEqafFl91xjeXdXdHz/tOmeMYDDUNDIzRkAFBkPdZbNemr0CYdAMy4nq@vger.kernel.org, AJvYcCWwtjd0rBBwlgKVtS/gjz4w2hBNZ3p69+z+owVv2/1nYbm42rApljJAC1dMOqwjczoIRWhUDvsz8Tlik7iKwGwZcLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWeDhJlV4RMlKnljH4EBvX5V7sHz8eoloVQb7nU1szg/9E2LS2
	aGDtfEFyr5ZtxwtIlsLmTJQ5MAjOWXijzmwMT79X65gB6/WSUdJ8vufxRwGv7c0=
X-Google-Smtp-Source: AGHT+IEdhygKeNmzJW8T1zwRO5o8DvBEr2FpAArw4f90hx5sT0afqZ0tNow5Q6uEwXVNKfM+fLpq9g==
X-Received: by 2002:a17:90b:2ec5:b0:2da:802d:1f95 with SMTP id 98e67ed59e1d1-2e9b1655967mr10350563a91.5.1731193461407;
        Sat, 09 Nov 2024 15:04:21 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:21 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Sat,  9 Nov 2024 23:04:01 +0000
Message-Id: <20241109230402.831-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109230402.831-1-wachiturroxd150@gmail.com>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1

