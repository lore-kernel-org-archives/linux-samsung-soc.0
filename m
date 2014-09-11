From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 5/8] arm64: dts: Add initial device tree support for EXYNOS7
Date: Thu, 11 Sep 2014 12:41:01 +0200
Message-ID: <27455049.omNFrla0xU@wuerfel>
References: <1410430852-3491-1-git-send-email-ch.naveen@samsung.com> <1410430852-3491-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:52800 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbaIKKlj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 06:41:39 -0400
In-Reply-To: <1410430852-3491-6-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, robh@kernel.org, catalin.marinas@arm.com, tomasz.figa@gmail.com, kgene.kim@samsung.com, naveenkrishna.ch@gmail.com

On Thursday 11 September 2014 15:50:49 Naveen Krishna Chatradhi wrote:
> +       aliases {
> +               serial0 = &serial_0;
> +               serial1 = &serial_1;
> +               serial2 = &serial_2;
> +               serial3 = &serial_3;
> +       };
> +

Please move the aliases from the exynos7.dtsi file into the
exynos7-espresso.dts file, and only list the ones that are
present, starting with alias 0, like

	aliases {
		serial0 = &serial_2;
	};

If the machine has only one serial port, it should be the first
alias.

	Arnd
