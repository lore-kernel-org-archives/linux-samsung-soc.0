Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518CBC43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26266206F8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YaGeCl5c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgCZPJ6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 11:09:58 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45227 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbgCZPJ6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 11:09:58 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326150956euoutp017e166225d954deccdd7dd0c77a33bdd3~-4zGvTqQ82403324033euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 15:09:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326150956euoutp017e166225d954deccdd7dd0c77a33bdd3~-4zGvTqQ82403324033euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585235396;
        bh=pw7aKR2d3SR38cZDtYmq5r3OrEZJymeEEyYQ1p3erHM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=YaGeCl5cjAI3Db8ut0RfLX0nZe5lNMQav+Oe2yECeYjpEgT+fMrZW/zeR021Rh+Va
         dHzMFX5wWisqD2LHufKicG1dBqW+7vJYy9NGxYnTql/fO/2sKDH/IwUR+r6Edrae81
         dlXCfzNph5aK9Q5oWXjRl3TkaUOj+yD3T4N18uAY=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200326150956eucas1p2e21af9c79182196298391eff93573c1e~-4zGlFqsk2797327973eucas1p2E;
        Thu, 26 Mar 2020 15:09:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D6.33.60679.4C5CC7E5; Thu, 26
        Mar 2020 15:09:56 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807~-4zGBCwIh3273532735eucas1p1I;
        Thu, 26 Mar 2020 15:09:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326150955eusmtrp16a6c8ebecaa15c1469b5948247211ca3~-4zF_i2eU2105221052eusmtrp1S;
        Thu, 26 Mar 2020 15:09:55 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-cb-5e7cc5c4dca1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0B.14.08375.3C5CC7E5; Thu, 26
        Mar 2020 15:09:55 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326150955eusmtip14e5718e013de8254bde69cd27f3c56bc~-4zFlKdS41680516805eusmtip1u;
        Thu, 26 Mar 2020 15:09:55 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove useless address/size cells for
 mshc_0 on Rinato
Date:   Thu, 26 Mar 2020 16:09:46 +0100
Message-Id: <20200326150946.27336-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7djP87pHjtbEGbR3cVlsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsEroyJkzYw
        F/xnqVhzfANbA+Msli5GTg4JAROJzQ//MHcxcnEICaxglDi+7Qo7hPOFUeL65X9Qmc+MEu2v
        Wlm7GDnAWo6fF4eIL2eUOPOziRVkFFjHz6npIDabgKFE19suNhBbREBV4nPbArCpzALbGCW2
        9D5gBkkIC0RL7G2cxwwylAWoaPorO5Awr4CtxIdJK6DOk5dYveEA2BESAjvYJNZuv8IEcYSL
        xJK3NRA1whKvjm9hh7BlJE5P7mGBqG9mlHh4bi07hNPDKHG5aQYjRJW1xJ1zv9hABjELaEqs
        36UPMdNR4ttuewiTT+LGW0GQYmYgc9K26cwQYV6JjjYhiBlqErOOr4PbevDCJWYI20PiT9c2
        ZkiIxEpc2fKPdQKj3CyEVQsYGVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIExvfpf8e/
        7GDc9SfpEKMAB6MSD69GS02cEGtiWXFl7iFGCQ5mJRHep5FAId6UxMqq1KL8+KLSnNTiQ4zS
        HCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhjlPA6YiG98nn/y861lLsUS21SMf3Y2OF02
        SGCo2sAQ4S+w/sktrc4vt5xzwqy7t7keZy8x2VKz/nFqtYhmbbXd06uvwj71rnhfYT4zo/WO
        FavKXlmRjD9WHy+ztpoovdX7cFJh67OnAhdnHahreCh6YNERAY0Ei2WVqbdy5jo8VTm/Weht
        02olluKMREMt5qLiRADxdIsD6wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsVy+t/xu7qHj9bEGezcIW+xccZ6VovrX56z
        Wpw/v4HdYsb5fUwWa4/cZXdg9di0qpPNo2/LKkaPz5vkApij9GyK8ktLUhUy8otLbJWiDS2M
        9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DImTtrAXPCfpWLN8Q1sDYyzWLoYOTgk
        BEwkjp8X72Lk4hASWMoocfPhIsYuRk6guIzEyWkNrBC2sMSfa11sILaQwCdGiU+ThUBsNgFD
        ia63EHERAVWJz20L2EEGMQvsYJTYsuMtWLOwQKTE/64drCDLWICKpr+yAwnzCthKfJi0ggVi
        vrzE6g0HmCcw8ixgZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGFjbjv3cvIPx0sbgQ4wC
        HIxKPLwaLTVxQqyJZcWVuYcYJTiYlUR4n0YChXhTEiurUovy44tKc1KLDzGaAu2eyCwlmpwP
        DPq8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2M8ode3inb0Hv/
        H+ebfw7SVTdnSF8UvJq5qXfytXff8q9vuScy/azMLacHsxiubnszeWJmYC7jk8qs49NLbN/2
        MExomKJ2Qf0XZ4aksPw1/rwNmy1sY06/8rot4nmx202xNN6a7VrwjsjLFSdNrCq+lVwt+as2
        +UjtDyXH6Ke8275OSzo8Y4LdciWW4oxEQy3mouJEAH2uZyhCAgAA
X-CMS-MailID: 20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807
References: <CGME20200326150955eucas1p16b8baa528a4d8e845accd67fc77d5807@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

mshc_0 node doesn't have any children, so there is no need for address
and size-cells properties.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 7b62c1e712f9..5f4e8f5a8b96 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -611,8 +611,6 @@
 };
 
 &mshc_0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	broken-cd;
 	non-removable;
 	cap-mmc-highspeed;
-- 
2.17.1

