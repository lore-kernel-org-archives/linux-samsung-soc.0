Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7A6C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Feb 2023 23:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbjBBXOk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Feb 2023 18:14:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjBBXOh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 18:14:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D7F82436
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 15:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675379627;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kXVHvL7Zc9SvpXlyodElHL/El9p9PH7Vp09KDuKNQ7k=;
        b=UZSsENMhMyiq0vTVZM7cqcrB4nyoqHJi/tkIFKdWIFh38FBUhz4H/xoZ98ObPRjQwNz/KD
        ur5WN3y4wPiHyavJFKuZxh6kA4DHfc/GvHJEosj1h01G89E+gfy3nR8ipkcfuLeyZgjp0P
        vX/sjuzFbK/LeS3w3cAbiFrt3uq8/Ko=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-k3yOBFiMO5evbIcaR9_QHw-1; Thu, 02 Feb 2023 18:13:46 -0500
X-MC-Unique: k3yOBFiMO5evbIcaR9_QHw-1
Received: by mail-il1-f198.google.com with SMTP id z12-20020a92d6cc000000b00310d4433c8cso2209754ilp.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 15:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXVHvL7Zc9SvpXlyodElHL/El9p9PH7Vp09KDuKNQ7k=;
        b=QqqOpSC2AKksjAf33euUVoVmJt1Ih/NyPQDAhwrsznuqg1yWIH+KHotcTFcxUcupIJ
         4A6/Ae2HYzs4wvdBOL6hexne61sMze5id1tWwyNlZMisD16zypLtHx9L5/XqABcWTadb
         +Z0y0kXlej5tBRNAbx7ZZ/U/tXezEcbYI4gnpnVsXsRTZxj4eXetSrd3Ts53SA8UgO6V
         mVOcidLxuXcA7kZNW01E6JcHm9By52ayXXHMSMEC9uS8zll9Plw2UL/Fd+XA1E07qiP/
         0KaCEhiX/+h+WwvRGFhnqTGFnzUHJOgX8bW7AilVt9tiW2YwQXDBJs9kRGykBMw+0lXp
         gQoQ==
X-Gm-Message-State: AO0yUKVgt0mCWQ832kSI7oSQqOuoTufmYpqxFuJ9QkdfKtOmSeBXC9bJ
        DDqrd18za4/AoEhhO7kEYDSpHODZtywM690m98c87KCXIhHcyUF4dU59x0/ROcnrbApZoAYcnbV
        2FXmv6OCj2IHHIyTkxD3R6s16lUuJa6Q=
X-Received: by 2002:a05:6602:2dc2:b0:707:d9c9:458e with SMTP id l2-20020a0566022dc200b00707d9c9458emr3293883iow.1.1675379625362;
        Thu, 02 Feb 2023 15:13:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8MFntk5bjnEw1nbcEwPglzwxtEbs/VR6tLktByEWuRryxfTh9CCM+W/HuYuBK+h7W/qw1aLw==
X-Received: by 2002:a05:6602:2dc2:b0:707:d9c9:458e with SMTP id l2-20020a0566022dc200b00707d9c9458emr3293860iow.1.1675379625133;
        Thu, 02 Feb 2023 15:13:45 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id a7-20020a5e8e07000000b007192441e5e6sm274085ion.45.2023.02.02.15.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:13:44 -0800 (PST)
Date:   Thu, 2 Feb 2023 18:13:41 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Artur =?utf-8?B?xZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH 11/23] interconnect: qcom: msm8974: fix registration race
Message-ID: <Y9xDpSxL+3Iny+hF@x1>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-12-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201101559.15529-12-johan+linaro@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Feb 01, 2023 at 11:15:47AM +0100, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: 4e60a9568dc6 ("interconnect: qcom: add msm8974 driver")
> Cc: stable@vger.kernel.org      # 5.5
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

