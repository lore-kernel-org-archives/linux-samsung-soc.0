From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] usb: ehci-s5p: fix: Fix null pointer dereferencing
Date: Tue, 9 Apr 2013 12:26:58 +0200
Message-ID: <201304091226.58822.arnd@arndb.de>
References: <1365499312-14232-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:64289 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935762Ab3DIK1S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 06:27:18 -0400
In-Reply-To: <1365499312-14232-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kgene.kim@samsung.com, Manjunath Goudar <manjunath.goudar@linaro.org>, Jingoo Han <jg1.han@samsung.com>

On Tuesday 09 April 2013, Vivek Gautam wrote:
> 
> 7edb3da makes ehci-s5p as a separate driver. But,
> it raised an issue with its driver data.
> Now that 's5p_ehci_hcd' doesn't maintain pointer to 'usb_hcd'
> and s5p_ehci is nothing but a pointer to hcd->priv;
> add hcd to the driver data rather than s5p_ehci.
> 
> This fixes issues with null pointer dereferencing in
> s5p_ehci_shutdown(), s5p_ehci_suspend(), s5p_ehci_resume().

Right, sorry for not spotting this during review.

> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> CC: Manjunath Goudar <manjunath.goudar@linaro.org>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Jingoo Han <jg1.han@samsung.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
