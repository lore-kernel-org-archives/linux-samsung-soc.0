From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: SAMSUNG: Bug fix spin_lock recursion in
	clk_enable() and clk_disable()
Date: Tue, 19 Oct 2010 19:57:51 +0100
Message-ID: <20101019185751.GB10325@n2100.arm.linux.org.uk>
References: <1286843980-23684-1-git-send-email-jc.lee@samsung.com> <4CBCD3A5.5070701@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52816 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830Ab0JSTDB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Oct 2010 15:03:01 -0400
Content-Disposition: inline
In-Reply-To: <4CBCD3A5.5070701@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Jaecheol Lee <jc.lee@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Minho Ban <mhban@samsung.com>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 19, 2010 at 12:09:25AM +0100, Ben Dooks wrote:
> I'm not sure, but I don't belive that the clk_ api has
> ever been callable from non-sleepable contexts such as
> interrupt handlers.
> 
> I would welcome RMK's response (or any other response)
> about this issue?

We have traditionally allowed it from non-sleepable contexts, mainly
because the platforms I've been using it with have had such simple
clock implementations that it's not worth artifically restricting it,
or the implementation only requires a few us delay after enabling a
clock.
