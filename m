Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1331CCA47E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 07:03:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbiFGHDg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237430AbiFGHDa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 03:03:30 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BA813CCA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 00:03:28 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220607070326epoutp0300c248ff0faba58ea9fd26a767a05fe1~2RKkzDmA81987019870epoutp03R
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 07:03:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220607070326epoutp0300c248ff0faba58ea9fd26a767a05fe1~2RKkzDmA81987019870epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654585406;
        bh=yJhA+UjFceUg75x+49cDDvuICos2q/A/o9oXrngnWpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p+VdT1Df9OIvWIRyBXnJirx6M4Z4Y+WsKKiqWnTvRgofyVoFrVfsut1HcNV7/9/o3
         zCOPBX2AeTrxr4z1K1s/Th1xahY7DicowF/v3dsdYLm9rdDfGR5Tr8QqCCnrs3pX4s
         /PjUvUoKe+9zdIwsJf5WxDBEvnDTnqsF6+eW5/e8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20220607070326epcas2p345f8b0f6189e27226ed6ddb591a04694~2RKkV8ol21419414194epcas2p36;
        Tue,  7 Jun 2022 07:03:26 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LHLt46kHWz4x9Q8; Tue,  7 Jun
        2022 07:03:24 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FF.19.09764.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220607070324epcas2p1048aeb6638908c91486e48e9f0ce5c9f~2RKinN5HK1918319183epcas2p1v;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220607070324epsmtrp2eb258dcfbebc44156523464fa0b4f4ca~2RKik2lfe0735307353epsmtrp2m;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
X-AuditID: b6c32a46-f8bff70000002624-99-629ef83c20b2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8F.74.11276.C38FE926; Tue,  7 Jun 2022 16:03:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220607070324epsmtip2a55344b1a50e5a78a2bade72751257dc~2RKiYqK8C1021610216epsmtip2k;
        Tue,  7 Jun 2022 07:03:24 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH RESEND v3 1/2] arm64: dts: exynosautov9: add secondary ufs
 devices
