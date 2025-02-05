Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289021E08A;
	Wed,  5 Feb 2025 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738794334; cv=none; b=WaL9UJSvRb7yW36Rv5ITrtWR7iJtcmyp1vIKPMM1BESRJTGZ/mslSb//PDkpzNF82eYnWweWadOLwX3T6Xz9za7lZiY/hT20ufEh1GeZPbJI2ejK0fP2NGimwXBFKKTt1i8yjHSlhQdM2dVsOMyT6XqtcQvP1MFAou6tpORsXk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738794334; c=relaxed/simple;
	bh=zhp3DRKeVR2iAD8aTuHQJYlWMEjl+ncvbmaQsWawsPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c/qfwoE8V2R3rV0vmklR3P1JTX7/XtzbCELFNn0tPSZxSADvcugWNOdVQ8pqrGAeocO06D+6p4TalWOYdQ8it/fk86AImnzIHiiMrr3mxotPs8zA6c4HXb9r4+hesjpS0/oql/FK1FNU2FFg/2+/GKTNCl88ixtjJM8JQo0wxHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njmQpKMe; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njmQpKMe"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso75586137.2;
        Wed, 05 Feb 2025 14:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794332; x=1739399132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62TGT2cJ8N53D9ZE5FWVLQuLK0YScVrC8nxALy7btwM=;
        b=njmQpKMeVEqBdBX7Lg7/KIyJquUnGRb9psEyQ6Fd2BfHBUN6ftV7713Vq6u186gFMv
         VndPYjCncp1rvrDsae/RIShOB+oLNR9R1nJfnuEAaYo6FaO56kqrXAelmXS/U7RM0dBn
         Aden5+7Ivm/3XiyvSnvGEz/ERYzY3jHaudtjCrr2eRjTDvYL9dKk1SrVrw3HKkqEbx/J
         RrAiUAuXuAzU7RqXoCNKdqt4R9SV9jQ2WFAF1aEU0zmIHLTwo4iqsBqSMjqwQ4m+iFdh
         FblpJSDD2O2WZ5S4dNllBacLxzVber8Q+gjajzVxGeQJstsS9Yuck+rxcyHhR+bRy88Q
         4B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794332; x=1739399132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62TGT2cJ8N53D9ZE5FWVLQuLK0YScVrC8nxALy7btwM=;
        b=np3jflzyie8bimcR3KG9yO2/VrN+3gtFGXaR9tQq/NIj5y0koEjP/PsN/PZYWN7KcY
         Py9Y9RR0HN5dc0B2WOQq6jzGitP+3z5wAuAd8gluK7W7+BHwkm9oNqDbHdIbKFfxX767
         AoiXd83UxAYm91TIZ++5EZhv/bG3kMha7fzS10AQJBhN/AYW00P3qrPAQ2wry8tO2kkP
         rRIVikJWwdU7bucW2kqEOqXAtyQ93wj345jW4/y17HX4AioAtq93QQYMCxrjrFOp2/ap
         w8jl2+SCqpBeGb8zVmcN+5V5ZPSkFmDCLtwk4qMPk4VRQIsClZPgdkv42KcoYGv5mP63
         SBTA==
X-Forwarded-Encrypted: i=1; AJvYcCX+rfnw2wnJErLZRL5Vsj7XMO6ZQcsMshI+TJYNnrtITsdM9htNbkFoMYANNHy+nI3xR37pcfcpqQf+JOX4Gk0y/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsK2vkr6wrx6PtBUBlLT70nVWyePRwMYOFqQTylZPRsIw8yan
	oBsRONIIuql0xUAL/8h5aRtuUZeNTNs3w/9OGf2G1yfdIlgUt8X8vkMjmHvX
X-Gm-Gg: ASbGncu1B1IT2H02nlJCX9AWnHVysGc50dap3vwjmljDK3IlDFLEp/WUNJuSSjH/OLK
	ROMV1Zw6KNgKUZGMIcry75RAPmQbEtq4vxueIsH4gAHQX3y3xmIp7tzMUACs6BfnTznkF1eLTbs
	WFkiKLHHlHxkqKkte78NwTIKABBfHXieuy+tKQOGKbpARg1vf6LmRScHcOdsuHhcde8ZJNO8wMx
	eDT5vNsoTtt41lEhxPa8tFylmbn1ovOt3kAmalzzGRmnF4Pss8G3BFkiUrhz8KQfyuZWmP9aPjh
	NVIFiepkfv5hEwv3F5Bm4M1SiWP+5wP2lBYASZirtVngge7K/bpNitt4KbIAbUNiPtPkmwxN9pa
	EtA==
X-Google-Smtp-Source: AGHT+IGvdgPJQLNk8VYsJILY0GbhobojYDagFzi9U9GlfgWpk9agg+4Z4umGvcSaLY4EEXsdXUXAcQ==
X-Received: by 2002:a05:6102:5121:b0:4b2:cca7:7d51 with SMTP id ada2fe7eead31-4ba47a68d02mr2571561137.19.1738794332017;
        Wed, 05 Feb 2025 14:25:32 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:31 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 6/9] dt-bindings: soc: samsung: exynos-sysreg: add compatibles peric0/1 sysreg for Exynos990
Date: Wed,  5 Feb 2025 22:22:20 +0000
Message-Id: <20250205222223.613-7-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Downstream from the Exynos990 kernel source it has more sysreg in flexpmu,
but for now only those two will be added

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index a75aef240..6ca3862b1 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -25,6 +25,8 @@ properties:
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
               - samsung,exynos8895-peric1-sysreg
+              - samsung,exynos990-peric0-sysreg
+              - samsung,exynos990-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
-- 
2.47.1

