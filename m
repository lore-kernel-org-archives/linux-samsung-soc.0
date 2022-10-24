Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BFFA373F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 15:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiJXPex (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiJXPeZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 11:34:25 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE261BB575
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:21:39 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id f22so5673780qto.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6/Gkom4ZPWK7cMyC9zfoGrRQqMQlvaVxP5vBufeZGo=;
        b=mejxcpn1uI9RNrXj4eSCcG9DdTDntnxcnQ0p/X47na73KIw0QDk7VkvlILO4BSrYgp
         mkn7tFJD3SrWeBS8Di3gq9DA5FUvvsC50J/9oz4yxFiJJiejBjUzWJPi/ZKN3zvis58+
         hpSzdLcfitVxKOxLluaifzo8FoP0wUqqmZFtYg2hwCo2zafUy6EroWzcDjm3+xcDisq2
         N1CWbTgDk4vur3LIsKxe2Lco4CeujIspSWYT+2zDs8dCzln+2w8TC5Z2C3l8ky4Wqy6A
         gPjmAgKo3UBTk4REpOhQz3rp0lGnB8xu5+Q55qMdpYKPuP662wbj8Nkzqpu8TtC8RKxI
         SAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6/Gkom4ZPWK7cMyC9zfoGrRQqMQlvaVxP5vBufeZGo=;
        b=TqQHuT3pw1DdOndczIk9F/0pe8RCyBXIWS0ZHmvKanovy95wpgq0OslyglhZp8KzZq
         an6PmyX41Ii+nxD8JXUKZiKZ5BmEYckxDDhu3JKjlyUPy054+TaIe2uzpUXc5u1ZJMwE
         6lZavwuzON6yiweCaOa1EwDHX1pP5RrJOh3CpOUHSNA/OEfj79vvVeGchdL8UcA41oLw
         xVX/4bdOEhGRluFZBMXT1MIYdZfU01jGGh9ajW1jnH0L9Z2x2CdxvzowhPczr4FPkbRs
         SQgG0zRR+O4cTwYXVbRvteGegeB7bCe6cjrY8LaUuC5qrF5nJwQq+woleNxZ/6IXo4uc
         j1Qw==
X-Gm-Message-State: ACrzQf0Zd2+HQppoRuDLRe71PLTUy0wwqsJ5PAnoSUd0UrZcsPW+BMro
        c7x56Hge73V+65mNfbtmE/aBwHZQRC8MYQ==
X-Google-Smtp-Source: AMsMyM7QY9u7Z1kYexxENhtYjDsCBL6DV4I13tRCpUzNLXQT4rVNiSMxlYrOH2XNj9HBkERybeb7Og==
X-Received: by 2002:a05:622a:134e:b0:39c:f1c2:60db with SMTP id w14-20020a05622a134e00b0039cf1c260dbmr27492997qtk.188.1666614612300;
        Mon, 24 Oct 2022 05:30:12 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a074800b006cea2984c9bsm14548147qki.100.2022.10.24.05.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:30:11 -0700 (PDT)
Message-ID: <bb7840e1-6748-3d51-c491-6d6c0257e055@linaro.org>
Date:   Mon, 24 Oct 2022 08:30:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 06/21] ARM: s3c: remove s3c6400 support
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-6-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> No board file and no dts file references the s3c6400 now, it's only
> s3c6410, so remove the final bits as well.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

