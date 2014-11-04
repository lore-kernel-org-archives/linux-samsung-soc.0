From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v3] usb: Remove references to non-existent PLAT_S5P
 symbol
Date: Tue, 04 Nov 2014 20:21:04 +0100
Message-ID: <1415128864.20372.189.camel@x220>
References: <1412673127-11479-1-git-send-email-s.nawrocki@samsung.com>
	 <20141103232438.GA11698@kroah.com> <54591BDF.8060203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews03.kpnxchange.com ([213.75.39.6]:59677 "EHLO
	cpsmtpb-ews03.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751261AbaKDTVI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 14:21:08 -0500
In-Reply-To: <54591BDF.8060203@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org

On Tue, 2014-11-04 at 19:33 +0100, Sylwester Nawrocki wrote:
> On 04/11/14 00:24, Greg KH wrote:
> > This isn't a stable issue...
> 
> Sorry for disturbing then, let me go and read the documentation again.

If I remember correctly, I asked Sylwester to mark this for stable. So
it's me that should be educated here.

Why is a patch that allows the users of ARCH_S5PV210 to set
USB_EHCI_EXYNOS or USB_OHCI_EXYNOS - which they apparently need - for a
v3.17.y kernel, not a stable issue?


Paul Bolle
