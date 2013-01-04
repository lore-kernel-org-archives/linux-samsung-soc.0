From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Early kernel hang with big DTB appended
Date: Thu, 3 Jan 2013 21:48:05 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1301032144490.1263@xanadu.home>
References: <7811936.npteFbuYu2@amdc1227>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:46166 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754973Ab3ADCsI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jan 2013 21:48:08 -0500
Received: by mail-qc0-f169.google.com with SMTP id t2so8491559qcq.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jan 2013 18:48:07 -0800 (PST)
In-Reply-To: <7811936.npteFbuYu2@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bones@secretlab.ca, linux@arm.linux.org.uk, thomas.abraham@linaro.org, kgene.kim@samsung.com

On Thu, 3 Jan 2013, Tomasz Figa wrote:

> Hi,
> 
> I'm observing strange behavior when booting 3.8-rc1 and -rc2 with appended 
> DTB. The kernel hangs very early when the DTB is bigger than some 
> threshold somewhere around 24 KiB.

What is the address where you load your zImage?

What if you load it, say, at an offset of 16MB from the start of RAM?  
Not that this is a fix, but at least that would help isolate the issue.


Nicolas
