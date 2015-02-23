From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 12/15] exynos: add fimg2d header to common includes
Date: Mon, 23 Feb 2015 11:19:08 +0000
Message-ID: <54EB0CAC.5030801@gmail.com>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1424094405-6314-13-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:44623 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341AbbBWLTF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Feb 2015 06:19:05 -0500
Received: by mail-wg0-f51.google.com with SMTP id y19so24896855wgg.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Feb 2015 03:19:04 -0800 (PST)
In-Reply-To: <1424094405-6314-13-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, robclark@freedesktop.org, m.szyprowski@samsung.com

On 16/02/15 13:46, Tobias Jakobi wrote:
> The reason for this change is to let userspace use the header.
> Currently 'make install' does not install it.
> 
Hi Tobias,

Afaict that this was done intentionally. I believe the Samsung guys got
this out only to fulfil the "no drm(render) driver without open
userspace" policy.

Although it's nice to see actual user(s) (outside of libdrm) perhaps the
header could be cleaned up (#define TRUE 0, #define FALSE -1) a bit
before that ?

Either way it's up-to the Samsung/Exynos people to make the call.

Cheers
Emil
