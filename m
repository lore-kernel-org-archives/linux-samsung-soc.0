From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 3/6] gpio: samsung: Skip legacy GPIO registration if pinctrl-s3c64xx is present
Date: Wed, 17 Apr 2013 00:35:58 +0200
Message-ID: <22399020.Z89v9QS8su@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com> <20130416162750.GO26958@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:54767 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965426Ab3DPWf6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 18:35:58 -0400
Received: by mail-ea0-f172.google.com with SMTP id z7so451393eaf.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2013 15:35:57 -0700 (PDT)
In-Reply-To: <20130416162750.GO26958@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>

On Tuesday 16 of April 2013 17:27:50 Mark Brown wrote:
> On Mon, Apr 15, 2013 at 11:14:40PM +0200, Tomasz Figa wrote:
> >  		{ .compatible = "samsung,exynos4x12-pinctrl", },
> >  		{ .compatible = "samsung,exynos5250-pinctrl", },
> >  		{ .compatible = "samsung,exynos5440-pinctrl", },
> > 
> > +		{ },
> 
> Strictly speaking this is a separate bug fix (though I see that's
> already in -next separately anyway so whatever).

Right. But this fix is so small that I thought it would be a major waste 
of mail server processing power to send it as a separate patch.

Best regards,
Tomasz
