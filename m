From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND v9 1/5] rtc: max77686: Allow the max77686 rtc to
 wakeup the system
Date: Fri, 12 Sep 2014 15:05:37 -0700
Message-ID: <20140912150537.56419981804c68f9108a22b6@linux-foundation.org>
References: <1410509864-10019-1-git-send-email-javier.martinez@collabora.co.uk>
	<1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56429 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752879AbaILWFj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 18:05:39 -0400
In-Reply-To: <1410509864-10019-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Fri, 12 Sep 2014 10:17:39 +0200 Javier Martinez Canillas <javier.martinez@collabora.co.uk> wrote:

> From: Doug Anderson <dianders@chromium.org>
> 
> The max77686 includes an RTC that keeps power during suspend.  It's
> convenient to be able to use it as a wakeup source.
> 
> NOTE: due to wakeup ordering problems this patch alone doesn't work so
> well on exynos5250-snow.  You also need something that brings the i2c
> bus up before the max77686 wakeup runs.

I removed this paragraph.

> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

And I rewrote this to Signed-off-by:, as you were on the patch delivery
path. Documentation/SubmittingPatches section 12 has the gory details.
