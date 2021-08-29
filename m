Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E581EC43214
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAF7560F56
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbhH2HHP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:07:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234810AbhH2HHO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:07:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 083C660F5C;
        Sun, 29 Aug 2021 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220783;
        bh=O3pbP7jEL/Bj/I5UJlOztCVLPaZ/b/JhJkVQczXMAxM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=J6KiGtkSxVpPAsamg8YObcgZlSP+8TRjGxNtThoyS/nYAlezk0uOCNWcTfhRBjaRb
         Gv+Osm+X45sWWJ4NLydmP0MykbGv7H/STzCw3eAF/EGfk92RoRnpEDrDBq29xd3RDA
         qXalVKK0XYz2+4kU3SfGaIkUqDnD8CBCqSbzmjmHuexxMuqOCUzDW+MbBVuRocAmKs
         Zd4WvP0RcQB2LRijZkgBf5VDs5CTW8z4n5diNwJoLeIMYO2ynR27XDSGaXbgvHYS7n
         1r/+oGKCcloqTvujQij/EclQqA2fIQZLDr5SwdOKGOrP9hGfXjIrvMA3ygiDMFpkDZ
         ocF7cDKW5At3Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134056.219884-5-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com> <20210825134056.219884-5-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 4/8] dt-bindings: clock: samsung: convert Exynos3250 to dtschema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:06:21 -0700
Message-ID: <163022078186.2676726.4881131896027633393@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:40:52)
> Merge Exynos3250 clock controller bindings to existing DT schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
