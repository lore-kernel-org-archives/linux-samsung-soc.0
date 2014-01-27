From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Samsung-clk patches for 3.15
Date: Tue, 28 Jan 2014 00:37:37 +0100
Message-ID: <52E6EDC1.9080003@gmail.com>
References: <52E27AE9.7040501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:39199 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754366AbaA0Xhr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jan 2014 18:37:47 -0500
Received: by mail-ee0-f43.google.com with SMTP id c41so2572059eek.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jan 2014 15:37:46 -0800 (PST)
In-Reply-To: <52E27AE9.7040501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: a.hajda@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, thomas.ab@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>, Mike Turquette <mturquette@linaro.org>

[Forgot to Cc Mike...]

On 24.01.2014 15:38, Tomasz Figa wrote:
> Hi,
>
> Linux 3.14 is going to include Andrzej Hajda's patches converting
> Samsung clock drivers to use clock ID defines in include/dt-bindings,
> instead of local enums, but to avoid unnecessary merge conflicts we have
> converted only the clock driver, leaving DTS files unchanged yet.
>
> We intend to complete the conversion in 3.15, by replacing magic numbers
> in DTS files with respective preprocessor macros, but to reduce
> potential conflicts we need help of you, Samsung clock patches authors :).
>
> I'd like to ask anybody who already has patches for DTS files adding any
> clock-related contents still using numeric IDs, e.g. clock properties in
> nodes or full nodes containing clock properties, to make sure that the
> patches are merged before Andrzej sends the conversion patches. Then
> Andrzej's script will generate patches updating all clock properties,
> leaving no numeric IDs in DTS files.
>
> If you are just starting your work on a patch that introduces changes as
> mentioned above, please make sure to already use clock macros, not
> numeric IDs. Otherwise you risk having needless rebases with a lot of
> conflicts. You have been warned ;).
>
> Best regards,
> Tomasz
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
