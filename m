Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFC7C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Aug 2021 05:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4CF361038
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Aug 2021 05:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbhHLFkw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Aug 2021 01:40:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234370AbhHLFkw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 01:40:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BE060F00;
        Thu, 12 Aug 2021 05:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628746827;
        bh=iIwawa64i19hlsx+tcPXQ0NVbCFtWVL2NbOR6eRLdJ4=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=Pl89Cu2kNBaJWnO8YSVpeACRwcJh//5YxIwCjujWaoa8SUCp8m2ovXjR/MmNkPxTC
         Ld9tWxP72KBdOf5mnTgLl55PLi/cUEUmm2YxRBF0SqUd3iGjeIRtBW9lL1+Cpgz+ux
         wskG882W7clweYrMiJnY06ss/KxXHpGtLVqtFzAw2pqd+S6s0egiZHDFOqMaRcS67T
         S/VvWYIlEk7TOrY8QXMIti6GKZiyRvrJgA5dbnr8aCP8r+8UGrg7hzvUV4Uutdw2wH
         IPv1appJ9HFz0NV+AZUEzB8V4jSQ9M+uyEW0TK4h1V8duuEDJlqbW+z+J3v+JS87Vl
         sln10lZ3bOD2Q==
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/9] usb: gadget: udc: s3c2410: add IRQ check
Date:   Thu, 12 Aug 2021 08:40:03 +0300
In-reply-to: <bd69b22c-b484-5a1f-c798-78d4b78405f2@omp.ru>
Message-ID: <87sfzfz0dz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
>
> Fixes: 188db4435ac6 ("usb: gadget: s3c: use platform resources")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
