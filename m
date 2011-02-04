From: Greg KH <greg@kroah.com>
Subject: Re: USB: Gadget: COMPOSITE: Debug interface number
Date: Fri, 4 Feb 2011 11:58:22 -0800
Message-ID: <20110204195822.GA30229@kroah.com>
References: <AANLkTimhnJ1dVK8yMz2S7R7r86xYjRSpD=cEx_weh_J1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:37353 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752620Ab1BDT7L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Feb 2011 14:59:11 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimhnJ1dVK8yMz2S7R7r86xYjRSpD=cEx_weh_J1@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-usb@vger.kernel.org, david-b@pacbell.net, gregkh@suse.de, stern@rowland.harvard.edu, maulik@ti.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Fri, Feb 04, 2011 at 06:50:27PM +0900, Jassi Brar wrote:
> Hi,
> 
> The commit 'avoid access beyond array max length' incorrectly
> compares w_index with MAX_CONFIG_INTERFACES. Whereas only
> lower 8bits of w_index refer to the interface number.
> So, use 'intf' rather than 'w_index' for comparison.

Why did you attach the patch in base64 mode?  Please fix your email
client to not do this and send it to me in a format that I can apply it
in.

Try using 'git send-email' instead.

thanks,

greg k-h
