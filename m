From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/2] phy: Kconfig: Re-organize Exynos USB 2.0 PHY configs
Date: Tue, 08 Jul 2014 17:45:48 +0200
Message-ID: <53BC122C.9090505@samsung.com>
References: <1404118582-21993-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51085 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbaGHPqX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 11:46:23 -0400
In-reply-to: <1404118582-21993-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kishon@ti.com, dianders@chromium.org, gautam.vivek@samsung.com, spk.linux@gmail.com

On 30.06.2014 10:56, Sachin Kamat wrote:
> Since the USB 2.0 PHYs are required only with EHCI/OHCI USB drivers,

That's not true. They are also required for USB gadget controller
supported by the DWC2 gadget driver (formerly s3c-hsotg). Otherwise the
change makes sense to me.

Best regards,
Tomasz
