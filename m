Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE243C7C8;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222105; cv=none; b=eESAlyGv89VCDi2qRF3ITdRlmY19+S1JxUOKTGMFzU4DZDopnxEsc1eSDNWHkSGmvp6k4bXHI2iRX3hrKv7Db7FkBEbmZhbyc8xwM1xRBeB12vhv4w6oD8fu8bLEWsxNc8Oo/gGeHpktAjHyjU8xfbkUAhivbxKLYACGW5XKElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222105; c=relaxed/simple;
	bh=hBEunpQWvteHiQBkH6asR7vbgoJFracR/Af+GMB/nmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rMz/jznSkLiDQlcnyPaNRK998kbrBzo/Lty7yLaFAlhsIKO+/sXwCJuTKxjj1s9NSiFYQNLL/636FmE6erJk1vvix2TKH+pn9PWW3AkexlnikOP6HvSHGDV6EV/IiBDb9CpL6V9W7L2KHjBpBYOYtZCk9/SfUBIblMTged5KlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/b6fDHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/b6fDHr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BAF0C2BCF5;
	Thu, 16 Jul 2026 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222105;
	bh=hBEunpQWvteHiQBkH6asR7vbgoJFracR/Af+GMB/nmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M/b6fDHrwKdK46qiPKEL7v2r5Uf+EkYj4Xl1q2FVzoSMoZ/VvmWuMZ3EIzztEHFsL
	 gxG6iEE2+p5hiov/tdD2dNRWQWLrdOvNnFxcgzP7gPQtM4gv+9gpyYEz0vd+3inL1E
	 V9i1RjOXP6Rq3nxq2lkZ4OfJZLWMnkOHkNro5ckjkLG55oqWsalHGuNZuJAgOstvX+
	 oBab+/MJJXuuRIOp0ta1Dg388N9vkm3W3jPWVsC2CXc0Xt4pEnxrpvFEw9fjc04dip
	 S2FKUDZ/CmBzgshjFtvQRXpfBtqcupYvJAZyObWTercaiEMJE58h41TGVOpiXLVqdV
	 Uw48/+VHiiNKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2E5C44518;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Date: Thu, 16 Jul 2026 20:14:59 +0300
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for Exynos9610
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-exynos9610-clocks-v2-5-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
In-Reply-To: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=938;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=E1bSKMgEPtMif3Sdy3gDrAXfrBKn4CyIguCFFF+2z0k=;
 b=n/yIIHt/0i3lrYnCiW57+C73q+GrdrF3E7W62qTJpaUVRoTX6GF8REncb6qpBXC4Vi3Pmmib5
 ftMoztZEG5iCYzMucGoacXv/Vte2XaNiRBji4c8FcG2Ye0qwqxLIeis
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
Reply-To: alex@chimac.ro

From: Alexandru Chimac <alex@chimac.ro>

Add maintainers entry for Samsung Exynos9610-based platforms.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd2c02840336..7c26c3ce1696 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24073,6 +24073,15 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 F:	arch/arm64/boot/dts/exynos/exynos8855*
 
+SAMSUNG EXYNOS9610 SoC SUPPORT
+M:	Alexandru Chimac <alex@chimac.ro>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/samsung,exynos9610-cmu.yaml
+F:	drivers/clk/samsung/clk-exynos9610.c
+F:	include/dt-bindings/clock/samsung,exynos9610-cmu.h
+
 SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-kernel@vger.kernel.org

-- 
2.54.0


