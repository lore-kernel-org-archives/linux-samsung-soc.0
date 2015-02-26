From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v5 4/7] platform/chrome: Add Chrome OS EC userspace device interface
Date: Thu, 26 Feb 2015 09:38:43 -0800
Message-ID: <CAOesGMiMAos-FTT8tURWM-pAOEbodjFO9ejBHqzfoXfjbwXTQg@mail.gmail.com>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>
	<1422876388-16540-5-git-send-email-javier.martinez@collabora.co.uk>
	<20150226005425.GA3101@quad.lixom.net>
	<CAMHSBOXOLrvkhWgF=hF8tB+yeakVUbTkTi-8ZvC2aAFtMEw_1A@mail.gmail.com>
	<54EEE28F.8000307@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:38405 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753733AbbBZRin (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 12:38:43 -0500
Received: by mail-ob0-f179.google.com with SMTP id wp4so12698111obc.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2015 09:38:43 -0800 (PST)
In-Reply-To: <54EEE28F.8000307@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Gwendal Grignou <gwendal@chromium.org>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Feb 26, 2015 at 1:08 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Olof,
>
> Thanks a lot for your feedback.
>
> On 02/26/2015 02:13 AM, Gwendal Grignou wrote:
>> Olof,
>>
>> I think the way Javier did it is fine, the 'major' of the ioctl is
>> 0xEC, from ':'.
>>
>> Gwendal.
>>
>
> As Gwendal said, I deliberately changed the IOCTL mayor number to
> make it different in both kernels.
>
> downstream:
>
> #define CROS_EC_DEV_IOC              ':'
> #define CROS_EC_DEV_IOCXCMD    _IOWR(':', 0, struct cros_ec_command)
> #define CROS_EC_DEV_IOCRDMEM   _IOWR(':', 1, struct cros_ec_readmem)
>
> mainline:
>
> #define CROS_EC_DEV_IOC       0xEC
> #define CROS_EC_DEV_IOCXCMD   _IOWR(CROS_EC_DEV_IOC, 0, struct cros_ec_command)
> #define CROS_EC_DEV_IOCRDMEM  _IOWR(CROS_EC_DEV_IOC, 1, struct cros_ec_readmem)
>
> I can also do what you suggested and keep ':' as the major and use 2/3
> as command numbers but I just think 0xEC is a much nicer major for the
> interface to talk with the Embedded Controller and it was available ;)

No, changing major is definitely sufficient and an acceptable way to
do it -- I had missed that you did so.

Thanks, Javier, Gwendal, I'll apply this today and push out. Gwendal
has been giving it a go on a machine here too so I'll check with him
before I push.


-Olof
