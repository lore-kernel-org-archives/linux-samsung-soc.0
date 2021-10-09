Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD606C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0E486109E
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Oct 2021 20:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhJIUa7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Oct 2021 16:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIUa6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 16:30:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20D6C60EBC;
        Sat,  9 Oct 2021 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633811341;
        bh=QxpioHdoYnt2iNZStTCKIywWZgGZS04w/KWVY4ujZmc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Tjd+fI/oA/D5W2Mqb6bp5yDw1bt4ZWSgN/dlfangA1T0fP4vzsUAOqSQ1w9xQ8U4g
         EGZ3y0R0F+8RxiFF3JlBtg3TdMzosfeJKuItKIaMrLJDucMcBdmZlja6DfIuGkVM+C
         G0looNnmOYKFCTBsFGDG0GHNTjqbU02GVl5Nh9WNv7M6awNn+8iMGOmSXnYBuhBw5+
         o3jKxlvqjde7H9akrkE8rwN1nDO3MYwQlMtMKhKXSpZWhXS8jWasdEART1kwoDixrV
         LFmsbiN2fnqcKTxAdxt456R6+MQAs1NQ7st3Yk56PbAH00uMGWmuG2wKjYAsK8PMW8
         /GPrPZIRYmRtQ==
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
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
 <20211008154352.19519-4-semen.protsenko@linaro.org>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <544afd6d-00c0-9482-2b90-8d0c6140e981@kernel.org>
Date:   Sat, 9 Oct 2021 22:28:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008154352.19519-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.10.2021 17:43, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring<robh@kernel.org>

Applied, thanks.
