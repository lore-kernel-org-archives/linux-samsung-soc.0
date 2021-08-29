Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6002C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A4460F46
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbhH2HGy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:06:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2HGx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:06:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25CBA6054E;
        Sun, 29 Aug 2021 07:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220762;
        bh=6Sej7zZ4V9GeOxURxZTUeaoRMyomHNnQGarsBvk2QZ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k4+NiD0ds1AqZrbgMZFoYF59la8J0m4AbUR71kjWbe6SjcjvaXJAEZZmDGkwiznO/
         s+FiTMKYrlQkGG7QlzMDtmh+U92PlPok/0dkSzY6+IOVPzqMzYZPjNqbDUkX0eOUCX
         e+x6N1EHymZjydmH3T+K5nAdtLY8zOeW81LcL8MjYnMeEzPwgaiyVE+xdLL1exR2Iu
         5tcDISlYVRjFW/SJ/iGWIFMp4zA7+6owdRqu8VA+4Bhdw9f4npfRUMr9BbKpUwkSzs
         NFztoMe7gkAsVekpna9Psa5r2Av8tWzULMkdW3hblPr9g1/fGc7kTVS3pE7IIbDzRb
         PtkeCNj7rBFvg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134056.219884-2-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com> <20210825134056.219884-2-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: samsung: convert Exynos5250 to dtschema
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
Date:   Sun, 29 Aug 2021 00:06:00 -0700
Message-ID: <163022076090.2676726.11327135487234941332@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:40:49)
> Convert Samsung Exynos5250 clock controller bindings to DT schema format
> using json-schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Applied to clk-next
