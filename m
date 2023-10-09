Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AC7E95A8D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Oct 2023 06:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345128AbjJIGDC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Oct 2023 02:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345146AbjJIGDB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 02:03:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4F4A6
        for <linux-samsung-soc@vger.kernel.org>; Sun,  8 Oct 2023 23:02:57 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3231dff4343so2394159f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Oct 2023 23:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831376; x=1697436176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4N3ATREkXvK843TZ23OVVz5eoxmZn5m1pt06q8AVw8o=;
        b=r3bderavc+mbDo4NIckVzyPhccG8/iq6EfSdIZkLpgiaRDtiy27XASc9vOzLEf6E6I
         3dqRT0Y5MGFgjS+g6tXgvCQ3dHgzFHgNwoh+l5yFAPOkDo8iWYqQvKYh6dTYwHgWI/Ef
         gEsoBY8W4LZElxGVTlTj6m1+xrcvR99lf7p74SsjkGVX81XUuiCROppoVb90UDggBSRP
         OAynwYDyuLfW6lR/KRuLfDGGsKOintrFcpg9Ld0zurNLoDzwOos0mKyiBWeGpFgaVrfO
         c2QyiXd9GIb4sKzPmMxUFcFHmyL/zJHocW0Mmu9I3IgeDEn2oXdfZRYheEYi5MktCQu0
         h7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831376; x=1697436176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4N3ATREkXvK843TZ23OVVz5eoxmZn5m1pt06q8AVw8o=;
        b=q/UqEipalMfOxtSE019HpM3Vmqkb7CjWbDT5lM8JYaxFhPJJO7ae5E/3tHMUW2B//8
         sBbxtIAtP/Iox/QZ9fjFIeC70CoqrCR4KRlpWu9aKSEZ+yFdGxBa5QhqlTnkRGjN2xY6
         lG3dcUHtrl0YjMYPMy95UuySk8JD8cL6SSJCctbfL7WishZozpzAbJedwtjm84OyC3Pa
         WENgKCE5n5i04WgocA2dBgUPl0W7MvKinlGDjXtdqJBoWyj1KwjeKNohINATIncXuOJE
         XfK/YFB2gYiPfAuCzG8pjB9yrW1Cyfynu/LDc/gRnaacyfMrP/xTM4oLaT3KrXnrwNLR
         4d3w==
X-Gm-Message-State: AOJu0Ywa/UQ6bsSbFwnzRqmJwiDtqak3blTTAD/CxbFTmi8h391HvMbl
        i6gWWANx7+RldTcpXJwt/WpXfQ==
X-Google-Smtp-Source: AGHT+IGdfiblx37cmyiMJPmbu5ee0oKAHqGuGtxnKYAOTurlL996uBf+3Sda8V3WezqZmlwMERGp1A==
X-Received: by 2002:adf:fece:0:b0:329:2306:91a7 with SMTP id q14-20020adffece000000b00329230691a7mr9184153wrs.2.1696831376119;
        Sun, 08 Oct 2023 23:02:56 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm8518043wrw.108.2023.10.08.23.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:02:55 -0700 (PDT)
Message-ID: <3fe1db30-038c-4ff5-8344-5b824503bd7d@linaro.org>
Date:   Mon, 9 Oct 2023 07:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: samsung: usi: remove superfluous parameter
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.griffin@linaro.org
References: <20231006090014.277448-1-tudor.ambarus@linaro.org>
 <CAPLW+4==D1OVB+rY92NVEmfv08=0FBF0LJ07xoHh4YZZPOneXQ@mail.gmail.com>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4==D1OVB+rY92NVEmfv08=0FBF0LJ07xoHh4YZZPOneXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 10/7/23 00:08, Sam Protsenko wrote:
> On Fri, Oct 6, 2023 at 4:00 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> exynos_usi_set_sw_conf() has a single caller, exynos_usi_configure,
>> which called it with exynos_usi_set_sw_conf(usi, usi->mode). Since the
>> mode is already defined in struct exynos_usi, remove the superfluous
>> pass of the mode parameter. While in exynos_usi_set_sw_conf(), remove the
>> reinitialization of usi->mode with its same value.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
> 
> This driver was designed with the easiness of its further possible
> extension in mind. For example, passing the "mode" into
> exynos_usi_set_sw_conf() allows one to implement some sysfs nodes for
> switching USI configuration manually, just by passing the user's mode
> into exynos_usi_set_sw_conf(). Other things which might also appear as
> over-engineered, make it easy to add USI_V1 implementation, as we
> discussed that possibility at the time. So yeah, it was done for a
> reason, and I'd prefer to leave it as is.
> 

Fine by me, thanks for the explanation.
Cheers,
ta
