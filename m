Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942F9C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 05:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7817061058
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 05:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241794AbhIAF22 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 01:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:57112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229731AbhIAF22 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 01:28:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF4E660F3A;
        Wed,  1 Sep 2021 05:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630474051;
        bh=HrcgKEff7Ccy7B2kWKkGcUGzgS8PjhIQyIIuB8F806I=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=F41INMyr7lMGfcAjwswuoHZeYPxwjDp8HMPfTL1YLJw8a2cdoIaJNeykxGGizCASJ
         TkV/Iy+AD/Rvl8XOQnP8LT8D8xhALnG5WUA2e1Ntkkt7cxEIJJz0yGnLTFBxhbTo4b
         n0SZE26RlF+vRnFC2wIM0q3PFFn4NoY9Pa+KNrTPv9x0URNbHDHGKYI9FAfp2xZvgk
         rqiijhf9/C41kKyvqMvXoyhN9DidsFJV3mCUiJ681FW38z3mym1GYlQ/woj1Go2nXj
         uqdbLszgqxyTjhls8zy+zI7FT78TteEwVH1vw4jOt33pDoDkp4N0aTHK6dT1hlV/Eo
         tzrcy6PjAk9tQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
References: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] dt-bindings: clock: samsung: fix header path in example
From:   Stephen Boyd <sboyd@kernel.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Date:   Tue, 31 Aug 2021 22:27:30 -0700
Message-ID: <163047405062.42057.9583291773440326105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-31 06:06:43)
> The proper header is exynos4.h:
>=20
>     samsung,exynos4412-isp-clock.example.dts:19:18: fatal error: dt-bindi=
ngs/clock/exynos4412.h: No such file or directory
>=20
> Fixes: 7ac615780926 ("dt-bindings: clock: samsung: convert Exynos4 to dts=
chema")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>=20
> ---

Applied to clk-next
