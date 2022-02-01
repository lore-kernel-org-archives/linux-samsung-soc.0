Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60065C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Feb 2022 11:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbiBALsg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Feb 2022 06:48:36 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38462
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237440AbiBALsf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 06:48:35 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9D3793FFE6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Feb 2022 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643716113;
        bh=OuVWT+OxqE323DEVUlu5DyHs7hHuGTLMdHDm6pwqNSI=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nzVHKUorVmzrzrOWORGOGRsP13Hq6vhGLEUpnmMW4vC6mjOvKsf+jSP3UPITkE7Xp
         QvHd1IGyMazWoMjxNmwNoJSo/hLN9AiYY0GworzslCi6zDbkrXomGZ+rk4TJIooB5T
         U5lRkhO9RoFrHo3wkUFS5ZNUVZ0DI1IvV5m20a3Z6Jf7iiTlMyd8o88QPIQvmK6K1F
         nuAFEDJKa5WRqzWr7y8E8WpAP8GH1gERk28hPHiWyzDlP7+0193tYOr7wlg7cuYDCx
         /+JprZueX4IRQsXU/KDgFukiZzFvCHmCPawouuyTssuytwF7ujrGKUC4SHeWfF2lhM
         T38Vua+aDyBJA==
Received: by mail-ed1-f69.google.com with SMTP id o25-20020a056402039900b0040631c2a67dso8469428edv.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Feb 2022 03:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OuVWT+OxqE323DEVUlu5DyHs7hHuGTLMdHDm6pwqNSI=;
        b=abcqHQTmohVEeq5Kl2uzyaLDiBoKTiH0/Eh/q3/X/bhClrjpZYH/GOBemql1aydDfb
         UnES/31l/ZuGOcT5tkr9IEBAxqzwCLaxsBKKTLScGQnIXexboVcWCuOBP2iU5HS86YYV
         KHVopZ69WIlwjr9+d19DL9E5Qx1EjCaYaN6Uu9UwZSwlfdFIa1Qjtc4VvvZwgjciZKOx
         NYxE4peToXrn2DM5paVxWXUTbrXU+YUNB35522deKmVKM5XTNuReaZiaGHbLqfGcooBJ
         bVONfpovPHnrC/eYWpTz9nOH6pqOFGKGbJ/vB5x433msjWMXZW3zQ4kSWu7CDc2+WQUv
         7xmA==
X-Gm-Message-State: AOAM530eQkNJpB1U3c94YGIxT5ACo/isIGX1vlnK+dXNCvbgpK7gTDER
        SIh5dS9ZnOXo4c15GGjaR/FDJJtWddA7xIJ3z/5VGgyFyAh8CgMJmP2FmUckc7RQbvJH/hPYP/S
        MUumLoWSqiRBcJLNoCrWfO9N60SnRmaGzaTbO83WQ1GPEiOfI
X-Received: by 2002:a17:907:d9f:: with SMTP id go31mr21604851ejc.282.1643716111079;
        Tue, 01 Feb 2022 03:48:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4hxffkdEDnSRNHd8A4Uy3TqYuAKbZF4KOrK7b4i45cPu6GWoai3jbLk/RRWS+LN17FX6K9Q==
X-Received: by 2002:a17:907:d9f:: with SMTP id go31mr21604841ejc.282.1643716110925;
        Tue, 01 Feb 2022 03:48:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bo19sm17954484edb.56.2022.02.01.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 03:48:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: memory: lpddr3: deprecated manufacturer ID
Date:   Tue,  1 Feb 2022 12:47:47 +0100
Message-Id: <20220201114749.88500-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
References: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The memory manufacturer should be described in vendor part of
compatible, so there is no need to duplicate it in separate property.
Similarly is done in LPDDR2 bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index 0c8353c11767..138c57d8a375 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -40,7 +40,9 @@ properties:
   manufacturer-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
-      Manufacturer ID value read from Mode Register 5.
+      Manufacturer ID value read from Mode Register 5.  The property is
+      deprecated, manufacturer should be derived from the compatible.
+    deprecated: true
 
   revision-id:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.32.0

