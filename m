From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] usb: ehci: s5p: Power-off VBUS during suspend.
Date: Tue, 29 Jan 2013 10:21:58 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1301291017360.1507-100000@iolanthe.rowland.org>
References: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:36645 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756608Ab3A2PV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 10:21:59 -0500
In-Reply-To: <1359456765-7335-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, jg1.han@samsung.com, Doug Anderson <dianders@chromium.org>

On Tue, 29 Jan 2013, Vivek Gautam wrote:

> This change de-asserts vbus_gpio on suspend and
> re-asserts on resume in order to save power.
> NOTE, this change means no USB charging in suspend
> mode.

Doing this would mean USB devices could not wake up the system.  This 
would be unacceptable.

However, turning off VBUS power is okay provided:

	no root-hub ports are enabled, and

	the root hub is not enabled for wakeup.

Under those circumstances there can't be any wakeup-enabled USB devices 
on the bus, and the root hub itself would not need to detect new 
connections and disconnections.

Alan Stern
