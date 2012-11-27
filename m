From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v4 00/12] clk: exynos4: migrate to common clock framework
Date: Tue, 27 Nov 2012 14:24:00 +0530
Message-ID: <CAJuYYwRMRUzijeTKiMcy5P3qV-OHW1wwGq3FiZ_fpf+Tcs+pKg@mail.gmail.com>
References: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
	<20121126193116.21126.66261@nucleus>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:55942 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758437Ab2K0IyB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 03:54:01 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so6593796vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 00:54:00 -0800 (PST)
In-Reply-To: <20121126193116.21126.66261@nucleus>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@ti.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

On 27 November 2012 01:01, Mike Turquette <mturquette@ti.com> wrote:
> Quoting Thomas Abraham (2012-11-24 13:17:53)
>> Changes since v3:
>> - Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>
>>
>
> Hi Thomas,
>
> 3.7-rc7 is out and I do not wish to take any large changes this close to
> the merge window opening up.  I will review these patches and give any
> feedback now on the common clk bits, but merging in the
> drivers/clk/samsung parts would have to wait until after clk-next is
> rebased onto 3.8-rc.
>
> Which tree do you want to merge this through?  Samsung or clk-next?
> Will you split the patches or take it all once you have gathered ACKs?

Hi Mike,

Ok. 3.8-rc should be fine. Since there are other Samsung platforms
being also converted over to common clock, I feel this could go
through the Samsung tree your ack. And there are lot of platform
specific bits that are touched, so it is easier to get it merged into
Samsung tree.

Thanks,
Thomas.
