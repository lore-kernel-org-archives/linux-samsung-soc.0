Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8AAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Feb 2022 14:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355045AbiBNORv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:17:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355043AbiBNORu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Feb 2022 09:17:50 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447F64A903
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:17:41 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id e3so27206991wra.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2022 06:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ln2uKU+vMAyRV7UsLvWBhWdQgf4eoy4B8mnlBh7Uf4U=;
        b=T3wz3eCfR4tmrh0J4vy9sCp8J/jWIy5urKk6OO+cbCvyUbRGqP+i7nWcAg+4+AFO56
         efMVlkNlLVf5dyJ55keCtaW5IeVN/wZa6mDMknpCo9YrruU3Na5DTtj/E64R8K+MyatB
         GaYPPqu0t+7A+Ly1FCB5CGYul82Nyi3QWjgLOqC1Wx3LNNuOiqq19axcbeRXvlJLtyIT
         wAbGVXVwM92TBH+Gu7+1O0EHWUbcGE938fc7zurGcZnjA3okbevlx5hklAnzhxNyL5zM
         nt76eOh6Sg2mkJEgeTiXPIkMBHJh39svmpY2XgJhs6jWeND7ORQ67Hohn+YByQkCEGOJ
         XP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ln2uKU+vMAyRV7UsLvWBhWdQgf4eoy4B8mnlBh7Uf4U=;
        b=0a/Vqwu86b5MG32pLZCht8Y5BH4T1qYYx33XhqH7f2S4aWUC3cNWUMog0xigMmmFum
         6BKdovSRxV3paqtmCFGaW1I4YOVCOLzglTprummPwPWG1tkIALQLbwux/7QsvHp8hXFt
         EzWiOChj1GkK9mRtqYdk0uTT4O/UE4WoRstpwRfZbxcNgCSZwVG1BoUs2X7Q2dS1G0Vn
         alMZNIph6lbU1lWkyYXo9alGBhwL83tqZsKWvDLsgFYjLnAh2YUxHVj8cmmpKQ2c+CO2
         oEYzYHZGyGOxgq3EnXpajm46Wa73TZq912KqD6W8pAoZLFEXDO6lIVMsjsnNlDWtW/N7
         R+uw==
X-Gm-Message-State: AOAM533YzOLhJxCHiuY3WHoanvdpi4ehNwTOps4GLWem7Tlc3KNuownN
        y9ZGA0fYlO9svAkXQTRU0dvFHfDQtEuwPQ==
X-Google-Smtp-Source: ABdhPJzuSHlgADVOkpRdKXvOYxCnoS/c5megiAinBNNs6xCgR6iJuRaS9XBuz50TVKdsIMN2FiYdDQ==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr11534462wri.40.1644848259878;
        Mon, 14 Feb 2022 06:17:39 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id y10sm11966398wmi.47.2022.02.14.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 06:17:39 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:17:37 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: power: supply: maxim,max14577:
 convert to dtschema
Message-ID: <YgpkgSmxAWCNHW9l@google.com>
References: <20220111174337.223320-1-krzysztof.kozlowski@canonical.com>
 <20220111174337.223320-3-krzysztof.kozlowski@canonical.com>
 <20220112112905.n6zb36kwop2kfm2n@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220112112905.n6zb36kwop2kfm2n@earth.universe>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 12 Jan 2022, Sebastian Reichel wrote:

> Hi,
> 
> On Tue, Jan 11, 2022 at 06:43:35PM +0100, Krzysztof Kozlowski wrote:
> > Convert the Charger bindings of Maxim MAX14577/MAX77836 MUIC to DT
> > schema format.  The existing bindings were defined in
> > ../bindings/mfd/max14577.txt.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> 
> I expect this to be merged through MFD:
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Do you need a PR?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
