From: Vivek Gautam <gautamvivek1987@gmail.com>
Subject: Re: [PATCH] usb: ehci-s5p: fix: Fix null pointer dereferencing
Date: Tue, 9 Apr 2013 18:32:27 +0530
Message-ID: <CAFp+6iE1Ei=B7+XfZghVivwQ5zdbCnuG+F=qdLX3P19Xo9QdYg@mail.gmail.com>
References: <1365499312-14232-1-git-send-email-gautam.vivek@samsung.com>
	<51640A16.1060002@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f48.google.com ([209.85.214.48]:48125 "EHLO
	mail-bk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759206Ab3DINC3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 09:02:29 -0400
In-Reply-To: <51640A16.1060002@cogentembedded.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Vivek Gautam <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kgene.kim@samsung.com, Manjunath Goudar <manjunath.goudar@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>

Hi,


On Tue, Apr 9, 2013 at 6:01 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello.
>
>
> On 09-04-2013 13:21, Vivek Gautam wrote:
>
>> 7edb3da makes ehci-s5p as a separate driver. But,
>
>
>    Please also provide the summary line of that commit in parens.

Sure, will add the commit line of that patch.

>
>
>> it raised an issue with its driver data.
>> Now that 's5p_ehci_hcd' doesn't maintain pointer to 'usb_hcd'
>> and s5p_ehci is nothing but a pointer to hcd->priv;
>> add hcd to the driver data rather than s5p_ehci.
>
>
>> This fixes issues with null pointer dereferencing in
>> s5p_ehci_shutdown(), s5p_ehci_suspend(), s5p_ehci_resume().
>
>
>> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>> CC: Manjunath Goudar <manjunath.goudar@linaro.org>
>> CC: Arnd Bergmann <arnd@arndb.de>
>> CC: Jingoo Han <jg1.han@samsung.com>
>
>
> WBR, Sergei



-- 
Thanks & Regards
Vivek
