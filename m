Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24FFC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C966F6108C
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhHIKJt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:09:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233565AbhHIKJt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 06:09:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B7906105A;
        Mon,  9 Aug 2021 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628503768;
        bh=J2hgy7rffX4798inBReCwp7jM4tx7ZvQ+GBmSpYvg00=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=g559DSd3DEpiOrFxVR96qasiZUlInlmcQYsXZW6ry305yP9TSUQILYdWmtXm2zT3N
         ozUb+m1i52iaOeAsDuaBmUCphKRCEnkfJgBmdXwz3trK1Mk2R2wSOBjAhich7Ryebh
         GRfTyXSNj41XDPH8ZqVVHWMOabmGu//N2gnjrkjRAeFUue26SMFBlz5PGJrXs6YEPz
         IovLGxLHyD2sROWJp5rpk8IT4YbvJ9V0miD/WkYeWb03X++KTrK5iXVES2PUCYY1Cz
         p0baA+iS9ezVNdHda11j0h6FAd5HbOrGs0TisLldPB1bbaIsxMCaFWaI5osYPhSark
         JNiHvnGJXWdbw==
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <f704a632-a970-fe8d-35e7-f4d032c670c7@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/9] usb: gadget: udc: s3c2410: add IRQ check
Date:   Mon, 09 Aug 2021 13:09:07 +0300
In-reply-to: <f704a632-a970-fe8d-35e7-f4d032c670c7@omp.ru>
Message-ID: <87wnovj5ey.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling devm_request_irq() with the invalid IRQ #s.
>
> Fixes: 8b2e76687b39 ("USB: AT91 UDC updates, mostly power management")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
