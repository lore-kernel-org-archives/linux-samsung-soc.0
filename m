Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13308C001E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Oct 2023 16:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjJWQyU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Oct 2023 12:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJWQyT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 12:54:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A8AFD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Oct 2023 09:54:18 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4083f61322fso27720595e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Oct 2023 09:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698080056; x=1698684856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzNpmNp+fktKwDMwK/gxOQWv1rtKi9BTRrCYzOlHcaE=;
        b=A7AV2tFv7ot3ee9gcjpx3TlBlJSO91PYfoWf/ZdnEF2ofTzElWXG4keTd1RKZftTQP
         tfwj8yiXiQiQ7WEN4zdPzljsejXaBd1YODNMJ2MR4Kun7fbuQRtk2cAoPJyaOtKC7xAw
         q7d6wdS4+Ldiivem3qb/WhqBQptWpkrqYz8VLEQNTWfPeH8zd5zM6S5e1EKyhnVxlLAZ
         nW6D570f+OYwfrqMhuSuT0sPMEAyvBUQz6EfqltJ4oc7l24qxbFDIVachFH+npOGlm2r
         USMVLy3yeK659FEYe9epvsJ0BsVwPL0kw+ELi10r2lEvpExivkALeabB/b159olXjiH4
         uxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698080056; x=1698684856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzNpmNp+fktKwDMwK/gxOQWv1rtKi9BTRrCYzOlHcaE=;
        b=EfFR0HGgCHLQasH6AX2Uj8pBGO+KwoK1eURTsjRF5GqConRyhtOpNMuzx2OW4W9O2h
         UqDOBzcKVyS7z9mOYXGxBPqvdAV6zzyEeRdUzafU+FAIdR7CzguCtdpJwXaH7O25uYFJ
         sDOJ74BmRQhRanKON6zV0/bU4JdV/f5eLWEPQjDLWrnCzrmFu6bl8cuIEvWm8NAze4XX
         IGaeC+0g9AzsHYNi++EnpVp7wlFmVi4CPKME5oEy+GJcUEn5XcqZ6/HsvB96jJH83VvZ
         V4jOrfGrnMaGrklCTDsZGl3iH7Dr/cF57HLvYiWw4MIq0mRmfX4xDzpJ7BNchfX4imW8
         hTjw==
X-Gm-Message-State: AOJu0YzLMqKJQ60ZaN7ESOgwr+ECrsie4JcAhn0WPQYNegmFbJVHkUd4
        VGFfRGyfP5COqlO3C2dgKHEu5g==
X-Google-Smtp-Source: AGHT+IES5Wh57HTX5V9DwQtvZnwriBUWvgP62B1LNyPFJZdJp0f2V2qI1D3EsrezWHIvfB2Wc7zBQA==
X-Received: by 2002:adf:db48:0:b0:32d:9d80:4038 with SMTP id f8-20020adfdb48000000b0032d9d804038mr7071732wrj.49.1698080056571;
        Mon, 23 Oct 2023 09:54:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d4c87000000b0031980294e9fsm8097709wrs.116.2023.10.23.09.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 09:54:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] arm64: dts: samsung: second pull for v6.7
Date:   Mon, 23 Oct 2023 18:54:12 +0200
Message-Id: <20231023165412.529762-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Just one more patch on top of previous pull request.

Best regards,
Krzysztof


The following changes since commit f28dde395937e000585ac87c0d1c18885661161d:

  arm64: dts: exynos: remove unused TMU alias (2023-09-14 10:03:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.7-2

for you to fetch changes up to 23e4a49943624dd83199989c852565a3ff760fa7:

  arm64: dts: exynos: Add reserved memory for pstore on E850-96 (2023-10-12 22:01:49 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.7, part two

Add ramoops reserved memory region to E850-96 board for debugging
purposes.

----------------------------------------------------------------
Sam Protsenko (1):
      arm64: dts: exynos: Add reserved memory for pstore on E850-96

 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
