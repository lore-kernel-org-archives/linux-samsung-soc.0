From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: dts: snow: Add board dts file for Snow board (ARM
 Chromebook)
Date: Wed, 21 Nov 2012 07:57:11 +0900
Message-ID: <0d5301cdc772$605a4420$210ecc60$%kim@samsung.com>
References: <1353432158-22999-1-git-send-email-dianders@chromium.org>
 <1353432158-22999-2-git-send-email-dianders@chromium.org>
 <CAOesGMiGZHAw0zOZFZcYJ9YngbcMsTJrzhG+DQ5sP9Sq+CyzDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29005 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752883Ab2KTW5O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 17:57:14 -0500
In-reply-to: <CAOesGMiGZHAw0zOZFZcYJ9YngbcMsTJrzhG+DQ5sP9Sq+CyzDQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>, 'Doug Anderson' <dianders@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Olof Johansson' <olofj@chromium.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Shawn Guo' <shawn.guo@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Josh Cartwright' <josh.cartwright@ni.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Arun Kumar K' <arun.kk@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Olof Johansson wrote:
> 
> On Tue, Nov 20, 2012 at 9:22 AM, Doug Anderson <dianders@chromium.org>
> wrote:
> > This dts file is based on the Snow dts file in the Chromium OS kernel
> > tree with the following changes:
> > * Some details have been updated to match the exynos5250-smdk5250.dts
> >   file from linux-next (as of
> >   c11068538994430547722dc9fb515a0ceefd5cb9).
> > * This file doesn't include references to hardware whose upstream
> >   support isn't quite there yet.  That includes most i2c devices.
> >   Note that most i2c busses have been included with no devices.
> >
> > The Snow dts file is mostly just an include of the "cros5250" dts file
> > which describes a class of similar boards.  Support for other boards
> > has not yet been send upstream.
> >
> > With this file and a change to use UART3 for serial output I can:
> > * Boot to a command line using either SD or EMMC as a root filesystem
> > * See the power button and lid switch using evtest.
> >
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
> 
> Acked-by: Olof Johansson <olof@lixom.net>
> 
> Kukjin, since your pull requests came in today, can you ack this and
> I'll just apply it on top of your branches?
> 
Hi Olof, yeah, I sent pull-request but there are some patches for dt and
exynos5440 stuff in my tree not sent yet. If you're ok, let me take this
with your ack.

Note, I will try to send out remained Samsung stuff before release -rc7 ;-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
