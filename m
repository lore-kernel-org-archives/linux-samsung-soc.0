Return-Path: <SRS0=3c0k=7Y=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532FEC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 06:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A8C520812
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 11 Jun 2020 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591857962;
	bh=XJJAMZPpmz2/X2eb0z7AHeR+GKW/GBnvj9PVb3ACpGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dhH+xE5qHSKNjDK49AjbiaIkGZsbCd4wGWHc5gzMLFcJ0FGeQaRyk1XrPqEOTLniI
	 UGryKKItBL9Fy1yg4M5nLPB0Olyy0OZ3t/fwPvwHzisAdoTnd4XFWiWDZ181R6Lw1H
	 NIXwLzrnNtP3NUNWCcn0Xi7edQmazOPsP2lUdaCc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgFKGqB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 11 Jun 2020 02:46:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33753 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgFKGqB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 02:46:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so4914148wru.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2020 23:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C/BCrk2EzI+8ty7eYcRTzVNsNenj3k5ORek3qLNkVLQ=;
        b=HMjRf73LfIudLQS/AVKZk2bh7xbp8zxwbAFoBFQfshLUIvjcl3cDWjIsKZdBdVARfA
         1fCH0zuVB6QOWxYVBT/2YJV6ghrTIIwj1qxcc7fo8b3zkUf2V2R4+Hn8xoYjTB2ocXNy
         ipb8jYfIeWk93PckJL5Mx/USyImZVIXzJz/BZTD5zByxdyBczhjCK+axJlR+ysFo9uCc
         qYdi+jcw/YLDI6ypycky+lsMeLtjm0ASyETu7xAsXB3yAOm7KhyIpvkAzQqhQTP7bjzX
         7DpOmuu9ygun5dnDw/nImGM+PlldFnAU1MCNgi8k48kMNAjSWGQepKOaEeAvsqcEZ0xN
         K85Q==
X-Gm-Message-State: AOAM532Q5sMvkwrwfaFgAPxWzhgm3vE5uny0Uy3jqFu6XKhHSXtZ84xP
        T8aUZHWs9B4Gk5BKut+SeCY=
X-Google-Smtp-Source: ABdhPJxPgE5J4d6qFlepPG3IObYFCwiLPt07KCNF8vTruWvTMSIrcSnMaXCV3obPhdyGJhqvGWJqyw==
X-Received: by 2002:adf:f889:: with SMTP id u9mr8392324wrp.394.1591857958995;
        Wed, 10 Jun 2020 23:45:58 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id f11sm3371824wrj.2.2020.06.10.23.45.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 23:45:58 -0700 (PDT)
Date:   Thu, 11 Jun 2020 08:45:56 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: ARM: warning: relocation out of range on Exynos XU4 and U3+
Message-ID: <20200611064556.GA5056@kozik-lap>
References: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jun 11, 2020 at 11:13:57AM +0530, Anand Moon wrote:
> Hi All,
> 
> I would like to report some warnings I observed on pre-compiled kernel
> image (5.7.1-1-ARCH) from Archlinux.
> Sometimes ethernet would not come up and get connected, so in order to
> investigate.
> I found below warnings, So I am sharing the logs at my end.
> 
> Are these warnings related to in-consistency in locking, How can we
> Investigate more to fix this issue.

These rather look like some address space randomization or some compiler
(LLVM?) feature. Not Exynos-specific anyway.

You should report it to Arch folks because they know how they compiled
the kernel and what config they used (althogh config you can find in
/proc/config.gz).

Best regards,
Krzysztof

