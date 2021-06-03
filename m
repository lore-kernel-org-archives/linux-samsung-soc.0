Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AACC47082
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Jun 2021 11:52:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E775460FE9
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Jun 2021 11:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhFCLya (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhFCLya (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 07:54:30 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5CFC06174A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Jun 2021 04:52:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p13-20020a05600c358db029019f44afc845so3523359wmq.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jun 2021 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Nxij94IMFMsp61zYWJS5XKMycKfWOvntSLUdgR9Luec=;
        b=PP1Vx2P7z4p7uzC7frRq63E4x3I08msTGMShcvAdEGFQwbgoSQLam6TY7qFtZnfrip
         sZ2vdZz58OMVJtBV+LV7UtfH3hRj1TGjasngZ2KltASWY+0UFk1GkCFvbmMy1zh8VBMP
         dPoAp8/Papp6e6Y9syxE5WTIn3EkF63IUFXhjOyvBnTk1EZXXSJ1zWN+ZFpLmyfRRgmV
         zaZeW5clEklapwp4mQNAksAoChe6wCnp4zD6/sK7bIoELjiqOV1BWj7Fd7qq0A12wR59
         YBj4xTZnnoKIwJpwtS8WL69eLi0TYKCyPQcOnDWAOzYthTaMGxq+z6P1knTVhENqAX1n
         l+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Nxij94IMFMsp61zYWJS5XKMycKfWOvntSLUdgR9Luec=;
        b=QfmWkz0Wf3mjOc8LmLM3rumbq0VZTCDuSCJiidcB6rLKxJEvHy/rkYIucojA5TVN+E
         VMSAPC3cNvs/t1riFSjIJy5REZ1i/dqj7eRbvbb11c+NXMOSmglTcghIojWLTBFDaoT7
         EXmk3HQ7FweHSW9hAueU8eh9r7la/S/Y2uk5BV7V8hVjlHAC9bw+mmyqHsFrYYhmbJ83
         ujeiOsYGYYCvrIA4u2Dsb1rWud4JlSO94RYV3kP070oPTwVsl1i4Zt6bC33fsPmPDBg5
         0geF5fCkYLEl8o9THcIzmJuitjj1WrRp/iwsi5NF7MZwov2Cj52D23Xk6sMDfVHpAf38
         v4VA==
X-Gm-Message-State: AOAM532hD8LEPEi2TMDyQ4RJKMNBfL734QoPnPbxd9fSUpalwDVVeFiU
        2H31iXNABFWz4dART4XKt85ctg==
X-Google-Smtp-Source: ABdhPJy5Njm66nMjE/L6HCMm1K6dzFQlD8FyCcfSndwd7kIwe0+i4mO9AXShjFboYjDIKB2XcsUlUA==
X-Received: by 2002:a05:600c:4e8b:: with SMTP id f11mr4461550wmq.40.1622721157306;
        Thu, 03 Jun 2021 04:52:37 -0700 (PDT)
Received: from dell ([91.110.221.214])
        by smtp.gmail.com with ESMTPSA id h9sm2479488wmb.35.2021.06.03.04.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 04:52:36 -0700 (PDT)
Date:   Thu, 3 Jun 2021 12:52:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Akshu Agarwal <akshua@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Alistair Popple <apopple@nvidia.com>,
        amd-gfx@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Ben Widawsky <ben@bwidawsk.net>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Fabien Dessenne <fabien.dessenne@st.com>,
        freedreno@lists.freedesktop.org,
        Hans de Goede <hdegoede@redhat.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Rossi <issor.oruam@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        nouveau@lists.freedesktop.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [RESEND 00/26] Rid W=1 warnings from GPU
Message-ID: <20210603115234.GA2435141@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 03 Jun 2021, Daniel Vetter wrote:

> On Wed, Jun 02, 2021 at 03:32:34PM +0100, Lee Jones wrote:
> > Some off these patches have been knocking around for a while.
> > 
> > Who will hoover them up please?
> > 
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Lee Jones (26):
> >   drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
> >   drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
> >     kernel-doc header
> >   drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
> >   drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc
> >     header
> >   drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc
> >     headers
> >   drm/sti/sti_hda: Provide missing function names
> >   drm/sti/sti_tvout: Provide a bunch of missing function names
> >   drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
> >   drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable
> >     'cmd_enc'
> >   drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc
> >     abuses
> >   drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
> >   drm/msm/msm_gem: Demote kernel-doc abuses
> >   drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
> >   drm/msm/dp/dp_link: Fix some potential doc-rot
> >   drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference
> >     static
> >   drm/amd/display/dc/dce/dce_transform: Remove superfluous
> >     re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
> >   drm/xlnx/zynqmp_disp: Fix incorrectly named enum
> >     'zynqmp_disp_layer_id'
> >   drm/xlnx/zynqmp_dp: Fix incorrectly name function 'zynqmp_dp_train()'
> >   drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
> >   drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
> >   drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
> >   drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc
> >     format
> >   drm/exynos/exynos7_drm_decon: Fix incorrect naming of
> >     'decon_shadow_protect_win()'
> >   drm/exynos/exynos_drm_ipp: Fix documentation for
> >     'exynos_drm_ipp_get_{caps,res}_ioctl()'
> >   drm/vboxvideo/hgsmi_base: Place function names into headers
> >   drm/vboxvideo/modesetting: Provide function names for prototype
> >     headers
> 
> Except for msm (Rob Clark promised on irc he'll pick them up for 5.14
> soon) and amd (Alex is on top of things I think) I picked them all up and
> merged into drm-misc-next.

Superstar!  Thanks Daniel.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
