Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F09C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FBF261041
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJIUm7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 16:42:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIUm7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 16:42:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6905960F90;
        Sat,  9 Oct 2021 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633812061;
        bh=HwWE77+NdeRx9l7KL8B4x2PzoXQ2pMa2AlP5+SKIX08=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I5nHXhQ2IIK9y6PhZCBJ8dTNMkxIbfmZB7hZ6uob0bvHyHhN8drpW68/n9wO5glUF
         tFtzSfRttTyKWOJhFAhwNl/ys6hcQPiEaqT3BY4sKwyiUFr9+iTqs5RdRSPhrFM2lF
         lgubZgv9usBD2eDbYHTpu+/DBo6VDAk2Sr2Y0gvFowJN2tbNRoqozQO8QthexjXWRG
         ufFeAFhtGaoCwAwdgr3bU2k6zDgOZlTHeI6/0tF3lTky7kgCTAQ0EvQgGuEVz2FRFk
         OrREBAyPzTlEk2j+Pk30glj6fBHxfF4+18GXasi9VecR1zbYehXdiDlw1phZcXKC8t
         i1007eZSmTqaQ==
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Document Exynos850 CMU
 bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
 <20211008154352.19519-5-semen.protsenko@linaro.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <7049b3a9-dc8f-2ae9-01e6-eb3b6f461400@kernel.org>
Date:   Sat, 9 Oct 2021 22:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008154352.19519-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.10.2021 17:43, Sam Protsenko wrote:
> Provide dt-schema documentation for Exynos850 SoC clock controller.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> new file mode 100644
> index 000000000000..79202e6e6402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos850-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos850 SoC clock controller
> +
> +maintainers:
> +  - Sam Protsenko <semen.protsenko@linaro.org>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  Exynos850 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
> +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
> +  clocks must be defined as fixed-rate clocks in dts.
> +
> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> +
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All clocks that available for usage

s/All clocks that available/All clocks available ?
No need to resend, I can amend it when applying.

