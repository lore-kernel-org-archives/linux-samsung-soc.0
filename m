Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00DDC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Nov 2022 19:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiKATox (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Nov 2022 15:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKATow (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 15:44:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714F012770;
        Tue,  1 Nov 2022 12:44:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D95F61715;
        Tue,  1 Nov 2022 19:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648B3C433D6;
        Tue,  1 Nov 2022 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667331891;
        bh=//K4QNbzYFOWo+QH+GbBMQaZSa7pLigyVZveW13UDss=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=h5CVyHDxIu+wbsgX7z2Se8He7WoX56gqzFkhqJkwj41lORQNNMOfDuXiCuAcOUPl8
         2MGG1srv+1vuAO4AuSpeWJHAS6HrfUo7Uq/C6gr0CEph/LXhGwRy7Dtz2U/IK4AaQY
         Mabd+8rQ9hvv8tw43+VWy42C6kCTYOuA76EI8Z4HLgQXLmAX3FwMhi5U6jDh/cYUEg
         4M7R0vA3swejR+0yWA1BzuoWxWBibPBHLF0AmxkE0NDvRPlpII6vsyZ1lja1x8lE+y
         R3XEOhmMOod8/tJQtbNwjeVUsgQnWsm56toOFuOw9uoozmVFWno2EYO4Z9KDVoIV5M
         V9Hbfr+JymGvQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221031220751.158341-1-j.neuschaefer@gmx.net>
References: <20221031220751.158341-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] clk: samsung: Fix reference to CLK_OF_DECLARE in comment
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Jonathan =?utf-8?q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-clk@vger.kernel.org
Date:   Tue, 01 Nov 2022 12:44:49 -0700
User-Agent: alot/0.10
Message-Id: <20221101194451.648B3C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Jonathan Neusch=C3=A4fer (2022-10-31 15:07:51)
> It was misspelled as OF_CLK_DECLARE. Fix it.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---

Applied to clk-next
