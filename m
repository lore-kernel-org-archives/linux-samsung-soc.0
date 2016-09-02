From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH v5 2/2] ASoC: samsung: Add machine driver
 for Exynos5433 based TM2 board
Date: Fri, 2 Sep 2016 11:56:16 +0100
Message-ID: <20160902105616.GF21682@localhost.localdomain>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
 <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
 <20160829150251.GU21682@localhost.localdomain>
 <65238f9c-bed0-7ad5-1961-fa2ff3848782@samsung.com>
 <2f5ac8bf-34da-7ce7-931c-86a8dad61dfc@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:42968 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752509AbcIBK4Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 06:56:16 -0400
Content-Disposition: inline
In-Reply-To: <2f5ac8bf-34da-7ce7-931c-86a8dad61dfc@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, k.kozlowski@samsung.com, broonie@kernel.org, Inha Song <ideal.song@samsung.com>

On Fri, Sep 02, 2016 at 12:49:51PM +0200, Sylwester Nawrocki wrote:
> On 08/30/2016 04:57 PM, Sylwester Nawrocki wrote:
> > I will use prepare/complete as with late_suspend/early_resume power
> > sequences are wrong as you point out. I still need to debug why
> > there is no errors reported when the SPI controller is suspended
> > while there are supposed to be done SPI bus transfers.
> 
> As it turns out the reason there is no any errors with late_suspend/
> early_resume is that the CODEC sets its regmap's "cache only" only flag
> in its suspend() callback and then clears it in resume().  So any SPI
> transfers which might happen when SPI controller is suspended
> are prevented this way.

Ah of course yeah should have realised that, but yeah you still
end up with the writes not actually reaching the hardware.

Thanks,
Charles
