Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAED0C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB2A22222C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 18:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603736183;
	bh=0oF4dz/2YwFiQ3HuQAwu4aotiwlQcqusAsPF+PCKk9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=teeiI0voZmeEuLWLFhhAy39utI6YjrzcYmMV/SPRQFMc2hbp/Iv30AYwC9NPhqt3f
	 wlFhha74baSx42ygdSxF3QWwVqmU/mMYG4JZOorX/fNugfZ47QoufRXfmtszpU9Tvn
	 O/jH7YheS+aAMZoiWVzPFwN5bwORgZcgMCQSMC5w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1789459AbgJZSQR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 14:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:59950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1789455AbgJZSQQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 14:16:16 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9438B222C8;
        Mon, 26 Oct 2020 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603736176;
        bh=0oF4dz/2YwFiQ3HuQAwu4aotiwlQcqusAsPF+PCKk9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PjStuzUU9U5ionG9yspz8dKzcWsQm8PKqOVh8wgrGp0W1sutKk+ZjbsRsNVuh8c6j
         fYZgqOUARBrzknLuZCuv5qMqSBIJnM/1iWM5h039f5gvNfjWRQ7+jb1OKz0PxhjXU6
         9zsGqfu0JmdTji24PpVjY9HBfrW4t2P1o+6AHLkA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 12/12] arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2
Date:   Mon, 26 Oct 2020 19:15:28 +0100
Message-Id: <20201026181528.163143-13-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026181528.163143-1-krzk@kernel.org>
References: <20201026181528.163143-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

New nodes are enabled by default, so status=okay is not needed for them.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not actually tested on the HW, just checked the output DTB.
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 143f45eaa953..bf92d126d59a 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -92,7 +92,6 @@ i2c_max98504: i2c-gpio-0 {
 		i2c-gpio,delay-us = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "okay";
 
 		max98504: codec@31 {
 			compatible = "maxim,max98504";
-- 
2.25.1

