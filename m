From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 3/3] ARM: EXYNOS: Add drm-device node to the dtsi file
Date: Fri, 28 Sep 2012 08:51:23 +0200
Message-ID: <2322047.YHar8WY1rI@flatron>
References: <1348232397-2477-1-git-send-email-l.krishna@samsung.com> <1348232397-2477-4-git-send-email-l.krishna@samsung.com> <135e01cd9b88$aea81140$0bf833c0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45415 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152Ab2I1Gv3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 02:51:29 -0400
Received: by weyt9 with SMTP id t9so1112235wey.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Sep 2012 23:51:27 -0700 (PDT)
In-Reply-To: <135e01cd9b88$aea81140$0bf833c0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org

Hi,

On Wednesday 26 of September 2012 10:46:01 Kukjin Kim wrote:
> Please check below comments from Thomas Abraham and I agree with his
> opinion.
> 
> There cannot be a node that represents a virtual device. Device tree
> should ideally describe the hardware but the above node does not
> represent a hardware device. The creation of the platform device
> instance for the above device should handled inside the kernel code.

I don't tend to agree with this opinion. Is there any further reasoning 
behind it? Is it a current policy of the kernel that nodes should only 
represent real devices?

Best regards,
Tomasz Figa
