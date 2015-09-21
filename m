From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 00/10] drm/exynos: add pm_runtime support
Date: Mon, 21 Sep 2015 09:50:12 +0200
Message-ID: <55FFB6B4.8060605@samsung.com>
References: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:35065 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755989AbbIUHuj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 03:50:39 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1Zdvrx-0002fa-4r
	for linux-samsung-soc@vger.kernel.org; Mon, 21 Sep 2015 09:50:37 +0200
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2015 09:50:37 +0200
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Sep 2015 09:50:37 +0200
In-Reply-To: <1441397752-6672-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

On 09/04/2015 10:15 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Hi,
> 
> This series adds proper runtime PM suport to CRTCs and Encoders, so
> now instead of relying on 'suspended' or 'enabled' flags to track when
> the CRTC or Encoder is enabled we let the pm_runtime subsystem do it for us
> and remove all the flags. This is a important step to the atomic suspend/resume
> support that will land in drm anytime soon.
> 
> Please review!
> 
> 	Gustavo

The title is quite misleading, exynos_drm has already pm_runtime support :)
Could you explain more why do you want to change it, what are requirements of
atomic pm? What is wrong with the current one?

If I remember correctly one of arguments for replacing pm callbacks in
components by one centralized callback in exynos_drm_drv was to avoid issues
with non-deterministic order of calling components suspend callback.
Are there any recent changes in PM, DRM which invalidates the reason above?

On the other side your patchset adds implicit dependency on PM_SLEEP config
option, it should be avoided or at least it should be explicit.

Regards
Andrzej
