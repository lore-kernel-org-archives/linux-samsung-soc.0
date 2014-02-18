From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/3] arm64: Add Kconfig option for Samsung GH7 SoC family
Date: Tue, 18 Feb 2014 16:40:24 +0000
Message-ID: <20140218164022.GA12381@localhost>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
 <52F99056.6010906@samsung.com>
 <CAOesGMgdDnSc=Y8i6JYeGewCh1RPYZ_AxocxKzSD265fa2-yrA@mail.gmail.com>
 <201402141806.12711.arnd@arndb.de>
 <5302B306.8090503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fw-tnat.austin.arm.com ([217.140.110.23]:19352 "EHLO
	collaborate-mta1.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932127AbaBRQkb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Feb 2014 11:40:31 -0500
Content-Disposition: inline
In-Reply-To: <5302B306.8090503@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Feb 18, 2014 at 01:10:30AM +0000, Kukjin Kim wrote:
> As I commented above, how about MCT? Samsung has a plan to use MCT on 
> ARMv8, it is not for used for GH7 though...

Any reason for not using the generic timer?

-- 
Catalin
