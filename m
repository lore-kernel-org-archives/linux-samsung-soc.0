Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACAAE95A82
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Oct 2023 14:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344841AbjJHOBc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Oct 2023 10:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344837AbjJHOBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:31 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E26ED6
        for <linux-samsung-soc@vger.kernel.org>; Sun,  8 Oct 2023 07:01:29 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so46472461fa.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Oct 2023 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773687; x=1697378487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
        b=dU3x9p4iOX75EpYEqgQ37wy734/yJbCHn/7k5zGHeyOwquq/6Ip9SQoxWsEhlOvw1d
         i9Xkb044JdQT3z/7Wwh4FY0OCZfcoW2jVHcagOhSR+7a2jZjzLqfmJp6P7kWEZe1x7JW
         9Bb7wj/sednYz8K5bIkHrqJidBZVajOix86PmLCCMw7MBYKjGxm2xEDNiNP2gYVosH1R
         HcxYpLqrqI6w9Q9gNo1GKDJMmkVjE0ur4n4kXfMfAN2Ht9koA6Vq0JU5QrbkThi2xzDq
         il3T+hSVMzJBaZw4tcNEKoeysNez8vPJwqyvMWekikI40sFGIyhY3MqI4ze+3WrWXiGP
         em+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773687; x=1697378487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
        b=Yojg8nsKx7s+wTA1/J/kFnrDR6Espp5szGpXpEo3MVrOyHITZ3TRuVt394ZHBYgRbx
         WGu3fhBpjqG9ebOnfiCSjuK+nj06YB6AYUuwHd6mCDEsrIwB/26+lIYArwbbsjZgDXue
         vmtJyDqNv0wTNW9GrjOVKY7grddOVRJ+xlkf5mLQ9iilnphkd3WTTugNMDkhUfeJp6Yf
         LvwhID61AOI+xFIeSAlT4dpkTDlnB0BaMAwZdUiGWuqhWH5vbQPbtrrIyH1faLuCTmcI
         UxUB7wkMfsbM8TDlrBB4kd/JHnVa8MnAfBUUy5FHdQe9MZ/6j5l+fSzA+H67VzVbuj8U
         RKPg==
X-Gm-Message-State: AOJu0YyIo93QOp70BqdsCZtzwTMKy6mzR6L6YolKb5iCtulsY10fPGSd
        6zO2L0wjmR9qc4/UsZTb6CnU5g==
X-Google-Smtp-Source: AGHT+IEZhcTkbfnDMA0TmtMUY6GUYhyBTjDeQoEWBa7c/RqNiiO7pOQy12FcGXqIQaqK7WTV5qhK2g==
X-Received: by 2002:a19:910c:0:b0:501:c1d4:cf68 with SMTP id t12-20020a19910c000000b00501c1d4cf68mr9460445lfd.15.1696773687355;
        Sun, 08 Oct 2023 07:01:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
        Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
        gurchetansingh@chromium.org, olvaffe@gmail.com,
        paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
        haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
        george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
        jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
        aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com,
        jiasheng@iscas.ac.cn, noralf@tronnes.org,
        jose.exposito89@gmail.com, javierm@redhat.com,
        mairacanal@riseup.net, davidgow@google.com,
        arthurgrillo@riseup.net, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/7] drm: Remove many unnecessary NULL values
Date:   Sun,  8 Oct 2023 17:01:18 +0300
Message-Id: <169677306919.2570646.8217027380730287216.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 09 Aug 2023 11:44:38 +0800, Ruan Jinjie wrote:
> The NULL initialization of the pointers assigned by kzalloc() or
> kunit_kzalloc() first is not necessary, because if the kzalloc() or
> kunit_kzalloc() failed, the pointers will be assigned NULL, otherwise
> it works as usual. so remove it.
> 
> Ruan Jinjie (7):
>   drm/amdkfd: Remove unnecessary NULL values
>   drm/amd/display: Remove unnecessary NULL values
>   drm/msm: Remove unnecessary NULL values
>   drm/radeon: Remove unnecessary NULL values
>   drm/virtio: Remove an unnecessary NULL value
>   drm/format-helper: Remove unnecessary NULL values
>   drm: Remove unnecessary NULL values
> 
> [...]

Applied, thanks!

[3/7] drm/msm: Remove unnecessary NULL values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/92a48b6ed510

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
