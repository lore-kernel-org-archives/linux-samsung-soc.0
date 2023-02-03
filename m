Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4C0C636CC
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Feb 2023 08:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbjBCIW3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Feb 2023 03:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbjBCIWL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 03:22:11 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B80C95D28
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 00:20:34 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id y1so3929705wru.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Feb 2023 00:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45Tnhfu0pAuxepjnBLmTM16w/DDLwSO1jhjjoAKVus8=;
        b=OUGU+d2plzG4JQUvTzSTt/pZc/bAsHxNbwp/HWH8vk4+Gh4xG+LPYlHI9CElCcbnxB
         4JDHm9QJB31ixhJ2S/EnpQRLSQiHIawt5YAt8wKciDlOxVsmFgrVMH70GBKd4MjfvUEa
         Sauy8zaw2OPEWV/GU41j/70NzI+Tkyhc45sFA+dm/p9w6/WmfHTmmnyFnx4zHLnPcCs2
         iYMOEDqqEiIFTMYYQwHgSP9972H0KdOufjFJyEGejeWeVoaOIMOImooURU1xPI1dyZcj
         jrgnPWg80CPQJv5gw/ywY3J3zM+nN5lT91wuINZmtsNCA+f7DZoDqineBN9NTx3yKkw+
         f/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45Tnhfu0pAuxepjnBLmTM16w/DDLwSO1jhjjoAKVus8=;
        b=76/1m9YSMPcTBNpel9ZXuoia8vt4Ky5H+cEdnh1IrEwkv+u2VRag08SIgjkS54/8b8
         Qp2SPsEFyMwRvO7jVBuWAOWlAmUsIt2se7KD4ejvKMT0fllit8PtT3LSnZv0sVx9gXET
         Y4fhksQ1g5Di1M+TesIiqjiYcTFkLHPyOTu7lcPqk16swsrnaLr4yysY0RM2BsP0q4Lv
         9uTZrMIwMAo4tismSszwOyUMtI6I2Oq+/9FFMc0HBPoaKSQfndnWznLH9bW8MeTLxS+n
         nTbaARceDYOzlkK8YuLn/htI1kJqdZAk7oYb299cGUW/VRRoMxvxxajFgYahF3J4kLAJ
         weQQ==
X-Gm-Message-State: AO0yUKWuBPbr53Z6U8y5jSrZGX9/WMfgxagr/xyo+kUyUPwuSmLI06Ld
        uIEgJOyDIWemmVfOTACDAwiy9k/ixp5iXSfi
X-Google-Smtp-Source: AK7set+EHfIJ8oVMvuan/LXh1dEkhymKWZxpfR3L3yw2Z1sdfrUNYRGI4me9tY8RpOo4+CdlFbpKHA==
X-Received: by 2002:a05:6000:1889:b0:2bf:c5e4:1af4 with SMTP id a9-20020a056000188900b002bfc5e41af4mr10438931wri.15.1675412412036;
        Fri, 03 Feb 2023 00:20:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c12-20020a5d4ccc000000b002bddac15b3dsm1378894wrt.33.2023.02.03.00.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:20:11 -0800 (PST)
Message-ID: <241f919c-8190-00d6-f89b-6f7f54b29df9@linaro.org>
Date:   Fri, 3 Feb 2023 09:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 13/13] USB: gadget: s3c2410_udc: fix memory leak with
 using debugfs_lookup()
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>
References: <20230202153235.2412790-1-gregkh@linuxfoundation.org>
 <20230202153235.2412790-13-gregkh@linuxfoundation.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202153235.2412790-13-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/02/2023 16:32, Greg Kroah-Hartman wrote:
> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  To make things simpler, just
> call debugfs_lookup_and_remove() instead which handles all of the logic
> at once.
> 

Hi Greg,

This driver will be removed in v6.3 via Arnd's tree:
https://lore.kernel.org/all/20221021203329.4143397-13-arnd@kernel.org/

I think we can skip any work on this.

Best regards,
Krzysztof

