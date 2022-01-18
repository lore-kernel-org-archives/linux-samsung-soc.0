Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C459C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348299AbiARSrU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:47:20 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44492
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348291AbiARSrS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 13:47:18 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 928663F203
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531637;
        bh=m+xP6bN0zKQ33R8bBjTU3wo4FVKXSjHRB56Y8SB1Y2Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=G6ZqhmKcgjOcF0JxRVmPtTJA4zDGludRX+wN4e2R6EzX0tF54Ev/H4Ztr8W7JQXYa
         YmWbaCAWFFXFMksZ3qkMSfSgv9sN5DJ0tDdMeRPNM7tM3nJQZwnUSzHQjd7fQynCd2
         MaRuWrZIjFEwjYMjtQRiI10nJeKMhAF8hszXiMGtiEBfuHQ7pr5pzZx/YjjtmzDH8s
         bQh3xaLkz71Hqn9rcHVZIVcv7TsvxA2Bmwfqxpx2tOI6NeJMN2oMx+YmW8SE11Y16q
         rAn9ker+npplrvrD0opegA4h4wxNJze7zFINkUPyQIpNS7nlFWMiqZuIIP/2k0cRYX
         jg8IhZkJJsuhA==
Received: by mail-ed1-f72.google.com with SMTP id ej6-20020a056402368600b00402b6f12c3fso6444482edb.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 10:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m+xP6bN0zKQ33R8bBjTU3wo4FVKXSjHRB56Y8SB1Y2Q=;
        b=4fItp3yyS/O5nf7WHCWBdRd3kR3A4mz0IMyG9dv++4kgbRbvN/sNpUTipF01vrRTmZ
         u+m2kxBXvTqeOwo4nNlJdggxsFwiPN70O6BBDOmzQPB9GCStXn4v+YGJ4HgEF1dm2FCY
         lqUshBSc7X3BRiAPePOpuYSOUMvRRHgrsqzkkTc8Z9kbHizPwBB17JeOvy0Oe2Pp0wzG
         fNh3jhSzAHlGmMCSTfR5kcB7LbBdGKxixIAmFMI5FnpA3OGT1GBN7oWFV4FK/o05mDj+
         jCsxXd6ml9j8/LAMZeI1bAlv3x1hBZAe/G7PXnt9xLa7ALD2HRST8JItiheRk5LdNIHF
         HOag==
X-Gm-Message-State: AOAM532BRmRTFpLxZ0zOP8QMtcpvizkaHijR6Nk1KI0UpGJcXP4lExDn
        oG59UGPUvRPnB/GHgBytGhoRkmeY6aufes3FAcW1IAxsL2vxGyZ5NTI7oFj+HsZ/5Cm9qZ9OIey
        8VYETw5VBcPf7A6QPXawCwoLS94PtCTjTj5+1mtXUf5XEvUiY
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21457483ejc.202.1642531637296;
        Tue, 18 Jan 2022 10:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhhrWDVROJkHhOAFBu8GoY4CzXaN/5V1ROMx/f1ASWRjjDQzxbHDuWfmOIns530yDN2yadsw==
X-Received: by 2002:a17:907:9810:: with SMTP id ji16mr21457468ejc.202.1642531637135;
        Tue, 18 Jan 2022 10:47:17 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id nd10sm5603511ejc.214.2022.01.18.10.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:47:16 -0800 (PST)
Message-ID: <ed1f3bd3-b17c-8c6e-35c6-c996cf0facfa@canonical.com>
Date:   Tue, 18 Jan 2022 19:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 16/16] arm64: defconfig: Enable Tesla FSD SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150116epcas5p415b4b658b3ca3fe5e52e11a33546b926@epcas5p4.samsung.com>
 <20220118144851.69537-17-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-17-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> This patch enables the Tesla FSD SoC in arm64 defconfig.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
