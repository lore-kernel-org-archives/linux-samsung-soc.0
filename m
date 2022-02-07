Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCECC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 09:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiBGJlB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 04:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245169AbiBGJdJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 04:33:09 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D9AC043188
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 01:33:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id s18so23548578wrv.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rBjYYVDfPJSH1BVq77LHmUbf5zvWji8qdpdwUm64Pcg=;
        b=NhD4MFPycqIBpOhwd8+jvRql2upsyK034+tQKBWW1HDFvOTTuQu0lom4xl1l/YGYdR
         NS1mJLu0MwwG2vZFKOi4k1tQe0gWQyfu6+frcfpc8aZn02P2FBH/i7fTXAcTqybXMdyY
         M9y0VZCQTuVie/Ex71UrKktMQgwYKAkbLftxT16PBRxcpAKqo1gu/MqVsEX+SpExYs4w
         9nw25Jry6zgct9e81Q/BH4tpx3K5mk1/MNcc3hugjKLMTIXSXzAWlj2QOUs6GFzEXo0+
         VkZZ6LFjm6JdVv3KcHaIxJJlugJq4i/iRM77D/PWhnDYVSn6ObiL7Xt4VoqS2tQl3/zQ
         aL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rBjYYVDfPJSH1BVq77LHmUbf5zvWji8qdpdwUm64Pcg=;
        b=h+8WdHy5gTHhjBYBEk9iVO/pmNeJcqg4vXFeDIPx8ONkvRvtLHPLNvngIr2cipgKBL
         XttM1odE+RcxmsKI58yfHD2C7Ngspm+ltnc4UOPsrVWdVw7tVGji9VykqeyLUEgUibfm
         Aq9Y4Wpto0JHfGPY56zGNfUmfNWD+GAKTtn+9P7T8Sq4Le7uJg2PUI73OomIcA8bs/lS
         o/+IhbioByOQXU4Qt0RD+fcGP9Zex6LEIF/dpbEfxPxEtUS4QjomKdnV6K/HjGLn6MTp
         2p3+sSmvGRheLtbu0/SGIlNW0RJpAOzPQaHTz4CnmODgePxQfnUNNasTNXfx2yhfMPEp
         uc8Q==
X-Gm-Message-State: AOAM533mO8c73CweX57VKnlsoxx64ZVMiElTm+GPYEeoQ5rnEzht1M0o
        oXatKerkG93pA8Yez8qA6B/7zg==
X-Google-Smtp-Source: ABdhPJxh2mvqeGHI9VwpCnxoxf60eD/D/VwhohJSXRkLkwKmdyolRzDLR+7kmAJg4PiqtpZcypaOOQ==
X-Received: by 2002:adf:e4c4:: with SMTP id v4mr9166828wrm.332.1644226386982;
        Mon, 07 Feb 2022 01:33:06 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id 5sm10359004wrb.113.2022.02.07.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 01:33:06 -0800 (PST)
Date:   Mon, 7 Feb 2022 09:33:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 0/5] mfd/extcon/regulators: max77843: add
 dtschema/bindings
Message-ID: <YgDnUNCNCO+JLyHU@google.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <1bebedb9-644f-783d-492c-84a5de91720d@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bebedb9-644f-783d-492c-84a5de91720d@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 06 Feb 2022, Krzysztof Kozlowski wrote:

> On 11/01/2022 18:48, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > The max77843 shares some parts with max77693 but it lacked bindings.  All
> > its compatibles were undocumented.  Add basic bindings for max77843,
> > matching existing devicetree.  These are not complete bindings, but
> > rather reverse-engineered to match current state.
> > 
> > I do not have access to device with MAX77843, so if anyone else
> > volunteers to be the bindings maintainer, please join.
> > 
> > Changes since v1
> > ================
> > 1. MFD: Use absolute path to schemas.
> > 2. Regulator: mention all allowed properties,
> >    additionalProperties=false, add min/max values for voltages and
> >    current, don't use patternProperties when not needed.
> > 3. extcon: Use absolute path to schemas.
> > 
> > Dependencies
> > ============
> > 1. Patch 1/5 (dts): nothing depends on it, sending here so Rob's automatic
> >    checker won't complain about DTS.
> >    I will take it via Samsung SoC tree.
> > 
> > 2. The patch 4/5 (mfd bindings) depends on regulator and extcon, so they
> >    should come together (2+3+4+5).
> > 
> Dear Lee,
> 
> This patchset was reviewed and there are no outstanding issues. Could
> you pick up patches 2-5 (skipping DTS patch) via MFD tree?

Are the subsystem maintainers not going to review/ack?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
