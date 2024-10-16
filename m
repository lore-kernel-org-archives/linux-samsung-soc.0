Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5D21018D;
	Wed, 16 Oct 2024 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093704; cv=none; b=qd2MKJVnlK5elCfz/zhzE3RNoZ5KLroSTNW5B3TsdbgGMM+3dcNdP1bLHXb5A94Jmqhuub+Tgk8cGTrvt0EpUgdrEnpo28eyWh5bZHQPRO3fwthUoAaRhDwssxxirZ0GlOOPqfxZdXkDlX/sHYeBgLHYJGFvzyFbOgDr4lty4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093704; c=relaxed/simple;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmbhTns5K13OuAaxThmlHFkQqU2vmgHr0mxzu/S7g8+ZL9reB6GbcwXXod+2nWuvSeaV4SpaS3FneneyTxTqlIC5cFV3INsxTkXwIOeXsiofgUSDUEesw1InW6OKJmKUdeY8+UgLmbwvGSIOqyEr/5XPIb8foQnNhXBtX+I2GAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=B+ETL4ll; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="B+ETL4ll"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFjq4ckNz4wjJ;
	Wed, 16 Oct 2024 15:48:15 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFjh358Xz8sWT;
	Wed, 16 Oct 2024 15:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093690;
	bh=N1tK/Gf1hqrbHvTeOFOJ9O1O9vrudZVyOkpSwb3tzr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B+ETL4ll07A17RBZHG6Vm3Fzv2f6DcPAXXF5r98lKK+spqgO1KQsP1inPhoTQ1yB3
	 Z2RvA9xj9ZK4qOc5Nk9xvYJpPMNE21j9IFMh5j/5qspxlZpTIQFf2AysAv/RtzXzqW
	 AcXxLPp0CuqTcxATxBAsPpwCQE/T/+ay/Wkc+NYnDsYknBuJeLn1edKITIXUgq98pL
	 FUjGPRtgqtGsiFPi++leKVfcgyiaQjMNQludiverl94+23+ctaE2AfB2ZfCRvMK+pi
	 hrAog9WLEKJSdOaO/J1pihgkajmn77wV8RfdL10Q8VZZ5B8BAix8nH7899siDJTr5m
	 yVrtNQrpD1b9g==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 2/6] dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
Date: Wed, 16 Oct 2024 17:47:43 +0200
Message-ID: <20241016154747.64343-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
References: <20241016154747.64343-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the exynos990-chipid node, used by
Exynos 990 platforms.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index c50ee587dc1e..47a8d98346eb 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.45.2

