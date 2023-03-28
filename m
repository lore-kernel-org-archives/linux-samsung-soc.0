Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB72C76195
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Mar 2023 07:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjC1HyS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Mar 2023 03:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjC1HyK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 03:54:10 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B944A7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 00:53:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l27so11157521wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679990036;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1KWp1+z6lyc6dsscSk2tZ4gyzAuqIqBXoGIiti+qmqQ=;
        b=X0gkVOwnCdVvjs8+7aabpFC37zQNWPvw0NyjO8TQLgbSDDIQgjn+qlzfZ93IGekpUX
         GURrvxyzVHMV6utOrtglu2oI0OIhcX2SF20DFzBEXyPSjlMaXW9ORejLtGBv2wlzhBPd
         OZrB3WAiqtZ1M1pkskfqJjtU2nI2Kd4h8IXhue7uYcKyrn0cuYkZw27XgagXAIUC15FB
         iPqf6PNk1UvdVmx65jGbN3mQ76yP70wcVZuEbnKJPaRMh9XS63XOKZSkqBYszofT1k5U
         jtzfSaFDNZFNVZKdM3KYba9zIziq4xKnFM2vx4WkQgG07l3juFXziIksq/i6mjRzUlFM
         k+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679990036;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KWp1+z6lyc6dsscSk2tZ4gyzAuqIqBXoGIiti+qmqQ=;
        b=nbaD0BYE1IJuYjh9wfhLXbwDfA2VxUHtCMO96pdOrTtO+E9Cdsrx9wQe82xYDHB/Kh
         vp2BaU/q1rVvxXd4E2djs370NJrI3yOGCpH4m+gtqXzWJvmlnxdG3nMx+vrLhN36bups
         wy1nexzLb29b1nMtfc4f/oX6rdS/CM+jl2NG/FU9nTPYFITdIlS+MNYe9I0rG4SgKVGo
         G/nJNFrndCgK5BiMWBPSFwf3ldRfs6P5OyykAQzFkFi4h2CWp8TGLoPG9ptPyN1EFzc+
         0qZ34sTt+Bm34x7kUhp5mGTcBu/2GGjXDLX/ztLWcMK2Rch0YSEXUIwF8DBPfzSGQeA1
         6ArA==
X-Gm-Message-State: AAQBX9dCifnk56wXeteoxq0rJDXtI5wZFfyI+k+q9fBqc6mR4weFyffw
        WZxhAJ4eN0XxgNzZfz/HamKMsQ==
X-Google-Smtp-Source: AKy350buoSiGjbtjSppckEMPlWqbnD3nYQLLEwwIKp+tQwnuDZvp3ZvbNOMNBEmX0UvtUzK336DHPA==
X-Received: by 2002:a5d:66c9:0:b0:2ce:aa62:ff73 with SMTP id k9-20020a5d66c9000000b002ceaa62ff73mr11309446wrw.54.1679990036616;
        Tue, 28 Mar 2023 00:53:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8cdf:4bfe:3100:4240? ([2a01:e0a:982:cbb0:8cdf:4bfe:3100:4240])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b002c71dd1109fsm27043331wrj.47.2023.03.28.00.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:53:56 -0700 (PDT)
Message-ID: <3e22ad9f-eafb-f5ce-6de2-151bcb193543@linaro.org>
Date:   Tue, 28 Mar 2023 09:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Inki Dae <daeinki@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Adam Ford <aford173@gmail.com>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
 <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
 <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
 <794538dd-f29a-571b-601a-f61c60d00382@linaro.org>
 <CAAQKjZPmYcdUphP9w7i_O65rhXwsw2rCxAnDJ1JG73-RuLP4UQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAAQKjZPmYcdUphP9w7i_O65rhXwsw2rCxAnDJ1JG73-RuLP4UQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/03/2023 02:03, Inki Dae wrote:
> Hi,
> 
> 2023년 3월 27일 (월) 오후 11:08, Neil Armstrong <neil.armstrong@linaro.org <mailto:neil.armstrong@linaro.org>>님이 작성:
> 
>     On 23/03/2023 16:34, Fabio Estevam wrote:
>      > Hi Inki,
>      >
>      > On Mon, Mar 13, 2023 at 9:51 PM Inki Dae <daeinki@gmail.com <mailto:daeinki@gmail.com>> wrote:
>      >
>      >>> Could you please apply v16?
>      >>
>      >>
>      >> I am planning to merge this patch series soon, but I will be proceeding with the pull-request next week. As the DSIM driver is being moved to the bridge folder, I would like to wait for acknowledgment from the bridge maintainers. However, if there are no further comments until next week, I will proceed with the pull-request.
>      >
>      > A friendly reminder: do you think you can proceed with the pull-request now?
> 
>     I can apply the entire patchset to drm-misc-needed if needed.
> 
>     Inki, is it ok for you or you still want to take it in the exynos tree ?
> 
> 
> Sorry for late. I will proceed with pull-request today.

No problem. ping me if I can help on the bridge side.

> 
> BTW, now is rc4 so we have more time for pull-request. Is there any reason you hurry up?

As Fabio explains, it's v16 and was fully reviewed for a few weeks now, so it's time to LGTM !

Neil

> 
> Thanks,
> Inki Dae
> 
> 
>     Neil
> 
>      >
>      > Thanks
> 

