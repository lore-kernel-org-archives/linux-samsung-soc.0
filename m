Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96955C05027
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Feb 2023 11:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232901AbjBNLMi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Feb 2023 06:12:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232947AbjBNLMZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 06:12:25 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE9627D6A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 03:11:34 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id oa11-20020a17090b1bcb00b002341a2656e5so3591588pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Feb 2023 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky17l8iHWA+nurbdhU7Dvug8BSc+GSjC5WigIc/2O64=;
        b=TtE5mLMTOJZu7jg7Wi/r2is93T8mFOyVp8z2fwRxcPuZNEOADvL56XolJIbAZZXCUD
         EBfDbtDnnKvT3xcFNUpSCu5jdZmdoaG/4PA+CrGYXaxXaCSl3C5r5FEfDJzHdqg9vfoX
         gDpKOAMHyV7u+l5n/qRUICsPPjfwdIk8yGuurXiIO/+LzXSAF911Bb3xBi+ZKp7r61Vt
         L045/BEdXHhLPZnM+cT0V/0Zvi9b4xTdeFTII/JW9BkyJpSSxPz3jwZFcG8BcJymDaCE
         J5tSh9Si0FVocZuktjnC//TveJqUsIjSifIHMY+AVioNHKHVl9HalNnVl2f6KHuXREMJ
         lNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky17l8iHWA+nurbdhU7Dvug8BSc+GSjC5WigIc/2O64=;
        b=LE+Z2wjdxplcNtspqXPHiQcJMc4uJpXQ7gTpl/q65oWbRvNSvabBwDqeBC9DwMO69M
         7y/DQMZTKBKjsqCPKwci8+i6jdLqY3INS4DuIy2lOZFGOpYr1vVlkMD3+7QhRMcFJmcc
         Xs4xy2EV9i0k9H9wOAk3BWk6ZtFbyTa/TG/+IB+uUsgE4fsWFV/62IoWlkQnzfqqRu5b
         yXXTrpOEXNW5EmoE42v0dse4CQXCn8F1QRdVvvNA8mrVovrVKTum10sLR6fLosgFmVgu
         sOVa1bOxBgvYIuAuXTmRmKUiLRonk+DdSBZPWBvSDeKCrLhC7LD6cW9GTOi2IuuJDWBN
         wA8Q==
X-Gm-Message-State: AO0yUKVoxLBEYv6uRigIQ3BMJ3Sd7UDrua0InQnHgur175XMRBpgnSFw
        VI963AHkIDnz/2VSImtiqrtIdjA2ZD7J+TNeoys=
X-Google-Smtp-Source: AK7set+L+qwFIv/uwm+extZxpVupTYLYJ54DD3h5lIDQ7Xb8iFU2mYJYOuJcOIxVbuwmjwjEYnvDp/PZAV/eDEefaeQ=
X-Received: by 2002:a17:90a:d710:b0:233:bc13:2cbb with SMTP id
 y16-20020a17090ad71000b00233bc132cbbmr2915383pju.39.1676373081859; Tue, 14
 Feb 2023 03:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk> <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk> <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de> <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de> <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de> <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de> <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
 <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
In-Reply-To: <CAOMZO5C1oau7+YAbadD=8ERiNSLi_Z1k3VC9HVmT8aVpQF5hiQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 14 Feb 2023 08:11:11 -0300
Message-ID: <CAOMZO5AxHbi1w9w244SjYXNjv-P8MDzRvAmnWgYwsVOJ_kqtdQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
        linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
        dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
        Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
        m.szyprowski@samsung.com, aford173@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 14, 2023 at 8:09 AM Fabio Estevam <festevam@gmail.com> wrote:

> Some extra ADV7535 patches were needed. Please check patches 0020-0023
> and see if they help.

Sorry, forgot to put the repo URL:

https://github.com/fabioestevam/meta-imx8mmevk-bsp/tree/kirkstone/recipes-kernel/linux/linux-stable/6.1/imx8mmevk
