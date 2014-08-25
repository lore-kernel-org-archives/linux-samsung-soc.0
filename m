From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 1/2] i2c: cros-ec-tunnel: Add of match table
Date: Mon, 25 Aug 2014 11:37:01 +0200
Message-ID: <CABxcv==yuxBmed5pZMwfQTXkwpbW1WkXw58tLsBF16BH60-jAQ@mail.gmail.com>
References: <1408748582-29029-1-git-send-email-sjoerd.simons@collabora.co.uk>
	<1408748582-29029-2-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:52772 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222AbaHYJhD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 05:37:03 -0400
Received: by mail-wg0-f42.google.com with SMTP id l18so12731644wgh.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Aug 2014 02:37:01 -0700 (PDT)
In-Reply-To: <1408748582-29029-2-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Doug Anderson <dianders@chromium.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello Sjoerd,

On Sat, Aug 23, 2014 at 1:03 AM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> To enable the cros-ec-tunnel driver to be auto-loaded when build as a
> module add an of match table (and export it) to match the modalias
> information passed on to userspace as the Cros EC MFD driver registers
> the MFD subdevices with an of_compatibility string.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> ---

Looks good to me:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
