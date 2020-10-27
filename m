Return-Path: <SRS0=zeks=EC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB15BC55178
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5ED7D22409
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 27 Oct 2020 17:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o2Hv1AGA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822141AbgJ0RrT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:47:19 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38741 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822130AbgJ0RrR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:47:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id k9so233073edo.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Oct 2020 10:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dmarc-filter:dkim-filter:dkim-signature:from:to:cc
         :subject:date:message-id:in-reply-to:cms-type:references;
        bh=ucA7jhPwAZxi6baZIF7kxSy27Ok9a4Itdk82Az5bvjM=;
        b=fGW3Pe4VCnd946K2Z7eov8mhIXMe6zj29zLmV2wYcqnVcPFncZ68TB0AEio2SdN8ZG
         LCbIrohhzVUepa48vBSRbsEKhP9Ytop5OMdjj4zlij17KH023oCurU/ljgQIBxFlRt7v
         cjOZXaeeJFhR65KsI0Yk3wGgoTwkGHED+N1Faf0BtLKb9KJmVzW3SJNEW8MV0B2D/wdz
         F5yLTS43AletKz+gurrN9a2mXQ2xhEs83ajow7NEm8u7GhEpWAPocqYwARBlo+AdoOV5
         z2HqcjBMAO8OP3/ndf+fNGAzxpGs6oyHrgVQZiFHSusrSEW8DWi+OQ1tfC7MW8/MTj+2
         +Qgg==
X-Gm-Message-State: AOAM531gnHVfKheE17oCyFFZKVul056dVWKiW3bEYYkddkWohxyGo8xz
        kKFwXgrP5dbSZv+cdaOFB9bH9LHJV14NvlDd
X-Google-Smtp-Source: ABdhPJyzcoweZsGjJQ/AnxaYD3KMAuVlBe9qO/4k0aGvjzO3jIWAZpRc5Pvsv6GhiW38e1hOmzpjzA==
X-Received: by 2002:a50:f309:: with SMTP id p9mr739366edm.155.1603820832696;
        Tue, 27 Oct 2020 10:47:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id ay9sm1350724edb.72.2020.10.27.10.47.11
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:47:11 -0700 (PDT)
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=m.szyprowski@samsung.com
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Received: by 2002:a17:907:685:0:0:0:0 with SMTP id wn5csp3535795ejb;
        Tue, 27 Oct 2020 07:23:57 -0700 (PDT)
X-Received: by 2002:aa7:83c9:0:b029:158:11ce:4672 with SMTP id j9-20020aa783c90000b029015811ce4672mr2409769pfn.23.1603808636654;
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603808636; cv=none;
        d=google.com; s=arc-20160816;
        b=W6GFCJ5E0c0dgpwNQxI1T6FxDn68avtmo+twSVSpb2d0ZHe5ZXLJzMV5VPAgYKEniZ
         ZRXGxKPrUGU0PxDwryR7ArQtg8rXf544wvYMmXZxMsacfvI6U8HcPpjSY+i6+WJH+Zlf
         tjkrU2GuH9KN1DFj/46nfn39raSkEDuEuNf9XWmK/H3xvuD5WOZ2sx2RZJ9oiOr2xoxu
         EYcuZO5kWxh3lERsUtaUTbYqiPRf/0Hmc0wC52kZtEfYCf3T3B0nxfj6YSzOEMSpg/OV
         jYPJTjCCzpjj5trUJZKSIN8fN3ozUqBXsEh09n6ctv98Pb8qbwxRm4kuoxd8NsbKMpeR
         gIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:cms-type:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:dkim-filter:dmarc-filter:delivered-to;
        bh=ucA7jhPwAZxi6baZIF7kxSy27Ok9a4Itdk82Az5bvjM=;
        b=h24hbeh2Iqo/2AIKajPJpnOOzogPnz98hacEnn6g8/do/2AH04weAYegwIt+dEmp+p
         Bc7JuLu84rb05+UPwtOIIjappAnv8PQaIvOQG6kZQrc8iN6Qm57iHb6iAjl0EbCH3+OZ
         Y4LY5HLVKYyhukK0jBwWDHtL3vARG4nzFnMFpKuDaUr2ipkk0YVmE/06wjCDP1dADwJ+
         iQRYDtyiaaOr8mJcL0I0zzfWpALmslVXZaDk9kLAmSP6Kpl/XHWgUY6RO9ZcmXkANXy9
         FrZTnTTFfvM1r8adq8O3gdinSPStKKXX7OxnVMgPhX6h/drOnV7qFmw1CusgUh6ndXoi
         7uEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=o2Hv1AGA;
       spf=pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom="SRS0=8guH=EC=samsung.com=m.szyprowski@kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id u2si1649018pge.132.2020.10.27.07.23.56
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 07:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=8guh=ec=samsung.com=m.szyprowski@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 444FE20773; Tue, 27 Oct 2020 14:23:56 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPS id AF23A22202
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF23A22202
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201027142342euoutp01d24f6d12bab495d1550c79c8c2558bdc~B33H03JcE3119831198euoutp01O
        for <krzk@kernel.org>; Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201027142342euoutp01d24f6d12bab495d1550c79c8c2558bdc~B33H03JcE3119831198euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603808622;
        bh=ucA7jhPwAZxi6baZIF7kxSy27Ok9a4Itdk82Az5bvjM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o2Hv1AGAO2Nu71DUl8xYD9XtCDSbXwZoLgC9FaeMTc8uuzyirQDNqLutuCfeKzjfN
         8INe1+rr0hv1ja7JyPlU/L5yiAdv7YUAz2+4r7E7P+EIJF/NGW7lY+ih+KEiZzfrHC
         WMdH6cZSqthnfu7eTmU6EnDdYSWrDFrg5VUbx1Is=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eucas1p10e468b14a3bac1531800b3200cfec2e6~B33HmxTdS1107111071eucas1p1p;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F1.7A.06318.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98~B33HSGuUk1105111051eucas1p1r;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201027142342eusmtrp12b448ffd40b81de1697addfb77cf0e99~B33HRkx921905119051eusmtrp1D;
        Tue, 27 Oct 2020 14:23:42 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-7c-5f982d6e138f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.70.06017.E6D289F5; Tue, 27
        Oct 2020 14:23:42 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201027142341eusmtip28feb2419c77497a688382db4d2886ac4~B33G-p6yb2982029820eusmtip2e;
        Tue, 27 Oct 2020 14:23:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 3/3] ARM: dts: exynos: Enable BlueTooth support for Midas
 board family
