From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v10 17/17] drm/exynos: split exynos_crtc->dpms in enable()
 and disable()
Date: Tue, 2 Jun 2015 16:19:17 +0200
Message-ID: <CABxcv=kwcnjudw0vQ1gHcoNfDC4xQGMu_WJTZ3_vhcxG70R02Q@mail.gmail.com>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
	<1433171095-23773-18-git-send-email-gustavo@padovan.org>
	<556D9D0D.6010408@samsung.com>
	<20150602140623.GF20774@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f169.google.com ([209.85.160.169]:34775 "EHLO
	mail-yk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759060AbbFBOTS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jun 2015 10:19:18 -0400
Received: by ykfl8 with SMTP id l8so54138867ykf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2015 07:19:18 -0700 (PDT)
In-Reply-To: <20150602140623.GF20774@joana>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, Inki Dae <inki.dae@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hello Gustavo,

On Tue, Jun 2, 2015 at 4:06 PM, Gustavo Padovan <gustavo@padovan.org> w=
rote:
> Hi Inki,
>
> 2015-06-02 Inki Dae <inki.dae@samsung.com>:
>
>> Hi,
>>
>> On 2015=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:04, Gustavo Padovan wrot=
e:
>> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>> >
>> > To follow more closely the new atomic API we split the dpms()
>> > helper into the enable() and disable() helper to get exactly the
>> > same semantics.
>>
>> Below is the result from checkpatch.pl. Please fix all errors and ch=
eck
>> your patch with checkpatch.pl before posting it.
>>
>> Thanks,
>> Inki Dae
>>
>> total: 62 errors, 0 warnings, 410 lines checked
>
> I think you did something wrong when checking, for me it looks like
> this:
>
> 0016-drm-exynos-split-exynos_crtc-dpms-in-enable-and-disa.patch has n=
o
> obvious style problems and is ready for submission.
> WARNING: Do not use whitespace before Signed-off-by:
> #12:
>     Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
>
> total: 0 errors, 1 warnings, 594 lines checked
>

I also don't get any checkpatch.pl error or warnings when testing your =
patch:

$ pwclient get 6523251
Saved patch to v10-17-17-drm-exynos-split-exynos_crtc--dpms-in-enable-a=
nd-disable.patch.0

$ ./scripts/checkpatch.pl
v10-17-17-drm-exynos-split-exynos_crtc--dpms-in-enable-and-disable.patc=
h
total: 0 errors, 0 warnings, 410 lines checked

v10-17-17-drm-exynos-split-exynos_crtc--dpms-in-enable-and-disable.patc=
h
has no obvious style problems and is ready for submission.

>         Gustavo

Best regards,
Javier
