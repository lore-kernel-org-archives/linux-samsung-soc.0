Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532F2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 09:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243649AbiDGJRT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243703AbiDGJRQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:17:16 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C54B714A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:15:16 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l26so9545543ejx.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=unQfTgqeQZWyCG4CKIwW81rtnRzgcWAQJNa676fN02I=;
        b=LUII6HZ52R2BXGsCinwoXA7ZKD8j3+HdDEHYyZpvvKf/cBjymjr0XA+PSMIiSXwDB6
         +3STtlNbNTEM7dhW/DwEVx9m30IM5tDu0Qm0uKkIVO3EdnHmyWxxI25Gwz5LtYMYXrne
         Wr2v5W+DwP+Cs3qjDREIp+lNi1BLAOCYHfQ0gWD8qq1e40/YT9T0yhN+GEsAPsS6pvov
         7ep8L30sxWe1ySj3kyaihN9UdfM3JBtgFYJ1u4fQxXtV52f6+knvuy9pAgUMNimt5qMd
         fvhYjVYErWg/O6qn6X6eh+VhP9K4cRiVY9ZHPg4RaP6zEhv9ow4aGxm/C74s0bF9glON
         IIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=unQfTgqeQZWyCG4CKIwW81rtnRzgcWAQJNa676fN02I=;
        b=K0lqlTRvi7daAk68nbQaba559O0zFbRn8ipd5rt/8C2yajJL25gG/VOUlFzzfhaA/n
         zmt4gYlhxKbpVK/M2Ga0alQiXI8Vag+2E/MSEJreC566mWhC7kZ1R38mYcQR88ibsXxG
         aDv1teQLq3zJzIfmy09AI5P81wTIflFBntXelt85Et5d9ptRWEyWG1A4b3H6wQQ29iR2
         SBiK3CnwMtaHtp5lddqrGJepFFO8/4/o+fjPw6cY6mksofWq8eiR3rI90MpFjUFdTBic
         xSOSIkiiv53d7Y3cqqruwuYhA0LBHfuQjc8yNlrM0gXmIX5rQM2bkWXd3jb2C9baV3GJ
         NG0A==
X-Gm-Message-State: AOAM533ExAN8Xvlu3st2gj7Uja6fwFU/PrnVJp0tZOnut5iIXmqkPmxB
        rEicbZgnNTJf5u8i/+WG/i/6YA==
X-Google-Smtp-Source: ABdhPJzX7Qq8MseVUYhFiZ5y/Q8CYtiMgJnoYcI3cdxQ15X5vk2KJaRQOYRMPmRopxQLQi34LCtLPA==
X-Received: by 2002:a17:907:1b07:b0:6e4:b202:db8f with SMTP id mp7-20020a1709071b0700b006e4b202db8fmr12350681ejc.76.1649322914960;
        Thu, 07 Apr 2022 02:15:14 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j8-20020aa7c0c8000000b0041934547989sm9085028edp.55.2022.04.07.02.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:15:14 -0700 (PDT)
Message-ID: <84fbf3d8-7066-6c4d-0980-5ca803605a0d@linaro.org>
Date:   Thu, 7 Apr 2022 11:15:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] phy: samsung: fix missing of_node_put()
Content-Language: en-US
To:     cgel.zte@gmail.com, kishon@ti.com, vkoul@kernel.org
Cc:     alim.akhtar@samsung.com, lv.ruyi@zte.com.cn,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
References: <20220407085958.2491783-1-lv.ruyi@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407085958.2491783-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 10:59, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> of_parse_phandle returns node pointer with refcount incremented,
> use of_node_put() on it when done.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Ah, now I found, that this was already fixed:
https://lore.kernel.org/all/3eed8d0c-e009-2daa-ba66-899fe8f48a90@canonical.com/


Best regards,
Krzysztof
