Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C660AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Oct 2022 13:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiJJN0W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Oct 2022 09:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJJN0V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2022 09:26:21 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28855C358
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2022 06:26:19 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id bb5so1091040qtb.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2022 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bECZwqwp/UMUC2akq1A/CRAdUXQ8y+lySs9e81GJPvo=;
        b=wFLua3qNoxv1oK422WS3Z0arUW43Mk/9YaiEu598KyMxUreaiHVlStJNCYindCI14l
         0uih9J2kqd84xdRN2futlUGJ509Lgr0RHsCZxptFQ/CEi0EbJ4DYxtTtJ7nfsRAi5FH5
         yQa+s18iY7BYG1txW5XasmdW/pnqnle4EKdUHckr68cK+WWlCNEbifbF/BwNLoXjjpWy
         7hdOXNAEa9cf6nqCAQWPPR6TkkyB4J+L2ZAsE9uEpGVN8tSImHMblrh+LJR1vsQv/Nys
         XHaWRC/3q0osdP33TtZGwBWlxyY8/rXeMolzTBml+Msj6rDrgR15IvztiGkkSOaivGWy
         Le5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bECZwqwp/UMUC2akq1A/CRAdUXQ8y+lySs9e81GJPvo=;
        b=QI31mcmTVGqndNZuRyMry8S5TEnkvSgIt2jtwyUfmCx1K9HIxiGNmOYnDhw33pGQ6W
         hIpAL8xKC/hBn5UFzC1YEO4oiVGjOw23Of/CEF1jqbsb/A+XVd92wftmCFLMxfBZMcgR
         oln6DHra4bhZt6glnN86bxR3UyEsmXNF3pcUNonobQiKNXXkurH405UibRJ16JXsYpFW
         IQs+9cWMlI8EcmRr1sNCQ5SDCbxao0GfaypXhWGTFQ2MWxgKTa/d1hp6j21tCjj4p7gv
         PFzM7XG9dH8YqlU0yCY9QrXTxbaUAkahYgElJx7Kjg9uVi8KiuhxivGvxhPFIDpXesXH
         kotA==
X-Gm-Message-State: ACrzQf0p+i5w5PWKYRES5N5x2CwDo3w/9tPcGdwUh3nkHNy7X6AGdoC1
        7vSCg11AB+T2pHZjxszHsvCTF9Zl5EH95Q==
X-Google-Smtp-Source: AMsMyM5Y+JwiozPaIKFDE8rg9TBm8NsqgNP92weuetrqvm8DbETgSFdxRpjy0dqfKP9ATq6rHESYnw==
X-Received: by 2002:ac8:7f4b:0:b0:35c:bfa2:8bd2 with SMTP id g11-20020ac87f4b000000b0035cbfa28bd2mr14587635qtk.644.1665408378940;
        Mon, 10 Oct 2022 06:26:18 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm10660953qkn.37.2022.10.10.06.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 06:26:17 -0700 (PDT)
Message-ID: <ebf9e667-6b08-4a04-2241-04295cc28058@linaro.org>
Date:   Mon, 10 Oct 2022 09:24:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] arm64: dts: fix drive strength macros as per FSD HW UM
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, chanho61.park@samsung.com,
        linus.walleij@linaro.org, pankaj.dubey@samsung.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <CGME20221010123120epcas5p3ba947a3a982bc6a78310472c2a65ebfe@epcas5p3.samsung.com>
 <20221010120438.80680-1-p.rajanbabu@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010120438.80680-1-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/10/2022 08:04, Padmanabhan Rajanbabu wrote:
> In FSD pinctrl implementation, the pinctrl driver is using drive strength
> MACROs, which are deviating from the actual values specified in FSD HW UM

But you are changing DTS, not pinctrl driver. The message is a bit
confusing.

Add full stop to the sentence.

> 
> This patch adds the right pinctrl drive strength values for FSD SoC. This

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> patch also ensures that the peripherals are using right drive strength
> MACROs in-order to function as expected

Full stop

Which commit introduced it? Add a Fixes tag.


> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 34 +++++++++++-----------
>  arch/arm64/boot/dts/tesla/fsd-pinctrl.h    |  6 ++--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> index d0abb9aa0e9e..e3852c946352 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
> @@ -55,14 +55,14 @@
>  		samsung,pins = "gpf5-0";
>  		samsung,pin-function = <FSD_PIN_FUNC_2>;
>  		samsung,pin-pud = <FSD_PIN_PULL_NONE>;
> -		samsung,pin-drv = <FSD_PIN_DRV_LV2>;
> +		samsung,pin-drv = <FSD_PIN_DRV_LV4>;

Are you sure? The original commit used here value of "2", your change
also set value of "2", so what deviates from actual values?

You need to describe better the problem.

Best regards,
Krzysztof

