Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAFAC4363A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB17C24181
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FGTNg8hT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822365AbgJ0Rtc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:49:32 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33738 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822115AbgJ0RrG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:47:06 -0400
Received: by mail-ed1-f65.google.com with SMTP id w23so2367157edl.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dmarc-filter:dkim-filter:dkim-signature:from:to:cc
         :subject:date:message-id:in-reply-to:cms-type:references;
        bh=w63XQDjZCP11ykXLFKcGVmM/GiTpYJJ2CyfjB4+5SLY=;
        b=ix6q1QI7txlgx4p+5KnILhpPuQubsVWo5lxzq0lBKwGTj5G71Nj9FexxTDkUF436W5
         MIj5Yz3CHupO2fblKS5LCkShO99Q8DrN0shDH/rSHrJaXk4arPl/z72H0AbEinOq4REK
         rnrbF7/YF3cGYb+Uj2yAYPUjAGTQbCfaRqfJRPUMLwQNDwJsOHxb9nyxq0FEweLRTyhC
         Peuh74YpnYwodNrwnNlljEW5Uje5lOqC7uQgQWKgwjlY4wK6le70DCfMwngxq6Wf0v0f
         Tp1FhMQe6fdfliPOOwmQFgF2JvfXiZL4VVebpS2SGI6yf4bSjTbHThyz9aKQPoGg1Ihb
         MWAQ==
X-Gm-Message-State: AOAM533ErSckRIFlR0j7Zds3ww1KURAreqF7Mze8SquDadok41Cy/u3z
        pGe+Sqn2N3b+5V+ot8vlANJqpg+zhUkNqVTg
X-Google-Smtp-Source: ABdhPJzf6ILT0jFaDqL9gTd6iYAMi9Il0seTzdRp2BM9aI12tVEsIbu4Yvab6aIcM4Xxmr9R80NWwg==
X-Received: by 2002:a50:8acf:: with SMTP id k15mr3440611edk.351.1603820822822;
        Tue, 27 Oct 2020 10:47:02 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id p9sm1422447ejo.75.2020.10.27.10.47.01
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:47:01 -0700 (PDT)
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=m.szyprowski@samsung.com
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Received: by 2002:a17:907:685:0:0:0:0 with SMTP id wn5csp3535786ejb;
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
X-Received: by 2002:a17:90a:6b08:: with SMTP id v8mr2246836pjj.126.1603808636154;
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603808636; cv=none;
        d=google.com; s=arc-20160816;
        b=cbATrcWPGtK0YQKQ25QLlHz9cntZnGN6Yi8DALxp1U5r97uKp5E8eW5d+G7tnz5dBa
         Qs9t14/WHzsXYLXj66yx3YexMeaqvM4+v4vlLTQwKx8e/NNo34+JmP6HZnztVh8Ox/y6
         hPW7fJG+zARXWmYTOrW+U4zoBIKRFXsC4eF37cuns9RoIIEIwjMoXoRCTiZXO6r0HyZ4
         SZ6K6cICx3dnPJxhxPBl5iQTSjwyPSK287NVL34mH7RdEwe/b+/G/C+x/xn0YB6u5UpM
         uEXpPgMfZ8oOz9r/NWyGpVEHCiegzrVBQ/OP/B6bsXX1m+W7tz8OuF++uhg/bXEhldYz
         5iVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:cms-type:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:dkim-filter:dmarc-filter:delivered-to;
        bh=w63XQDjZCP11ykXLFKcGVmM/GiTpYJJ2CyfjB4+5SLY=;
        b=0D4GVhcUSxKD0saS5puzdRW5RwrkuUcaRh3ScpIwsl0TSvEUdjueW+HH4qelslPLFE
         QrsDLn9L6gJGSVELcJJs8kjtXOHw2lG0gEG9bn8IeYO3JqLLm83x+7NtKgCc7nCUVPGp
         3PttcTYl7Nea6nuQXGwDVnAT0+9HNT27VhjnoTuOe4/9nVIsHhUGIfaiNQEmiV+RZes/
         sZ5n1wnADoFSc0chJ9pyZhnL75qdTyqLRPILA/9D4nRHT/N5hQW9XSF7BfVDu0DTMoi6
         pCg+YRKPwdkRKJUvD1aZrwgxGc4q/Yn4Gko2yvjneRS/QpVqMS1mdwQKp6YwQt48OM1a
         ulqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=FGTNg8hT;
       spf=pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=8guH=EC=samsung.com=m.szyprowski@kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id k16si1739007pll.156.2020.10.27.07.23.55
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id BADC5207C3; Tue, 27 Oct 2020 14:23:55 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPS id B779522258
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B779522258
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp0281ba328adf1b35884453968c47a85b34~B33HgdhV92797427974euoutp02t
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201027142342euoutp0281ba328adf1b35884453968c47a85b34~B33HgdhV92797427974euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=w63XQDjZCP11ykXLFKcGVmM/GiTpYJJ2CyfjB4+5SLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FGTNg8hT/eVgKMccKtXSRDv+/vHbjU/R7q7FRw/WHz77JFxi8lsOSvE+i8yAphzS6
         wO+DNF6AUAE+OWZ8tuqYcrmyAPO+ZJcxGDeYwMMtZ+oA5IU14IdQURe4QOUD9gmSLZ
         QW/TRkMPhO4HEytLjBFVGFiLDrur5NigwGtCX/Rk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p24204108b772cd6af95988b5785051830~B33HQGVG_2017720177eucas1p2F;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.BD.06456.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf~B33HACEDf2016120161eucas1p2F;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201027142341eusmtrp2e40ba5f3996886f33dee8b1cdf081e70~B33G-eCvQ2617126171eusmtrp2O;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-de-5f982d6e317a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BC.70.06017.D6D289F5; Tue, 27
        Oct 2020 14:23:41 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip28dc17536a60715035283214ed331fe74~B33GtQm0r0110301103eusmtip2z;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos: Enable BlueTooth support for
 Universal C210 board
