Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0DE1E521C;
	Tue, 18 Feb 2025 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905437; cv=none; b=AQNnR4DbOxd5QEkRzNWj477IMyIgf2y/zhGGde2kIEmoucl0J6Yu0y4o3a8JtOaN8N/Pd08BxRymrlsej3D0r2qnUpPryjqIXlcnYFjCmmAgIz5xvzr1CdDS5wkWikggnWDQ50VST+FfB6O/gylX0NhA9dOU8xMbYyLZMCklcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905437; c=relaxed/simple;
	bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1716Xvf9GaPuLubcyQyHe0JpBGzjYzJQy/XcWva+P3BoZEHZpH04zBcaRyf7v1Rx8VXoJa1IMb6+1Ky7nbQl3t3koqdl9/nJFYqSBKGgKCNHoC1RcyqVgoVUoRCLOkoigX/WyDJMELCM+UKsA59PEWlSaXLtKGu1WAEQNIUfIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=G+2+bi6M; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="G+2+bi6M"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4D15225FBD;
	Tue, 18 Feb 2025 20:03:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9Gnftup6573; Tue, 18 Feb 2025 20:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739905428; bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G+2+bi6MADcNLaytdJ66n+HdZQ2SiD5avdJ4arTNjJOzQAXCvUOB0VulexRS4w/x/
	 5WC2chSPzdCVisfDCOdab9/JWaubF2J7Uchw/1oXdnJhCWy0sD2HIyIok55Qeda9+r
	 QIROk1ZeKNRD4hWIVb83XT0usSF0H+J9vcHxVWwOyFMIc1Z0FOeFqX2e43IeOg+3XO
	 gglDKxYQd10uu0I+FK2EaHy7/iw1oTLJjv1J79GK5nckUqM8dkMhTSPn4Tz/u/UNkO
	 Qshd1GzX1h28An/hmuPfCRqNR9X+D25KXso9p8n2P5xPFjTyH0NX1y+bVpgaUwFdl9
	 c6YyMdV2coE4Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:33:11 +0530
Subject: [PATCH v3 1/7] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-v3-1-e384fb610cad@disroot.org>
References: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
In-Reply-To: <20250219-exynos7870-v3-0-e384fb610cad@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739905418; l=992;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rn9baAKmyjlLutADSxQ9BFJcAwJNMgiRNTgHRQpBPKM=;
 b=MhZoQxfIOkbfoArXnAAHVh2wW0jmsogr1O5PtZNQne5jOivUKS6saBPKzIvEz/9Y2BZqrpaVg
 93WHHQpWk1OD6K+qKu/w3lualM9P4qpld9UKxXJe+rugiTZQjRWM+cO
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document the compatible string "samsung,exynos7870-chipid". The
registers are entirely compatible with "samsung,exynos4210-chipid".

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 385aac7161a0db9334a92d78a57a125f23ca1920..9105ad48563a42ecaeb3dbca37df734d5b93f52c 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
+              - samsung,exynos7870-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:

-- 
2.48.1