Date:   Tue,  7 Jun 2022 16:02:50 +0900
Message-Id: <20220607070251.15795-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607070251.15795-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnk+LIzCtJLcpLzFFi42LZdljTTNfmx7wkg977yhYP5m1js7i8X9ti
        /pFzrBZ9Lx4yW+x9vZXdYtPja6wWM87vY7Jo3XuE3YHDY9OqTjaPO9f2sHlsXlLv0bdlFaPH
        501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
        QJcoKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyM
        TIEKE7Izbn39yFhwhrdiyct+5gbGH1xdjJwcEgImEq/+72HuYuTiEBLYwSjR1LyMDcL5xCgx
        82cPI4TzjVFidttOoDIOsJZtU7VAuoUE9jJKLLnuCVHzkVHi4u017CAJNgFdiS3PX4E1iwhM
        Z5Q48/ArmMMM0vG09QsLSJWwQIjEz2ffwWwWAVWJk9/+soLYvAJ2Eu9/HmWHOFBeYsP8XmYQ
        m1PAXqKh9xxUjaDEyZlPwHqZgWqat85mhqh/yy5xewU/hO0i8XDDbqg5whKvjm+BsqUkPr/b
        ywZhF0ssnfWJCeQ4CYEGRonL235BJYwlZj1rZwR5mVlAU2L9Ln2I75UljtyCWssn0XH4LztE
        mFeio00IolFd4sD26SwQtqxE95zPrBC2h8Sd6z+gATqJUeJxQxfTBEaFWUi+mYXkm1kIixcw
        Mq9iFEstKM5NTy02KjCCx3Byfu4mRnDK1HLbwTjl7Qe9Q4xMHIyHGCU4mJVEeP0nz00S4k1J
        rKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnApJ1XEm9oYmlgYmZmaG5kamCuJM7rlbIhUUggPbEk
        NTs1tSC1CKaPiYNTqoFpwuPEhiWvvswoNZERDq+6dPzMlUupz7Zx3jx0+LGpoZv0J/6NssLT
        b1SKZXivmmWf8ppdRCPhWsNHob4yxcu/Zt/J/1jCGn754eFbn45v2b/5q3j59Uksvhu0E9kj
        PZa2mX6SuRphdD16hs1aHecr3LqbCuOOzH1/aMJmJ7N3muGM2norbWqN/zw1KbXYdebItIMh
        CgEaJ9+nbdsY/X5n1jGvDTunzXV0mpZz4OpOdt5123VmcIrPFLJzU76UYVDmI3UxZlFw/o86
        PqY1v1doL277sHGlBP9vRf3fd80tml/YGfwqXXZ2yr29c//P8d3OmvnB/P/fBdYr+W4tW7pZ
        qm+uA9tvO7+Kzo2cDA02OkosxRmJhlrMRcWJAEK/1u0iBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsWy7bCSvK7Nj3lJBjPWs1s8mLeNzeLyfm2L
        +UfOsVr0vXjIbLH39VZ2i02Pr7FazDi/j8mide8RdgcOj02rOtk87lzbw+axeUm9R9+WVYwe
        nzfJBbBGcdmkpOZklqUW6dslcGXc+vqRseAMb8WSl/3MDYw/uLoYOTgkBEwktk3V6mLk4hAS
        2M0oseTPLKYuRk6guKzEs3c72CFsYYn7LUdYIYreM0rc7p0FlmAT0JXY8vwVI4gtIjCdUWLq
        Ui8Qm1lgP5B9PxzEFhYIkli0bStYPYuAqsTJb39ZQWxeATuJ9z+PQi2Ql9gwv5cZxOYUsJdo
        6D0HViMEVLPy7mSoekGJkzOfsEDMl5do3jqbeQKjwCwkqVlIUgsYmVYxSqYWFOem5xYbFhjm
        pZbrFSfmFpfmpesl5+duYgSHtpbmDsbtqz7oHWJk4mA8xCjBwawkwus/eW6SEG9KYmVValF+
        fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUzVTz35o9tcM8VYRcXmq1h9
        9mOfFp94SzZ5C4PvXanGoksHPZ4/7bk31VZOW6awa79bzMuHljFvp9n0HzTJDq+0iN+R0ba7
        t9zW68waH7F3AQG/DHnLhQ5ZH//rzLJCcCWL5SlmcXFDG8Nll7ZwXFpVWLJCZvFuv2+GLHXZ
        J2cINUjc/vfJbX57+uTufet+9ksU9068eIxpp/X/x3Z572U6k1dEL5VXZ7queYdNcM+zZi6v
        qYc7eNrefwuqT60vN/TL7Hm4Lues4/FXszfOTebbwe/nEZV5weXJRNXy9P073s86tYt5i9z2
        f5muzk8tXh2+3brmVCDX8csB3d8+fNq+M8zqqIrcFouFCQeu3FZiKc5INNRiLipOBACEDWKG
        3AIAAA==
X-CMS-MailID: 20220607070324epcas2p1048aeb6638908c91486e48e9f0ce5c9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220607070324epcas2p1048aeb6638908c91486e48e9f0ce5c9f
References: <20220607070251.15795-1-chanho61.park@samsung.com>
        <CGME20220607070324epcas2p1048aeb6638908c91486e48e9f0ce5c9f@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add ufs_1_phy and ufs_1 for secondary ufs hci controller and phy
device.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index d694975738fa..00411d4c9c5a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -401,6 +401,38 @@ ufs_0: ufs@17e00000 {
 			status = "disabled";
 		};
 
+		ufs_1_phy: phy@17f04000 {
+			compatible = "samsung,exynosautov9-ufs-phy";
+			reg = <0x17f04000 0xc00>;
+			reg-names = "phy-pma";
+			samsung,pmu-syscon = <&pmu_system_controller 0x72c>;
+			#phy-cells = <0>;
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			status = "disabled";
+		};
+
+		ufs_1: ufs@17f00000 {
+			compatible = "samsung,exynosautov9-ufs";
+
+			reg = <0x17f00000 0x100>,
+			      <0x17f01100 0x410>,
+			      <0x17f80000 0x8000>,
+			      <0x17de0000 0x2200>;
+			reg-names = "hci", "vs_hci", "unipro", "ufsp";
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD1_ACLK>,
+				 <&cmu_fsys2 CLK_GOUT_FSYS2_UFS_EMBD1_UNIPRO>;
+			clock-names = "core_clk", "sclk_unipro_main";
+			freq-table-hz = <0 0>, <0 0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ufs_rst_n_1 &ufs_refclk_out_1>;
+			phys = <&ufs_1_phy>;
+			phy-names = "ufs-phy";
+			samsung,sysreg = <&syscon_fsys2 0x714>;
+			status = "disabled";
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynosautov9-wdt";
 			reg = <0x10050000 0x100>;
-- 
2.36.1

