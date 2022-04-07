Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA06C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242489AbiDGIAV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 04:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242495AbiDGIAT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 04:00:19 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800D210819B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 00:58:19 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l7so3702150ejn.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 00:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fC6I6LDKsU1dL3jt1bsaP5phqIETRSXO+VpMuWduiYY=;
        b=NAZwd9Y1aI51SSrlItLOHf6v0nHWXaJbmoEqV+YhgRAyLkkoxOa5cltHyIpiWq+udo
         Q7pm4lK8hOLsOzBI6fZ0h3sFvUw9+YHii8xE/FsSNofSfHQ0dhfETHfTTpNZrIBuHNm0
         yb4bXva/J1xsiIbj0hXVpqs3MtfaN7MMDHTWFU+eXCSvteTggFOx9vHS5qOr5XWeaBVe
         Xjvlp205sGeqb7kZvudhePFw89bLO1AguIPSd1gmuTNIx3oo1TWn7WQK+f7fe536o33s
         HdCOo1Nz8dyW9L/ITGsOQANC/UxkLUA78xsEx/0lgLvFej2PU3pKfrd32YCqcTuLuWTw
         rxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fC6I6LDKsU1dL3jt1bsaP5phqIETRSXO+VpMuWduiYY=;
        b=yjhU25+5SIbDca4XLDzJcQ2ukfnah4H6Nan1lgzQEIyVZzz9SwIIopHcDH2oiRCJSQ
         sGgMdVPm1cxxzZDaVmbXRc0XKugLKb9+NaRZHVUzAPpcFqt+9WeUn6qKP2y01pDRIRLC
         NEEhaq7FSAniJqxktQ31FBlPInjtcCyCxWaF1/27m7c+avDuhVlmzd9Z76mywGDrD8Fb
         l1xMNt+d09T7BtHgrDv6dtKs0rGE1egz/xIsKI2ZAT9KdHisxhV30hy0y4F6YPMBcBhd
         bzntrA8ZgceaML7H/slaTUibci1QqF2Dy/DcAaX/rtLW30l7zGsFbnbzqjvUwXVGrbsR
         oIrA==
X-Gm-Message-State: AOAM531nZqDLLU3ulSFH0Orc4FrXwlbjxWCAu15UGWJ9nQDveB6nI+9f
        Iy+anhnPdNlGRQaoLe7ptPWSwQ==
X-Google-Smtp-Source: ABdhPJwwBAjsNMwOIy95cYsA0aUV86ZNq+qMhjorORQ1aYLZQYgUC+I4uFf/XjF04nHEADZmXCtm2g==
X-Received: by 2002:a17:907:7f04:b0:6e1:39b8:d1a5 with SMTP id qf4-20020a1709077f0400b006e139b8d1a5mr12393193ejc.83.1649318298136;
        Thu, 07 Apr 2022 00:58:18 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906604a00b006e07c76f3d7sm7390612ejj.210.2022.04.07.00.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:58:17 -0700 (PDT)
Message-ID: <6dcddc8a-7ca2-b424-fc8f-7000be3f9116@linaro.org>
Date:   Thu, 7 Apr 2022 09:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/1] tty: serial: samsung: add spin_lock for interrupt
 and console_write
Content-Language: en-US
To:     Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
References: <20220407071619.102249-1-jaewon02.kim@samsung.com>
 <CGME20220407071223epcas2p16bb11821a0894a3375e84d17c4ff0844@epcas2p1.samsung.com>
 <20220407071619.102249-2-jaewon02.kim@samsung.com>
 <b53be23f-7935-dae3-9dc8-f850493a5fa9@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b53be23f-7935-dae3-9dc8-f850493a5fa9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 09:46, Jiri Slaby wrote:
> On 07. 04. 22, 9:16, Jaewon Kim wrote:
>> The console_write and IRQ handler can run concurrently.
>> Problems may occurs console_write is continuously executed while
>> the IRQ handler is running.
> 
>  From the patch POV:
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> 
> But given this is a v3 with no version changelog below "---", you've 
> just kicked the Greg's bot to wake up :P.
> 

There was a cover letter with such changelog:
https://lore.kernel.org/all/20220407071619.102249-1-jaewon02.kim@samsung.com/

It's indeed easy to miss...

Best regards,
Krzysztof
