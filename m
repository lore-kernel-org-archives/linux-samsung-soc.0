From: Ming Lei <tom.leiming@gmail.com>
Subject: Re: kernel panic when booting on exynos 5440
Date: Fri, 26 Dec 2014 09:39:11 +0800
Message-ID: <CACVXFVOTieySjaihsUSf++p6sM1LouoEhfQmZ2uguyeirZ0uJA@mail.gmail.com>
References: <CACVXFVNCZdMyHQ1fzZDGs7h7X9vWmMVBJFRqWs7_P=WBQUYk1g@mail.gmail.com>
	<549BE7CC.1000005@samsung.com>
	<CACVXFVMOmq4rzXtaLNFn2NE-X=__dTJFANWtuJZS9m9szV0JuQ@mail.gmail.com>
	<549BECBA.4060707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:59314 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750725AbaLZBjM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Dec 2014 20:39:12 -0500
Received: by mail-oi0-f44.google.com with SMTP id e131so21165528oig.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Dec 2014 17:39:11 -0800 (PST)
In-Reply-To: <549BECBA.4060707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Dec 25, 2014 at 6:53 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>> If I remember correctly, there are other SoCs which have not been
>> included in the pmu mapping list, and looks these SoCs need
>> to be handled too.
>>
>
> As far as I can see in today's linux-next and kgene/for-next tree, only
> exynos5440 PMU mapping is missing. If I am missing anything please specify
> exact SoC name, which you think need to be handled.

You are right, it is my fault.

Thanks
Ming Lei
