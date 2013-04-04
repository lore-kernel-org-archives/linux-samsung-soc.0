From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/2] input: touchscreen: atmel_mxt_ts: Add Device Tree
 support
Date: Thu, 4 Apr 2013 10:30:40 -0700
Message-ID: <20130404173040.GB12302@core.coreip.homeip.net>
References: <1365092066-31753-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:60225 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1763773Ab3DDRao (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 13:30:44 -0400
Content-Disposition: inline
In-Reply-To: <1365092066-31753-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Hi Tomasz,

On Thu, Apr 04, 2013 at 06:14:24PM +0200, Tomasz Figa wrote:
> This series is an attempt to add Device Tree support to Atmel maXtouch
> touchscreen driver.
> 
> First patch adds support for VDD voltage regulator to get operating voltage
> using regulator API instead of a driver specific field in platform data.
> 
> Second patch implements Device Tree bindings for the driver and adds
> respective documentation.
> 
> Tested on Universal C210 board.

Please coordinate this effort with Nick Dyer <nick.dyer@itdev.co.uk>,
Daniel Kurtz <djkurtz@chromium.org> and Benson Leung <bleung@chromium.org>
as there is a big update to the atmel_mxt_ts in works and I would prefer
not to disturb it.

Thanks.

-- 
Dmitry
