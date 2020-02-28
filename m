Return-Path: <SRS0=V4sZ=4Q=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E89C3F2D1
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 11:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C2D324677
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 28 Feb 2020 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582889530;
	bh=/NXBQ4kYypSM5LrNw/bWUkJMR93pB1Pw8Bfdp5znjeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0J9axrrTi/284qNCk4dXIwP6Wbugof2bcTPGAIgiVVdtzs+93kbLyvUFm+EfRdq5r
	 Y0MQQyI9qUoazcVHTw+m/cKEWLu7z50nWgwTbBNvhPXeM1NRtfL8+g1ZDSlS8Q+ig6
	 pvdTRTrF+lIWYLQo/xliN8dVjmaOT2KU0SvoiVWI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgB1LcK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 28 Feb 2020 06:32:10 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33267 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbgB1LcK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 06:32:10 -0500
Received: by mail-ed1-f66.google.com with SMTP id c62so1442398edf.0;
        Fri, 28 Feb 2020 03:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tuoQgcvkaKL0eF7k115n/CAKTAhLjoqIg2MZQZpgd70=;
        b=lu5EPH/shUD/8GZP87m1tNnSUMCrlPFBjQ+fZhbcDEZMCr8lFnldasSUGanQiskr7B
         zVlJIap22MseEJ2LyyFm3ord44HebbqM+jhXpQBXxmx/JdgbWbuYXzY6F2ygxsiEVKK9
         PflagOTOxPJYzzhu1s8j+NyzH/6igPhwbag3476Ha0NxxcFd4AzTQkLTjvo1qahqEYtT
         U6iwpIyltJxtGIbIQnRe6LyPs/1wEnOuJTrqi+1FEdt7SHLzMOdA/S9qzMhwoAxrGo5j
         bcnKCpCSlK9tDIMgjJOgacexCw57hbrg4GGsrm4JLHkyqvHTomnpzyTmEh8iHXS7ChQO
         yT1Q==
X-Gm-Message-State: APjAAAW3siiQm4Qf0dvSq05qCfsGf7nIhNDSkEMYLrEEvhyT69fDmqeD
        dSn75DZPM2QloYhcylDLleM=
X-Google-Smtp-Source: APXvYqz60k7iMt7s1HeKLLFN8zS0n+SWowVI1I4z3UnQdEpkMCOqa6m31ocmG4LtP3MgJUC3KPRRQg==
X-Received: by 2002:a17:906:70c2:: with SMTP id g2mr1012579ejk.268.1582889528238;
        Fri, 28 Feb 2020 03:32:08 -0800 (PST)
Received: from pi3 ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id c18sm80911edv.4.2020.02.28.03.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 03:32:07 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:32:05 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] udc: s3c-hsudc: Silence warning about supplies during
 deferred probe
Message-ID: <20200228113205.GC9458@pi3>
References: <CGME20200228092816eucas1p27ffbe58d985fb30fa400fcb9939f4433@eucas1p2.samsung.com>
 <20200228092808.4580-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228092808.4580-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 28, 2020 at 10:28:08AM +0100, Marek Szyprowski wrote:
> Don't confuse user with meaningless warning about the failure in getting
> supplies in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/gadget/udc/s3c-hsudc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

