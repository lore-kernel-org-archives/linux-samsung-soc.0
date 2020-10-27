Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3856C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7000424181
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="L2znZ7qa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822366AbgJ0Rte (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:49:34 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45188 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760004AbgJ0Rqw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:46:52 -0400
Received: by mail-ed1-f65.google.com with SMTP id dg9so2325981edb.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dmarc-filter:dkim-filter:dkim-signature:from:to:cc
         :subject:date:message-id:cms-type:references;
        bh=J77/F/hLSR9dNv1sIfSu1cyyoED7ummEYJEbsG7LdZQ=;
        b=gR0CWV1hYbgvpY5Yi6jHduL14zyzI10d9DYeOXd9X8D//qAx6hsWLpiC5eWlTl418/
         VBZHHQn9BFZ/hP3bts5raMtm9TRVJ3h68oEl3OSNjHtoqPZ5J29j1XjiciUDKS53RykM
         8Wyj+vzwD3NxcX2vA0saraBuwY5gNMUSixL6Ppi1L3PdY4hzHT6y96cfZBZchXQs1Z2b
         Baae8yM/uT84OUH8+Q8MZeFolcrO8yAPsvBEME76HpVqU5l7nP1Cg3SjEvUv7yq9YPVq
         6pE5xLtG2CGfnh1qysfGpxlMAKRgJprX8WymP8ConH4wGavpjqBMJrDEZ0DZsXsMlfSx
         qQ/A==
X-Gm-Message-State: AOAM530uxvv1+Onb61l6riXEz4Omf+oqZK9U899iR9qZNLXtIGjiM5Zq
        LpNoCQI8ChKc6s9sj9gn9L7KkHsfujZ73QdI
X-Google-Smtp-Source: ABdhPJwf7zBg86+7AfdRvp61OR1/UoLwJLuSB7YsRHukwIjSjZUtlmGKYdCgxy8cBfuyr6zA4FHu3g==
X-Received: by 2002:a50:d59c:: with SMTP id v28mr3304625edi.241.1603820809419;
        Tue, 27 Oct 2020 10:46:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id h8sm1366539eds.51.2020.10.27.10.46.45
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:46:46 -0700 (PDT)
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=m.szyprowski@samsung.com
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Received: by 2002:a17:907:685:0:0:0:0 with SMTP id wn5csp3535778ejb;
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
X-Received: by 2002:a17:90a:2842:: with SMTP id p2mr2165462pjf.220.1603808635855;
        Tue, 27 Oct 2020 07:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603808635; cv=none;
        d=google.com; s=arc-20160816;
        b=atc2GicTEU71KlwvE7DiNsEQzoxSr6uYHQYegM0W9GjphsrOfktGa1jskPAhlJG8R4
         /8Gmk4p/82pga0m49XqWW3esJxvNhU+Psi8GKAeWlkwbdmU7Q3LnNUEesa3+EtXjMz6s
         jticRTe7XBDRictByyqPMrplXDMICzZLSzRDp0UODl6XDTtscUI+Q1L75wLBMdGFL/v7
         QXvkg/BUlnR6CbxRCB0r54KcylefI61CJ1MXtR74gUL3lGqMV9mONqG5muMj8eLBpajL
         x4I2alFSiuKt3qzz2s5GAbCymJbslavuvpFaJcItU2vgVAweBMB6yI1QGxeFoFx1VLLA
         7w0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:cms-type:message-id:date:subject:cc:to:from
         :dkim-signature:dkim-filter:dmarc-filter:delivered-to;
        bh=J77/F/hLSR9dNv1sIfSu1cyyoED7ummEYJEbsG7LdZQ=;
        b=G8Xk/CA6T389NxfDx97xm8msqWpZd829kYfZgIuMJlzu2HXGh/333DYcO1h3t3o05M
         mWvkRikN8qPik2Zj2/ShIn+8XFwUrgGCoCUvk7cIJFGHuHKxyJR/pfJsG8Yd6b9N52Xb
         cSQRgOItIs86Y3kmntR07O1KSx0qqocsJjCcsZVuzkid4ZtcYVTzz/oXLQ701WFpoFg5
         C3gkkwKIVdiRPkH+xSolfZS0aLTobLOq2fv/YJk+A+vwvE/KwkXc/mhCeK4I9KXclcTx
         scyig3vrJT5OE/wSL1c6SFIPXSRMr7GRmm25qtfGNrmv+HZ9Ip2YRuhvvPInDmnA02W2
         JEWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=L2znZ7qa;
       spf=pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=8guH=EC=samsung.com=m.szyprowski@kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id t205si1590844pfc.108.2020.10.27.07.23.55
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 07:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 7AEEE21D42; Tue, 27 Oct 2020 14:23:55 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPS id 555CC20773
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 555CC20773
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp02d381154c422008972582e8a7803148ca~B33HjPALo2854928549euoutp02N
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201027142342euoutp02d381154c422008972582e8a7803148ca~B33HjPALo2854928549euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=J77/F/hLSR9dNv1sIfSu1cyyoED7ummEYJEbsG7LdZQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=L2znZ7qaKH3sTEgNVJ8A3b8+tnkzO0XtwxlRGm8qOTpjAjq6EvBGnlScspdTrx3u/
         WCyqVRwVZGkdFhbWQzzBk+uEnKieBv2J0TMMZM7TjsjUmh8Jd3Ut990m4pC3W85nbM
         py8Us4u/tYsGcsGNns+Vg+GesM/Bj07T/2cKag44=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p1aada8a2c2d98f157f3a06d65fc6b4e03~B33HKIuLR1100811008eucas1p1w;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id C6.BD.06456.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eucas1p16e42afed4cae1292ed72fcd631424562~B33GuVjf71100311003eucas1p1q;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201027142341eusmtrp2084fd0d752ceda521819cf188abc923f~B33Gtw19_2607926079eusmtrp2Z;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-dd-5f982d6ebe63
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6A.70.06017.D6D289F5; Tue, 27
        Oct 2020 14:23:41 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip2f46f144e0c8670cb2db25842f40eedb3~B33GanCHB2801228012eusmtip2A;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/3] ARM: dts: exynos: Enable BlueTooth support for Trats
 board
