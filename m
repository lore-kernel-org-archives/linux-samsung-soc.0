From: Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v5 4/7] platform/chrome: Add Chrome OS EC userspace device interface
Date: Wed, 25 Feb 2015 17:13:58 -0800
Message-ID: <CAMHSBOXOLrvkhWgF=hF8tB+yeakVUbTkTi-8ZvC2aAFtMEw_1A@mail.gmail.com>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
 <1422876388-16540-5-git-send-email-javier.martinez@collabora.co.uk> <20150226005425.GA3101@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:38272 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752920AbbBZBO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Feb 2015 20:14:26 -0500
Received: by mail-vc0-f171.google.com with SMTP id kv19so2871376vcb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Feb 2015 17:14:25 -0800 (PST)
In-Reply-To: <20150226005425.GA3101@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Olof,

I think the way Javier did it is fine, the 'major' of the ioctl is
0xEC, from ':'.

Gwendal.

On Wed, Feb 25, 2015 at 4:54 PM, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Feb 02, 2015 at 12:26:25PM +0100, Javier Martinez Canillas wrote:
>> From: Bill Richardson <wfrichar@chromium.org>
>>
>> This patch adds a device interface to access the
>> Chrome OS Embedded Controller from user-space.
>>
>> Signed-off-by: Bill Richardson <wfrichar@chromium.org>
>> Reviewed-by: Simon Glass <sjg@google.com>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>> ---
>>
>> Changes since v4: None.
>>
>> Changes since v3: None.
>>
>> Changes since v2:
>>  - Rename the devname to "cros-ec-ctl". Suggested by Lee Jones.
>>  - Added Gwendal Grignou Reviewed-by tag.
>>
>> Changes since v1: None, new patch.
>
> Hi,
>
>> ---
>>  Documentation/ioctl/ioctl-number.txt  |   1 +
>>  drivers/platform/chrome/Kconfig       |  14 +-
>>  drivers/platform/chrome/Makefile      |   1 +
>>  drivers/platform/chrome/cros_ec_dev.c | 268 ++++++++++++++++++++++++++++++++++
>>  drivers/platform/chrome/cros_ec_dev.h |  47 ++++++
>>  5 files changed, 328 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/platform/chrome/cros_ec_dev.c
>>  create mode 100644 drivers/platform/chrome/cros_ec_dev.h
>>
>> diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
>> index 8136e1fd30fd..51f4221657bf 100644
>> --- a/Documentation/ioctl/ioctl-number.txt
>> +++ b/Documentation/ioctl/ioctl-number.txt
>> @@ -321,6 +321,7 @@ Code  Seq#(hex)   Include File            Comments
>>  0xDB 00-0F   drivers/char/mwave/mwavepub.h
>>  0xDD 00-3F   ZFCP device driver      see drivers/s390/scsi/
>>                                       <mailto:aherrman@de.ibm.com>
>> +0xEC 00-01   drivers/platform/chrome/cros_ec_dev.h   ChromeOS EC driver
>
> It seems like a bad idea to reuse the same ioctl numbers as the out-of-tree
> driver but changing the arguments. So please allocate a few more and use 2/3
> for this calling interface.
>
> [...]
>
>> new file mode 100644
>> index 000000000000..15c54c4c5531
>> --- /dev/null
>> +++ b/drivers/platform/chrome/cros_ec_dev.h
>> @@ -0,0 +1,47 @@
>> +/*
>> + * cros_ec_dev - expose the Chrome OS Embedded Controller to userspace
>> + *
>> + * Copyright (C) 2014 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef _CROS_EC_DEV_H_
>> +#define _CROS_EC_DEV_H_
>> +
>> +#include <linux/ioctl.h>
>> +#include <linux/types.h>
>> +#include <linux/mfd/cros_ec.h>
>> +
>> +#define CROS_EC_DEV_NAME "cros_ec"
>> +#define CROS_EC_DEV_VERSION "1.0.0"
>> +
>> +/*
>> + * @offset: within EC_LPC_ADDR_MEMMAP region
>> + * @bytes: number of bytes to read. zero means "read a string" (including '\0')
>> + *         (at most only EC_MEMMAP_SIZE bytes can be read)
>> + * @buffer: where to store the result
>> + * ioctl returns the number of bytes read, negative on error
>> + */
>> +struct cros_ec_readmem {
>> +     uint32_t offset;
>> +     uint32_t bytes;
>> +     uint8_t buffer[EC_MEMMAP_SIZE];
>> +};
>> +
>> +#define CROS_EC_DEV_IOC       0xEC
>> +#define CROS_EC_DEV_IOCXCMD   _IOWR(CROS_EC_DEV_IOC, 0, struct cros_ec_command)
>> +#define CROS_EC_DEV_IOCRDMEM  _IOWR(CROS_EC_DEV_IOC, 1, struct cros_ec_readmem)
>
> I.e. go with 2/3 here.
>
> (I can just do that change when I apply this patch, let me know if you prefer
> that).
>
>
> -Olof
>>
