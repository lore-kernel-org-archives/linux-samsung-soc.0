Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9123FC433E9
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:11:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67FD022211
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jan 2021 16:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbhACQLb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jan 2021 11:11:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:54670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbhACQLb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jan 2021 11:11:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69C18208D5;
        Sun,  3 Jan 2021 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609690250;
        bh=7pwVwcDWI1J8DYef1FtdS8qF4NjeZGVQwVyJQpkNTrU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mKtyvKfDJHlG44T9INOu7vi8An13YGcuMRTwR/BOldkmG2G+rOWIKDxi1adEtr8Jx
         BZ8mQe0xZ3QTd7QrcoCN9HIlQ/aivwvynqaapPJxPS5cHHn54oY4X8PQ1Fx28WCdLy
         C0nolhe1mJzk2OIxhluV3xYCYfMLVaiiTou25AkVWPG1OSYwMcLy4sOf0FWZdxeftU
         DaJ8fiWTqp4LFxRFS78Ec9DLEAv32/UXuL7M+KeRDsyyaRvvPOs4zQ7lpTENxZjU7Z
         /5sFtRWCrIuvRPDK66SX6EHhq7pyZcsEzw/9ZgaAtnbBwPysBZX2/R/w2cM6nQ2HOa
         tguBaEhG/iJkw==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Pankaj Dubey <pankaj.dubey@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH v2 0/4] soc: samsung: exynos-chipid and asv improvements
Date:   Sun,  3 Jan 2021 17:10:44 +0100
Message-Id: <160969021293.28081.2430913792988475716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207190517.262051-1-krzk@kernel.org>
References: <20201207190517.262051-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 7 Dec 2020 20:05:13 +0100, Krzysztof Kozlowski wrote:
> Changes since v1:
> 1. Drop patch "soc: samsung: exynos-chipid: initialize later - with
>    arch_initcall" which is now superseded by convertin to a driver.
> 2. Include Marek's patch, just for the reference and rebase.
> 3. Add patch "soc: samsung: exynos-asv: handle reading revision register
>    error".
> 4. Add patch "soc: samsung: exynos-chipid: convert to driver and merge
>    exynos-asv".
> 
> [...]

Applied, thanks!

[4/4] soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
      commit: 352bfbb3e0230c96b2bce00d2ac3f0de303cc7b6

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
