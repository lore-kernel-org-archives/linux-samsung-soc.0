From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Wed, 15 Nov 2017 10:26:45 +0900
Message-ID: <5A0B97D5.1090202@samsung.com>
References: <CGME20171026013709epcas2p2525d1249a7f2ad640ce9028df12e2436@epcas2p2.samsung.com>
        <1508981828-5178-1-git-send-email-inki.dae@samsung.com>
        <CAPM=9ty-Boo8mjREQ8T2AaGYoU5ZcAu70iQpwJy_oawZxoS+Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48968 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751233AbdKOB0s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 20:26:48 -0500
In-reply-to: <CAPM=9ty-Boo8mjREQ8T2AaGYoU5ZcAu70iQpwJy_oawZxoS+Pg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>
Cc: Dave Airlie <airlied@linux.ie>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Dave,

2017년 11월 14일 13:22에 Dave Airlie 이(가) 쓴 글:
> On 26 October 2017 at 11:37, Inki Dae <inki.dae@samsung.com> wrote:
>> Hi Dave,
>>
>>    Improving Exynos DRM HDMI and Mixer drivers and also adding
>>    HDMI audio support.
>>
>>    Please kindly let me know if there is any problem.
>>
>>    Ps. we are reviewing IPP v2 driver[1] which controls post processor devices
>>        such as FIMC, GScaler and Rotator of Exynos SoC. So I plan to request
>>        git pull one more time after review.
> 
> Hi Inki,
> 
> I dropped the ball a bit here, I do think the second pull with IPP is
> probably a bit late,
> I think I'd like more assurance that the UAPI for IPP is to be used in
> some upstream
> shipping project (forks of mpv not withstanding, unless this fork
> ships in some distro
> or product).

I also commented same thing internally to author - Marek - of IPP v2 but I thought existing one is really ugly thing so may be better to change it as soon as possible before other users use this one.
Anyway, we will merge user space for IPP v2 to libdrm first, and then Linux platform. I hope IPPv2 would be merged as soon as possible in next turn.

Thanks,
Inki Dae

> 
> I unfortunately forgot to pull this one, I've rectified that and it is
> now in drm-next.
> 
> Dave.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
