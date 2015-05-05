From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 1/8] mfd: cros ec: Remove parent field
Date: Tue, 05 May 2015 11:06:50 +0200
Message-ID: <5548882A.50400@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-2-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOV3PxRqeHtMsDvqOaCLX7QpJ-ncvrfES_oixWAG1ZkDQg@mail.gmail.com> <20150429103734.GU9169@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34308 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031094AbbEEJG4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 May 2015 05:06:56 -0400
In-Reply-To: <20150429103734.GU9169@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Gwendal Grignou <gwendal@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Lee,

On 04/29/2015 12:37 PM, Lee Jones wrote:
> On Thu, 23 Apr 2015, Gwendal Grignou wrote:
> 
>> Be consistent, use cros_ec instead of "cros ec" or "cros-ec".
> 
> What is this in reference to?
>

I think Gwendal meant that I should be consistent in general and was not
referring to this patch particular.
 
>> Otherwise:
>> 
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>> 
>> On Mon, Apr 6, 2015 at 9:14 AM, Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> wrote:
>> > From: Gwendal Grignou <gwendal@chromium.org>
>> >
>> > parent and dev were pointing to the same device structure.
>> > parent is unused, removed.
>> >
>> > Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
>> > Reviewed-by: Stephen Barber <smbarber@chromium.org>
>> > Tested-by: Stephen Barber <smbarber@chromium.org>
>> > Reviewed-by: Puthikorn Voravootivat <puthik@chromium.org>
>> > Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> > ---
>> >  drivers/mfd/cros_ec_i2c.c             | 1 -
>> >  drivers/mfd/cros_ec_spi.c             | 1 -
>> >  drivers/platform/chrome/cros_ec_lpc.c | 1 -
>> >  include/linux/mfd/cros_ec.h           | 2 --
>> >  4 files changed, 5 deletions(-)
> 
> For when you re-submit:
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>
> 

Thanks a lot for your ack.

Best regards,
Javier
