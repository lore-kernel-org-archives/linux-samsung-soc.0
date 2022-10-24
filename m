Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D29ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 15:17:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiJXPRU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiJXPQy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 11:16:54 -0400
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6E078BE9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:56:11 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id p16so7743674iod.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6s8WA+syYl/1soPYugl8PgRcJUKvL8znur65OKyCTY8=;
        b=O4MW5Mz8AyKyDlwQp6prA3grYcTgM+7SDh5ALqtcwq8HOqoXmYnE73w5dRu/Jcqwod
         lK8ED3cOblYtl+6O6Vnj2bd+HIKLhr5SJRZB5w/lliAoR7H/b0lI76cNRWfU8GjNwJ9F
         2jPmL6UWjTjcoHKwSfTQN01OzFd6BL19NZnUlN7a10a8v3n8e+gjgHZqDUUQObYNtKYi
         xV7cxTbLIZYYxIYD3XViMzFKJa9UvhbEiu6MKFcyeYrBoEv8kz2vpZ1NEuvTGstPrV6M
         eSU7fgy0hEmbSa1ho6YiSlY8U5EJNxOeLNms9485OnDOgHcv69wz02CBVp4qC0MFs7r+
         yh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s8WA+syYl/1soPYugl8PgRcJUKvL8znur65OKyCTY8=;
        b=peVrRqudHHGZc6ewDyN3Nsc+K2l3xBDdajmPWpjbmHuEOTjVNNa2afPoRsv9jys9Ub
         7gZEgjZmste6YFTKED0cMzjB7EKI59Oi1JwDXVSpu5YdDKYfMLaNfGG4iYx1ueuF4OG+
         6KHhbQSAhJmsQCpslwPqzK0bmVx8qX3FwyBmqSEK0AiIOydIjzJ+U3iceu9YHZcH7LGn
         b18QUyyFJAUeAT2P3TjDPzJpk0eHjqG42wTfKU9vlORnFI2aFgj1MY52JvJ2hEGZ73tI
         stqSx1f5ApgsKcfRw78sg6K39FzCsnUXwSOceIKgFW0CQhPe5c2E5x/GF2b1yVXOnhmA
         gAaw==
X-Gm-Message-State: ACrzQf3Jvf2JVeA0Iyq4+KLTbBDaXAE8K0Iled03EzxJZLuF5pxLa1e+
        CZtZ38GxaEXf6R3q2WbCtyEDjpwWu+bRXA==
X-Google-Smtp-Source: AMsMyM78IBElxH8BgFkoT519PImmXgVVPmXKo+cy//tqAhGj3gFdCsN0VRVhe+sZ5YMuqfvc7mXViw==
X-Received: by 2002:ae9:e8ce:0:b0:6ed:22ee:305e with SMTP id a197-20020ae9e8ce000000b006ed22ee305emr22099101qkg.255.1666614959885;
        Mon, 24 Oct 2022 05:35:59 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id cd15-20020a05622a418f00b0035bafecff78sm12693087qtb.74.2022.10.24.05.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:35:59 -0700 (PDT)
Message-ID: <a896c106-d261-c763-7410-0f2acefebd41@linaro.org>
Date:   Mon, 24 Oct 2022 08:35:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 10/21] mmc: remove s3cmci driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-mmc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-10-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-10-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform is gone, so this driver can be removed as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

