From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 2/2] ARM: dts: snow: Add board dts file for Snow board
 (ARM Chromebook)
Date: Tue, 20 Nov 2012 10:43:57 -0800
Message-ID: <CAOesGMiGZHAw0zOZFZcYJ9YngbcMsTJrzhG+DQ5sP9Sq+CyzDQ@mail.gmail.com>
References: <1353432158-22999-1-git-send-email-dianders@chromium.org>
	<1353432158-22999-2-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f174.google.com ([209.85.210.174]:59360 "EHLO
	mail-ia0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752318Ab2KTSn6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 13:43:58 -0500
Received: by mail-ia0-f174.google.com with SMTP id y25so4451759iay.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 10:43:58 -0800 (PST)
In-Reply-To: <1353432158-22999-2-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: linux-samsung-soc@vger.kernel.org, Olof Johansson <olofj@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Shawn Guo <shawn.guo@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Josh Cartwright <josh.cartwright@ni.com>, Rahul Sharma <rahul.sharma@samsung.com>, Arun Kumar K <arun.kk@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Tue, Nov 20, 2012 at 9:22 AM, Doug Anderson <dianders@chromium.org> wrote:
> This dts file is based on the Snow dts file in the Chromium OS kernel
> tree with the following changes:
> * Some details have been updated to match the exynos5250-smdk5250.dts
>   file from linux-next (as of
>   c11068538994430547722dc9fb515a0ceefd5cb9).
> * This file doesn't include references to hardware whose upstream
>   support isn't quite there yet.  That includes most i2c devices.
>   Note that most i2c busses have been included with no devices.
>
> The Snow dts file is mostly just an include of the "cros5250" dts file
> which describes a class of similar boards.  Support for other boards
> has not yet been send upstream.
>
> With this file and a change to use UART3 for serial output I can:
> * Boot to a command line using either SD or EMMC as a root filesystem
> * See the power button and lid switch using evtest.
>
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Acked-by: Olof Johansson <olof@lixom.net>

Kukjin, since your pull requests came in today, can you ack this and
I'll just apply it on top of your branches?


Thanks,

-Olof
