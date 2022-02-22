Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D808C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbiBVPB0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbiBVPAt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDF410E57C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:02 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 62F9F3FCB1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 15:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645542000;
        bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=A8q+IGKUfAM8ea8bjjeC66pIYRgsgXI5QvFmBAjWvMq1VoxJcy/sPXrFFZviIhILY
         EIWELaukoBa7aeJF9nLyVOkiTAceoYiuNYqA7GJZmmONINAb2V6YUCsshX+UPH7XIH
         2ZA4aLge+YOHc3/AY3NXty/uLAnv8ENuy7Kid079y+sd4rdab6PBfZwT4PFjyHeqOm
         n7BbN3oa4IWuzvfVqg0314/LV9TCJ3QgD3U2IOcKSl2BAWjMAzCJM/fGalPfcTHQjr
         kK5LhoMQvQ89O6edCw69sfTlB3ul2ucHRwNedOqpNANNcsYj4SiJ0iuSsEnxD8OVzB
         Eual/81vpCjUA==
Received: by mail-ed1-f71.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso12077403edh.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OhXJxblf34wMx5+uRUs16cf2JFWMcvDQKlBG/4EIbg=;
        b=fYshmd6m0YpMdCCVis0kZ+MSvxwKljawD5jrdCQgTpv1DBphjx9Amrm1nFBvWza3EO
         dFcYEj2IQOb4R5cwQRobqpqhZ0/ft86oPgBtXKMT2dJqx0aQsElnc+kHx+9+rlvBtX68
         UHpDFA6GK+p588h82Oo1W7yxs3mDUtcI0wj6If9T+sol9LZQAMGNT+fjM4FiqjRD8IY3
         D2mrlLyS0VbFr8w8Iqx6FDbYoKPO8ePqBztkuwxL55HHHjXU7omd/0MQF33diBiUsG8+
         lYkB076q2rPJZ8emxZLo7zO+bXMZklZsVru0cfdX/0JPwPcSZGHF79xsk/bbNaayJVDK
         PBlg==
X-Gm-Message-State: AOAM5324SXfkA87KXjg9q0zq4OxeZTvJ/ga7gl4oB0V561XPmpT4w+tA
        JogSsPv1uxp1R+pJbD04E0M/etGfbPgQKEmMOvjiofisiWkJ0T4WNbfA4IfDxDE0Otl5+ra1nwV
        7MElMHrKRlw2VWRnBo2QyFQkhMi5ZQqy9kyYsWNZtKA9Pr9Sg
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr26939003edv.167.1645541995664;
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaJdWHb8xk+e2xSEaK1p8tjIOgBKlnOjh9riknUovYkgJh1fsrFc3SbrR3EFVhnzBs85hG8A==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id x1-20020aa7cd81000000b00410d64eaa31mr26938989edv.167.1645541995521;
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 10/15] arm64: dts: hi3670: use 'freq-table' in UFS node
Date:   Tue, 22 Feb 2022 15:58:49 +0100
Message-Id: <20220222145854.358646-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'freq-table-hz' property is deprecated by UFS bindings.
The uint32-array requires also element to be passed within one <> block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
index 636c8817df7e..754b3a66ec0d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
@@ -671,8 +671,8 @@ ufs: ufs@ff3c0000 {
 			clocks = <&crg_ctrl HI3670_CLK_GATE_UFSIO_REF>,
 				 <&crg_ctrl HI3670_CLK_GATE_UFS_SUBSYS>;
 			clock-names = "ref_clk", "phy_clk";
-			freq-table-hz = <0 0
-					 0 0>;
+			freq-table = <0 0>,
+				     <0 0>;
 			/* offset: 0x84; bit: 12 */
 			resets = <&crg_rst 0x84 12>;
 			reset-names = "rst";
-- 
2.32.0

