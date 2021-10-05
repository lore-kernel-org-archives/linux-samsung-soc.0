Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF675C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:15:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC556138F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234170AbhJENQy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Oct 2021 09:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhJENQy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 09:16:54 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAF8C061755
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Oct 2021 06:15:03 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id v17so37251753wrv.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2021 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C7t36aQJ/HdVD4haldIX8sv1hXdH5zMENhm9qykkDX0=;
        b=u/W41neVt5urYn/aY5Lkl4TT8qiB8LAHeqCJ1PtTbbe+W7kGbk1QoUtfLs5mDnG9TQ
         Jj1ySQu0udLwMDJ4GpmxcQqsmCEnTMqFD0kd0y9PgA3xRWiGHvwk0uTovGmPoju5mQth
         Q9DCqXk4Eo/lldLxH6LsZtKnqKTMeH3Bmm7cttIylM5HawltyfbY7gqkuuu0kbVn7waY
         ToFLue9dvcQfauTseB+5VSd0jXUYFx2gRrUNTtsmk6fX9Ha4G6XOIGwrdwaAj5NxmSL8
         xrLoK2hn4K6oJ3cpfEUc1CVG+qvFLKnJVlA4Y68fC07b7PitzDR+U4e8gcloSFlZSxkh
         Kyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C7t36aQJ/HdVD4haldIX8sv1hXdH5zMENhm9qykkDX0=;
        b=Pq2zi6oytfgbP6cMg5fUcRDx8tBi/7PwttdTjPEcxUTgEG9PkYZenLsf9txemHQvyc
         iYqlUzsr08Fk9q2lMHLMun2LyakSDaMS7AypX0Wg0urv0nOcCcSmSg8sh8UiD0ky2WQH
         rIZZU6t5GRV91MVKSd5A9vj4Qml34zZPm8YxPsnbikbNCkQvLS1s9hhQLFy3u5MRnKZ/
         iXUAfZtJCaYx666Kb0qSTK8Q4xJCk+jqepNbIzPdQdMmGKV9BWISNeOKmn/vkZa3MxDo
         wPkeazsXsjoUUDBbVWNqFBZ8tkFXZaA0FLQIv+/FASOJmirPsDF8a9FP9+UoXxCLhGWo
         JOWQ==
X-Gm-Message-State: AOAM532HGtJIsLq0clz/EcVgIBqX3fcvioPz6i298Z8olqGY7/LY6aTN
        vvFdkJqFOXBeN+4bYIxU4j1mKw==
X-Google-Smtp-Source: ABdhPJx+AvsAM1xJpR4F7gOV4Bz1IXec3HMpD2aJxgbeZYeQpGFuhMEfzND1sQXGP/vcePMxxmG4qg==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr21231328wri.93.1633439701937;
        Tue, 05 Oct 2021 06:15:01 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id k18sm1171078wrn.81.2021.10.05.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 06:15:01 -0700 (PDT)
Date:   Tue, 5 Oct 2021 14:14:59 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
Message-ID: <YVxP0+kVxI0xQmQQ@google.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <YVxBuEvHVdyDvaGD@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVxBuEvHVdyDvaGD@sirena.org.uk>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 05 Oct 2021, Mark Brown wrote:

> On Fri, Oct 01, 2021 at 11:40:56AM +0200, Krzysztof Kozlowski wrote:
> 
> > Merging/dependencies
> > ====================
> > 1. Regulator related binding changes depend on first two commits (the
> >    fixes), because of context.
> > 2. The mfd bindings depend on clock and regulator bindings.
> > 
> > The fixes and bindings changes (patches 1-10) should go via the same
> > tree.  For example regulator or mfd tree.  I propose the regulator tree,
> > since it will have also one driver change (the fix, first commit).
> 
> Lee, Stephen, Michael does Krzysztof's plan make sense to you?

I tend to take cross subsystem patches.  MFD is usually in the centre
of these scenarios and I have tooling to easily set-up immutable
branches/pull-requests.

Always happy to discuss if others have different/better ideas though.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
