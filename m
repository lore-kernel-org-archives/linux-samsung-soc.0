From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 08/14] drm/exynos: atomic phase 1: add
 atomic_begin()/atomic_flush()
Date: Thu, 5 Feb 2015 10:18:54 +0100
Message-ID: <20150205091854.GP14009@phenom.ffwll.local>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <1422990871-21355-9-git-send-email-gustavo@padovan.org>
 <54D1CF05.8000804@samsung.com>
 <20150204143052.GI14009@phenom.ffwll.local>
 <54D2D9F2.2060505@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:41624 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756693AbbBEJRc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Feb 2015 04:17:32 -0500
Received: by mail-we0-f173.google.com with SMTP id w62so6484929wes.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Feb 2015 01:17:31 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D2D9F2.2060505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

On Thu, Feb 05, 2015 at 11:48:18AM +0900, Joonyoung Shim wrote:
> Hi Daniel,
> 
> On 02/04/2015 11:30 PM, Daniel Vetter wrote:
> > On Wed, Feb 04, 2015 at 04:49:25PM +0900, Joonyoung Shim wrote:
> >> Hi,
> >>
> >> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
> >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>>
> >>> Add CRTC callbacks .atomic_begin() .atomic_flush(). On exynos they
> >>> unprotect the windows before the commit and protects it after based on
> >>> a plane mask tha store which plane will be updated.
> >>>
> >>
> >> I don't think they need now.
> > 
> > This does exactly what I wanted to do in my atomic poc but couldn't
> > because of the massive layer hell that was still around in atomic. Haven't
> > looked into the patch in details, so no full r-b but good enough for an
> > 
> 
> I agree about its operation but i think it is unnecessary now. Because
> it's exactly same operation with current codes.

Well that's to be expected since if you don't want to have some duplicated
code while transitioning to atomic you must do it all in one giant patch.
With a bit of duplication you can move things over slowly, in differnt
phases and piece by piece like Padovan's patch series here. The
duplication should go away in the end again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
