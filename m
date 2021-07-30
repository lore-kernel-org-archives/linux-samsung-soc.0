Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52173C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 16:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D49360241
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 16:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhG3QgB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Jul 2021 12:36:01 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:52940
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229479AbhG3Qf7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 12:35:59 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 5BC1A3F23B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627662954;
        bh=r6WBOzzzU71Avbpbkb7MJv5FMhuteThAgMvx7ePk7s4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ezwLRmvHQ/MfPcVmQT1RbewuFDc5ZpJ/mMgMzx32gPb7jSD4dNQkO343EUQDi1j3y
         WEPsuTiNDBICn+1SSt7auYbrfp7tpP+diR626Es2wITargm0m2FEOPcH1Tu16ycUmF
         r2vbfpc+iHEtkjrGN49cHa27aNrWU7ziocUj4dvsfCXkq6Qv/Vlq2j2Pdoro1TDmVF
         nJ78AzLKgJfwg0KWjFpQyzXrhRnyPD5vdVa7tn6Xm75HD9cZK7tocPWGAX9FsQb8Hq
         4mgOnJtDtUpmbUNjVNICkOVatBnHvV/tykFZP+9Fl5T6vou8PqBHkDZrIFzlKb8a7S
         +truZ6NHC7QPQ==
Received: by mail-ej1-f72.google.com with SMTP id g21-20020a1709061e15b029052292d7c3b4so3292946ejj.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 09:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r6WBOzzzU71Avbpbkb7MJv5FMhuteThAgMvx7ePk7s4=;
        b=NCOwLYz2Ym9wn5jnGvNkZPDKcXSKwNCDOFV83UZ2bUxVR4q9BaTXnp4lzZM+Da4Xkn
         J6+P/bLwRNXsyPZ+zW85+ZiGjXRIiZWT4WcJmaPQLswe21bOAmiUXaDpcTlac2QdorpK
         KCDJUxxE6jFGdtE5inqRZmvMPjI8bgW/7Py1DIN8aaqcUh4uiOqBeezJXNdv2S/Ff0xC
         rSXiQfr/POmlC6MwctyydLCfPKVMBTCiSXb9xozIgzS4Mx2klNUw9Sz1S/qJWyqvwJAl
         FuoZ2sZyOyVtxokO+Z/LbQX7zMxpxreXiqMiqcbYI9HfExPt6TLtm7KihL2CCusk/m0X
         XYvg==
X-Gm-Message-State: AOAM530m2agLZ8OToo0lagFmZUYcpMbSK8aIikdnueusqJTzJrnol/Ut
        rtdm9/nWIhzj+TDNrky2oEZQG6iFS69o8YmibhLtNO0+bUzv1YBDA3giHmyQIgYNd6hgXLiANr5
        dn0/fji37142cJQZDUl9qTymM53CclG9RoE3De6Wh4CPEGiOs
X-Received: by 2002:a17:907:766c:: with SMTP id kk12mr3257237ejc.525.1627662954041;
        Fri, 30 Jul 2021 09:35:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWkxEaV8vcHXDuB7QVly4oizqMQCUQ0S+bTlZqlWe7m7kMOzOsno/9k+vpyqKWr+t6iPU+7A==
X-Received: by 2002:a17:907:766c:: with SMTP id kk12mr3257225ejc.525.1627662953841;
        Fri, 30 Jul 2021 09:35:53 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id la23sm734067ejc.63.2021.07.30.09.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 09:35:53 -0700 (PDT)
Subject: Re: [PATCH 07/12] dt-bindings: serial: samsung: Add Exynos850 doc
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <45da758c-d32d-293b-f4c7-12b58ebca8ac@canonical.com>
Date:   Fri, 30 Jul 2021 18:35:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Add compatible string for Exynos850 SoC.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Thanks for the patches!

Please put this one before other serial changes but does not have to be
first in the entire series.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
