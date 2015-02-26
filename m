From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 4/7] platform/chrome: Add Chrome OS EC userspace device
 interface
Date: Thu, 26 Feb 2015 10:08:31 +0100
Message-ID: <54EEE28F.8000307@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk> <1422876388-16540-5-git-send-email-javier.martinez@collabora.co.uk> <20150226005425.GA3101@quad.lixom.net> <CAMHSBOXOLrvkhWgF=hF8tB+yeakVUbTkTi-8ZvC2aAFtMEw_1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53930 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbbBZJIi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 04:08:38 -0500
In-Reply-To: <CAMHSBOXOLrvkhWgF=hF8tB+yeakVUbTkTi-8ZvC2aAFtMEw_1A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Olof,

Thanks a lot for your feedback.

On 02/26/2015 02:13 AM, Gwendal Grignou wrote:
> Olof,
> 
> I think the way Javier did it is fine, the 'major' of the ioctl is
> 0xEC, from ':'.
> 
> Gwendal.
>

As Gwendal said, I deliberately changed the IOCTL mayor number to
make it different in both kernels.

downstream:

#define CROS_EC_DEV_IOC              ':'
#define CROS_EC_DEV_IOCXCMD    _IOWR(':', 0, struct cros_ec_command)
#define CROS_EC_DEV_IOCRDMEM   _IOWR(':', 1, struct cros_ec_readmem)

mainline:

#define CROS_EC_DEV_IOC       0xEC
#define CROS_EC_DEV_IOCXCMD   _IOWR(CROS_EC_DEV_IOC, 0, struct cros_ec_command)
#define CROS_EC_DEV_IOCRDMEM  _IOWR(CROS_EC_DEV_IOC, 1, struct cros_ec_readmem)

I can also do what you suggested and keep ':' as the major and use 2/3
as command numbers but I just think 0xEC is a much nicer major for the
interface to talk with the Embedded Controller and it was available ;)

Best regards,
Javier
