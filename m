From: Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v2] drm/exynos: use atomic helper commit
Date: Mon, 23 Jan 2017 09:55:06 -0500
Message-ID: <20170123145506.GA17868@trickycodes.roam.corp.google.com>
References: <CGME20170119101840epcas5p36732799cf9d707abdf6a8f07e5169131@epcas5p3.samsung.com>
 <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
 <5880B5E8.4000309@math.uni-bielefeld.de>
 <5881874A.5050506@samsung.com>
 <58820B33.8050107@math.uni-bielefeld.de>
 <5885C63B.7060606@samsung.com>
 <5885FABB.20909@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36565 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750784AbdAWOzJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 09:55:09 -0500
Received: by mail-qt0-f176.google.com with SMTP id k15so128442192qtg.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2017 06:55:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5885FABB.20909@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

<snip>

> >>> As of now, I don't see any case. even without Maarten's patch set, it works well - actually, I had a test with atomic test app more than 10 hours..
> >> Can you provide this test application? In particular I'm asking this
> >> because libdrm currently doesn't provide any tests using the atomic API.
> >> So this application might be of interest also for other people.
> > 
> > Below is the app I tested. Know that this application is from chromiumOS tree and I just fixed some parts for internal test.
> > https://review.tizen.org/git/?p=atform/upstream/libdrm.git;a=commitdiff;h�3bd95f2c5a9b4b69062a3ff008947054b94f55
> Thanks, any chance this is going to be submitted upstream?
> 

Probably not in its current form. I just wrote it to quickly test out
some stuff we didn't yet support in CrOS. I don't really think it's fit
for inclusion upstream.

Sean

<snip>
