Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9989C6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjCLRDF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbjCLRC5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:02:57 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00194392B8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:02:42 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h9so10317470ljq.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678640561;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bMzb4+f+2BylShTzIH+kD9h/2l/yJ2pk3VVMD+904ak=;
        b=opTkg4/pM4iFDUfQ7RQLLTuXPkbRDqLNmRLCBFpniSvDiwxAf1/ttMjEMDo/aPkePx
         1iVXJpIef22xalCd8EKVQJ/GFS+FLl7hZZQFEvT+zyOwTxHK0MGSqntc6V+AEx2UEE/h
         AQmJtQXo7fB/3Z7GG1eLmfaSsWr8p+WpPDc1Dy8GKbS50eKPWG1E+iHpJ9fmQZto40rR
         YDkbi7aoMjtIzVw2yj33aQ/TXg6xp4ycVo1iBX2uKWPstXJAcF/Fn8PRvzDs+SGvnFx+
         bj6zH4XUj6xP0CbdKuzCUDz5lUzjFyLCoORBDkkSayq6pUK8yqLXdzpqYsrw4rHbVCyL
         8QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640561;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMzb4+f+2BylShTzIH+kD9h/2l/yJ2pk3VVMD+904ak=;
        b=0DRTRviB6huSAsG/xK3rwDW29oj3Yb/uSDIyAOxYXXLjKhJnqcOykyi1HeAnrIlL4d
         fdzPH4VTz+LyXj+FwcV4ppWVG7Sg2Qx6o57HVlkSTYJLUacec89Rdu5lsNodUCjoPUgS
         xr6VcgqhAsM0W0qhe1+gVJfmITVi6F46ftY6MfDYGZaRMw3vJrJK2qBhkVu74Ip2P2fg
         FDdGbKreZYhJjVcPhYexmK4sau2/j3w17kAbQ/CYKqIRuSzEzfMxhj99SFg+i2M/rmGL
         5O2HE47+Z1JtxuufdRDeYHYpfu/4myZVCKUbxHjES+41E+czyCFvr1W80WQjjFJ3LIpn
         1qKw==
X-Gm-Message-State: AO0yUKVyJjDmpnUNQ7Hq6wrLxZowNRmybRJzeL1UlKnSkhc4REF9eQhe
        bnzys5LMvzIgL9huCrtu8QYjxQM/dqRna+IM
X-Google-Smtp-Source: AK7set+ekRAKV143eBaUpaiijxY+5TrJiLv0lrAfNVCAZ//HN3hOJZHcNBbpOuVG2fN9Ez5iHXtdMA==
X-Received: by 2002:a05:651c:1987:b0:295:a32b:9537 with SMTP id bx7-20020a05651c198700b00295a32b9537mr12077435ljb.43.1678640561062;
        Sun, 12 Mar 2023 10:02:41 -0700 (PDT)
Received: from 0001-dt-bindings-exynos-dw-mshc-common-add-exynos78xx-var.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e8ed0000000b0029571d505a1sm701384ljl.80.2023.03.12.10.02.40
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:02:40 -0700 (PDT)
Message-Id: <1678640497.9030156-1-sleirsgoevy@gmail.com>
In-Reply-To: <1678640497.9030156-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 19:59:29 +0300
Subject: [PATCH v4 1/3] dt-bindings: exynos-dw-mshc-common: add exynos78xx
 variants
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some Samsung Exynos boards using the arm64 architecture have DW MMC
controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
systems the 64-bit FIFO registers must be accessed in two 32-bit halves.

Add two new compatible strings, "samsung,exynos78xx-dw-mshc" and
"samsung,exynos78xx-dw-mshc-smu" respectively, to denote exynos78xx
boards that need this quirk. But it's very possible that all
"samsung,exynos7-dw-mshc" boards are actually affected.
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index fdaa18481..a72a67792 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -22,6 +22,8 @@ properties:
       - samsung,exynos5420-dw-mshc-smu
       - samsung,exynos7-dw-mshc
       - samsung,exynos7-dw-mshc-smu
+      - samsung,exynos78xx-dw-mshc
+      - samsung,exynos78xx-dw-mshc-smu
       - axis,artpec8-dw-mshc
 
   reg:
-- 
2.38.3


