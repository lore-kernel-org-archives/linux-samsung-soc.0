Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7A5C6FA86
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Sep 2022 09:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbiINJ4x (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Sep 2022 05:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiINJ4w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 05:56:52 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAAFC11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 02:56:51 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id r66-20020a1c4445000000b003b494ffc00bso2617472wma.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2022 02:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5FtBgeK2f0cwrAqROX1aiw+bsyTANUvt9FFxN9wNUrM=;
        b=XHFsSyyKZrA+ZJ2khkgtth5htTTD6NBx7KeB50DRgrZtb3PifpKrdGJLCYH/wGzvsd
         t//ol14nk4Pn6hjKfVhFt+0+S/HG7vHILvXQJMjCjxYAoVqKWWtSKzgABWoLu27E4QY4
         myfA1U20rVzmJ9peejcoVd35sdjV7My7Liz7cft/YA8RPgP7ooeOATdbyTkj/xNEr1V3
         v7YmzmrfnAI36QpXwnU2R8MbhmQ93X8p2BbBIGaeOsp6T+fttU+s4ureKA8Pm7f8sXpk
         dlbVEKMt2CqfNg5zLV/IJ5WbsFpgmZuxWSR3Ox1n8MLkbDpu4gr4suOSLjTcEVG4dR9u
         xAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5FtBgeK2f0cwrAqROX1aiw+bsyTANUvt9FFxN9wNUrM=;
        b=Zew1kpjW7hn0sIf7TGohzpx+2ANkN19zKpPCEQr6qiYbGggXNAKxYBQZ29cbtBqTZq
         QYKZNH4pIRRsclU+PR7A9tw5ktsuroDSGB8rvX8uIxaSgJ467fruwcGYbzCrRAhQkPZ1
         1FJtqnS4n58IEBFX5bsBV1pzDzseKxp1T9G5okatRxVNoYe/fuOmX8bU9xWgtt4S8ClS
         NAjkQUq/SDdbAxFZqJbarC18l7RsnMIofm3UZdWdY+utx+rmHjG49w5nabjSc5pQlws6
         4EbXVDFy8f0ueG/bmhg5nv52JzHAhHSc7Oogz8vohIPj2lemHFQi8lfYroirk5az3Lsy
         02cg==
X-Gm-Message-State: ACgBeo1Z22aFhJqutCtCvocAwALzjOrGps5Qbzod1vIdr1rR0yINgK2P
        WDL7WYxegW1aYyARUBAiA4nGWg==
X-Google-Smtp-Source: AA6agR7fzRki6XCTDf3LuWBEgQLBcp8/fw7HjZQ0M4BwpFA2amtSUrHYvGEFDFqrFRZWlMr/gJZrJg==
X-Received: by 2002:a1c:2c6:0:b0:3b3:efc2:1bb1 with SMTP id 189-20020a1c02c6000000b003b3efc21bb1mr2482160wmc.38.1663149409653;
        Wed, 14 Sep 2022 02:56:49 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d60ce000000b0022862fd933asm12808432wrt.96.2022.09.14.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 02:56:49 -0700 (PDT)
Message-ID: <f1a5fa86-2a4d-85be-5641-9d51f2d35af5@linaro.org>
Date:   Wed, 14 Sep 2022 11:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ARM: s3c: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>, alim.akhtar@samsung.com,
        linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220914084127.33781-1-yuanjilin@cdjrlc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220914084127.33781-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2022 10:41, Jilin Yuan wrote:
> Delete the redundant word 'would'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

https://lore.kernel.org/all/fa6a55a9-1c27-e9a8-739e-fd7ec34e3b76@canonical.com/

Same reply.


Best regards,
Krzysztof
