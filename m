From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3] usb: Remove references to non-existent PLAT_S5P symbol
Date: Tue, 04 Nov 2014 19:33:03 +0100
Message-ID: <54591BDF.8060203@samsung.com>
References: <1412673127-11479-1-git-send-email-s.nawrocki@samsung.com>
 <20141103232438.GA11698@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44234 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221AbaKDSdM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 13:33:12 -0500
In-reply-to: <20141103232438.GA11698@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, pebolle@tiscali.nl, jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org

On 04/11/14 00:24, Greg KH wrote:
> On Tue, Oct 07, 2014 at 11:12:07AM +0200, Sylwester Nawrocki wrote:
>> > The PLAT_S5P Kconfig symbol was removed in commit d78c16ccde96
>> > ("ARM: SAMSUNG: Remove remaining legacy code"). There are still
>> > some references left, fix that by replacing them with ARCH_S5PV210.
>> > 
>> > Fixes: d78c16ccde96 ("ARM: SAMSUNG: Remove remaining legacy code")
>> > Reported-by: Paul Bolle <pebolle@tiscali.nl>
>> > Acked-by: Jingoo Han <jg1.han@samsung.com>
>> > Cc: <stable@vger.kernel.org>	[3.17+]
>
> This isn't a stable issue...

Sorry for disturbing then, let me go and read the documentation again.
