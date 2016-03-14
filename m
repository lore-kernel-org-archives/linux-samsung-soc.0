From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 13:33:08 -0700
Message-ID: <1457987588.11972.135.camel@perches.com>
References: <1457982308-29848-1-git-send-email-javier@osg.samsung.com>
	 <1457982675.11972.119.camel@perches.com> <56E7119B.9060900@osg.samsung.com>
	 <1457984317.11972.123.camel@perches.com> <56E71825.5070104@osg.samsung.com>
	 <20160314201958.GB28277@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay0164.hostedemail.com ([216.40.44.164]:48624 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753263AbcCNUdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 16:33:12 -0400
In-Reply-To: <20160314201958.GB28277@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On Mon, 2016-03-14 at 21:19 +0100, Alexandre Belloni wrote:
> checkpatch will not complain for messages but it will definitively
> complain if they are not properly aligned:)

checkpatch wouldn't actually complain unless the --strict option
was used or these files were in drivers/net or drivers/staging.
