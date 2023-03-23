Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCA0C6FD1C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Mar 2023 15:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjCWPeo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Mar 2023 11:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjCWPem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Mar 2023 11:34:42 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA97AD0F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 08:34:38 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id h31so12788807pgl.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Mar 2023 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679585678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt7G+Vx35jiNRqx/4CbUvfSNsnSXjoz9hZ8bjwJTmRg=;
        b=HXNabD1rmVa3EmMZ0VI4nWe+JSSM9K9JqDd2ryVbdLHrShDYfi0YwU2HZFGLwh6YtN
         7D0q32xB+p3pQ4f8V+nY7MIBfSg+/YqXOj5LX1WsDtKTzFc2tkf6QdUIHeif8p7+YIeo
         b2nUXFhKEmEcGuoR8dWVNkWt5pIlVfMacheaIvJRJyg/0K91q2N4ac9sUv2zIgbP/yg4
         ePvnZSc+RFKkF28YgkiNoNYT05usB62KT+buwijkWvl7sj8kb+0p9laD/CADfYKmLvBa
         89VRipFQLK+NwJJNB02OMZVA6KGPpQ0Gq0kLpYq7F7gHQc/LhOF0F3YQbJHDo7HRXeF5
         auNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt7G+Vx35jiNRqx/4CbUvfSNsnSXjoz9hZ8bjwJTmRg=;
        b=PfJT1ft6xkeLSvbbGVCYzuZ8+aG7NbJKow/FxI9VOs9hBhOQ6BPNKYmXzb8P53RJa7
         HgBZP3pA9ybuxc5yNoXY/bZrV7dTwx/CoTuGHZePV8RJB+vPGZVXTju0lBVuEVyiF0cV
         QGwNMxZDQJri93ilYtFlCMXO2UZSs8p+azN3aD5ilrqsNuVM1mUSivqrgsE3KFEwaFZh
         K005Vvn63kM6ju0bzSxPbTk8exOZZgV5+8H/0n49yTyqjXK8pud6ihS7UEKtMu83uj3Q
         7z9OToLOOww+4frfNX5HogRQR1ztR+/WYAg7rwXSqYllBUxxg7xq/u0wbeEv0FY+SK46
         qygg==
X-Gm-Message-State: AO0yUKVuOlMr4oeqqBtMzVVnCbjKJre0RUhySUr6zrQ3wpECwZEadzd6
        QwYR+WmYxHreMnYqjSKYwCCTI+PqdrELeh9V8zw=
X-Google-Smtp-Source: AK7set+6wuYyRamh87vkrzZ2uGC7oaZvrvUgSq1WAHQFu92Ck749a8vmxr3SCJdhX/w7eePUzlR669mX2U99CLXm0Qk=
X-Received: by 2002:a05:6a00:21d4:b0:624:1261:918f with SMTP id
 t20-20020a056a0021d400b006241261918fmr1612660pfj.1.1679585678123; Thu, 23 Mar
 2023 08:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com> <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com> <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
In-Reply-To: <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 23 Mar 2023 12:34:26 -0300
Message-ID: <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To:     Inki Dae <daeinki@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On Mon, Mar 13, 2023 at 9:51=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:

>> Could you please apply v16?
>
>
> I am planning to merge this patch series soon, but I will be proceeding w=
ith the pull-request next week. As the DSIM driver is being moved to the br=
idge folder, I would like to wait for acknowledgment from the bridge mainta=
iners. However, if there are no further comments until next week, I will pr=
oceed with the pull-request.

A friendly reminder: do you think you can proceed with the pull-request now=
?

Thanks
