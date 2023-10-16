Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F25CDB465
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Oct 2023 07:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjJPHhR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Oct 2023 03:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbjJPHhQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 03:37:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71877E5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Oct 2023 00:37:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso672776266b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Oct 2023 00:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697441833; x=1698046633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HTyUQuoAbVjluxgr+h6sTqmqhDJGxpZB2IhyvmjXi6k=;
        b=Yzgt5ikvcI8rVGKsXsasXHUtt43axDil0nItBbVimWPB1Ca3fCEaryHvEfZPjA+/Lc
         WqrR6wBpLLwAWHlqgN/9ei9q/7bEhBIC3GOekxc4ulqFtKCqQHuaVfeW2gBgYEDUPG2l
         nfKZpne1xfFadylRS92yaMctL3JEN6JcuTolv7aY/6u7Vcdish7AXZ6vcZ+Mz+Q7lZTj
         8G6bt3E8/GxUdiM/oxuVMaQPtskzrfRlbYXFISayn4PzWq0yIw98wa7e+VQBQp+RnRXL
         v98zR/uIFcv47BCrVwhP+08iv2iSR4UCU2H/6i3x7tgkEpfjGCQ2a4+q4dobOCV0Zytz
         RAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441833; x=1698046633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTyUQuoAbVjluxgr+h6sTqmqhDJGxpZB2IhyvmjXi6k=;
        b=k1pbI+LNvRlNRAJxFDT9504PhvNB2VAzQdlCXNYiALFozFsvJxiBLE7hia+OFwILzk
         zSW+bpPWWgtUWYJpjLqLdILQt01WcHAjB91dxtcj2jlNLnsTpyJGp0jcWfEm/RlBjlPQ
         fLAnRUav98DdtyJMY74fsl1gAzLcXO4LJbuUnZ2LhFBruwf694s8j1gU+GT6O0h6+iMo
         HWEY4CzOENS/9tvQ4dvl7iGgOt2ksmEiau1oDzOETeO/IylQzh6U/18Pd4/I1fXFlKMq
         qTobLYTSNCnpIXsh/bGDzyI7MuXplUS97Px0Bs1wSA66CNlIDwZVIZHf2bvMVcEOPVeq
         UJ7g==
X-Gm-Message-State: AOJu0YwrV8RHLEx+DfeCuNutGH7OWsOqxcsMQgFJBpz0T3In6Y6gq6lB
        htI34NxjYztHIPKJbAIMEMW5HBkewWRkZ3BlbFg=
X-Google-Smtp-Source: AGHT+IEv0uejqa5NJBXNL8LEnWXrDwz7b76fiOOhyJGmmtCK0e7+o9cqfbI1hF43wqrFAkSUSjwscw==
X-Received: by 2002:a17:906:538a:b0:9b2:b269:d563 with SMTP id g10-20020a170906538a00b009b2b269d563mr29105305ejo.63.1697441832837;
        Mon, 16 Oct 2023 00:37:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id w17-20020a170907271100b009a5f1d15642sm3468031ejk.158.2023.10.16.00.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:37:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.7
Date:   Mon, 16 Oct 2023 09:37:09 +0200
Message-Id: <20231016073709.27851-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.7

for you to fetch changes up to 8aec97decfd0f444a69a765b2f00d64b42752824:

  pinctrl: samsung: do not offset pinctrl numberspaces (2023-10-09 12:37:21 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.7

Few cleanups, improvements (use __counted_by annotation) and finally
switch to dynamic allocation of GPIO numberspace.

----------------------------------------------------------------
Kees Cook (1):
      pinctrl: samsung: Annotate struct exynos_muxed_weint_data with __counted_by

Mateusz Majewski (4):
      pinctrl: samsung: defer pinctrl_enable
      pinctrl: samsung: use add_pin_ranges method to add pinctrl ranges
      pinctrl: samsung: choose GPIO numberspace base dynamically
      pinctrl: samsung: do not offset pinctrl numberspaces

 drivers/pinctrl/samsung/pinctrl-exynos.c  |  2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h  |  2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c | 56 ++++++++++++++++---------------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  4 +--
 4 files changed, 33 insertions(+), 31 deletions(-)
