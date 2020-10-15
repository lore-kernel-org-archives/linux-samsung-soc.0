Return-Path: <SRS0=zMHd=DW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0861BC433E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:21:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0150221EB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Oct 2020 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602786059;
	bh=4PM3lkFsHSYdM+Xy64virN9A07FT5yYAZKvrk/oAr6g=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=TnbMDpMzqMRNWfJeGDYDIjhcjDLr6wurm1BvGPnbkg6IJtce4lTDjTNCMjVyG4/sL
	 SMjbnOfjv81KreqYgf7u0cltEEFXYvlpYG7ISNyYJVh+LPXb2uBxvIPZgqv++q9att
	 s91lcXFglY5Q4Y48vM99zSF9hf6M2nsZbekxkKac=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732931AbgJOSU4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Oct 2020 14:20:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732918AbgJOSU4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 14:20:56 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3F3420760;
        Thu, 15 Oct 2020 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602786055;
        bh=4PM3lkFsHSYdM+Xy64virN9A07FT5yYAZKvrk/oAr6g=;
        h=From:To:Cc:Subject:Date:From;
        b=gT3M3YzNo7pyxR1DfBVU7GobBpHX5lbRW+Uic+Jkfhn18bizF3XJv9x9qsdeIcGy1
         5FpBm3ZoOVkd5mRjGFW9TDCWVt73NTHncBn9NPTyMZwqdoFrD39779iZfFVPHRQqps
         +H6X3Q9oGUOO/u4RR0/dxG1ys+onQfuUqrHDNg7Y=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Gabriel Ribba Esteva <gabriel.ribbae@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: exynos: fix roles of USB 3.0 ports on Odroid XU
Date:   Thu, 15 Oct 2020 20:20:41 +0200
Message-Id: <20201015182044.480562-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Odroid XU board the USB3-0 port is a microUSB and USB3-1 port is USB
type A (host).  The roles were copied from Odroid XU3 (Exynos5422)
design which has it reversed.

Fixes: 8149afe4dbf9 ("ARM: dts: exynos: Add initial support for Odroid XU board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 4f9297ae0763..353eb6ef3a04 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -637,11 +637,11 @@ &tmu_cpu3 {
 };
 
 &usbdrd_dwc3_0 {
-	dr_mode = "host";
+	dr_mode = "peripheral";
 };
 
 &usbdrd_dwc3_1 {
-	dr_mode = "peripheral";
+	dr_mode = "host";
 };
 
 &usbdrd3_0 {
-- 
2.25.1