Date:   Tue, 27 Oct 2020 15:23:28 +0100
Message-Id: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djPc7p5ujPiDU60sllsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsEroy2v4/Z
        Ch7xVDye5NvAeIqri5GTQ0LARGLdlB/sXYxcHEICKxglLn6bxQLhfGGU+PLpODOE85lR4uan
        WcwwLfOP3WGCSCxnlFhy6jorXMum6U8ZQarYBAwlut52sYHYIgKqEp/bFoAtYRbYxijxesFM
        dpCEsECgxNFZvWANLEBFv66tA2vgFbCRuD/jJxvEOnmJ1RsOgN0hIbCFTWLR0pfsEAkXiSU7
        njBB2MISr45vgYrLSPzfOZ8JoqGZUeLhubXsEE4Po8TlphmMEFXWEnfO/QJawQF0k6bE+l36
        EGFHidl3V4KFJQT4JG68FQQJMwOZk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXoEHkIbH22ymw
        04QEYiVeHbnOOIFRbhbCrgWMjKsYxVNLi3PTU4sN81LL9YoTc4tL89L1kvNzNzEC4/z0v+Of
        djB+vZR0iFGAg1GJh/eGwox4IdbEsuLK3EOMEhzMSiK8TmdPxwnxpiRWVqUW5ccXleakFh9i
        lOZgURLnNV70MlZIID2xJDU7NbUgtQgmy8TBKdXAuPbTceV1VpuSf0yxEtjfoXLodVe4kU+T
        wKXD52rqXm1fk6PbPTllQpwZW/rbPoak19IultN3MHyYmtXVEVP1xuLOrrbjEcwLWlv4Fv48
        FjQtc3vJ7BkNvK8dxX0bRB/cfxp3JyErbdorboFPYY9mRsgfN2Lk/9bpfo/3isb1WgeVpTmT
        J72LUGIpzkg01GIuKk4EAB6G9OnvAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsVy+t/xe7q5ujPiDa7uVrPYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehltfx+zFTziqXg8ybeB8RRXFyMnh4SA
        icT8Y3eYuhi5OIQEljJK3LhwgA0iISNxcloDK4QtLPHnWhdYXEjgE6PEhxYnEJtNwFCi6y1E
        XERAVeJz2wJ2kEHMAjsYJbpbLrCDJIQF/CXub3/ABGKzABX9urYOrIFXwEbi/oyfUMvkJVZv
        OMA8gZFnASPDKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMDQ2nbs55YdjF3vgg8xCnAwKvHw
        3lCYES/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq1KL8+KLSnNTiQ4ymQMsnMkuJJucDwz6v
        JN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPj7uVXXXOZTtTd/1cb
        ZmDNIFb29lvIuwv8t7xWXmwM+dJxSTn+LtfvmRXv5P8oeQpNT6qbu7/rXM318sXb69/mxu9V
        5kn8Yq6wJ9ZIUmhX39Jsza+FibKh/dd1RR1LHPk/9ITWNjkJxxfc5m6Y8bxMxuT5l+2efOzV
        E+tindN8JURljI6oWimxFGckGmoxFxUnAgAfFPmmQwIAAA==
X-CMS-MailID: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142341eucas1p16e42afed4cae1292ed72fcd631424562
References: <CGME20201027142341eucas1p16e42afed4cae1292ed72fcd631424562@eucas1p1.samsung.com>
X-TUID: +Q2PHeGugJ1U
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
the Exynos4210-based Trats boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index a226bec56a45..eb6ca2a74cc0 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -462,6 +462,26 @@
 	};
 };
 
+&pinctrl_1 {
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpl1-0";
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
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&pmic_ap_clk>;
@@ -512,6 +532,17 @@
 
 &serial_0 {
 	status = "okay";
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

