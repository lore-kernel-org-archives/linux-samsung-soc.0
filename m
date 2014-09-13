From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 0/4] Add initial support for pinctrl on Exynos7
Date: Sat, 13 Sep 2014 13:34:33 +0200
Message-ID: <54142BC9.9050303@gmail.com>
References: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:38405 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180AbaIMLei (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 07:34:38 -0400
In-Reply-To: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kesavan.abhilash@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, thomas.ab@samsung.com, Naveen Krishna Chatradhi <ch.naveen@samsung.com>

Hi Abhilash,

On 13.09.2014 10:50, Abhilash Kesavan wrote:
> The following patches are tested based on Kgene's for-next tree.
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
> 
> Following patches are required for this series:
> 1- "tty/serial: fix config dependencies for samsung serial"
>    https://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg36208.html
> 2- "dts, kbuild: Implement support for dtb vendor subdirs" patchset 
>    http://comments.gmane.org/gmane.linux.kbuild.devel/12131
> 3- "arch: arm64: enable support for Samsung Exynos7 SoC" patchset
>    http://www.spinics.net/lists/linux-samsung-soc/msg36728.html
> 

Other than few of my and Thomas's comments, my further actions (i.e. an
ACK) will depend on reply to [1].

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/36823/focus=37456

Best regards,
Tomasz
