From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: MFC Encode on S5PV210 hangs
Date: Tue, 11 Sep 2012 12:26:13 +0200
Message-ID: <504F11C5.4060002@samsung.com>
References: <1347218514.1641.4.camel@edge.config>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:56480 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753311Ab2IKKaF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Sep 2012 06:30:05 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1TBNjH-0006bR-TL
	for linux-samsung-soc@vger.kernel.org; Tue, 11 Sep 2012 12:30:03 +0200
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Sep 2012 12:30:03 +0200
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Sep 2012 12:30:03 +0200
In-Reply-To: <1347218514.1641.4.camel@edge.config>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org

On 09.09.2012 21:21, Mike Dyer wrote:
> Hi All,
>
> I'm trying to use the MFC encoder to generate an H264 bitstream using
> the V4L2 interface.  I've tried using my own application, and also the
> example encode application here:
> git://git.infradead.org/users/kmpark/public-apps
>
> Both exhibit the same behavior.  Input frames are queued up until the
> input queue is full, but only one frame is emitted (which I guess is the
> H264 header).  The encoder then just sits there.
>
> I'm not sure where to start looking, so any advice is appreciated.
>
> Cheers,
> Mike
>

Hi Mike,

Please test with enabled CMA(Device Drivers/Generic.../Contiguous Memory 
Allocator). I will test it further and update defconfig if necessary.

Please also apply latest published MFC patches(not yet in mainline), 
especially:
s5p-mfc: Fix second memory bank alignment
v4l/s5p-mfc: added support for end of stream handling in MFC encoder

Regards
Andrzej
