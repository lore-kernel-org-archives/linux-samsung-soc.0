From: Subash Patel <subashrp@gmail.com>
Subject: mis-match in VMALLOC_END value for exynos
Date: Fri, 30 Mar 2012 11:53:02 +0530
Message-ID: <4F755146.3030801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35752 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754083Ab2C3GXH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Mar 2012 02:23:07 -0400
Received: by pbcun15 with SMTP id un15so1284363pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Mar 2012 23:23:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hello,

I observed below address limitation changes in below versions of the kernel

linux-3.2: VMALLOC_END=0xF6000000
linux-3.3-rc5: VMALLOC_END=0xFF000000

What is happening is, when I use the SYSMMU to allocate and remap the 
memory, I need the consistent dma region. Hence I need to call 
init_consistent_dma_size() to increase the default address range of 2M. 
Inside this function there is a BUG_ON(base < VMALLOC_END); base is set 
to the value of CONSISTENT_END(0xffe00000UL) - ALIGN(size, SZ_2M); For 
any sizes greater than 8M, I generally dont enter the VMALLOC range. But 
when the consistent DMA size is big, it overlaps with the VMALLOC area.

Can anyone of you please tell me why this change was removed from the 
exynos files in 3.3 (and above also I think) kernel?

Regards,
Subash
