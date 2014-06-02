From: Jungseok Lee <jays.lee@samsung.com>
Subject: Re: [PATCH v6 3/7] arm64: Add a description on 48-bit address space
 with 4KB pages
Date: Mon, 02 Jun 2014 17:13:19 +0900
Message-ID: <07ff01cf7e3a$83442d40$89cc87c0$@samsung.com>
References: <000201cf6dc6$3ed91500$bc8b3f00$@samsung.com>
 <CAMJs5B8MW_Abni2X=+bdywg9zz5JyaEcDmZ+0MLd79Pn1+ZYtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8322 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751442AbaFBINX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jun 2014 04:13:23 -0400
In-reply-to: <CAMJs5B8MW_Abni2X=+bdywg9zz5JyaEcDmZ+0MLd79Pn1+ZYtg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Christoffer Dall' <christoffer.dall@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 'Catalin Marinas' <Catalin.Marinas@arm.com>, 'Marc Zyngier' <Marc.Zyngier@arm.com>, linux-kernel@vger.kernel.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Steve Capper' <steve.capper@linaro.org>, =?UTF-8?B?J+ygleyEseynhCc=?= <sungjinn.chung@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Ilho Lee' <ilho215.lee@samsung.com>

On Wednesday, May 28, 2014 5:26 AM, Christoffer Dall wrote:
> On Mon, May 12, 2014 at 06:40:44PM +0900, Jungseok Lee wrote:
> > This patch adds memory layout and translation lookup information about
> > 48-bit address space with 4K pages. The description is based on 4
> > levels of translation tables.
> >
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Steve Capper <steve.capper@linaro.org>
> > Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
> > Reviewed-by: Sungjinn Chung <sungjinn.chung@samsung.com>
> > Acked-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> 
> Looks reasonable to me:
> 
> Acked-by: Christoffer Dall <christoffer.dall@linaro.org>

Thank a lot!

- Jungseok Lee
