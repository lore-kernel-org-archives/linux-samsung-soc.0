Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20F9ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 30 Aug 2022 22:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiH3WFF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 30 Aug 2022 18:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbiH3WEq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 18:04:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ECF891D3A;
        Tue, 30 Aug 2022 15:03:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A884460B9A;
        Tue, 30 Aug 2022 22:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB6DC433D7;
        Tue, 30 Aug 2022 22:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661897006;
        bh=W3UvA0KjpIMtP2Uq4fpqJ+KTfnsGHwilKFhq3opz2oA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SQ71bbuZHFJiZVNMqSJNo2l8rqvUiehe4U8WJfFvUI5ZK1FSsFoo5s0Q4d2ZLumsH
         +d5byNIFYEW3N/2j7B84KklkwEvcWPXJgSBBgezHpEVPuB1jFFgQ9F/IyuyHK+nRzN
         Snai71z/jkPFJJe8asCUHJBWRk037KTf2ThGPU/bhbOeR0qTEQJISOJPu+xm9/sBrn
         mz8EvNbwC4WLyJ/GXmfRPDE/KPM4Ycf8nLMfxRXsP+KJp9lFo0qPygVPqmjmNB7Xtu
         FnSR9La8OWSF3zpl/2N2EQHtE2U0lWl6L4j7pLF/JFl7NwnKQTFGXDyFNwYoQanWwU
         a3XvGf0LBuYHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220830183448.18997-1-krzysztof.kozlowski@linaro.org>
References: <20220830183448.18997-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [GIT PULL] clk: samsung: for v6.1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 30 Aug 2022 15:03:23 -0700
User-Agent: alot/0.10
Message-Id: <20220830220325.EDB6DC433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-08-30 11:34:48)
> Hi Stephen,
>=20
> Samsung clocks from a new tree. I hope we can meet on some Linux conferen=
ce for
> a key signing. :)

I'll be at LPC next month.

>=20
> Best regards,
> Krzysztof
>=20
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/sam=
sung-clk-6.1
>=20
> for you to fetch changes up to ef96c458888fa2a329b14efc7991530f645fbddb:
>=20
>   clk: samsung: MAINTAINERS: add Krzysztof Kozlowski (2022-08-24 16:10:22=
 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
