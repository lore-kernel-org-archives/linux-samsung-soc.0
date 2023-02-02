Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CAFC636D3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Feb 2023 10:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjBBK7A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Feb 2023 05:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbjBBK66 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 05:58:58 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC2B712CC
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 02:58:55 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so1061139wms.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVC3BbCIKGwKEURboffcV34GlxCVIjCwQdv8Aw/FvBc=;
        b=NSlTIDIuXmr9NgzQl2ljftdQqscbgLmM96D3y9V9sYNrZSiu7WXdyrOZf1aaNeVxXJ
         CuunDZjDr09/Cn+xmJ6lxD49d4UDmurgZv+j8P8UFRDkZmjyQ/Sc0yTJ3sXCCUv56pYy
         bfDiIHEvJGj0Z0iIOpv03yIbxpVwUUUbRU4mvE5KjVQzts5vFFju1ZuCUmuBwhJzzfMQ
         uFl8/km3hcqaTjZ3oh7N3c9q1FB/k10A+v1QatIqEXQQqZKnuDt/pk2iDp0M8oZkKqlH
         C9uzeMyVPZ0ag98zy3c8OHcROza1M1HLe5QiFdnu6cFEaLoJBIkOT1Cjb+R+W+AsoTtz
         HHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVC3BbCIKGwKEURboffcV34GlxCVIjCwQdv8Aw/FvBc=;
        b=b8lA3GZ3gs1um1zAAw6iLNTQCgeaoFBRXZY37zc/a+nX9P1WSzL/VcwNYUGNRAEF4/
         jVeza5oYWMRbRzsFJhAc8940kEYNPH5yyynPAHlDQ9LIH5FbK1hBG/5lC2AfZhFPTHvp
         10y4Q4xL29l8tWkNEwd8m1PVcyludbeQbRDQ8fSxmkSEjsQuNJOxJHqyjovHIKp2LkzG
         63d9yq/SrZjOI2LRCL2bYDqGCcXFVeV9yft89syWkwIDyiZCMdVdyNVjg06dd7v/80Gp
         k0EizQ5i53zL2xn/93N3kaVO2R69qPuLnDOxyZh2Q0oLHVIiejdjJ0GuLVBCRV4pbA5B
         cE/A==
X-Gm-Message-State: AO0yUKWv7FmRIDt8qyzGcrWpNGRN1tiP09HFWTgM8SsZIYcpIiP+FKFl
        v9xKQxZ8nF5CwduwrIeaCTHf3w==
X-Google-Smtp-Source: AK7set83lIl4nGCVu7Pf1aCB5oUVzv4rO6WDAnBXErPnHSfhSs/9z3OqQW47YCDl+K02oT7+vlDn0w==
X-Received: by 2002:a05:600c:4f41:b0:3d7:889:7496 with SMTP id m1-20020a05600c4f4100b003d708897496mr5231407wmq.17.1675335534471;
        Thu, 02 Feb 2023 02:58:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm4322832wmi.2.2023.02.02.02.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:58:53 -0800 (PST)
Message-ID: <d006ea43-6aa1-89d9-ec6a-a44810d31bff@linaro.org>
Date:   Thu, 2 Feb 2023 11:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/23] interconnect: exynos: fix node leak in probe PM QoS
 error path
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-15-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-15-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> Make sure to add the newly allocated interconnect node to the provider
> before adding the PM QoS request so that the node is freed on errors.
> 
> Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/samsung/exynos.c | 6 +++---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

