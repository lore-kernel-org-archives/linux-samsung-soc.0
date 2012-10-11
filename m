From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/16] pinctrl: samsung: Parse pin banks from DT
Date: Thu, 11 Oct 2012 15:52:03 +0200
Message-ID: <CACRpkdZsfNgckwKHWTf5xM+SHUr_tKbCHLyDDYef8QM6XWAcUg@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-5-git-send-email-t.figa@samsung.com>
	<CACRpkdafuxbO_peOBgmrjXk7ioVBF6D-D7d=shUd-GpHOdNxqg@mail.gmail.com>
	<1983938.6eHV2XjAIK@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45662 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752302Ab2JKNwF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 09:52:05 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so1026805wey.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Oct 2012 06:52:03 -0700 (PDT)
In-Reply-To: <1983938.6eHV2XjAIK@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: ext Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Wed, Oct 10, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> On Wednesday 10 of October 2012 09:34:05 Linus Walleij wrote:

>> If you will end up with a hybrid approach with some
>> stuff in the device tree and some stuff in the code,
>> it's better to keep the old driver.
>
> This will allow us to cover all the existing Samsung SoCs, starting from
> S3C24xx, through S3C64xx, S5P*, all supported Exynos SoCs and ending on any
> future SoCs using this kind of pin controller, without bloating the driver
> with hardly readable macros, lots of (often duplicated) static data and
> similar.

I do not agree with this, as you probably have realized by now...

I think it's better to use the compatible string to choose the offset
variable directly in the driver. But hey, it's just me, still.

> If there are some serious problems with this approach, just let me know and
> I will reconsider it, but if not, I'd like to keep it, because of the
> benefits it gives.

I'd like some input from Thomas Abraham before I make up my
mind about it.

Yours,
Linus Walleij
