From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 04/10] mfd: cros_ec: Use a zero-length array for command data
Date: Mon, 11 May 2015 23:47:25 +0200
Message-ID: <4091454.JTEcLO5LxH@phil>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOXj3QvtCWX3WprDpfr2VN2+OpviCbazqr7EBZtt7m_i4g@mail.gmail.com> <55512034.3000206@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:51764 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752268AbbEKVqm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 17:46:42 -0400
In-Reply-To: <55512034.3000206@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Gwendal Grignou <gwendal@chromium.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

> Heiko, Alexandru,
> 
> I don't have access to my Chromebooks right now but could you please test
> the following patch [0] to see if that is the problem?
> 
> It seems I got it working on my test just out of luck since it happened that
> version was initialized to 0 due the data it was on the stack.
> 
> Tomorrow when I've access to the Chromebooks I'll do more extensive testing
> and see if I can reproduce the issue and if my assumption is correct.
> 
> Best regards,
> Javier
> 
> [0]
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c
> b/drivers/input/keyboard/cros_ec_keyb.c index ef3ba20f4560..4f233e248a4d
> 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -151,6 +151,7 @@ static int cros_ec_keyb_get_state(struct cros_ec_keyb
> *ckdev, uint8_t *kb_state) int ret;
>  	struct cros_ec_command *msg = (struct cros_ec_command *)kb_state;
> 
> +	msg->version = 0;
>  	msg->command = EC_CMD_MKBP_STATE;
>  	msg->insize = ckdev->cols;
>  	msg->outsize = 0;

on my rk3288-pinky this seems to fix the issue ... keyboard works out of the 
box again.


Heiko
