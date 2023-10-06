Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43598E92FF1
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 07:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjJFHD1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 03:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjJFHD0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 03:03:26 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B178ACA
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 00:03:25 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406619b53caso15805845e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696575804; x=1697180604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
        b=vhKA4QkzUWOjhADHxxfKCPXfY/W9yTmCyd6mAEe33z8xtikwbLgz6YGIkCbCrjHl7o
         PGXul+iQe+OFmhGEYakxj4h5mAVBVlxfx8v5a0jwEwZ1ntX8lKXhqc0gWGu/cftiZzFO
         oba4r8JzMugi21hYuh948ptasuN2QJFSbCop9d/lP00L7VyOn58DslHNWWnGsMAIJPW+
         R0QmkuJuUZq5ichQajl1CZaWnRDqmbiL5QGYbnxR41zivvoec10cdLkemt9kEXWIyaNU
         7X5ZstqwTyo6Vr2A9VCAZhFvn5ZfTk0sfXjeqe/0OBHswDeELbv5jMhMpQaeqMVt62Di
         jjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575804; x=1697180604;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
        b=kOsQwKRc+rXC7SgFSUHHB5De/bVMOFywOwQmu4KcLzjDBB4tHBesedNO+XjXMHp1nV
         m44whNbO+UwTGeznFK2+/q39w37IKH4KIMbSHvkE+A7rI0JRx67JCnrqcfSJn/JMg9I8
         ebiSYhK+Q3/wM0I03tFHcLXRMVkoF2XE9/MalIWsWJFj7MJ5E/7vwrbkEYvsTn0STUcB
         5yPPkLGcCjQig3C9i1piVU+dM4cAyK9nbMkrWSJ4u/2kh2lK3lIg+lBt261YSobjD6LJ
         W/mCKZ3uzhSQzBnJjzCwjZzrHSKjheVG7yE+CMDVi/uSKPsiO2vhPPrG1qDGAI5Catts
         Ut1g==
X-Gm-Message-State: AOJu0YzX3oNqVQuhP8Fd7FK2SMuZka7qpU55DQue8HdWnHPSqMRR9ZGF
        RY5rx8vCupp+Jw7pWzcKqdxV6w==
X-Google-Smtp-Source: AGHT+IE0vdFoZPq1GaW6Q5CvV78kFSSPNlWMmQoCWBzIFhzjf5oxVJEh5fyUIBo3WnZB8u+fL0Xw2Q==
X-Received: by 2002:a7b:c8c8:0:b0:402:cf9f:c02d with SMTP id f8-20020a7bc8c8000000b00402cf9fc02dmr6583323wml.8.1696575803973;
        Fri, 06 Oct 2023 00:03:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t14-20020a1c770e000000b004054dcbf92asm3056149wmi.20.2023.10.06.00.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:03:23 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Inki Dae <inki.dae@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        kernel@pengutronix.de
In-Reply-To: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
References: <20230919103939.1367659-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm: exynos: dsi: Convert to platform remove callback
 returning void
Message-Id: <169657580295.3992302.7015352174084859049.b4-ty@linaro.org>
Date:   Fri, 06 Oct 2023 09:03:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, 19 Sep 2023 12:39:39 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: exynos: dsi: Convert to platform remove callback returning void
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c1698c73f4aaef2fd406da1c0a92e1c8f7b7780c

-- 
Neil

