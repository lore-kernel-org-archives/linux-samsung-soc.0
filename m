Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A035C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:17:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355035AbiBNORZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:17:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbiBNORY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 09:17:24 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471EFBF7F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:17:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id e3so27204981wra.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=s8YquNU04gHjJdyZdqG6wS1fewBMA8c3UASp3XdZ20I=;
        b=d7/+3WHErfiJHVs7nuciZQLFuQpqn1uH0EnhAQvlHUfiv9Jt6LsJ/fYZJQrCxvL1p9
         OaMvHPwxZT+pPyLd6pRuiwyCeDygrpMmPrsuVUYVElbPTqmA3P1AONASmkaul1BqUXey
         8yU9vkKcJ4cyc2TQRGYpdDfmsupF5o4+76JbFGCIB+OSAFY2l6cjxqUBDZ5dceonEMS8
         ikLTTOPxFFMN+gwBSZ/Y8WQO5IDKI4F5ZoKXZqbeKGNPJMpUsz5XNMVKFLt7GpNLbQwU
         L0v7io0cv5YnIY07Q+L7ql3eZ/kgl7OoWAAFTvcyLuGrI8JvxHDnjwAGIkijUfhm2gIF
         FQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=s8YquNU04gHjJdyZdqG6wS1fewBMA8c3UASp3XdZ20I=;
        b=Hfq5s5i7zPP+vldPaN4Au3gRD1ycWjjfK0mM5iU2E1fyjcKaCrk+OqML0DtOdMjDp4
         ut4vVm3ussjB7Q/9kREL48piSOrOmj8JbgDdD3ZyACEVLJDc+RL/1zWGBsvEaRqZtNpV
         kUIZ+Kq/JHOGeoQloWqooKFUsc1YuX8FeeTgaPTD9SFFGv+EOoB3fYeWBF0yKaGjTWDE
         dIBVTxlYCF5tm0dExub3diE0DpMqDr6exJwA8NUkvojQxR2Pm/zxZ3SinW+ALr4Rb1aD
         wabtUibPrRyx62/uvs5P+sfZoUhLY//MLJF2faAtQOKjItbYScMupKUJR5H+L0EsoQpJ
         r2Eg==
X-Gm-Message-State: AOAM532wnJ/L1maqnUov5r23MHh48tEQvxhuvkQ5ZKlGeSgk9KB/Mrms
        ikzLZeijRIoDK3DnEcNQoXrRgQ==
X-Google-Smtp-Source: ABdhPJzlbYCMwZF+I5AvIrwVXEqzQejiMLKHsGIY4lGCN3MuJQQ/7sRR0ojLKZAdCZqUhQlOsUbVfQ==
X-Received: by 2002:a5d:508c:: with SMTP id a12mr11574121wrt.379.1644848233876;
        Mon, 14 Feb 2022 06:17:13 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id u12sm27136772wrs.2.2022.02.14.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:17:13 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:17:11 +0000
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
Message-ID: <YgpkZzMWuuWpK8Tk@google.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-2-krzysztof.kozlowski@canonical.com>
 <YgFgQsV2bJS6mjQs@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgFgQsV2bJS6mjQs@sirena.org.uk>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 07 Feb 2022, Mark Brown wrote:

> On Mon, Jan 24, 2022 at 09:23:44AM +0100, Krzysztof Kozlowski wrote:
> > Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
> > controller bindings to DT schema format.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Do you need a PR?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
