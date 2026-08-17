Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD383AAF5B;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961513; cv=none; b=ggbur2/bFy9/aCTksfHMWyIymuCe1St9Ag74QJKnsXWDJnHZ66atb6Tqzc/CIf14PICRp3aeV+zHTACdVY/Cq8ndMsNGyNyxuR2L0PzUOKn3l+kmFkJG+SP9T5IjbTzHBsyD8cgj+374Q8qDcMMbpxN7JZ/GS7W3BSmzu8FgJCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961513; c=relaxed/simple;
	bh=HBymSy0e8V1Jdo3HydqtzVX4WJvfuiz0AeM/kPrBAho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PL6OZ/KQ+ETZbMR6MmS+EJlPuz5V6vemRXzQGLi1kVNs0qJ4NLrZY9usQr2xF8N+eQ9iKWw1ANXs8RZc610LoQrd0ot/yyCByBPwegjoGfoiyNSELTzS4QF6GdIIsUtrL9eQvIr4dgPUeBaSyYSiNDw3FY5dUFXJ6gQBVLCRC3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4sqlQuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4sqlQuw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04A12C2BCB3;
	Mon, 17 Aug 2026 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961513;
	bh=HBymSy0e8V1Jdo3HydqtzVX4WJvfuiz0AeM/kPrBAho=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X4sqlQuw/USMGTU7Ig1sLJFQfMJqdfQ9bjPa3DsDMrpGvz29zFaUO/jh7UGOLF7r6
	 o+EJxOXXVoXU9sgt61fGxUwxexFVfrSn9QsrxRPtzDj2l2I0ifNOOWLo2Ksh5Dn077
	 P8Lfcq6cBI+3qF4AHD+9dS/XcelSkcIZSPBxA8MVU3q9IPBuwzmLn6JUouvp0eiVve
	 G+OQvueWuOPCLQiCd3PpSeVTbtzOzbZ8pxx8ukJBphgw4vYw0j/Rn6GE+eF/rAXJK3
	 15fCzrKdcyat2wnRC0NE5iRGk99gI+F64Pw5iB0RJYqiPW8CSXCTv6bNc/wuSNlZmk
	 j0AFZnxqXYTrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D908FC5B572;
	Mon, 17 Aug 2026 10:11:52 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/2] Hi there,
Date: Mon, 17 Aug 2026 11:11:44 +0100
Message-Id: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDegmoC/yXMQQ6CMBBG4auQWTsJEK3gVQwLGH5k1BTSFlPTc
 HerLr/Fe4k8nMLTpUjk8FKvi82oDgXJ3NsbWMdsqsvalE114mlxbBEDPzd5vM8ss646MkRwbI0
 0Zmgpx6vDpPE3vnZ/+224Q8L3Rvv+AXE+4tJ6AAAA
X-Change-ID: 20260815-for-next-lucky7-chipid-ecce496c86b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=HBymSy0e8V1Jdo3HydqtzVX4WJvfuiz0AeM/kPrBAho=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt5ikqtrRi9zC5WphlCcPFX8+LqrSpK0WCl/O
 YMXUIuPtquJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLeYgAKCRBJJwGyxHrX
 6/cXEADNUPtRxwYaI87hahphr8JmnU/eihs96reJnyIwHeK4Q81v34q+MMmk3Ztxm29PDT57p0f
 SRqG8QJHZ5k3TOhhA3qTjbN/tvx6W093AAhA9TnvkZ57TdeP4VUlDCdi0Z/nKsg4sG4xdpwkIxe
 agUvqoyzLeBFcuym0EhQe75nRGvyRmVCxW7t0+HP6tZoVC9lbdKN6EOCGmBDYNeIS4au58yqU20
 UEK87Lk0sqWFFtsJmgUx2UFQKwNGu5R7xZaifr+T1k2JfjLOW43/4AP/Mgg6Ex2uaM/oFiRY09x
 tjxNsClfBB/FboFsvAa40jPyXuWZcUPiDPhEPU+ZRlfQIrqMkE8wMguJDaegIRFZjFZnXnHBNC5
 skKlydIu87+QXlTEsr7oHLuvQrjYWaxRtNIZyB1E1n5TJt9EcUZ6NeenUDRTHCSwsspkvwsduyg
 6bRfxNu3bsxynLUSkDYpB6xGorJo2equ16wofTWyB6fn/vYbdT859ou9nLfNoY8M7XdeB/0/6Ya
 kV86yXhrkf2/YnmWCMSL4l3FdjtqKIglXwhwg4Guf8GioKYi8s5TsKe+7UplE8RfBG1R62oqWw9
 a3GePb9GVkkzGSn6Q6Max+Iz8Xfy8Vp0l/QsQdnsrysUFf9PbU8X9cxOAYaGs6aBVzhf8UxH+nV
 gnuNHLUgrBN7H7Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

This patchset adds support for the Exynos5515 SoC's chipid to the
chipid driver, and documents the samsung,exynos5515-chipid compatible.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
      soc: samsung: exynos-chipid: Add exynos5515 SoC support

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-chipid-ecce496c86b9

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


