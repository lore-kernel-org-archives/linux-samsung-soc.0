Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF25C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 10:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237057AbiDXKwG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 06:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239130AbiDXKwD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 06:52:03 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1F92409A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 03:49:02 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id r13so24445223ejd.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 03:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZeFfic7NkdYVY76qjghFYEa4bj1suXvfyxykTnL7iSU=;
        b=EQzrSr7IPIJEN2vBGd4rtciOiq7x+HzcyycDjE3DJxCACvRuhViJsJVxgtyGYh77h+
         bXh+U/bRcLGD5btOet6OMQS0+DcPPBQmkNKLpwqpCNUE/M7CWf6vmecux8Sx+g/Klret
         /jZs65AzmSB0w7b60opHRrvd9dKn0TWDKz9/rdlzpp8VB5QzmrzrgXjvwfABEwq5bQJj
         AhI1w3mx3C5pJbod0RjZibSlzG5KtixYP6rvxDcqTwDfIP0MbzPY2aeAjuSzGRv0oyyC
         /DNrWd4lGo8dVjhCQY4vrNz1RNpRBanlq35mLozoeTIB8R3cGuG4LZqglrzTfz7qzx7d
         skMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZeFfic7NkdYVY76qjghFYEa4bj1suXvfyxykTnL7iSU=;
        b=JR/gXWp4DHO5nEldbCWCGeAq+qxP/XRkH8Q6O+j5VQoJui8mzVS+oUN2zd4L55D9wc
         IX02LNyx73pk7FXoF9jhf/nKv1PmzKXkb1fz/lhSDjC1EjqbKDVBAdY5yxfmO6+RgQaO
         RBxD/ItQueHRdXQmpm2XO4ISxNKbgmQf4oIg3f7rSZ02ZNropgja5sW4omlj5h3WrFfF
         JSbil61JzyD08O0/GqjgJjIGF1s/TNOhgLVdyGJHWGsZw+YQmiDKKFqtwttaVw8qBgr9
         WLi/OjDMSZzced0Pj5yB34foj2//Fpps4XR8pAn399Kpn9XdHpymdDlVhKGusi9iwoTP
         NdEA==
X-Gm-Message-State: AOAM533cdYngsOQpaKF5yIh/tidKd4IO3B9uK6Ss2m0JYYAx2AC1lEcg
        YaXQhjt5+7ClMn6LlVt0vsUALw==
X-Google-Smtp-Source: ABdhPJxu1SgZxDPFJ4hqAIpFqD034Z/96Fhc0oCnQnk01+fVNPLw3U0KEHFw/qjT9d5lLeTmJz/g7Q==
X-Received: by 2002:a17:907:7f0d:b0:6f3:85c0:7c6e with SMTP id qf13-20020a1709077f0d00b006f385c07c6emr3054591ejc.693.1650797341532;
        Sun, 24 Apr 2022 03:49:01 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h22-20020a056402281600b004206bd9d0c6sm3244860ede.8.2022.04.24.03.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Apr 2022 03:49:01 -0700 (PDT)
Message-ID: <5b41d217-a5d6-91f0-bae8-4086173bb5db@linaro.org>
Date:   Sun, 24 Apr 2022 12:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/5] mtd: onenand: samsung: Add support for device tree
Content-Language: en-US
To:     Jonathan Bakker <xc-racer2@live.ca>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <CY4PR04MB0567451F82EEBED23A7559EFCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CY4PR04MB0567451F82EEBED23A7559EFCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2022 05:43, Jonathan Bakker wrote:
> This builds off a patchset submitted in 2019 [1] and adds support for DT
> initialization to the Samsung OneNAND driver.

Please rebase your patchset first on recent kernel, because it seems you
missed some addresses in Cc, so your get maintainers are from older tree.

Best regards,
Krzysztof
