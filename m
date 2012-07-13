From: Todd Poynor <toddpoynor@google.com>
Subject: Re: [PATCH] ARM: samsung: adc: fix race in s3c_adc_start
Date: Thu, 12 Jul 2012 18:35:29 -0700
Message-ID: <20120713013529.GA16856@google.com>
References: <1342059131-31251-1-git-send-email-toddpoynor@google.com>
 <20120712123125.GJ18513@trinity.fluff.org>
 <4FFF5287.8000608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f202.google.com ([209.85.220.202]:56056 "EHLO
	mail-vc0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932250Ab2GMBfb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 21:35:31 -0400
Received: by vcqp1 with SMTP id p1so49096vcq.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jul 2012 18:35:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <4FFF5287.8000608@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben@trinity.fluff.org>, eunki_kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

On Fri, Jul 13, 2012 at 07:41:11AM +0900, Kukjin Kim wrote:
> BTW, Todd, do you want to keep the 'Change-Id' in mainline?
> If you don't mind, I'd like to remove it...

Oops, I forgot to take it out, please do remove it, thanks.


Todd
