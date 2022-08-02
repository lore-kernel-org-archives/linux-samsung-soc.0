Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95414C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Aug 2022 06:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiHBG4J (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Aug 2022 02:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbiHBG4I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Aug 2022 02:56:08 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED1212ABF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Aug 2022 23:56:07 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w15so20578462lft.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Aug 2022 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=duMOzSzPC0kNmGBuxGFT1vQPdxsyOe841Ff5xSydUPI=;
        b=TX//HXS7nXFnr5lv8r55Wi/gkS44/731u4IrRnhMkQDM1gX8IIZZcWxlN2OpbAmqMe
         WBC5UwyxZCPjU33eKAgp/e8W3pBqmWcnVIfZM7dgWRloyTExgDnbEh72eLEdFYFrOyD9
         XROwv22bkVXIXZylwIwhkDK6xa0THYLHX3rR+AensJ+7aOFN1cXDst3Gt2VqVfzRdiZB
         bN/4lcZhvtXM/Y+yE8n4sBqN7PlWnFbOcb6Cdzm/+j/J8LbkDeKYRa9sdwcWXo0uxBBO
         E4HTQxZGTuFkDd8hm8JSVstqxLgYfuxzC1wP43dit/DR0BJogUwGQGo3wsP0rNts4a5d
         FyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=duMOzSzPC0kNmGBuxGFT1vQPdxsyOe841Ff5xSydUPI=;
        b=U/oS2Gh6i4UXH+a9URUl16gFx7xFLNNJWGuoClUFZIfAgf+hc4wSfl0+NcHa2gsIug
         hVNJTK7ULQJwNOvBH3mBSG8+g0YDdYPm3zYLYZMnn477lox3ybHQy11KmwAxCWc5sMNa
         MtnCEd6TKkHt+ieWJ2Nlp/JGEBu0XT7gwdja2nXYRWexIePAlm9S1K/wBOBG/nYbTQQa
         ozJ+cDQX+LYp3nK/VglX+i9qqq2S0atriTdfffSQlpB4EnzvvIpbA1sEcLLBv7T3bXf/
         sDnr9ks+RScoUmG48kbABB3E1C/GYVY20sIEojTodUGMaldsxNsf/Cct2b4H7yyGg4QJ
         ZwVA==
X-Gm-Message-State: AJIora9xMHeNgZc+/a+rwiDNjZsU3tNuR5YqFfskpQlLlhenkvvssEdb
        VmvF+Nu7BLGADKsaZQKn58OMrg==
X-Google-Smtp-Source: AGRyM1v7wLsOscR2SNIg7NarMsgFVtSgIEn3ktNg2PO0Vj6oBrb0XcI9QfYQbnJN2LR4pLTxWBkocg==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4128 with SMTP id h3-20020a056512350300b0048144704128mr6698719lfs.303.1659423365664;
        Mon, 01 Aug 2022 23:56:05 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id d4-20020a196b04000000b0048aeff37812sm1094997lfa.308.2022.08.01.23.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 23:56:05 -0700 (PDT)
Message-ID: <1b4206ee-155f-80a2-f339-ab590ee2ce05@linaro.org>
Date:   Tue, 2 Aug 2022 08:56:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
 definitions
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <debb6335cb2bcc935f7572bed25d76a85e80cfaa.1659054220.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/07/2022 02:30, Chanho Park wrote:
> Add fsys1(for usb and mmc) clock definitions.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
