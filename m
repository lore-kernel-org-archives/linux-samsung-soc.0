Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E79B1B4124;
	Wed,  4 Dec 2024 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324387; cv=none; b=EaEsnqmLdNZmATeWDkvVnhnXxa3SctWtvdnYPDY2sgc4QVYpNdHMjNvLouPsmbA58DrkXVJlf0Ct1iCFlrk9z5bSZ6PXQ0OTRnlEo5WxxopLFBPTHuVNm8hpandi1OPSmGhgPMOizEm/5wCV8ZuOoeFpMGOvWfCeYvl9duQla18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324387; c=relaxed/simple;
	bh=NcUhC83cFlqmRmSFrXtC0hbpqm6HSQrM74C2peoi7/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7YTMV9lHrfnBCwm/tFsY6p9U+kbQpb6cwfjCNOoACH4DLfMfnKL30yc76hwPcofV+Oxc4bbrNkxynCQAyCaMOq0l3dnT8jwyKhajXfNlEmmi2fCORjg3vmRWbKboDpRIM8yXUPXo+m/m5dWZh9CsV3Ii4kKAtaTvUkYg8aP5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=UOqS+q4K; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="UOqS+q4K"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LKD0JDNz4wVW;
	Wed, 04 Dec 2024 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK501txz8sWV;
	Wed,  4 Dec 2024 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324378;
	bh=NcUhC83cFlqmRmSFrXtC0hbpqm6HSQrM74C2peoi7/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOqS+q4KniEzdyIqIrbQMfKgc0SzdFrItO9+xVg61ME9ZaE9lgsvLqwhOKrSATEq0
	 vNQX0pGhDNdm4wmGHP/RJTa/OdPIgM+A9sHrx8r42t0amx+dPxa0oI4absH8d8rbFl
	 2Ui2FSARKScF3zQze4f8ybXCwKnj1DKes6guYRJcO/T1Vp9hgxAhj3mZx7LxjcNO7B
	 M9qfxzAx3uDkPyxWAXUVlhesxk8lERD+ZiraFmYWVx30NwtZldigAxWDlNPmfusCCK
	 8COsfKiDRt37CNlHtXhTG7pDnrxYvefxWbloyTRGKW5IZ8ui9DtRCKfqHdLvax1BNj
	 szWjOQ7NBbYNw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Wed,  4 Dec 2024 15:55:58 +0100
Message-ID: <20241204145559.524932-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dt-binding compatible for the Exynos990 PMU. It's compatible
with the Exynos7 PMU design. It handles system reboot, as well as
other system control registers (i.e registers for the USB PHY).

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.45.2

