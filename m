Return-Path: <SRS0=l8CY=3M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEE1C33CB6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jan 2020 14:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 001FB214AF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jan 2020 14:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0QkYri9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgAWOar (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Jan 2020 09:30:47 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:37017 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbgAWOaq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 09:30:46 -0500
Received: by mail-io1-f65.google.com with SMTP id k24so3155571ioc.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jan 2020 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FRpZc2K8rtySt0g/Uf8aZHkLQ6/PNDol3SnEb8AWinM=;
        b=h0QkYri9Yp7KyFw2sOYrAifNEyLvX5ywLuinybzXcIUOmd4e1uZBvsVyzisS86YZO7
         OgQstHaMhtJEOXG9MPrKD9NY9n2aCYvR6l+kPDQzy3XFRmLFGiPSWRlYOenRMkXpqyu8
         qZpAdmyLek4GTQWSQCQJi7/V/yWmflq1KpLceyUgd15LQH6zb+cxAlmX26JxuM89M9bY
         ahysNYOoybucdUTaqxWWfuHfkMzqMtGcF+ZnZ+g8jUYW+Jfvwj3kt654o2gOIysbm7kM
         IUZQMMNYeLOK99R1l4OjYrBKnvgeSk7Mjvk1AfklqkDqSCAVJfsLPllunCf3Uz7NTcXs
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FRpZc2K8rtySt0g/Uf8aZHkLQ6/PNDol3SnEb8AWinM=;
        b=MHQIgKzttBM3qC3OxpcbxUxBCjkPz2kJWz9OF/JVvDrktXYhy5aXNLH/bb6LhrUouu
         yyKbbb48wC78jYx1XJak6s0mNAeG3PWV9GUiKPcOmW4ynsMYZV4rLvBu3svGydTMzBkJ
         oK8MDfz0rWglMXc50Jv1Y+hXf+nDH1OlBPw2TXfsgIKWEaw/qwPhTpY4L5SAEP/H9FA8
         6BDdyv/rKxDrs6CByrtqz5lYNG7+TbG6J7W0488OFqH16F3hU48zS+ZKZGaMSCli8Rmt
         XUtthyTjtgfz/vGSJdHpM8Q1LnWsXts/qkbQt5KTY8m/HxZB/Mb3D8+a53wC4/nFsq75
         2tcg==
X-Gm-Message-State: APjAAAXu4HlBYHXCm0H9xHQfsixD+E297aZ3bmP4Bc4ObZihxfwukaqN
        0kf0G1j18UfrninptCe0F3hpQomzfN3D+ehXchEEBA==
X-Google-Smtp-Source: APXvYqwSf3MBFy40L9z7Lsg8cTAKdWiFqdm9ffUU+sKkZ74cwURCcHJaChpJcdQvwur/o0JvjpEI0xQyxnEzylJxsC0=
X-Received: by 2002:a5d:8989:: with SMTP id m9mr11378201iol.118.1579789845058;
 Thu, 23 Jan 2020 06:30:45 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200123134100eucas1p1078c46b83d1ef49f9b1616f8f7789cf1@eucas1p1.samsung.com>
 <20200123134046.9769-1-m.szyprowski@samsung.com>
In-Reply-To: <20200123134046.9769-1-m.szyprowski@samsung.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 23 Jan 2020 22:30:33 +0800
Message-ID: <CA+Px+wUHzCixCh7JYu=Reqwx=D+-4aV9Mi8jGzxKYV9LGjjxvA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98090: silence lockdep warning
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     ALSA development <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jan 23, 2020 at 9:41 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Fixes: 08df0d9a00f7 ("ASoC: max98090: revert "ASoC: max98090: fix lockdep warning"")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Thanks for fixing this up.  I guess I can't see the lockdep warning
messages because my environment is based on v4.4...anyway, thanks.
