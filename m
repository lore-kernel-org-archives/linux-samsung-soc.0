From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [PATCH] dt/bindings: exynos-rng: Move dt binding documentation to bindings/crypto
Date: Tue, 22 Aug 2017 21:40:50 +0530
Message-ID: <20170822161050.24610-1-prasannatsmkumar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:38236 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdHVQLI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 12:11:08 -0400
Received: by mail-pf0-f196.google.com with SMTP id h75so6077465pfh.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Aug 2017 09:11:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, krzk@kernel.org, linux-samsung-soc@vger.kernel.org
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

Samsung exynos PRNG driver is using crypto framework instead of
hw_random framework. So move the devicetree binding to crypto folder.

Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{rng => crypto}/samsung,exynos-rng4.txt (100%)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt b/Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt
similarity index 100%
rename from Documentation/devicetree/bindings/rng/samsung,exynos-rng4.txt
rename to Documentation/devicetree/bindings/crypto/samsung,exynos-rng4.txt
-- 
2.10.0
