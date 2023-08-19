Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442DDEE49AA
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 07:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344149AbjHSHK0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Aug 2023 03:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbjHSHJy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 03:09:54 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633783C22
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 00:09:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso211570166b.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 00:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692428992; x=1693033792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8qI0sJztqQDw6h/vBwRwLhtMGerNoCgM5/KeoVhh6Q=;
        b=loNavOkqgomEZyWZklIcwWH6P4OTjuA0nITXlNoir2jSumGwkTVrhmiRvoWpu3BygZ
         v0b4SPNBoGaqal88HKs2X4+Qc+QC1/nyhzWLYJIM52KayIqvLrUrQ3Um4JYxxSUHCg/+
         1auED2qbQ0qAyTYlFQJUMx6b3tCHvcxTFp4SP/KtSKjmmMxGUDQ9OHXDwrquhXRudOnP
         e3Y6/qF2J2rL6/rdgV0LcSZDXYdH+047HqSY5YvsKqyDahJVNmb10oBXpeQEQZNgzaFZ
         VVpKPma5j4km5nSuz05zfxCvHHCOitODpDmoln5EgH8WMtQXt7xGZHSfMcVdshypbL9v
         lk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692428992; x=1693033792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8qI0sJztqQDw6h/vBwRwLhtMGerNoCgM5/KeoVhh6Q=;
        b=X88Romp+8/J6+g19KphMwfeBPqFwfi2cPzy8WAGgGbdqLTnBCxeD6Jr2IvucrHkp0K
         +As0cawj3Dl2d3WpR7sj3M2Me+ZWkYYCMn+pO+9aSmPZU84IzqTrJnEM4NZRLe3XfYmQ
         aYQYreq2jkWbO0n1Fs7SgXMMIWCfVVmeJHPqoDyKlvH3LFhhROhaOMfsF2bxOIBIdMFu
         dWhATvxZFlF0oVZdoFRMmykjWXhNfeQktItyBkOAnKJvQ0Q2ZtMfLJLQBHuoObsimn7r
         wPzZS1rXoZAeagqBx5tyaxQ/eSneKc/4hJNRO3txk1pF+SE/cyOM/K7Uqg88wvv6bKlf
         dqIQ==
X-Gm-Message-State: AOJu0YzAdSZjhHOvwtXf7rIUIzcTMAQ4TeD2slAEo+Tf+JbLmtdRdVP+
        3VGK07tcuxN+Rwz50WMsvEs4cQ==
X-Google-Smtp-Source: AGHT+IHs6WiXcA/juYG/iLEiP8ou4eb7inN/XUyyyKaBZRpQm/jMfrvGH7BD8NMoU7Rbym5ZM3OM/g==
X-Received: by 2002:a17:906:113:b0:99d:dc0b:a898 with SMTP id 19-20020a170906011300b0099ddc0ba898mr870453eje.69.1692428992020;
        Sat, 19 Aug 2023 00:09:52 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id sa17-20020a170906edb100b00997d76981e0sm2182783ejb.208.2023.08.19.00.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 00:09:51 -0700 (PDT)
Message-ID: <b5d56d90-dc94-c29b-6429-281622e4c559@linaro.org>
Date:   Sat, 19 Aug 2023 09:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/8] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos850
 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
 <20230819031731.22618-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819031731.22618-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/08/2023 05:17, Sam Protsenko wrote:
> Exynos850 has dwc3 compatible USB controller, so it can reuse existing
> dwc3 glue layer. Document a new compatible for Exynos850 and its clocks.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

