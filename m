Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2164FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 097206112D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhJSIGl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234699AbhJSIGk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:06:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98FF46138D;
        Tue, 19 Oct 2021 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634630667;
        bh=2dwYW4dtVW8GPK2uMbwRzB/+mR8j/h2dEXeqrnCa8/Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rE8GYpDnOBLYFK0SsN7jmRbqdDmAWYVByzaGBrXPF3364cNIYLL7hIX0yrVHtbQLN
         4Lki3oHCKsDJWPFn4g5XA/kr+TfmG+44lxhzmYfHyWBy+SaFLXfXAjZu/VC8Naey6S
         IN9WUF+LbbnixI5q/7hIug8ZlIZcgPhxC4m6U7Vo7B/tsSuFqklV44RAVUN/0lS4oh
         rTN+Sl+x/79oOPVYmnhlyYLBBQKpq1C5HxugUM923/C7/WwCgjP/a3HHkAJn3+BK38
         f8fw03LLIKnMytYgjAdMtcs8/QHUgj49VsX+9L3dZDrE6xapepTZ8CH9zebH9vY7MN
         six8cj5TxJefQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mck6j-001oJp-AN; Tue, 19 Oct 2021 09:04:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 21/23] regulator: dt-bindings: update samsung,s2mpa01.yaml reference
Date:   Tue, 19 Oct 2021 09:04:20 +0100
Message-Id: <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634630485.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The file name: Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
should be, instead: Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml.

Update its cross-reference accordingly.

Fixes: a52afb0f54fa ("regulator: dt-bindings: samsung,s2mpa01: convert to dtschema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/

 .../devicetree/bindings/regulator/samsung,s2mpa01.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
index 0627dec513da..0a564319f4b2 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
@@ -15,7 +15,7 @@ description: |
 
   The S2MPA01 provides buck and LDO regulators.
 
-  See also Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml for
+  See also Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml for
   additional information and example.
 
 patternProperties:
-- 
2.31.1

