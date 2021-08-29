Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA9C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BE3B60F55
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234733AbhH2HJO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:09:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:52626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234707AbhH2HJN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:09:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8ACC601FD;
        Sun, 29 Aug 2021 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220902;
        bh=Kd/1V0ou/Z+6AXIJuFR1aNsvh8VPa3aMJaIfxpWLZOs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KAZ1KFNB+v0Sx/qQI794QDD6I2S1Lwe28lzcPmkloqxMmyF505b/xJ/oWcuDpm+Uo
         jtBw1g3rNUhVTEOGmlrfROIclPK/nXf/TsvhTem++Kdq+JZJzdA1JKUdOWs6ZKZwu9
         CeRKrrh9TOvyc58M+aR7lg48ndjfB8tLkU6MP4lJ5gi8LDW16vNRCAAdD27u4Gd21f
         b7dkXeWjPfEizHHWTBqJTqGp/fzLwSck2rhIjhFVppKBAuk20iMslmjXZKY8mg6aPc
         Zb258ae3Cpq0E80vuwMJo15Atv97UxMy+Sr5Dd1owAUZ42eNb+RNkK73WRb+IEghpu
         AhpDxhH17iDXQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134251.220098-1-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com> <20210825134251.220098-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 6/8] dt-bindings: clock: samsung: convert Exynos AudSS to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:08:20 -0700
Message-ID: <163022090079.2676726.10315720276792690321@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:42:49)
> Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
> schema format using json-schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Applied to clk-next
