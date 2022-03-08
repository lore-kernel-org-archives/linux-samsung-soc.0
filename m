Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF518C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 06:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344215AbiCHG56 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 01:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344206AbiCHG55 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 01:57:57 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DC03D1D3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 22:56:58 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 842643F7E7
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646722615;
        bh=/nQH0xMVMGOl4ilEFj0NRFMKFBrrtbNt+lvO7kMd8B8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=bvKwDIdeaJr9K5ihdLiF0JxqqJxPDzgCESu5aK+cz4hHdzPyq5pwxmujHDUmkf8ZL
         2Kbvh7gCa1Byx+7vcyN8B6cY14RLKUz8ychYF1pSRV4yhL4jQswiOaIGDEAfy2Y9Ri
         RgmDbiNCF8WjB8d8+MA9di4FDFDqoIvTM6NUVFNKkbWBaUy7b6+VeyZmrfgEkZrnTo
         BV/dtvTvOynExP5eFdqhZvsQ3uwGO5SaN6Fdpg2vv4xnV+Pg3xsl+i5Qb/0sc0hdsB
         SRBm3kQRqT14Q2De7D1UdLUNtS+24k2XvtJE4zOiR0w6xVzJYgTY5xt7YxcDAJ+G/A
         yakMPjuSmdhRQ==
Received: by mail-ed1-f72.google.com with SMTP id da28-20020a056402177c00b00415ce4b20baso9115843edb.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 22:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/nQH0xMVMGOl4ilEFj0NRFMKFBrrtbNt+lvO7kMd8B8=;
        b=ohQ0dwmYARQTqL81T9piQTI1ubCcpAUPr3Mn69oh7emFCV5BMjogsLIm4k5g7ia1md
         aXPYxdib8WDAYE26UrHmi+NmOh+1OdAX/vDx9L9x3MM2fy1AutFAJOF4qpOmFzf0E84h
         QeZxaZ4gNO49GHOWPt+BBG5aWGNBfa1fuxDkcs+pt4pNpw0AsLPTG9kp0B7h7p45va/z
         nCqs+IluA3UJg983ybGhMfnDQbeDZE5sNX3QTFxGlrI0pHicht5bMydhadyyZAeGfcpe
         K29HKLPNf0pG6u1v4FqkLnkUjKUWy1iUCcUpCQFkoXTycCwNQm71j0XZthjNA1iIWwuu
         hMpA==
X-Gm-Message-State: AOAM5329r9zzWiBuJboCoeDVojCIANQmL9D1aqv77bs0MDdx7TgENtRh
        IQJiEr07+hWCldVoocAXPkCq1OwDubswT5UvqvgYVcMZEDyYJNSZqK1CysgkeZ4j8Z/ZnvMON8g
        gLWZ+YN70z7uv8NcZuoMLILdemjySrHc+HvWctVY7AbnkiFnQ
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr12768798ejy.463.1646722615191;
        Mon, 07 Mar 2022 22:56:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUUfasT4Wjs6f1SXSBcbJnAlAC2IvlRrhE2phlpmtyxBZWf0RDTazNUP3wQmlNW1PxEj37jQ==
X-Received: by 2002:a17:906:a08b:b0:6b9:2e20:f139 with SMTP id q11-20020a170906a08b00b006b92e20f139mr12768790ejy.463.1646722615008;
        Mon, 07 Mar 2022 22:56:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id f5-20020a1709067f8500b006da68bfdfc7sm5517952ejr.12.2022.03.07.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 22:56:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] MAINTAINERS: thermal: samsung: update Krzysztof Kozlowski's email
Date:   Tue,  8 Mar 2022 07:56:48 +0100
Message-Id: <20220308065648.6443-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use Krzysztof Kozlowski's @kernel.org account in dt-bindings maintainer
entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Hi Daniel,

Could you take this one directly (optionally squash with the last
patch)?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/fixes&id=5125091d757a251a128ec38d2397c9d160394eac
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8c471cb93ef..48b0cf606be0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17382,7 +17382,7 @@ F:	drivers/net/ethernet/samsung/sxgbe/
 
 SAMSUNG THERMAL DRIVER
 M:	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
-- 
2.32.0