Date:   Tue, 27 Oct 2020 15:23:29 +0100
Message-Id: <20201027142330.5121-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87p5ujPiDd43cVtsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsEroyNL88w
        FWzirVix/xVbA+Ms7i5GTg4JAROJrYe/sXUxcnEICaxglGg5fYUJwvnCKHF0znV2kCohgc9A
        mYfKMB3H961hhShaDlT0qhWho2HBP7AONgFDia63XWwgtoiAqsTntgXsIEXMAtsYJV4vmAlW
        JCwQJfHn7w1WEJsFqOjUj1Ywm1fARmJu/zE2iHXyEqs3HGAGsTkFbCX2XrgGtlpC4DKbxMoJ
        Z4EcDiDHRaL/lDpEvbDEq+Nb2CFsGYn/O+czQdQ3M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9s
        IIOYBTQl1u/Shwg7SvQf+MIIMZ9P4sZbQZAwM5A5adt0Zogwr0RHmxBEtZrErOPr4NYevHCJ
        GcL2kFh2dDo0FCcwSmzZnjaBUX4Wwq4FjIyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcx
        AqP/9L/jn3Ywfr2UdIhRgINRiYf3hsKMeCHWxLLiytxDjBIczEoivE5nT8cJ8aYkVlalFuXH
        F5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwBie/HpFUG5k+gXzrMsJ51nv
        rAx6/2Hjw357Pg4rtq4jO4RfRNgt/HRg33Khaj2JnJKO9F0KvM7nmg0r7t2cxLfiZXrMernM
        suk//u5aX6uqK8rzrMc+YptcnUpWZyFLZHuc1MvXc/3V69x+383O3jbTrezAeRXlTy7hnAuS
        T1fbB7Zezv3JpcRSnJFoqMVcVJwIALVvpwb6AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsVy+t/xe7q5ujPiDR4stLTYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehkbX55hKtjEW7Fi/yu2BsZZ3F2MnBwS
        AiYSx/etYe1i5OIQEljKKNH8eio7REJG4uS0BlYIW1jiz7UuNhBbSOATo0TDeS0Qm03AUKLr
        LURcREBV4nPbAnaQQcwCOxglulsugA0SFoiQ2PfpIjOIzQJUdOpHK9hQXgEbibn9x9ggFshL
        rN5wAKyGU8BWYu+Fa6wQy2wkzl9tZZnAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZG
        YDBuO/Zzyw7GrnfBhxgFOBiVeHhvKMyIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58
        UWlOavEhRlOgoyYyS4km5wMjJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoR
        TB8TB6dUA6PRhw2XOA8J1z+oPPqMgymNU/aAs2PE++2XRO89+695UXHf5xh1PhFR9SPSIlOu
        nNE/riZa8LLk9bvjVsstNi9Z5n5vCa8Xy3/5xVl5cT3sBp5H+9LmlL7kTU1j2JvALi0r/2H9
        tf5JE8/ELwp/VZ26aEfWDOH7DTvyndozAoJjTxTe49y9drISS3FGoqEWc1FxIgCFVV5BXAIA
        AA==
X-CMS-MailID: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
        <CGME20201027142341eucas1p299a5277c0de2a490f12a64cc84438fcf@eucas1p2.samsung.com>
X-TUID: TZvdPilne4Zh
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4330 Bluetooth chip on the serial bus #0 on
the Exynos4210-based Universal C210 boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../boot/dts/exynos4210-universal_c210.dts    | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index eecf93280b3a..68ab4290bcef 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -545,6 +545,24 @@
 		samsung,pins = "gpx3-7";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
+
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpe1-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup {
+		samsung,pins = "gpx3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
 };
 
 &pinctrl_0 {
@@ -612,6 +630,17 @@
 	status = "okay";
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpe1 4 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

