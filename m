Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C217CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Nov 2021 14:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243464AbhK2O6W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Nov 2021 09:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240377AbhK2O4W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 09:56:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AA1C0613FC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 05:17:54 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v11so36721367wrw.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Nov 2021 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TufeQEGFPXdPqZUewAvDpIDz7hRA8J+tU2fgiZwFK3s=;
        b=Rh2nwXPnvA9iuBIYM2mJCjDkGte7jZWqfXb9ApWOfiwSTUSNP4dZhoUcy0FCOmAPaZ
         s6IQvCVpoVJaWJ39WB8qGbG/FjaZ69p9XhFOCS0ht+5ZEQxi+6s7I4ODu7ZK06UJH2QB
         CXVwCr//Ow7inoB7iR4FEcxRs+ivyRHCoygZkEYp2YcTSeIqCXYhs1Gv1reHegc6/nK5
         DuQXq/N4zm+SWqL7eAhzZyOKECQ6uiYgg3rTdQIBiQLfJSFx9Pjsh0Cb9/XHLwxn8f8+
         R95wIhtjdkUCp38WVAZbV7jLAy1OzJBfu6FovdPuvZs/46vT5hLXdzL2ACwX4LLfaCP9
         f8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TufeQEGFPXdPqZUewAvDpIDz7hRA8J+tU2fgiZwFK3s=;
        b=aFf2HZOfW+wr6dUv6mLqGwx1xLiAl/tmyJ9LInsZtFRX0481Pl1UdiD5aMH0yDb8Zp
         wpV0NHQhablWrCEsCnANUYTjhIvqIbrs8843z15gXHOhUYuzqOzcIdWRk/x2B/aoXCxP
         X9D07WpXZzKda9ypr+Z96EuIeJf7tQD+8dZALxqRhkziB87CxOsSfSORRoI/wZuRMles
         PlKIKCG0D7KWg+6Lh3yhZ6Q42atN4cdklCFqVQm8V/UNPuY+9R2VmI+KRFG5kQWfUWLA
         6/NRIzN1E2h3z7o1bVypd4wKnIpjOXrOsmd1oycbsR5AI13xkbLZINGMtDmK2ZiEXchv
         oEqA==
X-Gm-Message-State: AOAM532tg1jHb7ScheWbhh5AAvq2Fk9zMrrlCM0a/391QYtEkSTGvlAb
        +LTSJOsS0SqX4qcoHZoPb4IiSQ==
X-Google-Smtp-Source: ABdhPJxQTo38KGVz5QhFkfSjcXgQk7w89OcRlvyUQzIvM0KWq9+nkcNGUHA3aegfkb82x2rH9FY91A==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr36439746wrs.291.1638191872656;
        Mon, 29 Nov 2021 05:17:52 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id l15sm14438472wme.47.2021.11.29.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 05:17:52 -0800 (PST)
Date:   Mon, 29 Nov 2021 13:17:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add samsung,exynos850-sysreg
Message-ID: <YaTS/l1wYV892JSn@google.com>
References: <20211126230620.478-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211126230620.478-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 27 Nov 2021, Sam Protsenko wrote:

> Document Samsung Exynos850 compatible for system registers.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
