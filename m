From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH] ARM: mm: Regarding section when dealing with meminfo
Date: Fri, 21 Jan 2011 20:15:24 +0900
Message-ID: <AANLkTi=8DnGVJ6j4rHv+bQoTK2UhgMysC95LuKjH-fBy@mail.gmail.com>
References: <1295516739-9839-1-git-send-email-pullip.cho@samsung.com>
	<1295544047.9039.609.camel@nimitz>
	<20110120180146.GH6335@n2100.arm.linux.org.uk>
	<AANLkTimsL8YfSdXCBpN2cNVpj8HeJF0f-A7MJQoie+Zm@mail.gmail.com>
	<20110121103850.GI13235@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:58796 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754301Ab1AULPZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jan 2011 06:15:25 -0500
In-Reply-To: <20110121103850.GI13235@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Dave Hansen <dave@linux.vnet.ibm.com>, Kukjin Kim <kgene.kim@samsung.com>, KeyYoung Park <keyyoung.park@samsung.com>, linux-kernel@vger.kernel.org, Ilho Lee <ilho215.lee@samsung.com>, linux-mm@kvack.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Jan 21, 2011 at 7:38 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Fri, Jan 21, 2011 at 11:12:27AM +0900, KyongHo Cho wrote:
>> Since the size of section is 256 mib and NR_BANKS is defined as 8,
>> no ARM system can have more RAM than 2GiB in the current implementat=
ion.
>> If you want banks in meminfo not to cross sparsemem boundaries,
>> we need to find another way of physical memory specification in the =
kernel.
>
> There is no problem with increasing NR_BANKS.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
I think it is not reasonable to split a contiguous physical memory
into several chunks.
9 banks are required to use 2 gib.
Even though you think it is no problem,
it becomes a problem when we want to give physical memory information
via booting command line but atag
because there is a restriction in number of characters in booting comma=
nd line.

I don't understand why larger bank size than the section size is proble=
m.
