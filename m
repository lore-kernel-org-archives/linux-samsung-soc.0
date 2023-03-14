Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA25C6FD19
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Mar 2023 00:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCNAbq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Mar 2023 20:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCNAbp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 20:31:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD567E8AC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 17:31:44 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q14so2787302pfu.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Mar 2023 17:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678753904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTki4dq5GO7SRaR6dQWVXUZKBjk5cuLTvV6wXNGOXZI=;
        b=kG9SDioQdfpzSQqbDMldHb4Yp9/tE/B0C7md2nApwBu2DmrxG++UGk/9Pvut12KT7W
         FJF2qQTQn3pYC+w80lV4oUJhCaRt1pT4sz1V6e19kg7MtuPK8M+/wnyJbV4FRm06gai7
         fNLIRfzB8tvxfITyklM0JYygh4mCZGW499fUSnQSWfNIprNob7oeCNC8i8/yfOZF86xp
         1B7mW+oS5Oi/BHZwDS8MylzsbelLSf3wj64wyUwrtRo7HsQT1uTqCE08XFM+RGYueRF9
         XZ86GkPxEhmdJuhPtdaD1d5Hg5Cd60Bmdvdth7CheviariDJpZvaZWdAg1GFqu78VSH9
         hDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678753904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTki4dq5GO7SRaR6dQWVXUZKBjk5cuLTvV6wXNGOXZI=;
        b=MNk/gSMpFTbIt9QImGr4U7JMNtTddylWscc4W5YvYw0yxlPUe2qa/NDscV07cn3duK
         NgdBD5RPA4OAwW6MlCyPqkI2c4JAE7BZXz2zEbfo4hgvtmtCEUsrEKy22zZTKL/G6tUK
         UWz3fGhhcdfXexFi2V+rIhwg0MdUssviJtBhutO+JDVhEc9jseSE3xxQj1FCLLV1qO2s
         IEYirIGvaNVBJ3nFq/qIIhQWkti93CmyUVnqXwbdZtYQxdLhDTzVPEITRyQES4zRu1wp
         wVMjkCV0k+kI3CQs9BwcGD8Q63PF8fjrlpuieQOaEnFOF0BD0yRrj2udikSRu0xJoNO1
         T6Tg==
X-Gm-Message-State: AO0yUKXIZYcg8bmEJVn2CPyUFS5u4Sf9jMrVHLD9tBTKhq1DrztFZdk6
        Ndb2Q/X0vFQfRMgDUVKRrsmC1D1akfmaxyfAjBM=
X-Google-Smtp-Source: AK7set8Vv87JbVevNVFuCmJU7DZp3vlkh+pkO9cJwwzGyhMTFMNrcFLcN653o0pHhYKr8woQJeggOfYoA+tDUWzjTow=
X-Received: by 2002:a63:4d07:0:b0:507:46cb:f45b with SMTP id
 a7-20020a634d07000000b0050746cbf45bmr4300161pgb.1.1678753904383; Mon, 13 Mar
 2023 17:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com> <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
In-Reply-To: <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 13 Mar 2023 21:31:33 -0300
Message-ID: <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To:     =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <mripard@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On Mon, Mar 6, 2023 at 2:24=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Pl=
atform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:

> Seems some issue Marek found on testing. If fixed then I will try to pick=
 this
> patch series up.

Marek has successfully tested v16.

Could you please apply v16?

Thanks
