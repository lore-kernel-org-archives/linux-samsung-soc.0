From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: use atomic helper commit
Date: Tue, 24 Jan 2017 08:49:37 +0900
Message-ID: <58869691.60307@samsung.com>
References: <CGME20170119101840epcas5p36732799cf9d707abdf6a8f07e5169131@epcas5p3.samsung.com>
 <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
 <5880B5E8.4000309@math.uni-bielefeld.de> <5881874A.5050506@samsung.com>
 <58820B33.8050107@math.uni-bielefeld.de> <5885C63B.7060606@samsung.com>
 <5885FABB.20909@math.uni-bielefeld.de>
 <20170123145506.GA17868@trickycodes.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60764 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751055AbdAWXtk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 18:49:40 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK900BKDBIQ17A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jan 2017 08:49:38 +0900 (KST)
In-reply-to: <20170123145506.GA17868@trickycodes.roam.corp.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org


2017년 01월 23일 23:55에 Sean Paul 이(가) 쓴 글:
> <snip>
> 
>>>>> As of now, I don't see any case. even without Maarten's patch set, it works well - actually, I had a test with atomic test app more than 10 hours..
>>>> Can you provide this test application? In particular I'm asking this
>>>> because libdrm currently doesn't provide any tests using the atomic API.
>>>> So this application might be of interest also for other people.
>>>
>>> Below is the app I tested. Know that this application is from chromiumOS tree and I just fixed some parts for internal test.
>>> https://review.tizen.org/git/?p=atform/upstream/libdrm.git;a=commitdiff;h�3bd95f2c5a9b4b69062a3ff008947054b94f55
>> Thanks, any chance this is going to be submitted upstream?
>>
> 
> Probably not in its current form. I just wrote it to quickly test out
> some stuff we didn't yet support in CrOS. I don't really think it's fit
> for inclusion upstream.

Sean Paul, do you have any update about this test app? I'd be glad if you could share it.
For the verification of atomic kms interfaces, I tried to find proper solution before making new one and this is what I found out.

And another story. Do you know which use case CrOS has for use of atomic KMS? I'm trying to apply atomic KMS on Tizen platform - this platform uses Enlightenment as Wayland server.
I had a dicussion with a Platform guy for it but I didn't find any use case for atomic KMS. And I guess Android has such use case. For this they would use ADF framework maybe.
Can you share some detail with me if you know it?

Thanks.

> 
> Sean
> 
> <snip>
> 
> 
