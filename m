Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD1E1DE4E7;
	Sun,  4 May 2025 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370775; cv=none; b=N6ohS8POzCHqx5GnG5x7/NyiC0HbCw5K+O5od0KXMkxkj5uSZt7TuWo2A37ZxhIGGvvszcnLalcc96GvLc6qt4rMmNVKRlMEeWXSUduzuzjhbY9rdEoWCteR31zuy9cOX4Fv96zvbqJuEyZQuMcnLAHu+ppUUh7DAfLJnzBaQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370775; c=relaxed/simple;
	bh=SFIyXosOhLyy5Qfz3e0zgrOkS97jBHBTxBoHFCbB/EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiaAh7OaCmCDSvx/bWhYu1MGPvGpW7Y+TBnQ6hASsSSrEvooxSp3Be/7eKFK+vYtoy427ScYz9lLBtse/kOTGKE3wL8TaeTq09pdkdcyuROruFtcyiZtMVXAZOSrEM8TKJzVhUcTgYHJIQnwC/PA8OT5iOzRsjQyLDIc5qZW6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByVBQJA8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByVBQJA8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4476994a12.1;
        Sun, 04 May 2025 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370772; x=1746975572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ny5j/6TjMJC/z8tBR7whkEk58tIYnd2wnAxlQ5nNsQ=;
        b=ByVBQJA8y4EEGeP9tsTzmljP6JauK0FtY4f64ckL9yqNyVHQd0VvVdbJRm7CNaAtHo
         iZPt1pEVYVyCTCLtTiWp1oFxvR8UDAfuSt2nr96SezvC+eHIlPHUGb90jPo7CfcneVoe
         ZHb5ds/Ur9GTwkgtZjioH/DGx0gAuTH+GPq+dqDTy0d/yzJULT3U0OSbXldrTnmgBXjb
         GtlvuUsUnmv0gaXgmDQfLFJditXbnZDVTP5jEOGwUMJ7QTLnW88WchiPWjFBoWaTPjws
         Dvo9VrYsQp/X0DWhYHEuBu4uXFP5zD5Np99fsFgo7RBGadxo9kiNa45Cyb9ixm5UCfxt
         m6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370772; x=1746975572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ny5j/6TjMJC/z8tBR7whkEk58tIYnd2wnAxlQ5nNsQ=;
        b=I1oLlCJNhynKp491CGuRXAZ8D9pIcuT0rWdG4xyVQxa+9PbxzF4740rzABO0UE1XNE
         lqoSUwCyq3npw+lW7J7wfswy/bSkHcIl9l2xVW2VrjwpniA9sEGr1GCk0B0sjK1nBGHd
         BfBPuu8A1KIXnFBeTD1UYeSuCxkXsJ4c5vP3HSEv/aKUPaSml+oE6YgKfpcNy5gbedeK
         x2SHw7Cgc7E0nIxtFOCSG9FIzXPhbvazyPhYRK2MSvhTlzeLl+AowK4sNdKqEZ8mQF6K
         582QwFel/M3DtQsRLeC2fFcgsAm1ilTp/idx5tcUnA2XtyYjkwJHLQUqdZSm8xIeQU3X
         hngA==
X-Forwarded-Encrypted: i=1; AJvYcCVYoT3eH6H841ky5tV+850pNuh4Y+ytX5Ikcw269tDULF9Q/KkP1p+mcfi2BL4Vuu0BDe1EC9zv6zt1@vger.kernel.org, AJvYcCVyza2qUco81kEd/LUujhL54nGyDUaCPzJ7htZN31K/jJwK7wl8svxXexOzJuL6Pg/84tuvhbLsXvH18klV@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMrP9GKwE7uu2oxvkXzwfPIfpypEQlLf3JgS1JVeFtGWjizNK
	L32p9+GTRDLVx1TgTdQm7vvrJqwzVF9SvAVrGu8Se4/nKnJB5+MU
X-Gm-Gg: ASbGnctAR60WP550hL3QohmK32TxF9V4TGeiqXbANi3Auab/2tPc6u6tvMXJNgJuPvC
	DqijGuAAC/U0v7XGL4d8sLVmVwm97q5LtbcyoJaGgmyK6K7M4ZWHTFRHYZgqqtAccnpo0M/4oy4
	uN2OWlB36/H8bKZN6ujNKQok0IO2fXE0L1ncBkvRofDwcd+QSRum7l2HNd5na5oNO/OmkvWZWR8
	s2VZimJJmrOTYZQBSD9ktdMelXQsvepA402o++Aqc9yq0lzoSZFnsZoIuVWJxAb4PLFv09wKWon
	AjNgbc3scSWeipZxdIudKdVF0/mnaTJp+4SY2GJOwCEZ2GjtNI8incp08JOTA9UuohA4xbTbS1Q
	ICZELFvhzJITTt7VCrB4iOyo6wDM=
X-Google-Smtp-Source: AGHT+IEAZn2vETWAdCzHTScUgsNEu/Nuf7Gcd6Ob+PheOqy9a2d+WQheq2mGZLss9RXAM3FEkqVPyA==
X-Received: by 2002:a17:907:7f90:b0:ace:388e:d84a with SMTP id a640c23a62f3a-ad1a4a8dac7mr364338266b.47.1746370771646;
        Sun, 04 May 2025 07:59:31 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:30 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
Date: Sun,  4 May 2025 17:59:07 +0300
Message-ID: <20250504145907.1728721-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintainers entry for the Samsung Exynos2200 SoC based platforms.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2dcc38f64..52258d22e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21401,6 +21401,16 @@ B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
+SAMSUNG EXYNOS2200 SoC SUPPORT
+M:	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
+F:	arch/arm64/boot/dts/exynos/exynos2200*
+F:	drivers/clk/samsung/clk-exynos2200.c
+F:	include/dt-bindings/clock/samsung,exynos2200-cmu.h
+
 SAMSUNG EXYNOS850 SoC SUPPORT
 M:	Sam Protsenko <semen.protsenko@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

