Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1D2C00A89
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 12:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 800D922403
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604320891;
	bh=qt9zBsoc3VVGk50l/yuGhQoHArbKCfg2VFIG3hjAjpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FAOrOHmozjLgpBbYHlH3mFc/rsBs9uVKqetNhcENMbIVmw15eCn8nzPL07sBCwOr3
	 ObCjgtm7elFuqTRlFn7xmLcWY41Zyo1egZbu0asj0gSZ7msy+oBwdPgetZ7rhqkQfT
	 hKQa7IuTrJbo2NRhOiTk0LtxIfNYbTIIBF2pza/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgKBMlb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 07:41:31 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43462 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgKBMla (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 07:41:30 -0500
Received: by mail-wr1-f65.google.com with SMTP id g12so14392560wrp.10;
        Mon, 02 Nov 2020 04:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vE+PH3YLHOhOeLKgAfBwuoHNLUQzsqJV1bKYObjVQTA=;
        b=QS6Neq/l0P62NHvyviWNsUdPCpguqOJXlopZjqOd1Rw2HTA0Kv91o6ytLA+SwG8kMv
         229tkQyEzju38QW1HVqIgNFB0a9XeIFSL8x7QUpabUWArVVkVP32EX8j3kLZjA3zE+pj
         gs0Uhh3O/EpykcSRrPx2eBM3OtOOxPsFkJdzMoowlEmYFHAT1WphsPme66JyZlDXQhCi
         LqRvLrGaKz+uoHGz6zmyGUz2oLc8DwJqni5FTffXzjomvohAqqXodhOlgec7QroLB+BB
         wnYpZ3VpE6fiuU/1pdxgKB80AJPSoDH+2Z8NDo1Gh/PRkaNTgQDjD6bHn6+k9zKe+eEv
         0k/A==
X-Gm-Message-State: AOAM532GAZf3VCbmfLhxNtJCjIRPZSsZbwTvdkORdXNGMyuJ+VnzNjHM
        9TsyyV9FSJuJqcMaSbTK8aQ=
X-Google-Smtp-Source: ABdhPJxO96MjaHNz8VC1k9cRxHvlW6BeV6r7uvMv+QRAZP+NenJAbJ9TbyqjTJjr4zWYDBgKznzRcA==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr6564318wrj.328.1604320888114;
        Mon, 02 Nov 2020 04:41:28 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b8sm1396420wmj.9.2020.11.02.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 04:41:26 -0800 (PST)
Date:   Mon, 2 Nov 2020 13:41:25 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     vigneshr@ti.com, linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Kukjin Kim <kgene@kernel.org>, Ben Dooks <ben@simtec.co.uk>,
        linux-mtd@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 17/23] mtd: nand: raw: s3c2410: Add documentation for 2
 missing struct members
Message-ID: <20201102124125.GA437900@kozik-lap>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-18-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201102115406.1074327-18-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Nov 02, 2020 at 11:54:00AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

It took me some time to spot why the "mtds" change is there, so maybe
add to the commit msg:
"Correct also typo controoler -> controller."

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/nand/raw/s3c2410.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
> index cb2d1b4e278cb..f0a4535c812aa 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
>  
>  /**
>   * struct s3c2410_nand_info - NAND controller state.
> - * @mtds: An array of MTD instances on this controoler.
> + * @controller: Base controller structure.
> + * @mtds: An array of MTD instances on this controller.
