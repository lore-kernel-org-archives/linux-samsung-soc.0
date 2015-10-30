From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 06/13] tests/exynos: add fimg2d event test
Date: Fri, 30 Oct 2015 11:24:38 +0000
Message-ID: <CACvgo52ax76mKOsYX6p9UEw8n2m-7OjmMYEbiFw8G1E7hOTp3g@mail.gmail.com>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1442937302-8211-7-git-send-email-tjakobi@math.uni-bielefeld.de>
	<20151030155043.35acb278@hwh-ubuntu>
	<5633519F.60607@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:36762 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030730AbbJ3LYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 07:24:39 -0400
Received: by igdg1 with SMTP id g1so9197459igd.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 04:24:38 -0700 (PDT)
In-Reply-To: <5633519F.60607@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Hyungwon Hwang <human.hwang@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

On 30 October 2015 at 11:16, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello Hyungwon,
>
> first of all thanks for reviewing the series!
>
>
>
> Hyungwon Hwang wrote:
>> On Tue, 22 Sep 2015 17:54:55 +0200
>> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>>

>>> +    evhandler->evctx.base.version = DRM_EVENT_CONTEXT_VERSION;
>>> +    evhandler->evctx.version = EXYNOS_EVENT_CONTEXT_VERSION;
>>
>> The versions must be set not using XXX_EVENT_CONTEXT_VERSION. After the
>> versions are bumped, the event will contains wrong version info.
> Hmm, I don't see how this is true. Both DRM_EVENT_CONTEXT_VERSION and
> EXYNOS_EVENT_CONTEXT_VERSION come from the public libdrm header. If the
> version in the public header is bumped, then it's also bumped here. So I
> don't see the issue.
>
The issue is that the public header defines the interface available,
while you set the version that you implement. Currently those match,
but if/when we expand the API (bumping the version in the header) and
rebuild your program we will crash.

Before you ask - yes current libdrm users are not doing the right
thing and should be updated one of these days.

-Emil
P.S. Having some deja-vu here... I thought I mentioned this a while back.
