Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80471C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:32:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E7DC2224D
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FV9rlnty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgKMVcQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgKMVbt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:31:49 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B05C061A56;
        Fri, 13 Nov 2020 13:26:46 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id i19so15695569ejx.9;
        Fri, 13 Nov 2020 13:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Myew9GTzazX8Kq03fWyShDiGztES2RoGSzvTqItP6pU=;
        b=FV9rlntyjm/NM6FGTdLSWvg6s24TS4v8BWS3rBREYuSBXChesgyVV5AOYdSN0psqVr
         CzVBCdWrvRUqRP5NC7f32+U+iCdlvmEErjv+VnuzKCFp3dFGCuZxVdaz3x+YD1NWjOkn
         CaCOMii9wcSj9V2A8c4vocm6UrS+INfD3nrXBNlbJTlKu10PDUVvlUvL3VorKhxmNkoa
         15zrYNHLS5OMcqSVXj/H8kxjTjILsAqTq4hl3RaD0ugoAoMU0srg+zP1atwhnnmORj/E
         /m7YZBwKV09GkKwTtqqg6FplDpUsxEe1l8QiDChccP/qP62kzbEM2z6lbPc6dkt0qeaN
         Fm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Myew9GTzazX8Kq03fWyShDiGztES2RoGSzvTqItP6pU=;
        b=VBVuusw/iRFBxR/gMcTR/lDqXw9Cdk9tyzVC1iZb5n6aHXDeLOICuVAv7F2iI/xC+n
         bemm+98UEeK2XierbGoto1im0K31UUwoTboU0tF8/o030JGvIa2A9yyY6LxvdwGfwA6U
         kwPJsMz1V6AADVaVGZ+lz0A0VNo7O/5hd/meu5mZqPrQZ/aGiMhVSteWLtdgt2xeeyU6
         EGJKYCfOCwhIvnmIOT245ZYzY2PzvRNpP8Ru09tJZfTiafZCN09DqyW02ZFfb8d1ZGeM
         2K9I4kMZu/7xTOK2pfZ1QbcckPBf7Jz67CEJbAUV8GJQalgLkbXJO/OaOgrI0d7CidHP
         8NWw==
X-Gm-Message-State: AOAM532370256ZNljWk/Bwk1zMOv49j6tzWvQivgYCEuzRWzPCWjc1NQ
        eBRs9BLrIYaB44nZJ1TtZXA=
X-Google-Smtp-Source: ABdhPJznirO2PUJRyJ8Jfr2h7bNv2NgmUSZI1rxF7QIVPr5KMkycxd3/lW7MmBRT6qns92Le0BEFGQ==
X-Received: by 2002:a17:907:374:: with SMTP id rs20mr4007427ejb.191.1605302805790;
        Fri, 13 Nov 2020 13:26:45 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id b12sm4964684edn.86.2020.11.13.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:26:45 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: samsung: document bindings for p4note family boards
Date:   Fri, 13 Nov 2020 22:25:22 +0100
Message-Id: <20201113212525.13455-2-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113212525.13455-1-martin.juecker@gmail.com>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the GT-N8010/GT-N8013 device binding and the p4note common
binding that it is based on.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 272508010b02..d0d80fffe14e 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -83,6 +83,14 @@ properties:
           - const: samsung,exynos4412
           - const: samsung,exynos4
 
+      - description: Samsung p4note family boards
+        items:
+          - enum:
+              - samsung,n8010                   # Samsung GT-N8010/GT-N8013
+          - const: samsung,p4note
+          - const: samsung,exynos4412
+          - const: samsung,exynos4
+
       - description: Exynos5250 based boards
         items:
           - enum:
-- 
2.25.1

