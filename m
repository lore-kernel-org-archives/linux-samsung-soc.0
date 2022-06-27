Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1363AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 11:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbiF0LbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Jun 2022 07:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbiF0L3x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 07:29:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D81B6B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 04:28:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id o9so12497317edt.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/t4Xm9+FraTLR9hcokAjM0p4uyhSwWz6XTXdVOTOTeY=;
        b=WUUYOCKjF+CjYBCEU4xB+C5tmTt+OHg4/wP/B/fZoq3zxojZDcIeuXNTvkiMQhnHKU
         dpILD6bfuPO8nP5jHMNa85TRrbel8gvofp84ykB7HeKrfaUtxhuLO9Nx07KH0clQS7zS
         unTdptdd9dggBYIEXkZ7h8ZLaSdUjqwJuC8RCD8v1eCPTBbHuf2VwwIQWDFHU4uYRJjd
         IehkaWUypEkpJA83HCOBSeOQ2FtrW24DYQGEjYxT+vzby5dD1F77ebUi9TXeBhr5bbXu
         /6HRsGtYKWf/8yMXaT+oxHj9+VvZ7JCAWg7afM3mo6Y3kd4Ubs2vhaDShZ8sFQpPdtE2
         QyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/t4Xm9+FraTLR9hcokAjM0p4uyhSwWz6XTXdVOTOTeY=;
        b=uyrGAoj2ORTNN2SSeZiaE2s6z7nxxvzL5gUpdZP9IUCYwlpA+FSguvXPGbDWBJNeiq
         tnJhNMU89CTgW1eTEHNDwsVcbLwNyT1nBZmdqu07pNRsH+HLwNEkRnCitQiDLqukNsQT
         e//0OikGgcJki6uGGZEl7+w7AG9bBTGBfENg0GeHYG6OyJ88PGsWEVLjPFX0+cPRr7DH
         TNtvPzldvtLgUNnzNm0Z3Lhwd9UdddztKPwDiJhyBHQDRczrGsRZ6kdqYoR4M3E/dL5S
         D1n2T2PbwF7W0zs+Cz5p0AbljdWovB0TEUHfQNb0CUkoV0xilzTR6qL1+464lYPac5Uo
         vVkQ==
X-Gm-Message-State: AJIora+dJ+ABYHs9+0eNG0zxQ6C/TxxZz1EqQAg2hRfca1rIK4rjqHyr
        hcR23czowajsX88twlIaBHpwMQ==
X-Google-Smtp-Source: AGRyM1uv1ehNApugy+NOUezcRtQPCQpoYtTHCveVV3gt2ujW+I/EL0vOXUCpwTrCWLgqHy9wWv2AmQ==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr15834606edx.128.1656329313730;
        Mon, 27 Jun 2022 04:28:33 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lo17-20020a170906fa1100b0072696b3a327sm2162188ejb.187.2022.06.27.04.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 04:28:33 -0700 (PDT)
Message-ID: <07afc435-90fc-34f7-8357-e212c81867b0@linaro.org>
Date:   Mon, 27 Jun 2022 13:28:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] tty: serial: samsung_tty: loopback mode support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Hector Martin <marcan@marcan.st>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20220627032556epcas2p26c2cd2786888a5018607bf651bc5dec0@epcas2p2.samsung.com>
 <20220627032353.8868-1-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627032353.8868-1-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/06/2022 05:23, Chanho Park wrote:
> Internal loopback mode can be supported by setting
> S3C2443_UCON_LOOPBACK bit. The mode & bit can be supported since
> s3c2410 and later SoCs. We can test it by linux-serial-test program[1]
> with -k option. It will set TIOCM_LOOP mode during test.
> 
> -k, --loopback     Use internal hardware loop back
> 
> [1]: https://github.com/cbrake/linux-serial-test
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/tty/serial/samsung_tty.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
