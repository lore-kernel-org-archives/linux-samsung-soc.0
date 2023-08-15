Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C422BC0015E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Aug 2023 05:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbjHOFy3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Aug 2023 01:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbjHOFwi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 01:52:38 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101D2171B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 22:52:17 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31963263938so2863969f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Aug 2023 22:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692078735; x=1692683535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5zZszRJ1TGZmt1SftJeogGq7JuNQUPsnorZGUjcM80=;
        b=MsolIu3IE0lP2hEs6fQ0tC7Ck8AEypROUkZlWM3Ebv8EHB6YRbrVlHiQUbtn7VWgPT
         UiV3H+ECTKz6aw4bzdgsvwGoWPH4In6jIWjjel3dD+dH64px9vo6vL5EuAiTaBHwfWKf
         5vBoz2/iVMH9XVUHc4I++Pwit3udVu+xZlsYLZ66g5pCwx28MhUJFSjf17ZFYeJYUB9R
         28T5bUgUhFdjcEUTxkmeIbjqF0IGjXOwG4okGd8uyEH9q01vgJ2QEql4SVUrN4XprKBr
         LNUanWMQLyGYcjGjfc61EmefJZZkWEF2b/eNBfkjcetih+G/x4ix6Um4xk2jPpGZp7bz
         6gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692078735; x=1692683535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5zZszRJ1TGZmt1SftJeogGq7JuNQUPsnorZGUjcM80=;
        b=enaiWnharY8JTNXNXxJ8u8ui+u6Lsv5CK+GzwpGDp8rP/LW7vWsuXor7orCdfsFwwO
         KAqziAVeYrMRw0XGTm32KKfRoKSFvBjEb0nw1lYvPhDjLS2rWWaqOp+EzzJ06tM4orm0
         mRWvTXQeCykYln2sKgpQPfLZ/dEeh5Ak3aDvJHaBL/bImHkfhtpcuPGR/Iw2cJlq33br
         O+Yna6MUU74S709CEFxDGhtxJHS214rgaZsCVc+Kpz9fqlu205SDqlDBgSXvX59mki3T
         W3CIwobVdH7h32s6TNNfJrOAg/k2FF9nm6w6dJueaA+rdhRgrM3CYg5T4zQ+jXTjyUNK
         hVZg==
X-Gm-Message-State: AOJu0YybrHPpzA3U3/D3kaerNLnTXsQtZ16BzYfTRO+G45AdZHKOdODY
        4m6mRTVR4Ci1120nWXHf9v2EGg==
X-Google-Smtp-Source: AGHT+IE/LzquRwTZSsulsvNuTfzEJnWCWfvoE6jF1rEF9CrWQKOMne+14OV1eWD5PpxyW0xtsskriw==
X-Received: by 2002:a05:6000:12c4:b0:317:e766:d5e9 with SMTP id l4-20020a05600012c400b00317e766d5e9mr8903334wrx.3.1692078735462;
        Mon, 14 Aug 2023 22:52:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c378d00b003fe2de3f94fsm16455755wmr.12.2023.08.14.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 22:52:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 00/11] clk: samsung: remove number of clocks from bindings
Date:   Tue, 15 Aug 2023 07:52:12 +0200
Message-Id: <169207869892.18669.12968579673742031375.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 08 Aug 2023 10:27:27 +0200, Krzysztof Kozlowski wrote:
> No dependencies, patches can be taken in one set via my clk tree.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (11):
>   clk: samsung: exynos3250: do not define number of clocks in bindings
>   clk: samsung: exynos4: do not define number of clocks in bindings
>   clk: samsung: exynos5250: do not define number of clocks in bindings
>   clk: samsung: exynos5260: do not define number of clocks in bindings
>   clk: samsung: exynos5410: do not define number of clocks in bindings
>   clk: samsung: exynos5420: do not define number of clocks in bindings
>   clk: samsung: exynos5433: do not define number of clocks in bindings
>   clk: samsung: exynos7885: do not define number of clocks in bindings
>   clk: samsung: exynos850: do not define number of clocks in bindings
>   clk: samsung: exynoautov9: do not define number of clocks in bindings
>   dt-bindings: clock: samsung: remove define with number of clocks
> 
> [...]

Applied, thanks!

Fixed commit msg language as suggested by Conor.

[01/11] clk: samsung: exynos3250: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/ec01691c9c631ae465ff0438172738d68bca828b
[02/11] clk: samsung: exynos4: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/826951d90658199a1a1098e823b6205aaea09b0f
[03/11] clk: samsung: exynos5250: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/835dc5ac296073b9ca3a2fda86568bb1b9377dee
[04/11] clk: samsung: exynos5260: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/727d0f0640755eb6e41725d63a506d510078fa8f
[05/11] clk: samsung: exynos5410: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/678417694b8ec22d31d7605352196ffce9bfe128
[06/11] clk: samsung: exynos5420: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/62eef444cf300ea8a5498a98bfcfd6eb0e53dd3e
[07/11] clk: samsung: exynos5433: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/6a44298ddbdde13bc7d84168bd4d256521aef439
[08/11] clk: samsung: exynos7885: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/ef4923c8e0523d83b7cd4918760e03b03b2b08ad
[09/11] clk: samsung: exynos850: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/56d62cd46dee861080e2484e1bdcc9f892add060
[10/11] clk: samsung: exynoautov9: do not define number of clocks in bindings
        https://git.kernel.org/krzk/linux/c/901a0c690f547dbe24fd599e7fc58d7cbf69599b
[11/11] dt-bindings: clock: samsung: remove define with number of clocks
        https://git.kernel.org/krzk/linux/c/b3f9581affb03ed28ff1905b649e66904f29b9e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
