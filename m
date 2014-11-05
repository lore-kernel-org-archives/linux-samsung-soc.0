From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] usb: Remove references to non-existent PLAT_S5P symbol
Date: Wed, 5 Nov 2014 08:25:43 -0800
Message-ID: <20141105162543.GA14075@kroah.com>
References: <1412673127-11479-1-git-send-email-s.nawrocki@samsung.com>
 <20141103232438.GA11698@kroah.com>
 <54591BDF.8060203@samsung.com>
 <1415128864.20372.189.camel@x220>
 <20141104194221.GB3722@kroah.com>
 <1415130776.20372.194.camel@x220>
 <5459FAA8.1060902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:32815 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754602AbaKEQ0y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Nov 2014 11:26:54 -0500
Content-Disposition: inline
In-Reply-To: <5459FAA8.1060902@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org

On Wed, Nov 05, 2014 at 11:23:36AM +0100, Sylwester Nawrocki wrote:
> On 04/11/14 20:52, Paul Bolle wrote:
> > On Tue, 2014-11-04 at 11:42 -0800, Greg KH wrote:
> >> > As it's something that no one seemed to ever need before (i.e. it's not
> >> > a regression fix), but it would be a "new feature", I don't think it's
> >> > really a stable fix.
> >> > 
> >> > But feel free to convince me otherwise :)
> >
> > Sylwester, was I right in thinking that users of PLAT_S5P, who could set
> > USB_EHCI_EXYNOS or USB_OHCI_EXYNOS pre v3.17, got, well, transferred to
> > ARCH_S5PV210 and lost the ability to set one of those symbols in v3.17?
> 
> Yes, after commit d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
> we lost the ability to enable USB OHCI and EHCI on S5PV210 SoC.
> Thus for those who use the mainline kernel (might be rare) with S5PV210 SoC
> there is obviously a regression in USB subsystem in v3.17.

Ok, I'll add this to 3.17-stable when it hits Linus's tree, thanks.

greg k-h
