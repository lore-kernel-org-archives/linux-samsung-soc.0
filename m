From: Lukasz Majewski <l.majewski@samsung.com>
Subject: Re: [PATCH] usb: gadget: s3c-hsotg: fix kernel panic
Date: Wed, 21 Mar 2012 11:59:25 +0100
Message-ID: <20120321115925.67ef9f9e@lmajewski.digital.local>
References: <1331904920-19685-1-git-send-email-sangwook.lee@linaro.org>
 <20120319175208.274ca294@lmajewski.digital.local>
 <20120321095622.GK3092@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:58401 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932069Ab2CUK7e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Mar 2012 06:59:34 -0400
In-reply-to: <20120321095622.GK3092@arwen.pp.htv.fi>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: balbi@ti.com
Cc: Sangwook Lee <sangwook.lee@linaro.org>, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, patches@linaro.org, linaro-dev@lists.linaro.org

On Wed, 21 Mar 2012 11:56:23 +0200
Felipe Balbi <balbi@ti.com> wrote:

Hi Felipe,

> > > This patch is based on Lukasz Majewski's patches:
> > > [PATCH 0/9] USB: s3c-hsotg: USB S3C-HSOTG driver fixes and code
> > > cleanu
> > > 
This patch shall be placed on top of the above patch series.
Unfortunately those patches aren't yet applied to any of branches:

git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb

> 
> I don't seem to have the patch in my inbox, can someone re-send with
> Lukasz Tested-by line already in place ?
> 

I've already squashed this patch with one of the above patch series
with adding 
Signed-of-by: Sangwook Lee <sangwook.lee@linaro.org>

I will resend those patches asap on the linux-usb mailing list.


-- 
Best regards,

Lukasz Majewski

Samsung Poland R&D Center
Platform Group
