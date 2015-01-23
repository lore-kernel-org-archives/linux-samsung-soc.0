From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Add sd0_rst pinctrl node to exynos5420
Date: Fri, 23 Jan 2015 16:59:24 +0100
Message-ID: <CABxcv=kARp8xLYCqf8dfdKd9ehs1u=qTEjkn1iujhN77ZjPdTA@mail.gmail.com>
References: <1422023038-11842-1-git-send-email-jh80.chung@samsung.com>
	<CABxcv=mJhHTBKes38+6kHi5o3RmBHHN6sVqBUDRc-YyNvkdESQ@mail.gmail.com>
	<1422028075.15395.92.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:35791 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753722AbbAWP7Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 10:59:25 -0500
Received: by mail-we0-f174.google.com with SMTP id x3so8377329wes.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jan 2015 07:59:24 -0800 (PST)
In-Reply-To: <1422028075.15395.92.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hello Sjoerd,

On Fri, Jan 23, 2015 at 4:47 PM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
>>
>> If this pin is used by the Odroid XU3 board, shouldn't be defined in
>> the exynos5422-odroidxu3.dts instead?
>
> It's not just used by the XU3 though, it's also hooked up on the peach
> pi chromebook for example and i would expect it to be hooked up on most
> board with an eMMC
>
> This change is consistent with most of the special purpose GPIO pins
> defined in that file, so i don't see the problem with including it in
> that pinctrl file

In that case I completely agree that it should be defined in the .dtsi
but that is not what the commit message said though :-)

Best regards,
Javier
