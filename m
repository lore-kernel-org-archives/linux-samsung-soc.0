From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: About SECTION_SIZE_BITS for Sparsemem
Date: Mon, 12 Jul 2010 11:13:12 +0100
Message-ID: <20100712101312.GE22138@n2100.arm.linux.org.uk>
References: <000601cb219c$c7830b60$56892220$%kim@samsung.com> <AANLkTin1M4CnLb1sj9mZiePjF4SvgRXySyJmT4eWpJlj@mail.gmail.com> <001601cb21a8$d1cdd120$75697360$%kim@samsung.com> <AANLkTimsEDWv9X3PeX2EBjvxl53j9R6tnAkxQuOS3CQD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37579 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab0GLKNc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jul 2010 06:13:32 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimsEDWv9X3PeX2EBjvxl53j9R6tnAkxQuOS3CQD@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jul 12, 2010 at 07:08:11PM +0900, Kyungmin Park wrote:
> 27 for our board. 28 for generic.
> 
> Note that I enabled HIGHMEM and modify the VMALLOC_END to 0xd000'0000
> to test HIGHMEM.

If you want to test HIGHMEM, the way to do it is to specify a vmalloc=
parameter to the kernel, not to modify VMALLOC_END.

> Universal # bdinfo
> arch_number = 0x00000B2E
> env_t       = 0x00000000
> boot_params = 0x30000100
> DRAM bank   = 0x00000000
> -> start    = 0x30000000
> -> size     = 0x05000000
> DRAM bank   = 0x00000001
> -> start    = 0x40000000
> -> size     = 0x18000000

28 will work for this too.
