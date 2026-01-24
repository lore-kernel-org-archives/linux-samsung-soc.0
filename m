Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82D27A916;
	Sat, 24 Jan 2026 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769285258; cv=none; b=XT9fiG7SGVFUXKYh0ShvgYkAnKhW96NkBz8z/RhzW0NyK0LaraO4jgQuZOFs5KFFx1hiAFqHeYg0MaSsSkQNTkKNKa4VgWwwDZlhuId6YsumEwPwEttIizwYDYgK9DixvCKMwfFYMqHG2ID1E0xNGEddnswo0weMxYSM+Zdp4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769285258; c=relaxed/simple;
	bh=6WLysDQHDS/NxD9rZS9oYzGmPdkPu5Wzpeu6uK+5x3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDMv3Z4eldS+Ygmrxk6O+pRJObps52t7w1ZjT5gIguL9mg9FRB/OJDn5RYCsL9CuMIXpiwXMGIs1RuFXS3DxrXsZhgvZUXZBjTCC/DW/tc+Cf9VCSlUCpYvr7hOXxSEHBi+/6kwgIsasNDy8NQRtefQ0EivNEquUqo3avfka3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=c8AaXmjz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="c8AaXmjz"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C237727E02;
	Sat, 24 Jan 2026 21:07:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ1Il6ZpQfLY; Sat, 24 Jan 2026 21:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769285255; bh=6WLysDQHDS/NxD9rZS9oYzGmPdkPu5Wzpeu6uK+5x3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=c8AaXmjzlqAjce+Pc7UMyIThC+BzxvNVoKnACoNNoHWIHkFOI1E5XiLl/xbp4T1iA
	 xWMTzg8UnP1Zgb2FLcgV6s4JD/pUlDs3IOzzx89Wpq/Z8d1bMai5BWgGsFRxhptbb3
	 MGB7/1AJaIbufCPvJvVAZ/bqi2K9iZEezwFSpdjCYpjOhQIGj0OYJdFdZw34wRNo8T
	 t/mfF6wYMir/kkDPvs2bi8wBx5T9vTrSfN4rIwvAvOA1W9lB+OBLUvTiN0O/pzKUWu
	 JVefdZzNHFVIAiBYK8nOkgNTmR0orktCUlzZXR6MPIPkieNAJLDEP1UTsrYi2B+oJC
	 JiatpJZpeXApw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 25 Jan 2026 01:35:26 +0530
Subject: [PATCH 1/2] dt-bindings: arm: samsung: add compatible for
 samsung-j7xelte
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-exynos7870-j7xelte-v1-1-5cacc3042c42@disroot.org>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
In-Reply-To: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>

Document the board compatible for Samsung Galaxy J7 (2016), an
Exynos7870 device.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8e20e602c205..711824c0dd7e3 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -217,6 +217,7 @@ properties:
           - enum:
               - samsung,a2corelte               # Samsung Galaxy A2 Core
               - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,j7xelte                 # Samsung Galaxy J7 (2016)
               - samsung,on7xelte                # Samsung Galaxy J7 Prime
           - const: samsung,exynos7870
 

-- 
2.52.0

