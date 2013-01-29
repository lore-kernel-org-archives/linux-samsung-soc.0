From: Oliver Neukum <oneukum@suse.de>
Subject: Re: [PATCH] usb: ehci: s5p: Power-off VBUS during suspend.
Date: Tue, 29 Jan 2013 12:37:28 +0100
Message-ID: <2944580.3eEfUK6kfJ@linux-5eaq.site>
References: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51076 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753067Ab3A2LhX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 06:37:23 -0500
In-Reply-To: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, jg1.han@samsung.com, Doug Anderson <dianders@chromium.org>

On Tuesday 29 January 2013 16:22:45 Vivek Gautam wrote:
> This change de-asserts vbus_gpio on suspend and
> re-asserts on resume in order to save power.
> NOTE, this change means no USB charging in suspend
> mode.

What happens if a device on the bus is a source of wakeups?

	Regards
		Oliver
