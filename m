Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B11C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 08:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236951AbiDGIST (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 04:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239163AbiDGISQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 04:18:16 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298151FF23F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 01:16:17 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id q26so5462108edc.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xUYWxyJEg6leDM0Xoa+hYl6e09Zj0klrd/06rKmbpmY=;
        b=VDt+MTz290lEtYWH2rYjozi9VS/wDkTwYnmZ1LHSDAEKP9qIm5ptabMoOVy2BND0Jd
         0L/LUQaem3vZwxfUuvDjdbtMswNl1eX0QWzsSivBnM1zpfkIFZ4hXbyDzByJBJkrf2yo
         llVHCnqcLTsm62tnuOi5v/6b71TBZCDJNbHwM/PM0+G57hSSWjRQi+4dEon9BUSW8EIA
         hozevSwzAYq/hABD6Yre/N7t1Spx9rVku5XMnFRlg8vFRtQ5gD5N0lyqR4Vr1D/G7s7d
         WDjA5Dm7s8ar9mDYFoj7tTOBGU+uGdcq4XJBDLpdni7lwiaorQQeU5BNNHm43b2JjE+I
         qywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xUYWxyJEg6leDM0Xoa+hYl6e09Zj0klrd/06rKmbpmY=;
        b=2YDbhnD2PahAVBMHGIXhjRFbhblUp9h3Rbt1ZCWtU2EBoXEsFMKXZZC79SfYkpCQLN
         su6pAHAwJFmJAKV8zWVBy9iotjNlDNtIHqXvXvITV10q7ViPCi57b1MEog6Lh/44rgUL
         HPhhBZgVet1dC+JS50jW74/TgCZf6cL0iZINZeZ8tOiiZUXh80YwKLMvkxdYAA00PA/2
         GJ3Ma5SM6sCOxH1AcPUm4LjZsxEi+5GyA83eFiyZ5bbEWyUKCvh2Jbx85GoFCYASr2V5
         arDeTCw2Wi2rvf7SMb5CqtSHgQjYKarAlRO0qXU1rPafpggwqSVYPZUSxVMbtha+g0MR
         ZzLQ==
X-Gm-Message-State: AOAM533uh2kdTMW3exu9Zl6OwNlRo8EZd3C61kJnvowucvpQpBgZeLM+
        fV/8xh1QQf8snem74J6M+fTxYQ==
X-Google-Smtp-Source: ABdhPJy/ERLqCYKh9BpiL5bF6j78reR9LcaBuPraPoj6GLaivpbUlPeSk3kUE3ntnN95zAfa0g/A9w==
X-Received: by 2002:aa7:cc96:0:b0:410:b9ac:241 with SMTP id p22-20020aa7cc96000000b00410b9ac0241mr13117970edt.246.1649319375803;
        Thu, 07 Apr 2022 01:16:15 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a056402090a00b004196250baeasm8923523edz.95.2022.04.07.01.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:16:15 -0700 (PDT)
Message-ID: <c46aa011-1292-0dfb-2f10-a4d9f9a4fdaa@linaro.org>
Date:   Thu, 7 Apr 2022 10:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [GIT PULL] ARM: samsung: Fixes for v5.18 (current cycle)
Content-Language: en-US
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 10:05, Krzysztof Kozlowski wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Hi,
> 
> For the v5.18, please.

Argh, I need to update my email in my scripts as well. The tag is done
with correct identity.


Best regards,
Krzysztof
