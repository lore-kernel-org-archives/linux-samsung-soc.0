Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AE1C54E94
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbjAWPs4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbjAWPsr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:48:47 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE581ABE1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:48:42 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id c124so15270719ybb.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lad2S3DmWAOKK3//NALgU6IibSlQrTkUVTfexl9hK28=;
        b=iZkcSIQzF/MH/mRCVgA0S+N54Fw4FdVsgLfkRYCRNmmnxQg3ucT9g4RbICTeA1dNdo
         wECwxxE7HSZ1q+E599vwhYLEsvttvYgzdQQMsCVe/sYal0P2zmNR9qYjkqpX3KqtdrVu
         gKJel2BN9+zhKQL8IS5zGQWVQxDccR/2hrdDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lad2S3DmWAOKK3//NALgU6IibSlQrTkUVTfexl9hK28=;
        b=FkEJEtjdH7wt/0liJCqlhpUNnFSi4pjNyhiIJDBqBeZBHBNCyVAuZYTBZAP7y6BTyc
         +D8oENz0VlTN2vOtHf5Qv2vJTVHWhWgAh74G7bRmzSQO5NETwMAbvH4u1wTaTYmRLR7G
         7kLePbpkk51RJO+QD37lNBfgZfyk3tVWg8LAblQg5xuH2pRS+peUJ/Iuu81Z3pZWSgEh
         TogZU6eK5xA7FpnnC1CjmTPKau4BJcUj1kevtGXZ+vHeLT9fNWv/DfgQILNPfFwXTj2G
         CQQssYho4yxYPpuPwGzPJ3u4cgRz1nsHAww+OhZpGI8Kmq0KpOEpzW5UrEtBTuSO+9L5
         3Z6g==
X-Gm-Message-State: AFqh2kqW0BAuf/ElNxOmXwOcVuGmKmsLKF8PXB+D7e1crxLPJ2PLIRzA
        PXbc3d6poFaL0cQQY4BEOEzKpaFHVrht8bzNwzqHrA==
X-Google-Smtp-Source: AMrXdXtQ6or+o73bm1Dy+HD5HO5+7SmuUrYsEF6I2faUuPEkt7lv4xXbqVlYtJkd+l6OUmAN509bUeHbdrb4wDtMjNw=
X-Received: by 2002:a05:6902:1822:b0:800:e4d5:1bf3 with SMTP id
 cf34-20020a056902182200b00800e4d51bf3mr1270342ybb.159.1674488921411; Mon, 23
 Jan 2023 07:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com> <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 23 Jan 2023 21:18:29 +0530
Message-ID: <CAMty3ZDeAKhp4W1oA4eLXcw5YjsPjOTshjsipSn-pko06fUzdQ@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Marek Vasut <marex@denx.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Fri, Jan 20, 2023 at 8:36 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .
>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?

Fyi: I sent the v11 series for this with RESEND prefix.

Let me know if you have any further comments on this.

Thanks,
Jagan.
