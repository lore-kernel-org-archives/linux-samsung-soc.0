From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 6/7] mfd: cros_ec: Support multiple EC in a system
Date: Thu, 28 May 2015 16:28:29 +0200
Message-ID: <5567260D.6000301@collabora.co.uk>
References: <1432309340-13688-1-git-send-email-javier.martinez@collabora.co.uk> <1432309340-13688-7-git-send-email-javier.martinez@collabora.co.uk> <20150527091154.GX11677@x1> <55671F8F.1090500@collabora.co.uk> <20150528142551.GU11677@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:35338 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753518AbbE1O2h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 May 2015 10:28:37 -0400
In-Reply-To: <20150528142551.GU11677@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>

Hello Lee,

[...]

On 05/28/2015 04:26 PM, Lee Jones wrote:
>> >>  
>> >> +	if (ec_dev->max_passthru) {
>> >> +		/*
>> >> +		 * Register a PD device as well on top of this device.
>> >> +		 * We make the following assumptions:
>> >> +		 * - behind an EC, we have a pd
>> >> +		 * - only one device added.
>> >> +		 * - the EC is responsive at init time (it is not true for a
>> >> +		 *   sensor hub.
>> >> +		 */
>> >> +		err = cros_ec_dev_register(ec_dev, dev_id++, 1);
>> > 
>> > I don't really like this devidx business.  Just keep it simple and
>> > define more than one mfd_cell structure.
>> 
>> I explained to you that this is done because the number of cells depends on
>> the system. I can have an array of mfd_cell structures and use the index to
>> register but I don't think that is easier to understand.
> 
> Keep it simple.  Create a static struct for each and:
> 
> mfd_add_devices(ec_cell)
> 
> if (ec_dev->max_passthru)
>    mfd_add_devices(ec_pd_cell)
>

Ok, will do.

Thanks a lot for your feedback.

Best regards,
Javier
 
