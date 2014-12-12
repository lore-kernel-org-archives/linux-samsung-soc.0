From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 04/15] regulator: add restrack support
Date: Fri, 12 Dec 2014 09:21:01 +0100
Message-ID: <548AA56D.8060202@samsung.com>
References: <1418226513-14105-1-git-send-email-a.hajda@samsung.com> <1418226513-14105-5-git-send-email-a.hajda@samsung.com> <20141210160720.GS11764@sirena.org.uk> <548976D2.7080005@samsung.com> <20141211125837.GV11764@sirena.org.uk> <20141211134327.GO11285@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:42589 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965817AbaLLIVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Dec 2014 03:21:50 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1XzLTS-0003UX-UV
	for linux-samsung-soc@vger.kernel.org; Fri, 12 Dec 2014 09:21:18 +0100
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Dec 2014 09:21:18 +0100
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Dec 2014 09:21:18 +0100
In-Reply-To: <20141211134327.GO11285@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.orglinux-gpio@vger.kernel.orglinux-kernel@vger.kernel.orgdri-devel@lists.freedesktop.orgdevicetree@vger.kernel.orglinux-kernel@vger.kernel.orglinux-arm-kernel@lists.infradead.orgdri-devel@lists.freedesktop.orgdevicetree@vger.kernel.org

On 12/11/2014 02:43 PM, Russell King - ARM Linux wrote:
> On Thu, Dec 11, 2014 at 12:58:37PM +0000, Mark Brown wrote:
>> I'd expect someone reading the change in the regulator API to have at
>> least some idea how this fits in with the rest of the API and how to use
>> it, and probably more importantly I'd expect to be able to understand
>> why this is DT only.
> 
> Yep.
> 
> This is a repetitive problem, and I fully agree with your concern about
> stuff which is supposed to be arch-independent being designed with only
> DT in mind.
> 
> New core kernel features should *not* be designed with only DT in mind -
> DT is not the only firmware description language which the kernel
> supports.  Folk need to understand that if they design a new arch
> independent kernel feature where the sole use case is with DT, that new
> feature is probably going to get rejected, especially when it's
> something as generic as resource tracking.
> 
> The world is not DT only.
> 

OK. I will post next version of patchset with resource/provider lookup
left to frameworks (regulators, clock, etc), this way it will be fully
firmware agnostic. I will add also better description of the framework.

Regards
Andrzej
