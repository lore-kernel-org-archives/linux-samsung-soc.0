From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/14] drm/exynos: cleanups + atomic phases 1 and 2
Date: Wed, 4 Feb 2015 15:35:44 +0100
Message-ID: <20150204143544.GK14009@phenom.ffwll.local>
References: <1422990871-21355-1-git-send-email-gustavo@padovan.org>
 <54D1CC20.60000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:55572 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932630AbbBDOeW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 09:34:22 -0500
Received: by mail-wi0-f179.google.com with SMTP id l15so4071138wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Feb 2015 06:34:21 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <54D1CC20.60000@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org

Hi all,

I've gone through some of the contentions point in this patch review. With
my community guy hat on I really want to make drm atomic a success, exynos
atomic is important for that.

On Wed, Feb 04, 2015 at 04:37:04PM +0900, Joonyoung Shim wrote:
> Hi,
> 
> On 02/04/2015 04:14 AM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> > 
> > Hi,
> > 
> > This series clean ups a few more paths from exynos-drm with the most important
> > being the removal of the global page flip queue and the removal in driver
> > internal data (struct *_win_data) that was replicating plane data.
> > 
> > Following these patches comes the first step torwards atomic modesetting
> > support on exynos.
> > 
> 
> It's better to split cleanup and atomic support, not one patchset.

Imo the cleanups make perfect sense as prep work for atomic. They're
definitely needed afaict from what I've seen reading exynos code and these
patches here before we can implement atomic.

Personally I'd have delayered even more aggressively before going into the
atomic stuff. But in the end I guess Padovan wants to be able to ship
exynos atomic preferrably sooner than later.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
