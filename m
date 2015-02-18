From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 0/7] platform/chrome: Add user-space dev inferface
 support
Date: Wed, 18 Feb 2015 10:27:15 +0100
Message-ID: <54E45AF3.1010405@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>	<54E1A825.7090408@collabora.co.uk> <CAPnjgZ2QQzdZSrJ8gFYzMiVEFT8y7jod993AeVkpTPpKhiQ8DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:34650 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbbBRJ1V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Feb 2015 04:27:21 -0500
In-Reply-To: <CAPnjgZ2QQzdZSrJ8gFYzMiVEFT8y7jod993AeVkpTPpKhiQ8DA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Glass <sjg@chromium.org>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Gwendal Grignou <gwendal@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, lk <linux-kernel@vger.kernel.org>

Hello Simon,

On 02/18/2015 03:26 AM, Simon Glass wrote:
> 
> On 16 February 2015 at 01:19, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
>> Hello Olof,
>>
>> On 02/02/2015 12:26 PM, Javier Martinez Canillas wrote:
>>> Hello,
>>>
>>> The mainline ChromeOS Embedded Controller (EC) driver is still missing some
>>> features that are present in the downstream ChromiumOS tree. These are:
>>>
>>>   - Low Pin Count (LPC) interface
>>>   - User-space device interface
>>>   - Access to vboot context stored on a block device
>>>   - Access to vboot context stored on EC's nvram
>>>   - Power Delivery Device
>>>   - Support for multiple EC in a system
>>>
>>> This is a fifth version of a series that adds support for the first two of
>>> the missing features: the EC LPC and EC character device interfaces that
>>> are used by user-space to access the ChromeOS EC. The support patches were
>>> taken from the downstream ChromiumOS 3.14 tree with the fixes and cleanups
>>> squashed to have a minimal patch-set.
>>>
>>
>> Any comments on this series? The last version was posted a couple of weeks
>> ago but the series have been in the list for months. Lee has already acked
>> the mfd changes so you can merge all through your chrome-platform tree if
>> you want.
>>
>> It wold be great if this series get in to have the EC user-space interface
>> supported and to minimize the delta with the Chromemium OS kernel since it
>> still has other features that needs to be upstreamed like multiple EC in a
>> system and access to vboot context stored in block device or EC's nvram.
> 
> Are you sure Olof is the right maintainer for this going to mainline?
>

The downstream ChromiumOS kernel has this stuff in drivers/mfd but Lee was
patient enough to explain to me why it does not fit there. So I think the
best place is drivers/platform/chrome/ which is maintained by Olof.
 
> I do feel for you trying to get all this in and have seen your many
> attempts. It has been in U-Boot for 18 months...I hope you get there
> in the end.
>

Thanks a lot for your empathy. I do hope to get there too since there are
still more features to match what is in the downstream tree but needs to
be based on this series.

> Regards,
> Simon
>

Best regards,
Javier
