Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080EF25760
	for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Jan 2025 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024075; cv=none; b=HyS6u7l2jNCWyrJ+miQDJqKMzv98I8DY3eB3DA5lMGqgQ4XpoLOKhmKH11FKWwp6KMCb71Il4AcYAMegRilRZM+utCNF1SDoEsfOU+xhxivxRus0aZHr8+36You8T0DAyONU/eojMJ2Scg3rhgyljycWgcdfVGnaM8QiHevtzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024075; c=relaxed/simple;
	bh=u277CPLBGNkpYhIE1Rr/ra64g8X2BqQPgiL87IDzy5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJ081M6PkF2Joln0KbP5DQ7W8VnQ1Duq2vELeHqaCmUNcTRNnAePF6208D9OD2/QNHt+S4O8wrzaJCLjZtEOCD3nRFFFLbubcAV9ucBdL5XwyCpZXipmgLorHAHVH3mXuOqI9pKyY/e+4UzEjC1vW3Tf1L5yBu7N1kSSWX1tiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=FEXNIqLb; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="FEXNIqLb"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=FEXNIqLbA2dho6TkleojVJU/mNabeFXI+ZNE1ovlYhYWGv6w+dSDF7Ao+DJsC9IkhHH6czuTO/nXxpeJEbpsalZgHGURIbCDWTaRBMcNSP3S1OBR3QcwpZ7OBcGljJ25BX41BlvQ6Hz6Puacv/fvUFxtI7TjpqGElO8AkcbU43BcyiGjPQlOdfCY4ckyvFCVmDwgCTiYPjKltJhEbwkJJojdVcjLB9j/ZRk1WDcBd9ZMQ8E9yiI1/5oyyQ2VmovZpW/ioM1tjdTfsqcTmWjj9URkPiTX/Fcvfw/rSckDX8F8GNuxk7S4WtNyTxwT9RcFYuk8bsNZLV/Z45zKmI7lqA==; s=purelymail3; d=purelymail.com; v=1; bh=u277CPLBGNkpYhIE1Rr/ra64g8X2BqQPgiL87IDzy5Q=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166263896;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:54:30 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Sat, 04 Jan 2025 21:54:16 +0100
Subject: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
In-Reply-To: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736024066; l=1238;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=u277CPLBGNkpYhIE1Rr/ra64g8X2BqQPgiL87IDzy5Q=;
 b=LmjPRu8Mc9V1XnLhYRXEnZgszVTkWv+64u5dFvrbNqNXJzVqL6r4jRSD41n4kiRqffrzMcZUN
 ClRoiJQmxEGD67zArdb9WO7RM52IToo79RzKP82xSBa4TBPXaN5Wcc2
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a dedicated compatible for the MCT of the Exynos 990 SoC.
The design for the timer is reused from previous SoCs.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 02d1c355808e4eadd77b98247cd70e76aea72b21..12ff972bfefcc5dcef2a38582e963ea49a567d18 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -34,6 +34,7 @@ properties:
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
               - samsung,exynos8895-mct
+              - samsung,exynos990-mct
               - tesla,fsd-mct
           - const: samsung,exynos4210-mct
 
@@ -135,6 +136,7 @@ allOf:
               - samsung,exynos5433-mct
               - samsung,exynos850-mct
               - samsung,exynos8895-mct
+              - samsung,exynos990-mct
     then:
       properties:
         interrupts:

-- 
2.45.2

