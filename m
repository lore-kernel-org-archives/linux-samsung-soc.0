From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 03/10] mfd: cros_ec: Allow static din/dout buffers with cros_ec_register()
Date: Tue, 17 Jun 2014 20:29:53 -0700
Message-ID: <CAPnjgZ3octrMMenuiXYZGTCxRevpLrjUSXOujyVrN1h529PHUA@mail.gmail.com>
References: <1402954800-28215-1-git-send-email-dianders@chromium.org>
	<1402954800-28215-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:59755 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933616AbaFRD3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jun 2014 23:29:55 -0400
Received: by mail-qc0-f177.google.com with SMTP id r5so231595qcx.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jun 2014 20:29:53 -0700 (PDT)
In-Reply-To: <1402954800-28215-4-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>

On 16 June 2014 14:39, Doug Anderson <dianders@chromium.org> wrote:
> From: Bill Richardson <wfrichar@chromium.org>
>
> The lower-level driver may want to provide its own buffers. If so,
> there's no need to allocate new ones.  This already happens to work
> just fine (since we check for size of 0 and use devm allocation), but
> it's good to document it.
>
> [dianders: Resolved conflicts; documented that no code changes needed
> on mainline]
>
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Simon Glass <sjg@chromium.org>
