Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5296C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A71CC60F39
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234770AbhH2HHC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:07:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234745AbhH2HHB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:07:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1931860F39;
        Sun, 29 Aug 2021 07:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220770;
        bh=Noy9wcudOtyIBgMW/3I3NyRYCcxIeB72CBB37OLaQCM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lH7YyRSIklahpcppRexExzaJ2dm8QtAeXCB444umj1b0HkzXLyesZewOuxI5S0EtJ
         shlYLJ6cI46XBHsbdU90B6gD2Jzy2unEcrTbm4rp1jqAUeb0WFSDi+TRgOnM1GpWVp
         iqBikfgIMF5nivPvo1teNZIB+xUOZmxcfaXV0HopP5NNJWwvbfKCynaevGAtHyLX9H
         BytIo59TwZqbugUSJvRoALgpC6ieKxpcRdLMdoIQ/1M77/vc1VlLu2X5CCxJr163EB
         AboDyQlVzd/FJa9cwJg0b1WpZxZYGHCfbUoBBL0+8coYzcnMmxl9aLMXJwTaDQa0SH
         4FPM37QkSXEOw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134056.219884-3-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com> <20210825134056.219884-3-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: clock: samsung: add bindings for Exynos external clock
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
Date:   Sun, 29 Aug 2021 00:06:08 -0700
Message-ID: <163022076896.2676726.7403300581307105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:40:50)
> Document the bindings for Samsung Exynos external to SoC
> (oscclk/XXTI/XusbXTI) clock provided on boards.  The bindings are
> already implemented in most of the Exynos clock drivers and DTS files.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
