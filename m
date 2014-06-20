From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 05/10] mfd: cros_ec: Use struct cros_ec_command to
 communicate with the EC
Date: Thu, 19 Jun 2014 21:40:55 -0600
Message-ID: <CAPnjgZ0VfWx6EFrqPZ71OCr7K+fBQ0STBYAbXPTaL4bsbQ3qow@mail.gmail.com>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
	<1403115247-8853-6-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f179.google.com ([209.85.216.179]:50499 "EHLO
	mail-qc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753775AbaFTDk4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 23:40:56 -0400
Received: by mail-qc0-f179.google.com with SMTP id x3so2991432qcv.38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 20:40:55 -0700 (PDT)
In-Reply-To: <1403115247-8853-6-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>

On 18 June 2014 12:14, Doug Anderson <dianders@chromium.org> wrote:
> From: Bill Richardson <wfrichar@chromium.org>
>
> This is some internal structure reorganization / renaming to prepare
> for future patches that will add a userspace API to cros_ec.  There
> should be no visible changes.
>
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Simon Glass <sjg@chromium.org>
