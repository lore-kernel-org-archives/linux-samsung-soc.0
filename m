From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 06/13] tests/exynos: add fimg2d event test
Date: Fri, 30 Oct 2015 12:31:51 +0000
Message-ID: <CACvgo52xNr9yCxV+dAGhxHBtHuPv=fgzhAzKHvsCFY7Eh4AXJg@mail.gmail.com>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
	<1442937302-8211-7-git-send-email-tjakobi@math.uni-bielefeld.de>
	<20151030155043.35acb278@hwh-ubuntu>
	<5633519F.60607@math.uni-bielefeld.de>
	<CACvgo52ax76mKOsYX6p9UEw8n2m-7OjmMYEbiFw8G1E7hOTp3g@mail.gmail.com>
	<5633546C.5090601@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:34302 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbbJ3Mbw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 08:31:52 -0400
Received: by igpw7 with SMTP id w7so9028555igp.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Oct 2015 05:31:51 -0700 (PDT)
In-Reply-To: <5633546C.5090601@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Hyungwon Hwang <human.hwang@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>

On 30 October 2015 at 11:28, Tobias Jakobi
<tjakobi@math.uni-bielefeld.de> wrote:
> Hello Emil,
>
>
> Emil Velikov wrote:
>> On 30 October 2015 at 11:16, Tobias Jakobi
>> <tjakobi@math.uni-bielefeld.de> wrote:
>>> Hello Hyungwon,
>>>
>>> first of all thanks for reviewing the series!
>>>
>>>
>>>
>>> Hyungwon Hwang wrote:
>>>> On Tue, 22 Sep 2015 17:54:55 +0200
>>>> Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>>>>
>>
>>>>> +    evhandler->evctx.base.version = DRM_EVENT_CONTEXT_VERSION;
>>>>> +    evhandler->evctx.version = EXYNOS_EVENT_CONTEXT_VERSION;
>>>>
>>>> The versions must be set not using XXX_EVENT_CONTEXT_VERSION. After the
>>>> versions are bumped, the event will contains wrong version info.
>>> Hmm, I don't see how this is true. Both DRM_EVENT_CONTEXT_VERSION and
>>> EXYNOS_EVENT_CONTEXT_VERSION come from the public libdrm header. If the
>>> version in the public header is bumped, then it's also bumped here. So I
>>> don't see the issue.
>>>
>> The issue is that the public header defines the interface available,
>> while you set the version that you implement. Currently those match,
>> but if/when we expand the API (bumping the version in the header) and
>> rebuild your program we will crash.
> Hmm, I'm still not sure I understand this. Do you mean rebuilding the
> tests out-of-tree and then running them against a newer/older libdrm
> version?
>
> Because from my understanding the tests are always build together with
> libdrm anyway. Or am I misunderstanding here something?
>
We're not talking about building out of tree or anything like that
here. The following example should illustrate what I have in mind.
Greatly appreciated if you can explain it in your own words.


Currently

* xf86drm.h
#define DRM_EVENT_CONTEXT_VERSION 2
struct drmEventContext {
   int version;
   ...
   void (*page_flip_handler)(...);
}

* user
struct foo {
   .version = ...VERSION // 2
   ...
}


API bump

* xf86drm.h
#define DRM_EVENT_CONTEXT_VERSION 3
struct drmEventContext {
   int version;
   ...
   void (*page_flip_handler)(...);
   void (*page_flip_handler2)(...);
}

* user (hasn't been updated, only rebuilt)
struct foo {
   .version = ...VERSION // 3
   ...
   .page_flip_handler2 = 0 // ... or garbage.
}


* xf86drmMode.c
int drmHandleEvent(...)
{
...
if (foo.version >= 3)
   foo.page_flip_handler2(); // boom !
else
   foo.page_flip_handler();
...
}


Also worth mentioning is that the issue is rather wide spread rather
than limited to libdrm :'(

>
>> Before you ask - yes current libdrm users are not doing the right
>> thing and should be updated one of these days.
> Maybe a dumb question, but what would be the right thing to do in may case.
>
> Define my own MY_XZY_EVENT_CONTEXT_VERSION and use these?
>
No need for extra defines imho. Just set the versions to 2 and 1 for
evctx.base.version and evctx.version respectively.


Glad to see some of the Samsung/Exynos people looking this way :-)

Regards,
Emil
