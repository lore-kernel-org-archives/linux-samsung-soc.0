Return-Path: <SRS0=nK2D=3U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 375A8C33CB2
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 10:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2F59206F0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Jan 2020 10:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eZQUbn74"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgAaKhg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Jan 2020 05:37:36 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52751 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgAaKhg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Jan 2020 05:37:36 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200131103734euoutp0106130fae85d475756dd2c264ba7bf357~u8mmqY-kJ1474714747euoutp01L
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Jan 2020 10:37:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200131103734euoutp0106130fae85d475756dd2c264ba7bf357~u8mmqY-kJ1474714747euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1580467054;
        bh=G8IfKRpltRBy3gn+x2ps+iVTjgDn0Hfw81VhG610e2s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=eZQUbn74rkl99rYpDzc2EYvxqGkGke74uR/FTQQdyLFqs+Dae0NMd9+r2i1FLpsfL
         RgAujrB0EbqpCoP3TjKR4SdCxXyBcr+4pe4YFeGbppvxe7WZqaSWOlR3plmaXxfJUp
         xugT9bxJDF25/gKy9yS4+Yg/sI5vBOX+DEwz1TKM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200131103734eucas1p1c228e959c92d17ec69bfa9e290f6075c~u8mmd8NQp2137821378eucas1p1j;
        Fri, 31 Jan 2020 10:37:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 57.FB.60698.E63043E5; Fri, 31
        Jan 2020 10:37:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb~u8mmHVElP2969329693eucas1p2c;
        Fri, 31 Jan 2020 10:37:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200131103734eusmtrp1aee35b1cb7e2fc184c2103243707c4e7~u8mmGuB9k2039220392eusmtrp1b;
        Fri, 31 Jan 2020 10:37:34 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-1e-5e34036eb296
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AA.77.08375.E63043E5; Fri, 31
        Jan 2020 10:37:34 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200131103733eusmtip20e207563ebaa2e750c0257cc2a1037b4~u8mlu0UTt0514105141eusmtip2Z;
        Fri, 31 Jan 2020 10:37:33 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH] ARM: dts: exynos: Fix broken reboot on some Odroid U2/X2/U3
 boards
Date:   Fri, 31 Jan 2020 11:37:09 +0100
Message-Id: <20200131103709.15763-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djP87p5zCZxBot71CyWPb7HYrFxxnpW
        i+tfnrNanD+/gd1ixvl9TBZrj9xld2Dz2HF3CaPHplWdbB59W1YxenzeJBfAEsVlk5Kak1mW
        WqRvl8CVcebAL/aCeTwVPbP/MTcwTuXqYuTkkBAwkZi57zJrFyMXh5DACkaJp1+mQzlfGCUa
        1rYxglQJCXxmlFi2yRGmY9qKgywQRcsZJdoa77DBdfx+95YNpIpNwFCi620XmC0ioCrxuW0B
        O0gRs8BLRomj27eDjRUWCJW4/vcdE4jNAlS0cMcOVhCbV8BW4t/BE+wQ6+QlVm84wAxhH2GT
        aD1uBWG7SPTt3ckIYQtLvDq+BapeRuL05B6w8yQEmhklHp5byw7h9DBKXG6aAdVhLXHn3C+g
        8ziATtKUWL9LHyLsKNG58D4rSFhCgE/ixltBkDAzkDlp23RmiDCvREebEES1msSs4+vg1h68
        cAnqTA+JWbdvs0JCLlZi0fYTrBMY5WYh7FrAyLiKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/
        dxMjMPJP/zv+dQfjvj9JhxgFOBiVeHgXnDOKE2JNLCuuzD3EKMHBrCTCK+pqGCfEm5JYWZVa
        lB9fVJqTWnyIUZqDRUmc13jRy1ghgfTEktTs1NSC1CKYLBMHp1QD4+3Xd2//+p3N6Pvbo9KI
        u/B1X0PR2UvT9z4U+Vbn/Pv38S+LPrB9iPcv7NNwznwiw1Z9+8/naRUzbx7UKOxVdBZV2yqp
        u/Ollqft4snWogZbjhof+C8p/FL0wGy9za1PW9R/5KybO/dB1bR/ITxTWj4eqFSrD3Gf0vPW
        Vd9e/L/hiUWHig6lHVFiKc5INNRiLipOBAAvIQT2+AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsVy+t/xe7p5zCZxBhfe8Vgse3yPxWLjjPWs
        Fte/PGe1OH9+A7vFjPP7mCzWHrnL7sDmsePuEkaPTas62Tz6tqxi9Pi8SS6AJUrPpii/tCRV
        ISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv48yBX+wF83gqemb/
        Y25gnMrVxcjJISFgIjFtxUGWLkYuDiGBpYwSy76eY4NIyEicnNbACmELS/y51sUGUfSJUWL2
        9edgCTYBQ4mut11gDSICqhKf2xawgxQxC7xmlNjw9QTQWA4OYYFgiY73dSA1LEA1C3fsAOvl
        FbCV+HfwBDvEAnmJ1RsOME9g5FnAyLCKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMOC2Hfu5
        eQfjpY3BhxgFOBiVeHg9zhjFCbEmlhVX5h5ilOBgVhLhFXU1jBPiTUmsrEotyo8vKs1JLT7E
        aAq0fCKzlGhyPjAa8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
        MFakXXmu4rJF1WK11Z0fkj/jc4VcJ1vE25eo9m3YLyqb552iMINh5ee/Ww7pb8jOZdJJDFge
        Eq70/lK34hm9nMIX87Z+Tr788NCC7exebLvW9i+/oR99ZJIdG7fRDfv9xa/3mHifzuXonH3l
        xA6tw5uVJx3TmfDPLLiz7brdc8OGzvPplvmLzZRYijMSDbWYi4oTAdtkQSFOAgAA
X-CMS-MailID: 20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb
References: <CGME20200131103734eucas1p2ee9005c0d984a40a158367786ad457bb@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bootloader on Odroid U2/X2/U3 boards configures main ARM clock to
1GHz. During the system shutdown procedure Linux kernel selects so called
'suspend-opp' for the CPU cores, what means that ARM clock is set to
800MHz and the CPU supply voltage is adjusted to that value. PMIC
configuration is preserved during the board reboot. Later when the
bootloader tries to enter the 1GHz mode, the voltage value configured by
the kernel might be not high enough for the CPU to operate stable. This
depends on the individual physical properties of each SoC (usually it is
related to the production series) and varies between the boards.
Typically most of the Odroid U3 boards work fine, while most of the U2
and X2 hangs during the reboot.

This commit switches suspend-opp to 1GHz for the Odroid U2/X2/U3 boards,
what finally fixes this issue.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index ea55f377d17c..0126587c7fab 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -534,6 +534,15 @@
 	cap-mmc-highspeed;
 };
 
+&cpu0_opp_table {
+	opp-1000000000 {
+		opp-suspend;
+	};
+	opp-800000000 {
+		/delete-property/opp-suspend;
+	};
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
-- 
2.17.1

