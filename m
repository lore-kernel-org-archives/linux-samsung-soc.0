Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F8EC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241737AbiBNOr7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:47:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237639AbiBNOr6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 09:47:58 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02D24BFF9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:47:50 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso11768934wme.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VqFIbMHS9PJxJt/MmXCU6mhg8T/EbdtODuacavlxAZA=;
        b=Uz8HM22G11OlllXpa0uJQqZlDsuee2x2w569q1vQbJJNGHN0n8s3+O3Qxy+ArdyO0E
         aQ2c3ueo8s1I4EZUiiWEJMFXJCPnXTJ7LytcJl9bpU1rCz9AcmB5Bvaa3eFIV+SuBgj9
         rF9oxfaHfyai8TbI7eQeSmcAQBqvtDU08l4pIScZ/Ljv/kONmmqeUkq/yaQ5dgRTAZPU
         yxfnDeC+nyrO1rdGY8VJ828QgVwci3oko+UGmqSPtHpd5flkrLtmW2o77PclYcR647Rj
         Ut4WOyhvdJQF9McJTPTWpA1LpJhi2k9YX2vT4E3mKZkYHHBxOuU3uKWDn5meuSOGzP/s
         cQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VqFIbMHS9PJxJt/MmXCU6mhg8T/EbdtODuacavlxAZA=;
        b=BhqKCsOu5pBQlcD3itLWcH+YGicwC9lsvZCXWdItduFvSdG7o6M1iPcdn7zfRfZP/M
         Nq8xqDIKtvGDJEwT8JHq5yE0njqwNhWc74FerPfkWZ2kLr4HsHP2NsDwOgLK6JW1/PFN
         mkIhCkfRTqesDqGyur+JHm15Zl1PaPRZsfrGAPr4RvTQdNAOzt+/owFMQjOZ21WhB3ll
         MfOTJcvytp7w0tIfuTLy1jw9GMCwBLCE4j0Yh3MQL5nFqMoXBWw5dM353ElJHrk9Kl9L
         +9uovuUV0sqv7oSOAjxnxO27aB7cnNk1Irz2P2QkNcv9ClvIncQaWi26yX3SSIjljeMa
         a20g==
X-Gm-Message-State: AOAM532Phsb1XRQMTeo/6PnJRyHXGXPmnBjHqqgOAViqt9OdGZdp/db7
        EMFdFoD/b3PH69hRi1a2QhItxQ==
X-Google-Smtp-Source: ABdhPJxSw1FwkKhmXDhcwO+z+DvJYTP+fXzHbCfXunNctoyfkj9UEuX9KbRQKkkrTHVeacjS2FzjHw==
X-Received: by 2002:a05:600c:3583:: with SMTP id p3mr5799657wmq.69.1644850069265;
        Mon, 14 Feb 2022 06:47:49 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id a1sm30331629wrf.42.2022.02.14.06.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:47:48 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:47:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 1/4] spi: dt-bindings: samsung: convert to dtschema
Message-ID: <Ygprkl4sLrW6T+iD@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-2-krzysztof.kozlowski@canonical.com>
 <YgFgQsV2bJS6mjQs@sirena.org.uk>
 <YgpkZzMWuuWpK8Tk@google.com>
 <YgppwvQwfJ1xycvT@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgppwvQwfJ1xycvT@sirena.org.uk>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 14 Feb 2022, Mark Brown wrote:

> On Mon, Feb 14, 2022 at 02:17:11PM +0000, Lee Jones wrote:
> > On Mon, 07 Feb 2022, Mark Brown wrote:
> > 
> > > On Mon, Jan 24, 2022 at 09:23:44AM +0100, Krzysztof Kozlowski wrote:
> > > > Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
> > > > controller bindings to DT schema format.
> > > 
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > 
> > Do you need a PR?
> 
> It'd be good to have one in case it's needed.

No problem.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
