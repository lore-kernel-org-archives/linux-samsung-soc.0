Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E66C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92832601FD
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Aug 2021 07:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbhH2HKi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Aug 2021 03:10:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232001AbhH2HKh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Aug 2021 03:10:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DEE960F4C;
        Sun, 29 Aug 2021 07:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220986;
        bh=olAG6rBxAWbnUThXRykMVAfSeKRBGOfhj2tniWMJDKM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XY+m2XbTMIeX9hNOqK30m4XP+LnYulxcyDky+6xf43fIwroT7y6N6H5Nb5fJMgpQy
         ELkww5HV2NLwzZvTk1AE3tUbFELsQeqxwiuFFl74Q3pKqKOXnCxIPZGtMW59NXURxG
         ZPSJWy7/eZsLM3XRnLI0fRH/ngLdzT9zc3EiVp5z0pvDE7kNfc/CM7vE0W8yTJSrjw
         OqLnRM4iikj/+hGCv0HDLvxvnq9/5dT0Icf6CsJEBDmbJByk1EOfdcXlamsBJjC77m
         8xZ6gF4nxIU0MWgwjhKXDRCQiP65jq0jK4sACNAz0dYuXgym/yJOHlXs9Oz0JmhR+L
         8UctPCVnlmMng==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 0/8] dt-bindings: clock: samsung: convert to dtschema
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
Date:   Sun, 29 Aug 2021 00:09:44 -0700
Message-ID: <163022098497.2676726.6455473597971395732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2021-08-25 06:40:48)
> Hi,
>=20
> Changes since v2:
> 1. Add reviews.
> 2. Split Exynos4 ISP into separate schema.
> 3. Add maxItems to clocks and power-domains (review feedback).
> 4. Do not allow samsung,exynos5420-clock and samsung,exynos5800-clock
>    without syscon. These clock controllers should always use syscon
>    to allow DMC bindings access the registers.
> 5. Drop assigned-clocks.
>=20
> Changes since v1:
> 1. Patch 7/8: include header to fix clock IDs error in example.

I think this header file isn't in clk tree?
