From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 3/4] plat-s5p: Add platform support for MIPI-CSI2 devices
Date: Thu, 2 Dec 2010 23:14:57 +0000
Message-ID: <20101202231457.GA12385@pulham.picochip.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <1291307862-8125-4-git-send-email-s.nawrocki@samsung.com>
 <20101202171538.GB30933@pulham.picochip.com>
 <4CF7D9E6.5000409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39362 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757269Ab0LBXPA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 18:15:00 -0500
Received: by wyb28 with SMTP id 28so8768966wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2010 15:14:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4CF7D9E6.5000409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

On Thu, Dec 02, 2010 at 06:39:50PM +0100, Sylwester Nawrocki wrote:
> On 12/02/2010 06:15 PM, Jamie Iles wrote:
> > On Thu, Dec 02, 2010 at 05:37:41PM +0100, Sylwester Nawrocki wrote:
[...]
> >> +static struct resource s5p_csis_resource[] = {
> >> +	[0] = {
> >> +		.start = S5P_PA_CSIS0,
> >> +		.end   = S5P_PA_CSIS0 + SZ_4K - 1,
> >> +		.flags = IORESOURCE_MEM,
> >> +	},
> >> +	[1] = {
> >> +		.start = IRQ_MIPICSI0,
> >> +		.end   = IRQ_MIPICSI0,
> >> +		.flags = IORESOURCE_IRQ,
> >> +	}
> >> +};
> > Do you really need the [0] and [1] here? These are only needed if you are 
> > sparsely initialising an array.
> 
> I agree explicit indices are not really needed. I just followed the style of
> all other resource definitions already there.
> I am not quite sure what is the preference of the maintainer, I guess they want
> all devices to follow same style for consistence.
Ok, that's fair enough, it just looked a bit odd to me!

Jamie
