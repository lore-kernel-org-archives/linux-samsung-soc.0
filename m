From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH RESEND 0/7] Introduce MEDIA_VERSION to end
 KENREL_VERSION abuse in media
Date: Thu, 29 Jun 2017 10:01:05 -0700
Message-ID: <20170629100105.6af3b77a@xeon-e3>
References: <20170621080812.6817-1-jthumshirn@suse.de>
        <20170624171507.38353b10@vento.lan>
        <20170629094259.GG3808@linux-x5ow.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:34791 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751936AbdF2RBK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Jun 2017 13:01:10 -0400
Received: by mail-pg0-f46.google.com with SMTP id t186so51024599pgb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jun 2017 10:01:09 -0700 (PDT)
In-Reply-To: <20170629094259.GG3808@linux-x5ow.site>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

On Thu, 29 Jun 2017 11:42:59 +0200
Johannes Thumshirn <jthumshirn@suse.de> wrote:

> On Sat, Jun 24, 2017 at 05:15:07PM -0300, Mauro Carvalho Chehab wrote:
> > Sorry, but I can't see any advantage on it. On the downside, it
> > includes the media controller header file (media.h) where it
> > is not needed.  
> 
> My reasoning was the differences in semantics. KERNEL_VERSION() is for
> encoding the kernel's version triplet not a API or Hardware or whatever
> version. Other subsystems do this as well, for instance in NVMe we have the
> NVME_VS() macro which is used to encode the NVMe Spec compliance from a human
> readable form to the hardware's u32. Also KERNEL_VERISON() shouldn't have
> in-tree users IMHO. Yes there is _one_ other user of it in-tree which is EXT4
> and I already talked to Jan Kara about it and we decided to leave it in until
> 4.20.
> 
> Byte,
> 	Johannes

If you read Linus's comments on version.
Driver version is meaningless and there is a desire to rip it out of all
drivers. The reason is that drivers must always behave the same, i.e you
can't use version to change API/ABI behavior. 

Any upstream driver should never use KERNEL_VERSION().
