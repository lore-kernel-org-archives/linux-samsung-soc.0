Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11193C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Aug 2023 13:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjHJNiI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Aug 2023 09:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjHJNiH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 09:38:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C02BE7F;
        Thu, 10 Aug 2023 06:38:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D484C65CAD;
        Thu, 10 Aug 2023 13:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF1DC433C8;
        Thu, 10 Aug 2023 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691674686;
        bh=0OPYjnIks9F8xNaJ00TW2wNWuFrlrAMiXrDrbTbNpwE=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=U0Cm3KNSeCl9sGwrkNrs6J/UOkdyQ2uyUyxuKTQCUkZCqj6U2+rb4NvsHkaW3yMoE
         KdBSjyFQwcUkAbY1KiMcPvljVb9SEa68mH//MoIsyU5n451EutQtT8I6m05UEutc23
         VFqV3bBedq5nOwc9g3r/s1Yf1a+rsc2UxqfWPola87VILA5SinR+1nAz2qKDdOTScA
         5R331HrCzHTf/f2HPa8dFALppAJaUKi5EfQ27CIQT+b8S1tX3QuXFmCmJQHY9J7LGG
         g/ef1rxd4BrmFtyu9jBGzEhHe6PKPjkBtwvM4u+m6wuGptybkhv9eN1mPRs1QVabu+
         wGl3Ghf3f0mBQ==
Message-ID: <cac9c508-5638-dbc5-8086-ade995ee644b@kernel.org>
Date:   Thu, 10 Aug 2023 22:38:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/11] clk: samsung: remove number of clocks from bindings
Content-Language: en-US
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
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
From:   Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 23. 8. 8. 17:27, Krzysztof Kozlowski wrote:
> Hi,
> 
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
>  drivers/clk/samsung/clk-exynos3250.c          | 11 +++-
>  drivers/clk/samsung/clk-exynos4.c             |  5 +-
>  drivers/clk/samsung/clk-exynos4412-isp.c      |  5 +-
>  drivers/clk/samsung/clk-exynos5250.c          |  5 +-
>  drivers/clk/samsung/clk-exynos5260.c          | 41 ++++++++----
>  drivers/clk/samsung/clk-exynos5410.c          |  5 +-
>  drivers/clk/samsung/clk-exynos5420.c          |  5 +-
>  drivers/clk/samsung/clk-exynos5433.c          | 65 +++++++++++++------
>  drivers/clk/samsung/clk-exynos7885.c          | 14 ++--
>  drivers/clk/samsung/clk-exynos850.c           | 35 ++++++----
>  drivers/clk/samsung/clk-exynosautov9.c        | 29 ++++++---
>  include/dt-bindings/clock/exynos3250.h        | 18 -----
>  include/dt-bindings/clock/exynos4.h           |  5 --
>  include/dt-bindings/clock/exynos5250.h        |  3 -
>  include/dt-bindings/clock/exynos5260-clk.h    | 25 -------
>  include/dt-bindings/clock/exynos5410.h        |  2 -
>  include/dt-bindings/clock/exynos5420.h        |  3 -
>  include/dt-bindings/clock/exynos5433.h        | 42 ------------
>  include/dt-bindings/clock/exynos7885.h        |  4 --
>  include/dt-bindings/clock/exynos850.h         | 10 ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 18 -----
>  21 files changed, 154 insertions(+), 196 deletions(-)
> 

There are no behavior changes.
It remove the unused clock id from binding header file.
I will remove the confusion of user of clock. Thanks.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

