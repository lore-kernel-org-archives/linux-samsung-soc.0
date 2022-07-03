Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671CDCCA473
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jul 2022 18:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbiGCSgw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jul 2022 14:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiGCSgv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 14:36:51 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A76E71
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Jul 2022 11:36:50 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx13so8591789ljb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2022 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=TGT3kemIADeYuBglcNi+xV1YmiL3GEhdQWJAey+jFZs=;
        b=IJHZjhEvjM7xn+M97PxbjLdIL1P8bn/vLB3QE/2+Exuo1PZlTtCalfXapjeebQ2bDS
         rAxB8yPwIwHKYDfFMfxCrl/FKqtn9NUvb0WGsfaqU21vHErtUzwnLpg4crlhRUJLIpKG
         7M1f06cyvAMOVLgmbR64boTZ47u0/iaGMWtRb3dXX/OJTYW4izJtWKOO7pLvMWswcd8k
         pAor3sPsk8EXdZY7De+uzepLu6ZRUzs7i6wu5TXk3u4zbffXXehdHY2FXoQWz5u9B8uB
         dClvJAsLck4o4SZhSpdNyPxHBO7GlQT9FWyLCOpRmQTBQBhciTBaP9s/oRIJipIiBmZo
         OoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TGT3kemIADeYuBglcNi+xV1YmiL3GEhdQWJAey+jFZs=;
        b=A2U7jfrSujBxZ+s4YRYJQ+vqbljB0CRTBmnU8HEpox9k+0Lrwn8rVi3iEQFf/0kt3s
         8ziTg0wmh10Npj7gwnA78S8xW46o/e6wHHOzRO/U24yPZjilRaZioy9vibNBv1UHpVpB
         QbrRA3Z+FrESWQJhNma7wTH7sicbjEhKdCTvlsLqDJCQOIIrFw17zy0y04VPj9bjSXUs
         iItOShtnmLGxab4zjBNBsigPfAZtZSXqmnK7uK0dYs/BSCNtQN4faJkpcPokmHj1IMWj
         5WSeGOO/uwGwEX+ycsRvch+UyUhFoKvxmnJCSViEvFelOWeZ21VKi6bDhErt8UHLYONJ
         kDmw==
X-Gm-Message-State: AJIora+tgPGPvPOLJDOmdS40aE6Ile5VbtcUUmUn4zPaSpaWUo7PRAFs
        gO51+Ta43zR1uOqUk62FevDw3A==
X-Google-Smtp-Source: AGRyM1tzYDkz4rWP9yNev9qT7Qcg6s33MZmMeeOloPJCJbSyqikwGGw6UR+ON582tM5uWIhDAbgxsA==
X-Received: by 2002:a2e:54a:0:b0:25a:6e2b:1096 with SMTP id 71-20020a2e054a000000b0025a6e2b1096mr15028892ljf.456.1656873408568;
        Sun, 03 Jul 2022 11:36:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d7-20020a05651221c700b0047255d2111csm4818566lft.75.2022.07.03.11.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 11:36:47 -0700 (PDT)
Message-ID: <badc0116-f9dd-bd02-1e6a-54cdfbde8ce1@linaro.org>
Date:   Sun, 3 Jul 2022 20:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/2] dt-bindings: hwinfo: group devices and add
 s5pv210-chipid
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/07/2022 20:34, Krzysztof Kozlowski wrote:
> Hi,
> 
> As suggested by Rob [1], I organized a bit bindings for SoC devices having
> similar purpose - chip identification.
> 
> These sometimes are put under nvmem directory, although in that case the
> purpose is usually broader than just chipid.

And the missing [1] link is:

https://lore.kernel.org/all/20220701173524.GA1185040-robh@kernel.org/


Best regards,
Krzysztof
