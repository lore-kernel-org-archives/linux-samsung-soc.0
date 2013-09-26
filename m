From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH V3] pci: exynos: split into two parts such as Synopsys
 part and Exynos part
Date: Thu, 26 Sep 2013 10:36:45 +0530
Message-ID: <5243C0E5.7020508@ti.com>
References: <000701ce8741$fe47deb0$fad79c10$@samsung.com> <20130923041427.GC2246@pratyush-vbox> <523FD286.608@ti.com> <201309242323.55323.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:49155 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751018Ab3IZFHA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 01:07:00 -0400
In-Reply-To: <201309242323.55323.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pratyush Anand <pratyush.anand@st.com>, Jingoo Han <jg1.han@samsung.com>, 'Bjorn Helgaas' <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, Mohit KUMAR DCG <Mohit.KUMAR@st.com>, 'Sean Cross' <xobs@kosagi.com>, 'Thierry Reding' <thierry.reding@gmail.com>, 'SRIKANTH TUMKUR SHIVANAND' <ts.srikanth@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Wednesday 25 September 2013 02:53 AM, Arnd Bergmann wrote:
> On Monday 23 September 2013, Kishon Vijay Abraham I wrote:
>> Btw if we hadn't programmed inbound translation table, the address will go
>> untranslated (according to the data book). I guess that's how it was working
>> for Jingoo Han.
>>
>> **
>> 3.10.4
>> Inbound iATU Operation
>>
>> When there is no match, then the address is untranslated
>> **
>>
> 
> Well, that should work just as well, since you have a 1:1 translation anyway.
> Do you get the same error without the translation?

Yes. I get the same non-fatal error interrupt in RC.

Thanks
Kishon
