Return-Path: <SRS0=Cil/=AF=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E1AC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Jun 2020 11:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75F052084D
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Jun 2020 11:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8pOtPW1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388795AbgFXLEp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Jun 2020 07:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgFXLEo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 07:04:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A94C061573;
        Wed, 24 Jun 2020 04:04:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so1001221pfa.12;
        Wed, 24 Jun 2020 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/T/N8+T8VRdD2pd3O+kasRwWgBFC0Eh4uFuB6FWblI=;
        b=I8pOtPW1qN3NdT/NC0Qymo1nt/esn4cUsKwRbcH15Rs8nEbfF+tk3ECsLhjiDPOX98
         0sMuNE6FqPHy8+W5Ic+/bdUc/7RQMKMBFuo66J1nE0iRajxdc4IbSReZZ6SOsjZmH+by
         fOYFELp2qLHr/PGSOswQqtagoGjgKN1c3PPMS4CtwUwB9DwEVDjE7ZmnzjqJjlJw+Xf2
         0MxwNAgkLzFZG8qGkBaEuaSBGSvF9f9WpyiCloKUU7Y5dn2a6JjeCE/zHz1pY22donl2
         NKKvL7Qo4doMrJgO/GAjWvjmj5DZRhXGBM2F3Mde8Il7zq3gYCowBP+dlRsaB/C8HK9x
         7M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/T/N8+T8VRdD2pd3O+kasRwWgBFC0Eh4uFuB6FWblI=;
        b=GnBl9HfIf9AXudsPOw1Qmt04dbYcfUnT/anaH3nP0dnZArYbXGB7WfAKNK9DOIFzXh
         sCIVTfBgsYcmhG86R22fDc984FKsgcXgYQWbqL2oZC4JMmzVaCWcpd5dj5kwSg0B8f9H
         bSVRUlRp9FOZp80PdQ90DKngPbYtsAsE09yhOFhKUuHW8RJIWjY+ydAzcfSF+MTI87JR
         0vZY0bFh7sPTCjSl9168TzCUbqPKF+ocPVmgIUPWVIaR0zJUIsYNMyNUyGjgISeUDMrT
         2z+RdvD3VKj3ptyqKFKL6N1WZPKaC232MUoI4ksNzfkgBRbWvxZmg4dShr6yRRmd8rj3
         55Cw==
X-Gm-Message-State: AOAM533rusp+Gh62aOnJNNYLxp/ieInRt4zdT7h52bCtWZzuH8ztjF7/
        cOMQyw2pua+J7E/gZqyvjT7Io5Gn
X-Google-Smtp-Source: ABdhPJwwCBDuUrdAtcpI4eEVifkWpvyoLlDNFzmhdcJKoqs7+myVuPLRwYJLFiikdQHsX+p6HaofpA==
X-Received: by 2002:a65:6089:: with SMTP id t9mr21707464pgu.236.1592996682708;
        Wed, 24 Jun 2020 04:04:42 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.220])
        by smtp.gmail.com with ESMTPSA id s98sm5272796pjb.33.2020.06.24.04.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 04:04:42 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Fix L2 cache-controller nodename
Date:   Wed, 24 Jun 2020 11:04:35 +0000
Message-Id: <20200624110435.1150-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix warning message by changing nodename to 'cache-controller'.

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/l2c2x0.yaml
arch/arm/boot/dts/exynos4210-i9100.dt.yaml: l2-cache-controller@10502000:
	$nodename:0: 'l2-cache-controller@10502000' does not match '
	^(cache-controller|cpu)(@[0-9a-f,]+)*$'
arch/arm/boot/dts/exynos4412-i9300.dt.yaml: l2-cache-controller@10502000:
        $nodename:0: 'l2-cache-controller@10502000' does not match '
        ^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Fixes: 56b60b8bce4a ("ARM: 8265/1: dts: exynos4: Add nodes for L2 cache controller")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 2 +-
 arch/arm/boot/dts/exynos4412.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b4466232f0c1..33435ce79ce4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -97,7 +97,7 @@ pd_lcd1: power-domain@10023ca0 {
 			label = "LCD1";
 		};
 
-		l2c: l2-cache-controller@10502000 {
+		l2c: cache-controller@10502000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x10502000 0x1000>;
 			cache-unified;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 48868947373e..7002832eb4c0 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -213,7 +213,7 @@ pd_isp: power-domain@10023ca0 {
 			label = "ISP";
 		};
 
-		l2c: l2-cache-controller@10502000 {
+		l2c: cache-controller@10502000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x10502000 0x1000>;
 			cache-unified;
-- 
2.27.0

