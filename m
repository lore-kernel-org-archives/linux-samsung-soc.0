From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on	S5PV210/S5PC110.
Date: Wed, 07 Jul 2010 11:15:59 +0900
Message-ID: <4C33E35F.8060409@samsung.com>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
 <20100706071245.GA5058@n2100.arm.linux.org.uk>
 <013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33111 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751348Ab0GGCQB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 22:16:01 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5600KLU0YNX510@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 11:15:59 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5600NBF0YN4M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 07 Jul 2010 11:15:59 +0900 (KST)
In-reply-to: <013001cb1d62$de72ff30$9b58fd90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On 7/7/2010 8:27 AM, Kukjin Kim wrote:
> Russell King wrote:
> Hi Russell :-)
> 
>> On Tue, Jul 06, 2010 at 01:36:47PM +0900, Kukjin Kim wrote:
>>> This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC110.
>>> Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16MB.
>>> So each section's maximum size should be 16MB.
>> What is the spacing of chunks of memory, and minimum alignment of those
>> chunks in physical address space?
> 
> Some S5PC110(MCP D-type) has only available 80MiB in a bank.
> So the space accounts for 432MiB in a DMC0, but larger memory(256MiB +
> 128MiB) exists in a DMC1.
> 
> As you know, the size of a section should be a power of 2 and a physical
> address space of a section should be contiguous.
> If a section size is greater than 16MiB, a section have a hole. So the
> SECTION_SIZE_BITS should be 16MiB.
> 
>> Also, what is the maximum physical address which memory can be located?
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
> 

Please see arch/arm/include/asm/sparsemem.h

 * SECTION_SIZE_BITS: The number of physical address bits to cover                                
 *   the maximum amount of memory in a section.

I know 1 bank of S5PV210/S5PC110 have maximum 256MB, so i think
SECTION_SIZE_BITS is 28.
