Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73928C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 19:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjHHTF0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbjHHTFF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 15:05:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8379031
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 10:48:58 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99357737980so863503366b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691516937; x=1692121737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/3xpf+nkmYM0/cP3Mm0ug8E6Tr0ifjOM0Sgp4Fheis=;
        b=oud0jY4qfQ7u3DiCrIpL60ImQD2EWKwktfVkIpeKfp6unjVSuCFssl6tpWo84nWWzq
         S7+KCeshoH7Uxf7Ft6K3QmzbdwJ7uUk0B0d4oWUkG+msgj6fs3XpA+15K+6L1Omam/fp
         IIfFJQAnAlF0gOR+iXDrrygSdUd+ymOf0C/JpF60BYve09PStW1f7dpKe2bnkMZSjDW8
         JEPo3Pz6TdPWmg8+io+nDDed/g3JnBKPPqXJlpgQ/zQE0Q1iYRgW5h2kWurk+5S4/kRH
         UqZ/B7wHbg15ZhgT1t6fHpsHORnF8yQX3zr2bXTxGY+KQetPS2Jx90+3vS0/nu911Hna
         clEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691516937; x=1692121737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/3xpf+nkmYM0/cP3Mm0ug8E6Tr0ifjOM0Sgp4Fheis=;
        b=EQuFL5jIdKjwKhvzTES4p9ZavSFBmpeSo5uK2p+72zeoFEsMr6D/qNnPVEvwaFNk0A
         0t533f9dyPGKmT4N0L1Tsdipg+Ti5/SpzjNnvkrxn4QhfynYYTXweMeEZOCQ4p54QmgT
         JBP+hUd7WKCID0JcPfH/fTFfR0YqznEGyOrirTDAWcTQ37oS69vWMZbYr16rwMkIOw0D
         rV1NOOWsmoAwxbn7JpoTpxFQnMQPHltX5y8kxObz4iOXc13445CpMS2E3fEyITK8KCuL
         TKMUVxF012vuUImaplOdQ7UhCMejkHLSSTDgNFnKvZ6ol04T/CrV6bvqE42VeyyiF5aa
         EeVg==
X-Gm-Message-State: AOJu0Yxc6u155Bi1zrja9nHnwDxH9czVTxK/nRa9nwOInPklhptR1Tk+
        vLZhCMndFADKnM6oIsw6cjU2Fkij3492+oe2Y04=
X-Google-Smtp-Source: AGHT+IFRoA13RhrMxnqW7ljjsyav/4dAxADif8m2tF9UwYMnrRa7VWJJXVr+r6ZRwLdvaG4hOCJatg==
X-Received: by 2002:a19:6547:0:b0:4fe:af6:5e5 with SMTP id c7-20020a196547000000b004fe0af605e5mr7041396lfj.23.1691483262566;
        Tue, 08 Aug 2023 01:27:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 00/11] clk: samsung: remove number of clocks from bindings
Date:   Tue,  8 Aug 2023 10:27:27 +0200
Message-Id: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

No dependencies, patches can be taken in one set via my clk tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  clk: samsung: exynos3250: do not define number of clocks in bindings
  clk: samsung: exynos4: do not define number of clocks in bindings
  clk: samsung: exynos5250: do not define number of clocks in bindings
  clk: samsung: exynos5260: do not define number of clocks in bindings
  clk: samsung: exynos5410: do not define number of clocks in bindings
  clk: samsung: exynos5420: do not define number of clocks in bindings
  clk: samsung: exynos5433: do not define number of clocks in bindings
  clk: samsung: exynos7885: do not define number of clocks in bindings
  clk: samsung: exynos850: do not define number of clocks in bindings
  clk: samsung: exynoautov9: do not define number of clocks in bindings
  dt-bindings: clock: samsung: remove define with number of clocks

 drivers/clk/samsung/clk-exynos3250.c          | 11 +++-
 drivers/clk/samsung/clk-exynos4.c             |  5 +-
 drivers/clk/samsung/clk-exynos4412-isp.c      |  5 +-
 drivers/clk/samsung/clk-exynos5250.c          |  5 +-
 drivers/clk/samsung/clk-exynos5260.c          | 41 ++++++++----
 drivers/clk/samsung/clk-exynos5410.c          |  5 +-
 drivers/clk/samsung/clk-exynos5420.c          |  5 +-
 drivers/clk/samsung/clk-exynos5433.c          | 65 +++++++++++++------
 drivers/clk/samsung/clk-exynos7885.c          | 14 ++--
 drivers/clk/samsung/clk-exynos850.c           | 35 ++++++----
 drivers/clk/samsung/clk-exynosautov9.c        | 29 ++++++---
 include/dt-bindings/clock/exynos3250.h        | 18 -----
 include/dt-bindings/clock/exynos4.h           |  5 --
 include/dt-bindings/clock/exynos5250.h        |  3 -
 include/dt-bindings/clock/exynos5260-clk.h    | 25 -------
 include/dt-bindings/clock/exynos5410.h        |  2 -
 include/dt-bindings/clock/exynos5420.h        |  3 -
 include/dt-bindings/clock/exynos5433.h        | 42 ------------
 include/dt-bindings/clock/exynos7885.h        |  4 --
 include/dt-bindings/clock/exynos850.h         | 10 ---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 18 -----
 21 files changed, 154 insertions(+), 196 deletions(-)

-- 
2.34.1

