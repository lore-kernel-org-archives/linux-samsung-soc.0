Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083F6CCA480
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 19:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiF2Tg5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiF2Tg4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 15:36:56 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6E529C82;
        Wed, 29 Jun 2022 12:36:56 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id z14so16308180pgh.0;
        Wed, 29 Jun 2022 12:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fh7LkY8pt/jmIPf4qOr2iwrFOxDDYK4GTv+nA/gWk74=;
        b=qhtOGRmx+OFI7R579Pr3wBDjgi/EdNO7soyIsVGztfOCWZv9rUcEQA7LQJ1LgohyIl
         J8UYi94W2AdcClGaJ1GztXnRUUAhBDorfZKotuNZHyRdO8d0CJ+DQFDaCBIOZPupZMOC
         yohnnftiNmexwrk9D8jLu/y0UlT2gDhL+tkgmIJQmuoOs310D4dz8+KzCiahJFDjkWcM
         rvj3DcgYum9zP0BNgPmh6CaFrTF6yeF9l4ueexF4jr68YGUNcbwKazRvCZVf2NTfsNRQ
         tiveEH9AM40sPESNxUUoUMULwaI/cQ6l9IsLHD1JBHquOUTfe3FGEtYXgDkXwWwz2m5g
         zRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fh7LkY8pt/jmIPf4qOr2iwrFOxDDYK4GTv+nA/gWk74=;
        b=RLnjL5ADk1eO6dtm7ilfwx1wvorAcTuc3zY20ahWCHqrYtez1q97ZghhtTGmEex3/T
         C0ELEjLPRQ0BaBd3eXj9NSi2801HvL4mVv9ljsz/QBFQheEdGBn2maQLInVV+y5zXtY+
         FLnNd2H+iiGjm5yUdGTAaD0NWarwB+6EdjLo9pJ/nJCCFmzeigPQLRjKuvRWdDYO7xYT
         OQFc9rOHKmrV5aOGSbMqc63nbHzol7hVN4DXCB/FdTDNVsHGIXJ5zZF7EfSjVWvxfSnE
         ZoKzlZJ5flzr8nayC0F4dbkyVQzaUcfCKG6beofaOWAPSxYYZRgU7P6Kt9dj/2rjnxub
         BoQQ==
X-Gm-Message-State: AJIora8UEZ5ZhBlEoScjOFa9T0zt/KuN3j/E0saA8YQoVscDTcjHKnRz
        CZrOa94bGqgT3KKJfROB58A=
X-Google-Smtp-Source: AGRyM1v8Ucdgoi5G2AM2Vi8xIWVDtCK5upwSink6IoFEMNBsLpwf9IOKLZsINDNf4Lb972POm1ovdg==
X-Received: by 2002:a63:7255:0:b0:40c:bce1:6558 with SMTP id c21-20020a637255000000b0040cbce16558mr4292418pgn.491.1656531415701;
        Wed, 29 Jun 2022 12:36:55 -0700 (PDT)
Received: from [172.30.1.37] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id az8-20020a170902a58800b00163d76696e1sm11826247plb.102.2022.06.29.12.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 12:36:55 -0700 (PDT)
Message-ID: <56235075-6cf5-adb5-ff9f-0e762d2455ef@gmail.com>
Date:   Thu, 30 Jun 2022 04:36:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] clk: samsung: exynosautov9: add missing gate clks
 for peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220628104138.152118-1-chanho61.park@samsung.com>
 <CGME20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f@epcas2p4.samsung.com>
 <20220628104138.152118-3-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220628104138.152118-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 6. 28. 19:41, Chanho Park wrote:
> "gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
> and peric1 respectively.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynosautov9.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
> index d9e1f8e4a7b4..c5a4e1bee711 100644
> --- a/drivers/clk/samsung/clk-exynosautov9.c
> +++ b/drivers/clk/samsung/clk-exynosautov9.c
> @@ -1330,6 +1330,10 @@ static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
>  	     "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
>  	     21, 0, 0),
> +	GATE(CLK_GOUT_PERIC0_PCLK_1, "gout_peric0_pclk_1",
> +	     "mout_peric0_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
> +	     21, 0, 0),
>  	GATE(CLK_GOUT_PERIC0_PCLK_2, "gout_peric0_pclk_2",
>  	     "mout_peric0_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
> @@ -1581,6 +1585,10 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
>  	     "mout_peric1_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_0,
>  	     21, 0, 0),
> +	GATE(CLK_GOUT_PERIC1_PCLK_1, "gout_peric1_pclk_1",
> +	     "mout_peric1_bus_user",
> +	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_1,
> +	     21, 0, 0),
>  	GATE(CLK_GOUT_PERIC1_PCLK_2, "gout_peric1_pclk_2",
>  	     "mout_peric1_bus_user",
>  	     CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_PCLK_2,

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
