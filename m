From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH] ARM: mm: Regarding section when dealing with meminfo
Date: Fri, 21 Jan 2011 11:12:27 +0900
Message-ID: <AANLkTimsL8YfSdXCBpN2cNVpj8HeJF0f-A7MJQoie+Zm@mail.gmail.com>
References: <1295516739-9839-1-git-send-email-pullip.cho@samsung.com>
	<1295544047.9039.609.camel@nimitz>
	<20110120180146.GH6335@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:42014 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816Ab1AUCM2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jan 2011 21:12:28 -0500
In-Reply-To: <20110120180146.GH6335@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Dave Hansen <dave@linux.vnet.ibm.com>, Kukjin Kim <kgene.kim@samsung.com>, KeyYoung Park <keyyoung.park@samsung.com>, linux-kernel@vger.kernel.org, Ilho Lee <ilho215.lee@samsung.com>, linux-mm@kvack.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jan 21, 2011 at 3:01 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Thu, Jan 20, 2011 at 09:20:47AM -0800, Dave Hansen wrote:
>> This problem actually exists without sparsemem, too. =A0Discontigmem=
 (at
>> least) does it as well.
>
> We don't expect banks to cross sparsemem boundaries, or the older
> discontigmem nodes (esp. as we used to store the node number.)
> Discontigmem support has been removed now so that doesn't apply
> anymore.
>

Our system can have 3 GiB of RAM in maximum.
In the near future, ARM APs can have up to 1 TiB with LPAE.

Since the size of section is 256 mib and NR_BANKS is defined as 8,
no ARM system can have more RAM than 2GiB in the current implementation=
=2E
If you want banks in meminfo not to cross sparsemem boundaries,
we need to find another way of physical memory specification in the ker=
nel.

>> The x86 version of show_mem() actually manages to do this without an=
y
>> #ifdefs, and works for a ton of configuration options. =A0It uses
>> pfn_valid() to tell whether it can touch a given pfn.
>
> x86 memory layout tends to be very simple as it expects memory to
> start at the beginning of every region described by a pgdat and exten=
d
> in one contiguous block. =A0I wish ARM was that simple.
>
