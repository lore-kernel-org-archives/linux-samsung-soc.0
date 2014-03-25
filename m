From: Daniel Drake <drake@endlessm.com>
Subject: exynos-drm HDMI PHY configuration values
Date: Tue, 25 Mar 2014 15:52:05 -0600
Message-ID: <CAD8Lp45XgvjebHn2qNBqftONpO_Y4-iWuB31FoO9Qb7jTmT2ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:54861 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751240AbaCYVwH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Mar 2014 17:52:07 -0400
Received: by mail-we0-f181.google.com with SMTP id q58so767639wes.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Mar 2014 14:52:05 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Sean,

In your commit "drm/exynos: hdmi: support extra resolutions using
drm_display_mode timings"  you added several more HDMI PHY configs to
exynos-drm. Thanks for that.

Can you explain where these magic numbers came from?

I'm interested in adding 85.5MHz for 1366x768 support.

Thanks,
Daniel
