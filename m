Return-Path: <SRS0=YEUN=EO=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D552C388F9
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Nov 2020 18:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DB2C20731
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Nov 2020 18:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604860883;
	bh=BB34i6qX1kFmwVdE8Dd7s1EdHCjK0YFuETZZ7uPAndQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=O73t9xAFvoRXNSYV+dOsC7WOt1EKsCWyGpTp6Kj83jH0jWCXm6hON6YRUgnV/ls4g
	 dzGlDwgOwp/gfjTXLSyqzhZxGWxQ07teLYRpPEdL7wFxohnGgxUn+c06w9/sryrsGj
	 5QagNZX0nlYEqqelZYOihQ8hEEQmL+h6BUORihK0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgKHSlU convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Nov 2020 13:41:20 -0500
Received: from mail-ej1-f67.google.com ([209.85.218.67]:41532 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHSlU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 13:41:20 -0500
Received: by mail-ej1-f67.google.com with SMTP id cw8so9133937ejb.8;
        Sun, 08 Nov 2020 10:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ey9X7mPMBcATwPjhwdqocaqwR7EqA7Y/rZNNR5RdnGY=;
        b=JXASts0jJ7Y30AAf1vWiurm0v08R813Lm2DBlwZ7CddL+dSNgxA2zDzKKzO+g3X+3L
         xY6u8uFtmKZ3AeG5vHsMd5yMNIOIA46NBPX6i92Tgu3miW3yqEiieB25VnBVGLTpvv+8
         Vxu5NKMUIxz4xmGME4GWC9TMNWOW1bqdWaS2MqENsMlfS1KsEK48Fn6vPws2KCSSD4/7
         cSSWLnXbDtoFijWhvy232SmOaJI81wIngSEcu9Yg3WWOz8Q4oQFsZcOrX0RMCjtFXPDl
         GKLeLiFcziLdiqCM5rCQE3M8LYXdZKFZ0SefKQs8IXaCUKUolXOTLo36M0EvNMGL0ZOb
         +n+A==
X-Gm-Message-State: AOAM533U8L39zhiOsNfE85wY6qUUnWulR9XfgNoHT6EOylBHlQk8tadV
        0s35/wQk4lZO4cD+fA6/nHw=
X-Google-Smtp-Source: ABdhPJxPftdb0DK3Om5Civ5TCbbbeFZ38vXXSSJJ0NcXWXu5sfffH/1OSZyDfxSKUk1ndKnQHcAgTA==
X-Received: by 2002:a17:906:cd0f:: with SMTP id oz15mr11870595ejb.200.1604860878295;
        Sun, 08 Nov 2020 10:41:18 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b1sm6945826edh.24.2020.11.08.10.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 10:41:17 -0800 (PST)
Date:   Sun, 8 Nov 2020 19:41:15 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc:     kgene@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: exynos7: Keep aclk_fsys1_200 enabled
Message-ID: <20201108184115.GA7078@kozik-lap>
References: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Nov 07, 2020 at 01:14:56PM +0100, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), fix this by calling
> clk_prepare_enable() directly from clock provider driver.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v1:
>   - Instead of marking clock as critical, enable it manually in driver.
> ---
>  drivers/clk/samsung/clk-exynos7.c | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
