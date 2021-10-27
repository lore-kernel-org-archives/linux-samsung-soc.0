Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AB0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 18:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8716610A4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Oct 2021 18:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243572AbhJ0Sgr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Oct 2021 14:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243570AbhJ0Sgp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Oct 2021 14:36:45 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD294C0613B9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 11:34:19 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 205so6209702ljf.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Oct 2021 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
        b=BU9c4Kt2klb9pGlGYSH6N2/niQ4oNqfLZ0U1NjtsaTgg7k2zPmvXxZMNe4LsT/a25Y
         FIhGhLYGlcZIbZ5j7j/wImxQN0EpLG2rhMuMjkY2ZOZtzRN9RqqqM2Z5uaL0wHre6mWM
         X7XRH+g6SO72fi7HbBdQdNVRGP6vVPJBwpQNB051MQ98oMp8EsGzZR8rkERWdlg/ct9o
         ddJXJKuqCo1GoTk5cB29k6H24t/jtwCG/qx/JiEgo0fh9G2BeRlLJWBsA8+ncOvhsWK7
         4aJySPcTUrOnoJ4Ah5b9ngmkz6HfI8+bB1S/leVgn/9yzaNvwSOGDWeh+h8NSiDjQk22
         DXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
        b=w+qfAoQbT72kjouBn0koqLOzIsaqWrGRGKIH3pfx/TnvN3da79bOfsWVGQ4UjB4JaY
         ZyF+eMtWmVhK/L9EZ5jGeMlvNk69iZEglvtupJuPS0QIPLELPRsoYcJfxy+/3PHfoLtW
         Swxf6gV9fzZYNhfPwYpUcHHIDHtnIQWLg8BPf6YfaWVkSJ7AMLJPLVRrrzu7cdXAna/z
         BpSamGjkFc2vJqwB8yCSGPs/Z4E9+6msjYdTx3QuTSFg4Wq1Lb6oiZW+N89OMQrhVdne
         6OUIvSfClKMDun2EIQ1ubanzItX8HgCLXoG3r22IO4cX5n5hWtNLXkzgneAYOt36serN
         gpKQ==
X-Gm-Message-State: AOAM532Hm4gCGu8C29ExOq12KAORriBI2a1L59IY6jKYQWLAc9l1BYev
        rvKp4GzyPeV8mzBrSA4P2w71FfDU1LSqLqyxuE5LLQ==
X-Google-Smtp-Source: ABdhPJydr0p5R5kOrBi0cKjyUtJDjfb0NxbOwZhHcj6m+H19kxZT9BRZop/bB7yZsgjxXgCMaOYdHA2FjRV6asLzles=
X-Received: by 2002:a05:651c:389:: with SMTP id e9mr14617679ljp.61.1635359656666;
 Wed, 27 Oct 2021 11:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-21-maxime@cerno.tech>
In-Reply-To: <20211025151536.1048186-21-maxime@cerno.tech>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 27 Oct 2021 11:34:05 -0700
Message-ID: <CALAqxLXG5R2ZN9gfFsGTLfdY8mhNhh=o8f1w5Axo8NSw8QanAQ@mail.gmail.com>
Subject: Re: [PATCH v6 20/21] drm/kirin: dsi: Adjust probe order
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Rob Clark <robdclark@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Xinliang Liu <xinliang.liu@linaro.org>,
        linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 25, 2021 at 8:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Without proper care and an agreement between how DSI hosts and devices
> drivers register their MIPI-DSI entities and potential components, we can
> end up in a situation where the drivers can never probe.
>
> Most drivers were taking evasive maneuvers to try to workaround this,
> but not all of them were following the same conventions, resulting in
> various incompatibilities between DSI hosts and devices.
>
> Now that we have a sequence agreed upon and documented, let's convert
> kirin to it.
>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

For this patch, and any others in this series folks see fit:
   Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
