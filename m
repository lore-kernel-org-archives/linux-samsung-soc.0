Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9745BC001DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 13:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbjGaNJh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 09:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbjGaNJU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 09:09:20 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF62B10F5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 06:09:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bf91956cdso326746466b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 06:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690808958; x=1691413758;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfMuxXi5TvQls5fruvhXx6XFvK+TXODXow4SAYLJGyY=;
        b=YIIFAwIAU89YqdlY5xoXlgtiPTk8CtcKCOl4cnjSq1qVkKNLBjqIdW4ydAnhqTaBFo
         F4t/Te49WdORIENXOMZDtoqNyM+ulsFDkW5btWkCkwwDmUy2GpbJ3t/GgFJWhgUWJ5jH
         1dcPhVgYazqOxASD8ReqJZFR1PEs92yWspK8t0lPzO0oTIEh6vda7zCj20MePrkQFmoH
         MqORnsj1aKLecUIYMcNgNcNuR0fLKvupdtWed0U2gysGAAH53xsgKlZlVgPH64vMhMru
         rqAfSSKFg+51TV9MJC5B6X+M8mA6dSBqTd6oTTTzwFyRlRv0GaJFAg9bfTVUM+riOaFS
         vm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808958; x=1691413758;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfMuxXi5TvQls5fruvhXx6XFvK+TXODXow4SAYLJGyY=;
        b=E305ZtR2Hi1/cn5Ci6wJtL73qsqUMxAS0O3jpXFlsNsZ1xHAVJZbeYh6Dl34Zy3DbN
         UxlN1mfe/6q7wOoYrt4xzDFjtneyKWqiQPl07jCBpvGYPrTF6a7by0VzhG466Rf3NCvq
         U+pbfAXsYxBe9xgno2PmxhN3lIBreG/8WvmHcvanldZmHJLVkvF9zT6Oa3YdF6HvaVFr
         OntXx7EGzbF9ZTompE5JE2A2jAPD+azN7aX40qZRaoZ68ODLVvgffjYB9UgUdFVZ2wGS
         1H8bZ0O21FnYGWqg21kxVNY+WThNKLOjqwc+nxG+ZV+FW8GBsSa9ERPAvUzpjXMerW0h
         csSw==
X-Gm-Message-State: ABy/qLbYTbtPAFHjFpOstai+8pDp+r5+NblQvc0Bn6Zyav9xw/bvRTLV
        6x2X3Kk6guuFQP1obAvdq/NhuA==
X-Google-Smtp-Source: APBJJlFVb9Kpp3kpY6QmBy9WgGIv7M6Ad8CkhSl3Nur0WbmyqeK07KblydLr57EhN5CFADUyfv+srg==
X-Received: by 2002:a17:906:2c6:b0:99b:499c:ddb6 with SMTP id 6-20020a17090602c600b0099b499cddb6mr6630736ejk.68.1690808958179;
        Mon, 31 Jul 2023 06:09:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id x23-20020a1709065ad700b009893b06e9e3sm6211722ejs.225.2023.07.31.06.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:09:17 -0700 (PDT)
Message-ID: <467bcd2c-19c6-f7c3-44e7-d0c4f8d460f4@linaro.org>
Date:   Mon, 31 Jul 2023 15:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH -next] drm/exynos: remove redundant of_match_ptr
Content-Language: en-US
To:     Zhu Wang <wangzhu9@huawei.com>, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        airlied@gmail.com, daniel@ffwll.ch, alim.akhtar@samsung.com,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        arnd@arndb.de
References: <20230731123336.55152-1-wangzhu9@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731123336.55152-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/07/2023 14:33, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.
> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

