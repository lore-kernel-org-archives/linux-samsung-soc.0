Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC09DC00144
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Jul 2022 00:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239373AbiG3AYm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Jul 2022 20:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiG3AYm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Jul 2022 20:24:42 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC332275C2;
        Fri, 29 Jul 2022 17:24:40 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so5162802pgb.4;
        Fri, 29 Jul 2022 17:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=S3s0DgJMCfv1NH5K7iItwTPGWILKOx0U0CgxdGkoF3M=;
        b=KXZPSDeLmdbcAWDk3ZfWpW0UckKemRFDvtNW1WHG4M2QoQFaBqWvDnqfCyU/D4Iz9S
         f7mwlh9Y/+uekgY2/06bD3NHA1bPd3PdhVnVjLF7F3gv1xnLJdZ7EFKobAu1I8QSZ/Sh
         /FQwqiTvVawixa2VeBX4MaewpQpB41wO0de2NaLAaBXQzPu82QHT5o+Q3b34/gdMrTTd
         eFOIJCrRWUisvD/+AjBT58jpeTcif6AEhpLDxGs6Cr602aKU+Qmri/AYwmIRUYoYP/K4
         t+LS+4+YXylA8MHiMthkBEQA/yRsWprde8EfeynJ8OFNbWB3yoiDve71vVn2/ZQwVcp9
         JxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=S3s0DgJMCfv1NH5K7iItwTPGWILKOx0U0CgxdGkoF3M=;
        b=nC1yMmfVMSdjZsB0bjeDFUZ9SFP9wFADpjpHTImKeERRBaHjhDWwBaDErWePQlNthG
         SPcsjnAWz/NcB8Q+74ynbnibSba0QUuGgWq4YAG9HJ2/jAaYMZlIuOj0ZYxZsfWAOGYt
         fAQPap2i72H3NduEMsYwpD98v60eA9Qdfce1iHedAYVYvkokvLEJpUBbpmm/tPOIczLv
         v1IeANF6bt9y6RlUl6xxcHfwPwEhXgNcfYrY8Ihsi+rDz9c4+0VA2mDNyyIV+/QEzKW4
         Da/Qw/qwwaiqK+tO/WTTOmLgzjzHHEv977jHzkH0uT2lqppVBfjS8+xCD/qRQmorwcco
         RtNw==
X-Gm-Message-State: AJIora8limM37Je4SmeQlGUR5iEO/+zY1MsytmvNNMoc5ZvgM22WRGdF
        79t5NJgWKICrwxLQPQvT5DE=
X-Google-Smtp-Source: AGRyM1uPniZcQhDM5GslX0kU1VMtXyiCeWvXKvISdBxcpP/0jBcGh7iBE753Ez0PgmJoPyNTw7dhmg==
X-Received: by 2002:a05:6a00:815:b0:52a:dea8:269b with SMTP id m21-20020a056a00081500b0052adea8269bmr5804673pfk.66.1659140679370;
        Fri, 29 Jul 2022 17:24:39 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709029f8f00b001637529493esm4257335plq.66.2022.07.29.17.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 17:24:38 -0700 (PDT)
Message-ID: <7be2229d-b74d-efaf-236b-6ca1af5705fc@gmail.com>
Date:   Sat, 30 Jul 2022 09:24:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
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
References: <cover.1659054220.git.chanho61.park@samsung.com>
 <CGME20220729003612epcas2p280d8bd61f755ab6234b60030bc2cf7f9@epcas2p2.samsung.com>
 <debb6335cb2bcc935f7572bed25d76a85e80cfaa.1659054220.git.chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <debb6335cb2bcc935f7572bed25d76a85e80cfaa.1659054220.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 7. 29. 09:30, Chanho Park wrote:
> Add fsys1(for usb and mmc) clock definitions.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index 6305a84396ce..ffa44b3bdd2b 100644
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
> +#define CLK_MOUT_FSYS1_MMC_PLL			3
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

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
