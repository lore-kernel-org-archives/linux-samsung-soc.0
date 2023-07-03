Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28592EB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 Jul 2023 21:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjGCVsP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 3 Jul 2023 17:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjGCVsO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2023 17:48:14 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B5410D7;
        Mon,  3 Jul 2023 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688420849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZIBH0iqPa4JrF/ybKqeSFFr0n/xkJ271cTM5K0p5/cQ=;
        b=yjzkFAfybAOqo8D0wjdvvR35hNMpwMN104L2Nj+j98H/tBAVpfcZl9/0Vzqp0pXcBoiKaN
        kVE8T07f35X6Q0nN7OqKsjFwTXb6SB4qtZ0zr8S7r2y8wU+tZbWeFui3Rh4F6ISab4jdgI
        99wBXtCm30nD5B93k3jAWghuPQWeQ3o=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>, stable@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: exynos/i9100: Fix LCD screen's physical size
Date:   Mon,  3 Jul 2023 23:47:15 +0200
Message-Id: <20230703214715.623447-4-paul@crapouillou.net>
In-Reply-To: <20230703214715.623447-1-paul@crapouillou.net>
References: <20230703214715.623447-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The previous values were completely bogus, and resulted in the computed
DPI ratio being much lower than reality, causing applications and UIs to
misbehave.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
Cc: <stable@vger.kernel.org> # v5.8+
---
 arch/arm/boot/dts/exynos4210-i9100.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
index 37cd4dde53e4..a9ec1f6c1dea 100644
--- a/arch/arm/boot/dts/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -207,8 +207,8 @@ lcd@0 {
 			power-on-delay = <10>;
 			reset-delay = <10>;
 
-			panel-width-mm = <90>;
-			panel-height-mm = <154>;
+			panel-width-mm = <56>;
+			panel-height-mm = <93>;
 
 			display-timings {
 				timing {
-- 
2.40.1