Date:   Tue, 27 Oct 2020 15:23:30 +0100
Message-Id: <20201027142330.5121-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027142330.5121-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87p5ujPiDe4/U7TYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBlnPvSx
        Flzmqdj0aDlTA+Nuri5GTg4JAROJxiX/2boYuTiEBFYwSkzYN40ZwvnCKDH903QmCOczo8SB
        vuvsMC3TF79kgUgsZ5TYNHsLK1zLlYnfWEGq2AQMJbredrGB2CICqhKf2xawgxQxC2xjlHi9
        YCbYKGGBCIm3nSvAbBagogfbroM18ArYSFxedAVqnbzE6g0HmEFsTgFbib0XroFtkxC4zCZx
        aMsSqCIXicYnG1kgbGGJV8e3QMVlJE5P7mGBaGhmlHh4bi07hNPDKHG5aQYjRJW1xJ1zv4BW
        cwDdpymxfpc+RNhRYsaan6wgYQkBPokbbwVBwsxA5qRt05khwrwSHW1CENVqErOOr4Nbe/DC
        JWYI20PiyrSt0ECdwChxY/VppgmM8rMQli1gZFzFKJ5aWpybnlpsnJdarlecmFtcmpeul5yf
        u4kRmAJO/zv+dQfjvj9JhxgFOBiVeHhvKMyIF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVq
        UX58UWlOavEhRmkOFiVxXuNFL2OFBNITS1KzU1MLUotgskwcnFINjObZRxSsf2SdfH5cfrMp
        k6n5t/hAzjXcu2WXiz36yjaz93rY43kmTx2PVd+atbneP/JVYYiIFmu5xM3wIKfXiqHy7y4E
        3p1+7oSI4yqmeJcfVxZtyeb91mwqvVX9m7/t+/8mWS3XBC83HZ72xZZpabTA9VXPb+0Lj7Zy
        3HhX1a61b6bZGVurw0osxRmJhlrMRcWJAPQ3DU/9AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xe7p5ujPiDe6u4bfYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlnPvSxFlzmqdj0aDlTA+Nuri5GTg4J
        AROJ6YtfsnQxcnEICSxllGjd3sIGkZCRODmtgRXCFpb4c62LDaLoE6PEiYlLmEASbAKGEl1v
        u8AaRARUJT63LWAHKWIW2MEo0d1ygR0kISwQJnHuyBRmEJsFqOjBtutgDbwCNhKXF11hh9gg
        L7F6wwGwGk4BW4m9F66BbRYCqjl/tZVlAiPfAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmb
        GIHhuO3Yzy07GLveBR9iFOBgVOLhvaEwI16INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX5
        8UWlOanFhxhNgY6ayCwlmpwPjJW8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWp
        RTB9TBycUg2MPTsf128/NyWvku3dkwaj+LWCCTd/vVXZ1xr2rE+RU5lboNxrosMXiZTm7g3H
        XVYEztLQUjm2rXaj0e3t2Y28aomVvrfP3H6x89oGA8X9hz70bP4sLqGhWl+9K+Hfre+iFZKP
        5KIC+rKnzljxJ6DiTMo0R1ne6wYT13vv3JAQremnMCPMNbxLiaU4I9FQi7moOBEA7lrgOF0C
        AAA=
X-CMS-MailID: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98
References: <20201027142330.5121-1-m.szyprowski@samsung.com>
        <CGME20201027142342eucas1p18136ba60377ee2985b6bc123908a3c98@eucas1p1.samsung.com>
X-TUID: 0Qg1/bXQpO/E
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM4334 Bluetooth chip on the serial bus #0 on
the Exynos4412-based Midas board family.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 7e7c243ff196..2fc6e2034b0e 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -1109,6 +1109,21 @@
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
 
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpl0-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup {
+		samsung,pins = "gpx2-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup {
+		samsung,pins = "gpx3-1";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
 	max77686_irq: max77686-irq {
 		samsung,pins = "gpx0-7";
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
@@ -1386,7 +1401,20 @@
 };
 
 &serial_0 {
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpl0 6 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

