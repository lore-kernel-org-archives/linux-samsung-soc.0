From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v2 08/10] mfd: cros_ec: Check result code from EC messages
Date: Thu, 19 Jun 2014 21:42:12 -0600
Message-ID: <CAPnjgZ1TbeTNMAvJOUAMi5t3_AEUMHptex=aR08iX5-ZLcsxoQ@mail.gmail.com>
References: <1403115247-8853-1-git-send-email-dianders@chromium.org>
	<1403115247-8853-9-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f176.google.com ([209.85.216.176]:53516 "EHLO
	mail-qc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933718AbaFTDmM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 23:42:12 -0400
Received: by mail-qc0-f176.google.com with SMTP id w7so3018054qcr.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 20:42:12 -0700 (PDT)
In-Reply-To: <1403115247-8853-9-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Sonny Rao <sonnyrao@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Bill Richardson <wfrichar@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, lk <linux-kernel@vger.kernel.org>

On 18 June 2014 12:14, Doug Anderson <dianders@chromium.org> wrote:
> From: Bill Richardson <wfrichar@chromium.org>
>
> Just because the host was able to talk to the EC doesn't mean that the EC
> was happy with what it was told. Errors in communincation are not the same
> as error messages from the EC itself.
>
> This change lets the EC report its errors separately.
>
> [dianders: Added common function to cros_ec.c]
>
> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

This is better.

Reviewed-by: Simon Glass <sjg@chromium.org>
