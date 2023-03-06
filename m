Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDD3C678D4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 09:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbjCFJjm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 04:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjCFJjl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 04:39:41 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6201223317
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 01:39:37 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so4779410wmq.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678095576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=40VqwZdEe396hnC8YGU9F90+ZA2jbCFRQN93aV3XtXw=;
        b=QdfS0evwYqN16uiYZJspo9C1gthxHrsyJRYArFwYHH+xD4DiREALp8tIywQ3ozcx1D
         WZ9vyCgJcFT663XhBotfdR6lI5yqyur8JeiXcIvzNEN3NNta3pYjCaDd//GZChhl41GJ
         czRhiNv1KkIwWTaKpEtmOY9lduW6LZMNQooAeoIiuFeb/DAyyaKV8iD423kQtMC6vhMq
         dX5U6uF5hw0Q+zvDd4PVSbaGvYFCuWk9I8YMg300+rCgBoQwpGSDU1f+FcgZlBkzWrhK
         U4mu9s8m08BHM7dmMY4rz4V2BvcJtskUmuzbKi5/EdpBoIpZh66+O3WobYovTF15oKhg
         MSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678095576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40VqwZdEe396hnC8YGU9F90+ZA2jbCFRQN93aV3XtXw=;
        b=i7Clb7FDAHWz8kfZ7z0DUGVKF2zg8jAca3as5wQs/TErxvxFYHIyJuGiluy/MtjZDl
         NDB6rH/t34eAEgtgeosqdnRLlJqTcR/vfBl8dSYTHfYoVKWvgfUUcRVxkbHZKpDiFwHp
         ZqAm4pW4yWaQz0zI4o//qzfdi/L+mwF+3L4Bp7prcYPDWyH8CReyvwE4k0FJDL1y9MpF
         jQD/vF8gfY6Z3h5bCCyBbRWBypMcHyiKHbDsT2L43k1JtcOhDf80bqwwQyMGMbiAXt1/
         wtqm2gTHtzd5qDECsHaWx1ghrb7RV1BOAscxXQfoS9OigRH8CKmJcqtGsLZ4PiMR/zhw
         krag==
X-Gm-Message-State: AO0yUKVBPFIWhj12xFmCKh+TYkfbcqYUTLOtzDd/JWmpHPowgHYNS7pV
        PeVAZsCEfYXx6KLp6cCGCRxXiA==
X-Google-Smtp-Source: AK7set88tTQGfzgyp+f/Btf9rlYPAuQT4JZr7E7rU0NltENebbxLf5HU1LaYA94GQ11/fk6/XQTYEQ==
X-Received: by 2002:a05:600c:3c9d:b0:3eb:4150:a476 with SMTP id bg29-20020a05600c3c9d00b003eb4150a476mr8451832wmb.0.1678095575788;
        Mon, 06 Mar 2023 01:39:35 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u32-20020a05600c4d2000b003dc522dd25esm9503954wmp.30.2023.03.06.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:39:35 -0800 (PST)
Date:   Mon, 6 Mar 2023 11:39:33 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
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
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/23] interconnect: qcom: sm8550: fix registration
 race
Message-ID: <ZAW01RH/gLwlueoT@linaro.org>
References: <20230306075651.2449-1-johan+linaro@kernel.org>
 <20230306075651.2449-14-johan+linaro@kernel.org>
 <ZAWsUrlrOfmmNBy3@linaro.org>
 <ZAWzqtWt5yBlYpQU@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAWzqtWt5yBlYpQU@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23-03-06 10:34:34, Johan Hovold wrote:
> On Mon, Mar 06, 2023 at 11:03:14AM +0200, Abel Vesa wrote:
> > On 23-03-06 08:56:41, Johan Hovold wrote:
> > > The current interconnect provider registration interface is inherently
> > > racy as nodes are not added until the after adding the provider. This
> > > can specifically cause racing DT lookups to fail.
> > > 
> > > Switch to using the new API where the provider is not registered until
> > > after it has been fully initialised.
> > > 
> > > Fixes: e6f0d6a30f73 ("interconnect: qcom: Add SM8550 interconnect provider driver")
> > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > 
> > Any changes since v1 or is it just a resend? 
> 
> Please see the cover letter:
> 
> 	https://lore.kernel.org/lkml/20230306075651.2449-1-johan+linaro@kernel.org/
> 
> Only the first patch of the series was updated in v2.

Right, my bad. Though I wasn't CC'ed on that as well.

> 
> Johan
