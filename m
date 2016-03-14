From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 21:51:01 +0100
Message-ID: <20160314205101.GD28277@piout.net>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
 <1457982675.11972.119.camel@perches.com>
 <56E7119B.9060900@osg.samsung.com>
 <1457984317.11972.123.camel@perches.com>
 <56E71825.5070104@osg.samsung.com>
 <20160314201958.GB28277@piout.net>
 <1457987588.11972.135.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:35112 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751165AbcCNUvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 16:51:10 -0400
Content-Disposition: inline
In-Reply-To: <1457987588.11972.135.camel@perches.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On 14/03/2016 at 13:33:08 -0700, Joe Perches wrote :
> On Mon, 2016-03-14 at 21:19 +0100, Alexandre Belloni wrote:
> > checkpatch will not complain for messages but it will definitively
> > complain if they are not properly aligned:)
> 
> checkpatch wouldn't actually complain unless the --strict option
> was used or these files were in drivers/net or drivers/staging.
> 

yeah, I'm using --strict on all the patches I receive.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
