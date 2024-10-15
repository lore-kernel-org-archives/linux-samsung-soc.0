Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746471F9EDF;
	Tue, 15 Oct 2024 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026145; cv=none; b=iwnzVtGBGOcV/yI1c6B/+QyDIhJweLFuHeS5woNqnyZsjvoYvwBigXZNKKTx06/31bx2mFf5eDQZdvFxZsx3sGi8eURruCxg079Cah/A1n4t8m32XasK4SARxfwC7kFN63AiZzsey6gUC1LphN3vmNhuBHJmuPMYFBIkHhLvczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026145; c=relaxed/simple;
	bh=S3U+b3hTaCTPOPTp+geqZoOfUjqW4wpwzav1nDtIva8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq+V6wZUmm321/F9LyTvHVnn15KBbucs+jm7IsocQm48Kqax3N34LsOxeATveBVufdfMfSH+dknt5o9z2kC1L1DyeG8DE2qhCzo2ZeThMe3YtCm8V9U+t5r+9WELhiBN4yimBvPYA4WBdMjQhc+bM3N6jmF5psP3PulG+Ol2mkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=K/wjhL/2; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="K/wjhL/2"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmkk35hVz4wgK;
	Tue, 15 Oct 2024 21:02:22 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmkb0GFSz8sWQ;
	Tue, 15 Oct 2024 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026137;
	bh=S3U+b3hTaCTPOPTp+geqZoOfUjqW4wpwzav1nDtIva8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/wjhL/23r89FgL9aOhWt2aBm++h99sxoVN6pRLfSNww6aXy27+WoLdCr+H/5K9T7
	 vbIIKzLkeOCh7mt1lfaKzDm3CPQklGLWhl34NVmbTno6C6X2GS3h1xKp/Rpy3JZ0ib
	 2WepQ4cjAaNIfq/vmsQxZIpYkCkd3zjokdZbZeEhGXSxbCvcv4hpJ/mhA1SnTHuQSG
	 tMazyZBAO8Bfas3W4s1Qa4D3IAHcJmwOcLxOWRmGI4nV0oHVyBZ6O+irZtM4V3agDW
	 /85/paq6lI4lNxQr6ZWnafaCV62/1kgY2xscFkEMgWJECh4EXSXkLJ3SG4GhEyeOye
	 NTkYAn/ApenFg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	David Wronek <davidwronek@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: arm: cpus: Add Samsung Mongoose M5
Date: Tue, 15 Oct 2024 23:02:00 +0200
Message-ID: <20241015210205.963931-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210205.963931-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the Samsung Mongoose M5 cores, found in
the Exynos 990.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index e41a8aec6066..c54d20dd9d7e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m5
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.45.2

