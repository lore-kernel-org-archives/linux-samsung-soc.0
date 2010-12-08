From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: CpuFreq for mini2440
Date: Wed, 08 Dec 2010 00:45:35 +0000
Message-ID: <4CFED52F.8070307@fluff.org>
References: <AANLkTi=55k8Dr6CAe6O92j6P2ht4D+onFAEu7J0Q+Nvn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:54826 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754713Ab0LHAph (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Dec 2010 19:45:37 -0500
In-Reply-To: <AANLkTi=55k8Dr6CAe6O92j6P2ht4D+onFAEu7J0Q+Nvn@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: tarek attia <tarek.m.attia@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 03/12/10 01:12, tarek attia wrote:
> Hi all,
> 
> I tried many times to enable the Cpufreq for the mini2440 "Friendly
> Arm board" but each time I enable it in the kernel it ended up by a
> successful compilation ,but when I mount the kernel image on the board
> ,just I dun find it's folder nor it's kernel objects,,,what I miss
> ,,or what track should I go to make it working ?

The board's init code may not support it. If no-one else comes
forward, I will try as I think I still have one of these boards
somewhere.
