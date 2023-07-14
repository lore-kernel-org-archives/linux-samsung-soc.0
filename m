Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3279BC04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jul 2023 08:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjGNIrq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jul 2023 04:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235610AbjGNIrd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jul 2023 04:47:33 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8D226A5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jul 2023 01:47:30 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fc8049fd8bso2707631e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jul 2023 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324449; x=1691916449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R8aePuJNV+aTV/P2+d1zYFy1JBvn+SWePZ58r04GmFw=;
        b=Yv7wNCignVQeQHx68i0XxK3/6GnIxCb5iM+IxeTjplbMgzS5ZtFIEB/aBTEjPcsGQo
         K/mpiJeUBlNHm0kHoZBkiohGUSSm9+Mi5FNldcjIcQ+SQT40x7B4nquXzDbdPBQ2XsK8
         qtlpvESK5DwpFP1JToV9AYRDC1pzj2EjYxTpiAP/XHu4om4/Bj3gDlzec+IDfba3rAf9
         CbRJlFJiSnhiK3K4BfH96M9QQyyC0o7KoBemZildDs7MP1wT6ZoOSuJ/EmNIqxeFWmrE
         JqqZ/T8CUFWgiljdQRkmtema9Scy91H9ikRBceYOsDNjn+eqfm4T+VSrYT6c4xbIfNij
         53Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324449; x=1691916449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8aePuJNV+aTV/P2+d1zYFy1JBvn+SWePZ58r04GmFw=;
        b=A1laGR57NF+1UljsSQg9STb3ZuJszqhtJXtdSjKwDgve+IHiL3iQLEKrMbWxNvhS4I
         gHb39m62pbQdqUNfY1kPpbEPujEpAti5ODMfSz354TBwWwBuxKNPiSOdDhy0d6FgltDB
         MoyLfYnxrZDz7aMtVTOvd2QVKk8kin1KPf2+35D1/p1+0ttfczEH2zjZ8++SUDxxQ6LO
         3l0v/U5ddD6hUlPIMJFafBHNXIaVZ/aE6kH8x7zhScJv/3z9Ot247XOe1xAC3eGFyWUp
         O9QQvFw4YTwB7a36wjdbjOQ8JpIFohGHTh7rgUy44CJtKmmLq1wRWZdNka/A9DbHHTj1
         R2ew==
X-Gm-Message-State: ABy/qLb0W97B3MWq/uEEu16MfPm2CKny4Ss9VKV5qBjN3CMoWh0JmEOH
        v+EPG90X9G6DIVzuwQkju2kOqg==
X-Google-Smtp-Source: APBJJlFjG7pdcW2yr/b2fsXuHegMrNjuBRaWxyLYGHZw7UwjJRO5qo5VVUqBvzsKR8P2U1WefMFewA==
X-Received: by 2002:a05:6512:33c8:b0:4fb:7666:3bc0 with SMTP id d8-20020a05651233c800b004fb76663bc0mr4290710lfg.47.1689324448797;
        Fri, 14 Jul 2023 01:47:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm5480662edt.8.2023.07.14.01.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 01:47:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] MAINTAINERS: soc: reference maintainer profile
Date:   Fri, 14 Jul 2023 10:47:23 +0200
Message-Id: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f646ba70a01b..b61289fa7891 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1558,6 +1558,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1

