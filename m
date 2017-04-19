From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Wed, 19 Apr 2017 10:56:47 +0900
Message-ID: <58F6C3DF.106@samsung.com>
References: <CGME20170418020509epcas5p2e54f307dee164846dabf0470c5f134eb@epcas5p2.samsung.com>
        <1492481109-2863-1-git-send-email-inki.dae@samsung.com>
        <CAPM=9tx2prz3mKuaRwwLohQ4gX_PbCOnVwdRZJXAt3EHzrPe1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50061 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1758833AbdDSB4v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 21:56:51 -0400
In-reply-to: <CAPM=9tx2prz3mKuaRwwLohQ4gX_PbCOnVwdRZJXAt3EHzrPe1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Dave,

2017년 04월 19일 08:35에 Dave Airlie 이(가) 쓴 글:
> On 18 April 2017 at 12:05, Inki Dae <inki.dae@samsung.com> wrote:
>> Hi Dave,
>>
>>    Some improvements, fixups and cleanups to Exynos DRM.
>>
>>    Ps. this pull-reuqest includes a merge tag from Krzysztof Kozlowski
>>    who is a Exynos SoC maintainer, which includes dt patches because
>>    these should be merged together with below one,
>>       drm/exynos: dsi: Fix the parse_dt function
>>
>>    Please kindly let me know if there is any problem.
> 
> Hi Inki,
> 
> We closed the merge window at -rc6 for this release, due to some push
> back from Linus,
> 
> It was mentioned in a few mails on dri-devel, so I'm going to have to
> leave this pull req
> until the next merge, unless there is something in here that will break badly.

Sorry for late. I was in a hurry but some review had been delayed. 

There is one patch which should be merged with Krzysztof's tree. Without this patch dt binding of Exynos drm will be broken.
Almost patches of exynos-drm-next branch are fixup and cleanup so I will request pull to -fixes, maybe v4.12-rc1 in proper time again.

Thanks,
Inki Dae

> 
> Dave.
> 
> 
> 
