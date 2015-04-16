From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RESEND PATCH 4/8] mfd: cros_ec: Use a zero-length array for command data
Date: Thu, 16 Apr 2015 11:45:42 +0200
Message-ID: <3714344.xf4aIv3C10@diego>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-5-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:55835 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753443AbbDPJpz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 05:45:55 -0400
In-Reply-To: <1428336906-14906-5-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Am Montag, 6. April 2015, 18:15:02 schrieb Javier Martinez Canillas:
> Commit 1b84f2a4cd4a ("mfd: cros_ec: Use fixed size arrays to transfer
> data with the EC") modified the struct cros_ec_command fields to not
> use pointers for the input and output buffers and use fixed length
> arrays instead.
> 
> This change was made because the cros_ec ioctl API uses that struct
> cros_ec_command to allow user-space to send commands to the EC and
> to get data from the EC. So using pointers made the API not 64-bit
> safe. Unfortunately this approach was not flexible enough for all
> the use-cases since there may be a need to send larger commands
> on newer versions of the EC command protocol.
> 
> So to avoid to choose a constant length that it may be too big for
> most commands and thus wasting memory and CPU cycles on copy from
> and to user-space or having a size that is too small for some big
> commands, use a zero-length array that is both 64-bit safe and
> flexible. The same buffer is used for both output and input data
> so the maximum of these values should be used to allocate it.
> 
> Suggested-by: Gwendal Grignou <gwendal@chromium.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---

[...]

>  /* Module initialization */
> @@ -269,3 +301,4 @@ void ec_dev_sysfs_remove(struct cros_ec_device *ec)
>  {
>  	sysfs_remove_group(&ec->vdev->kobj, &ec_attr_group);
>  }
> +

.git/rebase-apply/patch:893: new blank line at EOF.


> diff --git a/include/linux/mfd/cros_ec.h b/include/linux/mfd/cros_ec.h
> index 14cf522123dd..7eee38abd02a 100644
> --- a/include/linux/mfd/cros_ec.h
> +++ b/include/linux/mfd/cros_ec.h
