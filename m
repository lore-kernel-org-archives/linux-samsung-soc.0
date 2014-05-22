From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Thu, 22 May 2014 23:26:07 +0530
Message-ID: <CAK9yfHxK5tdaoBZTfs3MYheK2VjA-ddgWi=u7F3bHowUWU9bHQ@mail.gmail.com>
References: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
	<CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:58456 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbaEVR4H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 13:56:07 -0400
Received: by mail-oa0-f49.google.com with SMTP id eb12so4380621oac.36
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 May 2014 10:56:07 -0700 (PDT)
In-Reply-To: <CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>

Hi Rahul,

 On 22 May 2014 19:46, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Hi Inki,
>
> This is another one which has not got reviewed. Please review.

Inki has applied a similar patch from Takashi [1].

[1] https://lkml.org/lkml/2014/5/9/24

-- 
With warm regards,
Sachin
