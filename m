From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos: remove DRM_EXYNOS_GEM_MAP_OFFSET ioctl
Date: Thu, 02 Oct 2014 12:28:25 +0200
Message-ID: <542D28C9.30809@gmail.com>
References: <1410961726-2533-1-git-send-email-inki.dae@samsung.com> <1410961726-2533-2-git-send-email-inki.dae@samsung.com> <542C1A16.6030809@gmail.com> <542C9280.9050800@samsung.com> <542D2824.9020208@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:60568 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750987AbaJBK23 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Oct 2014 06:28:29 -0400
Received: by mail-wi0-f178.google.com with SMTP id cc10so3490556wib.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Oct 2014 03:28:28 -0700 (PDT)
In-Reply-To: <542D2824.9020208@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

On 02.10.2014 12:25, Inki Dae wrote:
> On 2014=EB=85=84 10=EC=9B=94 02=EC=9D=BC 08:47, Joonyoung Shim wrote:
>> Hi Tomasz,
>>
>> On 10/02/2014 12:13 AM, Tomasz Figa wrote:
>>> Hi Inki,
>>>
>>> On 17.09.2014 15:48, Inki Dae wrote:
>>>> This interface and relevant codes aren't used anymore.
>>>>
>>>
>>> Hmm, I might be missing something, but after removing this IOCTL, h=
ow do
>>> we obtain an offset to pass to mmap()?
>>
>> There is DRM_IOCTL_MODE_MAP_DUMB, it can get mmap offset before mmap=
 and
>> the offset is passed via mmap.
>=20
> Exactly. That will lead us to more generic world.

OK. Thanks Joonyoung, Inki, for quick response. I was confused by name
of this IOCTL. I'll modify my code to use it.

Best regards,
Tomasz
