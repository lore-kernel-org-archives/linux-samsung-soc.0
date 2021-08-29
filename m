Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48833C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B84A601FD
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhH2HJ0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:09:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234783AbhH2HJW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:09:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87A8A60F4B;
        Sun, 29 Aug 2021 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220910;
        bh=P8kM1UzMfKRlsPXkPiWBjMOv0Au6Ule6i2hNnI9yGUc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a41o/TuGDrFul2fZXXemyl17s8ZgyCZtBU8Kq4rpodZjTqLPAtbXhlFpngN+LIz5W
         K2hl9PoPXHAHaDty3ILqnS1xs9rWIa5KHPsxCkoeStmPccdz8jy/B0zgkoh/zVeD7g
         rsSEna+J5wJha1mhX9Afaw90ezm95mXaOKJBlyNZBcqDAQi5GUgVYRuVCUBsz4ItFN
         wpYsCafvygsOOfBlALZAUTMimfmuLQovPorBKA9mlUaheh7uowehHLWoTf5ts6vdFF
         W1YOs0q+0Y3nqlTxgtCbaQa/AEdL8lf2qzrHh9h5t8GTZw+KEQCmdK3j8p+1Y71E8w
         yw2RPlAitFzYA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134251.220098-2-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com> <20210825134251.220098-2-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 7/8] dt-bindings: clock: samsung: convert S5Pv210 AudSS to dtschema
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
Date:   Sun, 29 Aug 2021 00:08:29 -0700
Message-ID: <163022090939.2676726.3258581184867007965@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:42:50)
> Convert Samsung S5Pv210 Audio SubSystem clock controller bindings to DT
> schema format using json-schema.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>=20
> ---

Applied to clk-next
