From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH V2 RE-SEND 1/7] net: sxgbe: add basic framework for
 Samsung 10Gb ethernet driver
Date: Mon, 17 Mar 2014 09:58:53 -0700
Message-ID: <20140317095853.27c27f6c@nehalam.linuxnetplumber.net>
References: <007a01cf3e89$3bbdf460$b339dd20$%an@samsung.com>
	<20140314004454.GA10982@electric-eye.fr.zoreil.com>
	<000e01cf40ac$08c19290$1a44b7b0$@samsung.com>
	<20140316231101.GA23765@electric-eye.fr.zoreil.com>
	<005601cf4194$752c0c60$5f842520$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:33038 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756315AbaCQQ65 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 12:58:57 -0400
Received: by mail-pa0-f41.google.com with SMTP id fa1so6004845pad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2014 09:58:57 -0700 (PDT)
In-Reply-To: <005601cf4194$752c0c60$5f842520$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Byungho An <bh74.an@samsung.com>
Cc: 'Francois Romieu' <romieu@fr.zoreil.com>, netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, davem@davemloft.net, ilho215.lee@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, ks.giri@samsung.com, 'Joe Perches' <joe@perches.com>

On Sun, 16 Mar 2014 20:53:25 -0700
Byungho An <bh74.an@samsung.com> wrote:

> > 
> > They are used but they always point to the same set of methods.
> > Those methods could thus be directly called.  
> Yes, those methods can be called directly.
> But I think it is acceptable for manageability and extension for future.

That argument is only valid if:
 1. you have hardware that will use it but it is not ready.
 2. they will get used in next release (in < 6 mo)

Ths set of indirection has negative cost: it impedes readability, 
has to be maintained, and hurts performance.

One of the principles of agile programming is NOT to build infrastructure
until it is needed. Otherwise you are likely to build it wrong.
