Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E137C00A89
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 08:37:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 365C022272
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604306274;
	bh=YI+aPoM5axOwjZZTJn7r9OgREOC1u2temt3YSYXbUjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z8shlUKbNEBvrn2SPqYHaBAm1rC0aQZlitXCugxy3TX6jAKEjWLY2b71Bc1wsTHIZ
	 8ytRi0pZQh5wvIjTWbSaW1YyUhwBl5ityO/xZpiNfGm6P06ERmDxCrrsjbW4/j+p7L
	 ZfD92caeUE6CfpgpovRvLHpILeHVlM13+dYfdE/8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgKBIhx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 03:37:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41080 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgKBIhx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 03:37:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id s9so13496839wro.8;
        Mon, 02 Nov 2020 00:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VVhomTmtvbzVx2bMdt893B87MhgFoZTd/hUdnA5vKvs=;
        b=iU1NKoch1OxTbLmf5oMuh3ANi8vZk/9rEunXcDvI0dE38Zq3lwafrXGjT423q1pBqO
         SOSPMCpyK8+YGeWdy6i49ddg18OoX7OZB7iveCf4ftyz394PVcLLB0nmZHHX5DWdRjcT
         Dm86wnIUVXH9vfKelr+4VQ6gcp8Z29AhKamXVg1XKVmscN+3GmmktGzqDLTks/IRPVtu
         shMoZ9cErBWETtZmPEBTI69bt/aAd7X47fmAduac0NNK/F7L3CE1BSWEIIUotby/DpHD
         9sZuzOX7XBmfmikTn/qqQgbM+b4w4Z4cQhIRLF3pirwgApSXAA12XhlSbbXe58c/aynG
         xflQ==
X-Gm-Message-State: AOAM530mkqLn+jCwj5BBnfxVb+EqaLj9by24c7DKvNUsiTi1bafB96s9
        iJCIvuxD7rJAzIUxR6M89XQcesjGW/UiqQ==
X-Google-Smtp-Source: ABdhPJxhShAXHalgEE8zz8m3/7lalmV4v3jp8yxdlmvTTIji/b2ZykzbDkPbv3wXkVQTV/pRn41vjA==
X-Received: by 2002:a05:6000:36f:: with SMTP id f15mr18603306wrf.78.1604306271958;
        Mon, 02 Nov 2020 00:37:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id g17sm21590203wrw.37.2020.11.02.00.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 00:37:50 -0800 (PST)
Date:   Mon, 2 Nov 2020 09:37:49 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: exynos5: remove duplicate error message
Message-ID: <20201102083749.GB6986@kozik-lap>
References: <20201027214257.8099-1-martin@kaiser.cx>
 <20201101171807.8182-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201101171807.8182-1-martin@kaiser.cx>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Nov 01, 2020 at 06:18:05PM +0100, Martin Kaiser wrote:
> platform_get_irq already prints an error message if the requested irq
> was not found. Don't print another message in the driver.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> changes in v2
> - split the patch in three parts
> 
>  drivers/i2c/busses/i2c-exynos5.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
