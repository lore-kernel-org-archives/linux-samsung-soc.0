Return-Path: <SRS0=vFf2=EG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D534EC388F9
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 17:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 905B0206E3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 17:59:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kux4FYd3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgJaR7z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Oct 2020 13:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgJaR7y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Oct 2020 13:59:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78C0C0617A6;
        Sat, 31 Oct 2020 10:59:54 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id p22so5625189wmg.3;
        Sat, 31 Oct 2020 10:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z815WCX7lT6IHfytZFBVz2wfZcp8KbpYChqBbxS+J9w=;
        b=kux4FYd3XpiQMKkcrMhdEhca8/Mn9su2LV0z83W+Jm9XyhxV7mLkpaNSjEJZNyPkjr
         lJszQ6aIYO7Ihk5rgCXhwdChlLL5u5CbDHKlWykUernPTBSBil3IGeJmUXmpoXEgzllD
         y/HXxjwfqyytS5CRnAsMus+fSUg4HRn3MSRE138PZjLJt8/4mfanCEkcFgE9BhX7Ua7g
         HNBCEl1oFAJNecTRZSlkIbm1+qRVlWEIBxwVfyshkg3kx979w5btiTucWUBOjmaIPz67
         QRB6aL3rH73En1HJdQaFekjb1PV61+l+OPgWli1NBBVb6ofBNZouKAEzbpTKZnxzqrqs
         luaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z815WCX7lT6IHfytZFBVz2wfZcp8KbpYChqBbxS+J9w=;
        b=XDocUDdI+R1eEBx2yciT0I00xEEfHUO+rBTBeOcXdmgDaDr79/eLGj0JRBo2wsPuMV
         B+YWSKXOqwGKUWvuypZoojwshmqFruF5A9c31cDSBv74L4GFH8Q3sS95MOfqnXqTbEps
         /JoL6p43NJcB1Xb+Cx6yVDBK++waXKHvaf5uWXnPWw6nTneAZVEg26kNbySyg26aK+51
         b8rHQKs7B2h4dHD3H/+zSa/5oP7H4HgDCZJt9vzBXztUa+LRiT1onjN2S3hkAocEbuFY
         Q0B/4RBQ2hdYqk5sGTxgj8+bCHToG6AoDbs1rPpjD8gHDkn9dUJfBHj3TCjO6aEBMhj4
         L4zA==
X-Gm-Message-State: AOAM5318Kplx7COThkM3tzaZdhBGu8or4wuQivr9RajnU4fxZ6NtpINe
        XaW2rHpNXguuO40G3YjzyBVQHpM5eh2dXBON
X-Google-Smtp-Source: ABdhPJz2xZHpm1/8OVawC4SRquEmMtJJZQlwaQAgLpF85dawDwz7NP5LYGgGjLcQUOw37YfHHoejPw==
X-Received: by 2002:a7b:c741:: with SMTP id w1mr9410342wmk.67.1604167193468;
        Sat, 31 Oct 2020 10:59:53 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id n17sm8154823wrw.69.2020.10.31.10.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 10:59:52 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH 1/5] dt-bindings: samsung: document bindings for p4note family boards
Date:   Sat, 31 Oct 2020 18:58:33 +0100
Message-Id: <20201031175836.47745-2-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201031175836.47745-1-martin.juecker@gmail.com>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the GT-N8010/GT-N8013 device binding and the p4note common
binding that it is based on.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index eb92f9eefaba..dbc401984152 100644
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

