From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: git pre-commit hook running checkpatch.pl
Date: Wed, 20 Jan 2010 10:00:40 +0000
Message-ID: <20100120100040.GB20302@n2100.arm.linux.org.uk>
References: <20100120020202.GE26562@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45003 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584Ab0ATKA4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 05:00:56 -0500
Content-Disposition: inline
In-Reply-To: <20100120020202.GE26562@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Wed, Jan 20, 2010 at 02:02:02AM +0000, Ben Dooks wrote:
> I've written a git pre-commit[1] hook which stops any commits happening if
> checkpatch.pl reports problems with the patch. Any comments?

Very bad - checkpatch can be wrong at times.

Eg 1, asm/irq.h vs linux/irq.h
Eg 2, asm/memory.h vs linux/memory.h
Eg 3, lines longer than 80 characters for printk() strings are preferred
  so that they are grep-able.

checkpatch is at best a guide, not a set of hard rules.
