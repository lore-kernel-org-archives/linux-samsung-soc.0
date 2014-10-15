From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Wed, 15 Oct 2014 11:35:37 +0000 (UTC)
Message-ID: <loom.20141015T133306-266@post.gmane.org>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02> <7hzjd4lxc5.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:33937 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752440AbaJOLkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Oct 2014 07:40:07 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1XeMvz-0008Ed-Eh
	for linux-samsung-soc@vger.kernel.org; Wed, 15 Oct 2014 13:40:04 +0200
Received: from 210.94.41.89 ([210.94.41.89])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2014 13:40:03 +0200
Received: from jy0922.shim by 210.94.41.89 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Oct 2014 13:40:03 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi,

Kevin Hilman <khilman <at> kernel.org> writes:

> 
> Hi Abhilash,
> 
> Abhilash Kesavan <a.kesavan <at> samsung.com> writes:
> 
> > I had noticed a similar issue where only 6 cores would come up during
> > development on 5420. This was because there was a check in our u-boot
> > secondary boot-up path which would put a core into WFI if a flag was
> > not present and hence fail to boot. I wonder if it is the same
> > situation in your case too.
> > Is the u-boot for odroid-xu3 publically available or can you check if
there is any such code present in your
> secondary bring-up path.
> 
> I'm using the hardkernel u-boot[1], branch: odroidxu3-v2012.07.  I'm
> currently using the pre-built binaries that are in the
> sd_fuse/hardkernel directory of that branch, but I can rebuild u-boot if
> needed.
> 
> I'm not very familiar with u-boot, but if f you have some pointers where
> to start looking in that code, that would be helpful.
> 
> Kevin
> 
> [1] https://github.com/hardkernel/u-boot.git
> 
> 

It seems to need magic code.

Please refer
https://github.com/abhijeet-dev/linux-samsung/commit
/553b7f40465ab4fad6c270f289cd4780942f7fae

Thanks.
