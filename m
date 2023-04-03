Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DC2C76196
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  3 Apr 2023 21:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbjDCVKS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 3 Apr 2023 17:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjDCVKR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 17:10:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062B799;
        Mon,  3 Apr 2023 14:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61E6D62B53;
        Mon,  3 Apr 2023 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5419C433EF;
        Mon,  3 Apr 2023 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680556215;
        bh=ZF8uilewljXtH6O0TyRhrhZ2RTcilVOMrJ2V4RHaWdY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EzTSdaVskMnWZ28TRvwekq0TbLpuegeP861yjxjAPMBKrnxYqrDiebQGVBW7BPugS
         pfc3+sFS9j3jS5ySS+CuipiN0xv1TTMsufZIiNX9aOsgK7b952pd7a8F8k1YF2RNv2
         DUx8waAS/PS7CTdXGe/5T8VcfcPJXJ9XWGnY75nGOv1+AdPhyvbm8sXX45+csYfU1j
         OYrL08xs32nWZgx4wmE3mXxzHYyNjqKm4nDHwyiNaNROww8BfMtfXdXy6flOctwx/O
         DooI8Lj87F7Cqhvuxrqi2/NFngymqhbDu3T3ICKcmGEIyUyssn3K2mI7at3UIxg5EM
         skwOxmjDUd6jg==
Message-ID: <14ba831677070cde6e350287871e6642.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230403163106.331712-1-krzysztof.kozlowski@linaro.org>
References: <20230403163106.331712-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: drivers for v6.4
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 03 Apr 2023 14:10:13 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2023-04-03 09:31:05)
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4c=
c6:
>=20
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.4
>=20
> for you to fetch changes up to babb3e6a8a8e5a61a65d4463610108808139b23e:
>=20
>   clk: samsung: exynos850: Make PMU_ALIVE_PCLK critical (2023-03-13 08:24=
:57 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
