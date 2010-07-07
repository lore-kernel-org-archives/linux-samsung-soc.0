From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on
	S5PV210/S5PC110.
Date: Wed, 7 Jul 2010 08:56:22 +0100
Message-ID: <20100707075622.GA21830@n2100.arm.linux.org.uk>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com> <20100706071245.GA5058@n2100.arm.linux.org.uk> <013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:33399 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490Ab0GGH4i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 03:56:38 -0400
Content-Disposition: inline
In-Reply-To: <013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Jul 07, 2010 at 08:27:53AM +0900, Kukjin Kim wrote:
> Russell King wrote:
> > What is the spacing of chunks of memory, and minimum alignment of those
> > chunks in physical address space?
> 
> Some S5PC110(MCP D-type) has only available 80MiB in a bank.
> So the space accounts for 432MiB in a DMC0, but larger memory(256MiB +
> 128MiB) exists in a DMC1.

Ok.

> As you know, the size of a section should be a power of 2 and a physical
> address space of a section should be contiguous.
> If a section size is greater than 16MiB, a section have a hole. So the
> SECTION_SIZE_BITS should be 16MiB.

Where is this hole?  Please show it as a diagram similar to the one
you've produced below.

> > Also, what is the maximum physical address which memory can be located?
> 
> Following is memory map of S5PV210/S5PC110.
> 
> 0x80000000  -------------------
>             |          |
> 0x70000000  |          |
>             |          |
> 0x60000000  |  DMC 1  |  up to 1GiB
>             |          |
> 0x50000000  |          |
>             |          |
> 0x40000000  ----------------- 
>             |          |
> 0x30000000  |  DMC 0  |  up to 512MiB
>             |          |
> 0x20000000  -------------------

Right, so MAX_PHYSMEM_BITS is 31 and not 32 as you don't have memory
at or above 0x80000000.  This will immediately halve the amount of
sparsemem supporting structures irrespective of the SECTION_SIZE_BITS
value.
