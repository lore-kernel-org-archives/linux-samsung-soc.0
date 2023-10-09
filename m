Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520A6E95A8E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Oct 2023 09:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345624AbjJIJJS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345547AbjJIJJR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 05:09:17 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5803597
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Oct 2023 02:09:16 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40566f8a093so39430835e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Oct 2023 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696842555; x=1697447355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
        b=IWmoWzlBoTg4Vug7gKUuWmqVkbK/wf1h0+DwkOrhZZ0G6d8b6hJfgiiVlHslAy19TA
         fwZEDUmmI0UT5l8G94eDYxN0AamcBawg74U+VS5gDUYUmjAZRNhZEWJqspD04e7/MUWU
         kOYQUNBcPYt2ry/OkSjsVeQ5X3/kg0H7oB7g0xXWR6E7+2+EjjEAwJMG/ur5GvWBJPXR
         sKULMjm7BSd5RE0flj2yviq/OlGh8rUc4QB/487MDNM7KophGgI1nID+/Ll64w6pphQt
         JmykHKhXtP4btJ+pYI1bXatdcUBoTmRDNJhkkn/voNsfbfd736O4pjBgL1QQXHFDGjWw
         fSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696842555; x=1697447355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8Z3UYNvAtyEDlrSr7KXfmu9oYxAGlZ+o0c72dpgJv4=;
        b=BoOi62RMXRKLaTUsOHUFz9ZQcppDfqirZobNSjAC9jeO4Xe2EgTdUeqZ3AJfQd13oc
         xJlq0eCEYgZi+2Y2nowBrrRLoTflxe945imqGYzGgvQzJQlshI4yUygT0ODTaB/KOB0d
         nZ4aExjAd+mZSzI5pmoUNj0LRr7gj+kpqVgQYXSJ0DnWjwtoertzxNPvb8F8uOpCgxuM
         17rywyodTcawPinIG+bAjidD4vVEmuYjMi3t9p/fUbS4Vj502FkO7oM9PlMTk72g1Y1b
         nKVCvLhb+WAHEziviTmS8UUh5Kg65TDqSmzdzZjWIODBFpLhPMxYb5iDO1S9LuHhiXgi
         QMgA==
X-Gm-Message-State: AOJu0YyEyssyVL0Y8suUF0xors0MphlAxgZ5WXlYNFqiLgT+6WkVD3Fr
        s+ZtsW64zHyTVOLWMFKV+zY/c0eJuyu7P/jo2/lKMD3J
X-Google-Smtp-Source: AGHT+IFch8GuFHQEo6J3AnB25YuJr/bD2bLPerLfe0tE6CVQhPSYr2s659RcjWq6ka8GDVR+RhEqcA==
X-Received: by 2002:a7b:ce09:0:b0:405:3dbb:ec5a with SMTP id m9-20020a7bce09000000b004053dbbec5amr14092958wmc.1.1696842554673;
        Mon, 09 Oct 2023 02:09:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b004013797efb6sm12864525wme.9.2023.10.09.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:09:14 -0700 (PDT)
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
Message-Id: <169684255378.1988265.10483577692957189124.b4-ty@linaro.org>
Date:   Mon, 09 Oct 2023 11:09:13 +0200
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

