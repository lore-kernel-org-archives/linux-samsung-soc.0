Return-Path: <SRS0=VGRb=DV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF980C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 15:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 880F02223F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Oct 2020 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602690355;
	bh=ZO2zzjmGglCwYqkgfRhnAhmiEaEWisPsjKCp4MzM4CE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=T8Kz4UpZti1G0+XM8/czeY8bTh21LeBUCon1rfyFnYayPmhuWOJpcteRLkDZqeOIi
	 MJlvKmys9hpt4r8y5W9HjRSYJGkURnawdKrvLKLcgvSL6fbB1q4EM1diSBq42V9TRg
	 NgK/76irR0gX+Yj+HELj75Hem8KmwtMNx421sJAI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgJNPpx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Oct 2020 11:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731629AbgJNPpw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 11:45:52 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D003C0613D3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2020 08:45:52 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id u19so5780630ion.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2020 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GVsFzR74egr+o93/X35XS2maZ1vLsmxHPBrJlJDsuhI=;
        b=X4aAHpmKSHgU3/84qpUaV903w1xkwCtvsv7XMV8dUuc9QnpjmB/jKfLFcdpqh7UmY4
         IG9lWFz+HRgkE8tRa/pOXAXobj0l94fXgiNfyoap+V7yrzg1LQqQgDVrbGZk1Qt7MpXw
         IsWNMw7UDTAPcoV7udFaMBNkFCpbRweWEvQFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GVsFzR74egr+o93/X35XS2maZ1vLsmxHPBrJlJDsuhI=;
        b=oX+ldQkyDt+KwyWXS8xS9khv7F3uDIBTut7RV9T572AcffjxjfqGjnVAJhQIv4naUj
         8AiSAAeQ7hrbacZYauwxpF80lvfO+gNmTPtwzLk9+Yhl0A0YNWwboEJ2vHFBN5DfAm9v
         f7bxvJgLiiwuSKBQx2qusLKUzUQN99TjmdRSSx66+kOr9ffY1Mzmuv99bzPW0AILzA1O
         QPWFP5Kt3QBqTbXtKCngXsAugW13nDQXRbF4rEflAdXcj+ultNw4iKXnWPcQj4tFcckL
         nGMc0wnrYCpkpmPBFZDh8Z1I+ZJPfYoQC3ftvLifJp1PyUbInmh2JlwoPjNwqVE703Wi
         Pj4w==
X-Gm-Message-State: AOAM530BPaTyJV5qUeLDlf2Z4MU4CqB7S3SFGrkN55bWIPka7wSbevjp
        Jrs5aZXGbndHiUgEuH5Sx9Yf4Q==
X-Google-Smtp-Source: ABdhPJxFL0dEO8+kC0xlhiweNLkyf1APFnjIPT9B9l6CjUgbzU9W6XQstgVJjfauCC4EZCo/jPEspg==
X-Received: by 2002:a02:a510:: with SMTP id e16mr43790jam.51.1602690351653;
        Wed, 14 Oct 2020 08:45:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t22sm3922965ili.9.2020.10.14.08.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 08:45:50 -0700 (PDT)
Subject: Re: [patch 07/12] usbip: Remove in_interrupt() check
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.828083323@linutronix.de>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <fa656cc7-a323-7013-8435-915a1f8b5866@linuxfoundation.org>
Date:   Wed, 14 Oct 2020 09:45:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014145727.828083323@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/14/20 8:52 AM, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be separated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> usbip_recv() uses in_interrupt() to conditionally print context information
> for debugging messages. The value is zero as the function is only called
> from various *_rx_loop() kthread functions. Remove it.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>   drivers/usb/usbip/usbip_common.c |    5 -----
>   1 file changed, 5 deletions(-)
> 
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -324,11 +324,6 @@ int usbip_recv(struct socket *sock, void
>   	} while (msg_data_left(&msg));
>   
>   	if (usbip_dbg_flag_xmit) {
> -		if (!in_interrupt())
> -			pr_debug("%-10s:", current->comm);
> -		else
> -			pr_debug("interrupt  :");
> -
>   		pr_debug("receiving....\n");
>   		usbip_dump_buffer(buf, size);
>   		pr_debug("received, osize %d ret %d size %zd total %d\n",
> 
> 

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

