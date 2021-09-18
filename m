Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603DEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 18 Sep 2021 07:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34F8F603E5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 18 Sep 2021 07:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbhIRHEI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 18 Sep 2021 03:04:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234498AbhIRHEI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 18 Sep 2021 03:04:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2251760ED7;
        Sat, 18 Sep 2021 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631948565;
        bh=HEyQH5vIcXhvuCKm9VipyJOkS6LRe0aUd04HMgmsn7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D7kEsJ+m30BaDpG4B3Y4IqbTIXXnkgumGUD/xeE9Zn2vZvP6IFAXYXhOg6jNeHlbE
         NPolGIDHl8KJHDKQwHWSUGEYsejY8+ibg8mtoQOunH9zqc0c0CCvP1FbCYZMsfF4/W
         2Wtys/i0Sdrucn8q7lN6BKm3W4dzaXLKLXfBBss0=
Date:   Sat, 18 Sep 2021 09:02:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 1/2] soc: export soc_device_to_device symbol
Message-ID: <YUWPAs7uyyN1qjEA@kroah.com>
References: <20210917175134.252882-1-krzysztof.kozlowski@canonical.com>
 <20210917175134.252882-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917175134.252882-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Sep 17, 2021 at 07:51:33PM +0200, Krzysztof Kozlowski wrote:
> In case if soc-bus drivers are modules soc_device_to_device() has to be
> exported.  Since it is trivial, export it as non-GPL.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/base/soc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
> index 0af5363a582c..ac8db303daa1 100644
> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
>  {
>  	return &soc_dev->dev;
>  }
> +EXPORT_SYMBOL(soc_device_to_device);

I thought we were getting rid of the use of this function, why export it
and not just fix it up instead?

Or am I confused about some other soc device abuse...

thanks,

greg k-h
