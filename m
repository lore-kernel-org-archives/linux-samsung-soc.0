From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 0/3] Support Samsung S5P OHCI device and driver
Date: Thu, 17 Nov 2011 11:12:06 -0800
Message-ID: <20111117191206.GB30586@kroah.com>
References: <1473398.119441321339796993.JavaMail.weblogic@epml28>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:44431 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754465Ab1KQT3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Nov 2011 14:29:17 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 56E2B21201
	for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Nov 2011 14:29:17 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1473398.119441321339796993.JavaMail.weblogic@epml28>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@suse.de, stern@rowland.harvard.edu, kgene.kim@samsung.com, yulgon.kim@samsung.com, jy0922.shim@samsung.com

On Tue, Nov 15, 2011 at 06:49:58AM +0000, Jingoo Han wrote:
> Hello.
> 
> This patch series adds USB OHCI device and initial driver for Samsung
> S5P SoCs and is based from Linux 3.2-rc1. I have tested on SMDKV310 board
> using EXYNOS4.

This is to be sent through some arm tree, not the usb tree, right?

thanks,

greg k-h
