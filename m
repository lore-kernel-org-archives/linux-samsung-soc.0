Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB97C04A68
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:38:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiG0HiS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Jul 2022 03:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbiG0HiQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 03:38:16 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC3402F5;
        Wed, 27 Jul 2022 00:38:16 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e132so15236702pgc.5;
        Wed, 27 Jul 2022 00:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wV3c+f3BmyLTysoPPoqvpQB6Eo53pqDxPKi4IrUrfME=;
        b=fh4nnd3MT3SOOHuWiPH1hwnO6qvFYGG95e6iGxxwriYf3ayZGKDlgjcYzFBbsuzYI+
         WBG33QInj+Yef+0BtPB1Er7unTm1/PTDYK5mweCzoaelVvX45g+IKm3o7d25mnPT22LL
         Xet7d5AjBdJHWyj0PrmSJhqzytUZ6gVqEUtRzQAQj0zS7itT2K5DoeF/xq+OkHHGRYC4
         KmF+/uCPu9sESyMH4PzXFsUGWTKCOXsQM1/Ai5cJEJI2CR2HYMo1RfghauJjZgOTb88q
         xd6leNf4K/B6CdHG1ftxaSnBKU6QOV9Ibsb8MPgGpAgV2sBTNOpIHvvk9eoVP70j5bZ3
         g3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wV3c+f3BmyLTysoPPoqvpQB6Eo53pqDxPKi4IrUrfME=;
        b=Uv2ersq4qN7A5nyArIrQ7ogZba26KZs++qug/d6cZTF1cZHvmxL2zyuCGJPI8zSa/S
         5hFKeZ9wp9jtciJOiNf1i4ojGlB9mkPrsAYIKnYWVS9591Sj4W6nNHfIgqOKRlQtdn0h
         xCBJnEcLgJWgwIcN0ZTkZi5g/iqkW95okv1K9nzc+hxnawsQcP2xDNkh7woTxsWKrEVF
         I/PFZeST1RmqpXf9gqpkKgZoX8WNVDfRU412dkt1vdccsnMMu4pAeMr1kJLyiznBEUgt
         vPrdAkmZgwOu2UlCr+xqXdK2/aGqpNZwcOLSnMmCd24McQNUQJpiue/Va3alxSiNxuZY
         1jqw==
X-Gm-Message-State: AJIora8cV1ciZIwXqKWeO1zu9ghVPB1SZB9uRFIIv/GoO4lyk2GvJSr2
        lUSjxDSQzzyB520RdZuTJ1E=
X-Google-Smtp-Source: AGRyM1vdsUIYBLlb0d8yhP0ziUZSwBOiyyZ1gCdwluhVEKF8YIIHe23da7wmdSj2srxv3nolsQcI3g==
X-Received: by 2002:a63:4f52:0:b0:41a:3744:d952 with SMTP id p18-20020a634f52000000b0041a3744d952mr17251270pgl.186.1658907495484;
        Wed, 27 Jul 2022 00:38:15 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id t4-20020a17090a3e4400b001f20c694cccsm905286pjm.35.2022.07.27.00.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:38:13 -0700 (PDT)
Message-ID: <7aac0100-5f45-4586-b13e-df0f8bd95060@gmail.com>
Date:   Wed, 27 Jul 2022 16:38:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
 definitions
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
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220727060146.9228-1-chanho61.park@samsung.com>
 <CGME20220727060612epcas2p34e861279ece7fbd3c7c87ce02c7d795c@epcas2p3.samsung.com>
 <20220727060146.9228-3-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220727060146.9228-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 27. 15:01, Chanho Park wrote:
> Add fsys1(for usb and mmc) clock definitions.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index 6305a84396ce..7e11e681da5c 100644
> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> @@ -228,6 +228,31 @@
>  
>  #define FSYS0_NR_CLK			37
>  
> +/* CMU_FSYS1 */
> +#define FOUT_MMC_PLL				1
> +
> +#define CLK_MOUT_FSYS1_BUS_USER			2
> +#define CLK_MOUT_MMC_PLL			3

nitpik. This clock id doesn't have 'FSYS1' word. Is it right?

> +#define CLK_MOUT_FSYS1_MMC_CARD_USER		4
> +#define CLK_MOUT_FSYS1_USBDRD_USER		5
> +#define CLK_MOUT_FSYS1_MMC_CARD			6
> +
> +#define CLK_DOUT_FSYS1_MMC_CARD			7
> +
> +#define CLK_GOUT_FSYS1_PCLK			8
> +#define CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN		9
> +#define CLK_GOUT_FSYS1_MMC_CARD_ACLK		10
> +#define CLK_GOUT_FSYS1_USB20DRD_0_REFCLK	11
> +#define CLK_GOUT_FSYS1_USB20DRD_1_REFCLK	12
> +#define CLK_GOUT_FSYS1_USB30DRD_0_REFCLK	13
> +#define CLK_GOUT_FSYS1_USB30DRD_1_REFCLK	14
> +#define CLK_GOUT_FSYS1_USB20_0_ACLK		15
> +#define CLK_GOUT_FSYS1_USB20_1_ACLK		16
> +#define CLK_GOUT_FSYS1_USB30_0_ACLK		17
> +#define CLK_GOUT_FSYS1_USB30_1_ACLK		18
> +
> +#define FSYS1_NR_CLK				19
> +
>  /* CMU_FSYS2 */
>  #define CLK_MOUT_FSYS2_BUS_USER		1
>  #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
