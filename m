Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F38E9270D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 15:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjJEPlm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbjJEPlH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 11:41:07 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EE0677EE
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 07:55:47 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231005111725euoutp01c245783405ac8335e11509208d0db0b8~LMfySNrXX1624916249euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 11:17:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231005111725euoutp01c245783405ac8335e11509208d0db0b8~LMfySNrXX1624916249euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696504645;
        bh=WdBl7UA5fyuvUgO4bx/z2RRv+6uENgRWAgMYFmjv1v0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=RWAI7tryPW1UQ41T0zekv0fB9jls8RV6KhI9wRlwVYaBTOImszqdzfLgZeCshVMP7
         eX4T/OOshgoDAhe1UtyGNyPXp/9ne/3kxIySMhKgCX7ATgzE5o0LbDRBxtqu0lMh3J
         kwYf2vDTjg+RBJVgoSG8efvOLSp3bd/4Gez0Nhmk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231005111725eucas1p29c5e3b6d6e1c8078f6f8bfd5bf16d75d~LMfx9dD231064510645eucas1p24;
        Thu,  5 Oct 2023 11:17:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 3C.5C.11320.54B9E156; Thu,  5
        Oct 2023 12:17:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db~LMfxoH8EQ2766727667eucas1p1F;
        Thu,  5 Oct 2023 11:17:24 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231005111724eusmtrp1eec3f9f538305377efc58943d340df5b~LMfxnnubX0863208632eusmtrp1_;
        Thu,  5 Oct 2023 11:17:24 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-d4-651e9b45b99e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 04.28.10549.44B9E156; Thu,  5
        Oct 2023 12:17:24 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231005111724eusmtip1580d0b3d51467eb00be8435d216ecd37~LMfxJjzof2779027790eusmtip1Y;
        Thu,  5 Oct 2023 11:17:24 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: multi_v7_defconfig: add tm2-touchkey driver
Date:   Thu,  5 Oct 2023 13:17:18 +0200
Message-Id: <20231005111718.1096634-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzneV3X2XKpBse7WSwezNvGZvF30jF2
        i72vt7JbbHp8jdVixvl9TBZrj9xld2Dz+P1rEqPHnWt72Dw2L6n36NuyitHj8ya5ANYoLpuU
        1JzMstQifbsEroymUwsZC/6zVnRskWxgXMDaxcjJISFgIjHt9GWmLkYuDiGBFYwS/1Y3MkI4
        XxglTnS1M0M4nxklGnZMY4JpmbD5CAtEYjmjxKSP31ngWt4ePM4MUsUmYCjR9baLrYuRg0NE
        wFti+TVFkBpmgfWMEpe+zGIFiQsLOEr0fhAGKWcRUJXo7f4MtoBXwF7i4oOZ7BDL5CX2HzzL
        DBEXlDg58wkLiM0MFG/eOhvsOgmBqRwSG0+sgbrORWJD7yyo54QlXh3fAjVIRuL05B4WiIZ2
        RokFv+8zQTgTgH57fosRospa4s65X2BXMwtoSqzfpQ9iSgAdOn2RBYTJJ3HjrSDEDXwSk7ZN
        Z4YI80p0tAlBzFCTmHV8HdzWgxcuQZV4SOzZwwUSFhKIlZh/cDf7BEaFWUgem4XksVkIFyxg
        ZF7FKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmFpO/zv+ZQfj8lcf9Q4xMnEwHmKU4GBW
        EuFNb5BJFeJNSaysSi3Kjy8qzUktPsQozcGiJM6rbXsyWUggPbEkNTs1tSC1CCbLxMEp1cCk
        +njRQl2WFqPVnHO5Rfqrz8c+eBa81Ed+g+BvA37j2KyHW0sLTh+sVDioe1Dw3Jq5efOTqxkv
        Nc6Q/L85fc5954cSRczrvzZc89S8K//06d8PPQu2CrOcKj/489f7a0dPzo5n9ZMU9JBqy7s+
        sf3bTYPHmk6xjmXO2rtypPW49G9XXLU+9qbyjatI7lbdWkO1mE03/Tafz0xdxvZ9ntwMzj8T
        mhcu/xTyb1VfWxrTsp4UBrXp1xwDPstbrGJWXbxyhuoU4Y6bt3wnx64+XRLh6zmhs/uR26Ef
        +lO/Xmo4xfnpmr7htwgZedmJHPfN3CuFV5bYLskxKT0TM0OwWrZA8hAbR37q549soqvW9nor
        sRRnJBpqMRcVJwIAnCFq/JwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsVy+t/xu7ous+VSDfpvqVs8mLeNzeLvpGPs
        Fntfb2W32PT4GqvFjPP7mCzWHrnL7sDm8fvXJEaPO9f2sHlsXlLv0bdlFaPH501yAaxRejZF
        +aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlNpxYyFvxn
        rejYItnAuIC1i5GTQ0LARGLC5iMsXYxcHEICSxklrt+awQyRkJE4Oa0BqkhY4s+1LjaIok+M
        EkcmfGIESbAJGEp0vQVJcHKICPhKNH/dwApSxCywkVFi/8IWoLEcHMICjhK9H4RBalgEVCV6
        uz8zgdi8AvYSFx/MZIdYIC+x/+BZZoi4oMTJmU9YQGxmoHjz1tnMExj5ZiFJzUKSWsDItIpR
        JLW0ODc9t9hQrzgxt7g0L10vOT93EyMwrLcd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4U1vkEkV
        4k1JrKxKLcqPLyrNSS0+xGgKdN9EZinR5HxgZOWVxBuaGZgamphZGphamhkrifN6FnQkCgmk
        J5akZqemFqQWwfQxcXBKNTAxzW8NuJv8J+VHQk2VBfdTV4v9yw8sVOrk+fvHpDnI7suMi6fT
        0/aFp8rfmH+bRYDR6K/ADbYFqbwaPGvdl2VXz7E9wOKR9T7w4SrTpPvrrerO1fZsu+ydE+Gf
        EHV5o/J91t1ZdvNEbJ5d28DVPEHlavIziTbeXQcYZcva7PWy3/q6MerFdCo3ZucarlT4sErK
        s8mnfGVfzD+OLLkd0yeVNfjcL1SpuavL5GKX1HjbvCqsaekrQ/MP6a7vDykG/f9zf/0XC0ZH
        9VfzzhdzmPxju/2haevu+acm2lV8/3V1/uz3Dk+DE7t94/VnbGbJyO4NNZS0//Hy+3W7qzP/
        BxzN/erCEXm9d0XPmmvGLEosxRmJhlrMRcWJAHIB3aP0AgAA
X-CMS-MailID: 20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db
References: <CGME20231005111724eucas1p19824dca99456dca9c2c5caa6bfeaf7db@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Cypress 'touchkey' hardware is available on Exynos4412-based Midas
family boards, so enable the driver for it to increase testing coverage.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bbaa478dff0d..af064a4b73e1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -315,6 +315,7 @@ CONFIG_KEYBOARD_PXA27x=m
 CONFIG_KEYBOARD_SAMSUNG=m
 CONFIG_KEYBOARD_ST_KEYSCAN=y
 CONFIG_KEYBOARD_SPEAR=y
+CONFIG_KEYBOARD_TM2_TOUCHKEY=m
 CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_MOUSE_CYAPA=m
-- 
2.34.1

