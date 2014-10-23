From: Abhijeet Dev <abhijeet@abhijeet-dev.net>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Thu, 23 Oct 2014 08:36:48 +0000 (UTC)
Message-ID: <loom.20141023T103437-122@post.gmane.org>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02> <7hzjd4lxc5.fsf@deeprootsystems.com> <loom.20141015T133306-266@post.gmane.org> <CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com> <54485433.2040008@samsung.com> <54485730.10803@samsung.com> <CAGc3s_cS4zYUtdB=+8bPh2sa4Exy5guzupu-TvgJ_KmuyGGBPg@mail.gmail.com> <54485B99.2000703@samsung.com> <CAGc3s_e86Lx+pF12osoKoROXq4rUNf_GQtfJ8xB9w-X4pGVOmQ@mail.gmail.com> <54485E99.9020004@samsung.com> <54485FDA.8070508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:45847 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753149AbaJWIuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 04:50:06 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1XhE5s-00067Z-Dx
	for linux-samsung-soc@vger.kernel.org; Thu, 23 Oct 2014 10:50:04 +0200
Received: from aer01-mda1-dmz-wsa-6.cisco.com ([173.38.209.11])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2014 10:50:04 +0200
Received: from abhijeet by aer01-mda1-dmz-wsa-6.cisco.com with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2014 10:50:04 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Joonyoung Shim <jy0922.shim <at> samsung.com> writes:
> 
> On 10/23/2014 10:49 AM, Joonyoung Shim wrote:
> > Hi,
> > 
> > On 10/23/2014 10:42 AM, Mauro Ribeiro wrote:
> >> Joonyoung,
> >>
> >> Abhilash looks to be the father of it...
> >> Also I have no idea why I'm appearing as a commiter of that.. as me or
> >> anyone from Hardkernel doesn't have access to that github account or
> >> contributed to it.
> >> I do have a 3.17 branch here locally on my computer but its not public 
anywhere.
> > 
> > You are just author of the patch on github and it was committed to github 
by Abhilash.
> 
> Sorry, not Abhilash, by Abhijeet Dev <abhijeet <at> abhijeet-dev.net>, i 
don't know who he is.
> 
I had received it from Mauro. As Mauro mentioned, Abhilash seems to be the 
father of it - and the patch has to have Samsung origin - one can't dream of 
such magic :)

At the moment we can trace it as far as Abhilash - he looks like the person 
who actually knows this magic:

Abhilash(Samsung) -> Kevin -> Mauro -> Abhijeet (Me)

As I could only trace as far as Mauro earlier, I marked him as the author of 
this patch. I will change it in the next one. As for the tree on my 
github account, I maintain it to support various boards on Kukjin's for-next 
branch on kernel.org.
