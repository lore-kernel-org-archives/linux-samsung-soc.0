Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC0920FA8A;
	Mon,  3 Feb 2025 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615098; cv=none; b=ZxZLw5eznecKS/c0o7xh6VhDf0uh1mOwfE8943rtcoqpVGZYLFS4a4ixOi2DJH3O1e33HsSFYfW3E74VWgS+po0R0TTfCfYQeBocuQ34uPb6qOBtUTEsOcPBEY9UU3xV291kxxrK6d+HEuZxsy9OUvWe8n3mdB3VCG9p+YtvxbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615098; c=relaxed/simple;
	bh=BM8KTx7qJDDiJNeKHrn26vD1xnuMWeG6T6MPrixeQdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/N5j/fmIdYJGJncbMcQoQf6fE1dwdeMdYDCvLrSSpOYOUVrVvFYePu1J63uhfOrNBk0qKxcx2ADtVfv0SjlUPRCkMjw17MZUlxFarrnITa9H8hJK+OIpJrmdcnFmz9PX+8Sgd++7ojgcIgr8oM0qwpLGc2sBgGU59CvVdso0wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TVK2qYEO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TVK2qYEO"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 462BC25A8D;
	Mon,  3 Feb 2025 21:38:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5I_KCr3BtRJ; Mon,  3 Feb 2025 21:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615094; bh=BM8KTx7qJDDiJNeKHrn26vD1xnuMWeG6T6MPrixeQdM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TVK2qYEOgcBvPnVduuqKO16F+8W2m1ktj9lsZS3Kd4lmOG6N+lQX4Pd/jC+TSEiHy
	 7Z7we9AvNpC4Q+phR8ZXbTsWy1jR6LW/wAHD66HPeN+Hn4EQUxNFVYSDLmOmS0WB0H
	 iwqPkdXmZEeYCpycbfYKlZqswqg+WLpLvojrDghfeglwWkDrneBgHF41DwIFnWpJgV
	 jgfodJEf/L1Zjw9QTHX79MHmTBCXXudzcBJV4M5pWLRUkWqo6eVUm+pDEaxJzFrDud
	 lquSByfpPZNtIWwEPjlwtyFnnV6ZUkUrI1PIv+imiHcAm5JbcdFIlO/wnxelYAfwDj
	 5g3BYPwrlolug==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:07:31 +0530
Subject: [PATCH 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmu-clocks-v1-3-a3030ae5bb53@disroot.org>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=1048;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BM8KTx7qJDDiJNeKHrn26vD1xnuMWeG6T6MPrixeQdM=;
 b=OjIsm7aAdxOvTanlynmTqzxSvjLH3a5d92aUfx5++D0nBr0+scRHxrbmOSA3siGz3RNBTVFmc
 1KyMHWBOpu1D/ps528NG78jotKdZ0OsillWdrDtMsKsSaoqorwKBRnC
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string for the Exynos7870 PMU. It's compatible
with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode, as
well as other system control registers (i.e registers for the USB PHY).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8c97de0c843a91350a5cb9c332b2d6ce..3baee81df54981cb4c6502c1ddf5be3d5e3184c3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos7870-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu

-- 
2.48.1

