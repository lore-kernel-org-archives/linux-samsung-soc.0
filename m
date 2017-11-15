From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [GIT PULL] exynos-drm-next
Date: Thu, 16 Nov 2017 07:51:29 +0900
Message-ID: <5A0CC4F1.4090505@samsung.com>
References: <CGME20171026013709epcas2p2525d1249a7f2ad640ce9028df12e2436@epcas2p2.samsung.com>
        <1508981828-5178-1-git-send-email-inki.dae@samsung.com>
        <CAPM=9ty-Boo8mjREQ8T2AaGYoU5ZcAu70iQpwJy_oawZxoS+Pg@mail.gmail.com>
        <5A0B97D5.1090202@samsung.com>
        <CAPj87rNTgnoE49k4bbrj=gyZsWVE9p6jxboLX0OSmw5V-kpt2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56091 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753936AbdKOWvd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 17:51:33 -0500
In-reply-to: <CAPj87rNTgnoE49k4bbrj=gyZsWVE9p6jxboLX0OSmw5V-kpt2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Stone <daniel@fooishbar.org>
Cc: Dave Airlie <airlied@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Daniel,

2017년 11월 15일 19:27에 Daniel Stone 이(가) 쓴 글:
> Hi Inki,
> 
> On 15 November 2017 at 01:26, Inki Dae <inki.dae@samsung.com> wrote:
>> 2017년 11월 14일 13:22에 Dave Airlie 이(가) 쓴 글:
>>> On 26 October 2017 at 11:37, Inki Dae <inki.dae@samsung.com> wrote:
>>>>    Ps. we are reviewing IPP v2 driver[1] which controls post processor devices
>>>>        such as FIMC, GScaler and Rotator of Exynos SoC. So I plan to request
>>>>        git pull one more time after review.
>>>
>>> I dropped the ball a bit here, I do think the second pull with IPP is
>>> probably a bit late,
>>> I think I'd like more assurance that the UAPI for IPP is to be used in
>>> some upstream
>>> shipping project (forks of mpv not withstanding, unless this fork
>>> ships in some distro
>>> or product).
>>
>> I also commented same thing internally to author - Marek - of IPP v2 but I thought existing one is really ugly thing so may be better to change it as soon as possible before other users use this one.
>> Anyway, we will merge user space for IPP v2 to libdrm first, and then Linux platform. I hope IPPv2 would be merged as soon as possible in next turn.
> 
> This is putting the cart before the horse a little bit. This is the
> process for merging new DRM API:
> 
> Prepare the kernel and libdrm/etc patches exposing the new API, and
> also develop a _real_ user for it. Using IPP as an example, an
> acceptable userspace would be VLC, Kodi, Weston, Xorg, or similar.
> libdrm sample clients are explicitly not enough for this.
> 
> Once this is done, you should get review/ack for all of these. The
> kernel code and API should have review for good API (see for example
> Daniel Vetter's 'botching up ioctls' documentation) and code, and the
> userspace (VLC/Kodi/...) should have review for both code correctness
> as well as an explicit check from the userspace side that they feel it
> is good API which works for them. If the work just exists in a fork
> which has not got real upstream review, this is also not enough.
> 
> When all parts have review, you can merge the new kernel API with a
> pointer to the userspace review, explicitly stating that they feel it
> is acceptable. Once the kernel code has landed in a non-rebasing tree
> (one which Dave will be sending as a pull), libdrm code can be merged,
> and then the userspace code can finally be merged.

I know that. Before requesting git-pull I commented like below to the author,
"I think other maintainer will require real user space - not thing like libdrm - which uses new ABI.
The solution I think would be to apply the new ABI to tdm exynos backend of Tizen platform below,
https://review.tizen.org/git/?p=platform/adaptation/samsung_exynos/libtdm-exynos.git;a=blob;f=src/tdm_exynos_pp.c;h=db20e6f226d313672d1d468e06d80526ea30121c;hb=refs/heads/tizen"

Anyway, Linux platform I mentioned is _real_ user, Tizen[1], for it. Sorry about it. I didn't comment exactly what is the Linux platform.
And thanks for explanation.

[1] https://www.tizen.org/

Thanks,
Inki Dae

> 
> Cheers,
> Daniel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
