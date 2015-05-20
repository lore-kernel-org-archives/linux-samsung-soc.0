From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 04/10] mfd: cros_ec: Use a zero-length array for command
 data
Date: Wed, 20 May 2015 09:43:39 +0200
Message-ID: <555C3B2B.7060703@collabora.co.uk>
References: <1431166241-15775-1-git-send-email-javier.martinez@collabora.co.uk> <1431166241-15775-5-git-send-email-javier.martinez@collabora.co.uk> <20150513111034.GH3394@x1> <55533785.7080303@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53873 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923AbbETHnr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 03:43:47 -0400
In-Reply-To: <55533785.7080303@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, Alexandru M Stan <amstan@chromium.org>, Heiko Stuebner <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Lee,

On 05/13/2015 01:37 PM, Javier Martinez Canillas wrote:
> 
> On 05/13/2015 01:10 PM, Lee Jones wrote:
>> On Sat, 09 May 2015, Javier Martinez Canillas wrote:
>> 
>>> Commit 1b84f2a4cd4a ("mfd: cros_ec: Use fixed size arrays to transfer
>>> data with the EC") modified the struct cros_ec_command fields to not
>>> use pointers for the input and output buffers and use fixed length
>>> arrays instead.
>>> 
>>> This change was made because the cros_ec ioctl API uses that struct
>>> cros_ec_command to allow user-space to send commands to the EC and
>>> to get data from the EC. So using pointers made the API not 64-bit
>>> safe. Unfortunately this approach was not flexible enough for all
>>> the use-cases since there may be a need to send larger commands
>>> on newer versions of the EC command protocol.
>>> 
>>> So to avoid to choose a constant length that it may be too big for
>>> most commands and thus wasting memory and CPU cycles on copy from
>>> and to user-space or having a size that is too small for some big
>>> commands, use a zero-length array that is both 64-bit safe and
>>> flexible. The same buffer is used for both output and input data
>>> so the maximum of these values should be used to allocate it.
>>> 
>>> Suggested-by: Gwendal Grignou <gwendal@chromium.org>
>>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
>>> 
>>> Changes since v1:
>>>  - Add Heiko Stuebner Tested-by tag
>>>  - Removed a new blank line at EOF warning. Reported by Heiko Stuebner
>>>  - Use kmalloc instead of kzalloc when the message is later initialized
>>>    Suggested by Gwendal Grignou
>>>  - Pre-allocate struct cros_ec_command instead of dynamically allocate it
>>>    whenever is possible. Suggested by Gwendal Grignou
>>>  - Pre-allocate buffers for the usual cases and only allocate dynamically
>>>    in the heap for bigger sizes. Suggested by Gwendal Grignou
>>>  - Don't access the cros_ec_command received from user-space before doing
>>>    a copy_from_user. Suggested by Gwendal Grignou
>>>  - Only copy from user-space outsize bytes and copy_to_user insize bytes
>>>    Suggested by Gwendal Grignou
>>>  - ec_device_ioctl_xcmd() must return the numbers of bytes read and not 0
>>>    on success. Suggested by Gwendal Grignou
>>>  - Rename alloc_cmd_msg to alloc_lightbar_cmd_msg. Suggested by Gwendal Grignou
>>> ---
>>>  drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  59 ++++++++---
>>>  drivers/input/keyboard/cros_ec_keyb.c      |  19 ++--
>>>  drivers/mfd/cros_ec.c                      |  18 ++--
>>>  drivers/mfd/cros_ec_i2c.c                  |   4 +-
>>>  drivers/mfd/cros_ec_spi.c                  |   2 +-
>>>  drivers/platform/chrome/cros_ec_dev.c      |  66 +++++++++----
>>>  drivers/platform/chrome/cros_ec_lightbar.c | 152 +++++++++++++++++++----------
>>>  drivers/platform/chrome/cros_ec_lpc.c      |   8 +-
>>>  drivers/platform/chrome/cros_ec_sysfs.c    |  92 +++++++++--------
>>>  include/linux/mfd/cros_ec.h                |   6 +-
>>>  10 files changed, 273 insertions(+), 153 deletions(-)
>> 
>> [...]
>> 
>>> diff --git a/drivers/mfd/cros_ec.c b/drivers/mfd/cros_ec.c
>>> index 1574a9352a6d..ee8aa8142932 100644
>>> --- a/drivers/mfd/cros_ec.c
>>> +++ b/drivers/mfd/cros_ec.c
>>> @@ -41,7 +41,7 @@ int cros_ec_prepare_tx(struct cros_ec_device *ec_dev,
>>>  	out[2] = msg->outsize;
>>>  	csum = out[0] + out[1] + out[2];
>>>  	for (i = 0; i < msg->outsize; i++)
>>> -		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->outdata[i];
>>> +		csum += out[EC_MSG_TX_HEADER_BYTES + i] = msg->data[i];
>>>  	out[EC_MSG_TX_HEADER_BYTES + msg->outsize] = (uint8_t)(csum & 0xff);
>>>  
>>>  	return EC_MSG_TX_PROTO_BYTES + msg->outsize;
>>> @@ -75,11 +75,13 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
>>>  	ret = ec_dev->cmd_xfer(ec_dev, msg);
>>>  	if (msg->result == EC_RES_IN_PROGRESS) {
>>>  		int i;
>>> -		struct cros_ec_command status_msg = { };
>>> +		struct cros_ec_command *status_msg;
>>>  		struct ec_response_get_comms_status *status;
>>> +		u8 buf[sizeof(*status_msg) + sizeof(*status)] = { };
>> 
>> This sort of thing is usually frowned upon.  Can you allocate and free
>> buf's memory using the normal kernel helpers please?
>>
> 
> The first version of this patch used kmalloc (actually kzalloc) and kfree
> to allocate and free the buffers but Gwendal suggested that we could
> allocate in the stack instead as an optimization [0].
> 
> I have no strong opinion on this so I'm happy to change it again when
> re-spinning the patches.
>

[snip]

> 
> [0]: https://lkml.org/lkml/2015/4/24/8
> 

You didn't answer if you agree with Gwendal that we can allocate things on
the stack or if you still prefer to use kmalloc/kfree. As I said I don't
have a strong argument on either approach but just want to agree to avoid
doing the same change on each revision.

Best regards,
Javier
