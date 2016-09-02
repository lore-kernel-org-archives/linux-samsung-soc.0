From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v5 2/2] ASoC: samsung: Add machine driver for
 Exynos5433 based TM2 board
Date: Fri, 02 Sep 2016 12:49:51 +0200
Message-ID: <2f5ac8bf-34da-7ce7-931c-86a8dad61dfc@samsung.com>
References: <1470752514-11409-1-git-send-email-s.nawrocki@samsung.com>
 <1470752514-11409-2-git-send-email-s.nawrocki@samsung.com>
 <20160829150251.GU21682@localhost.localdomain>
 <65238f9c-bed0-7ad5-1961-fa2ff3848782@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:12126 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752272AbcIBKuy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 06:50:54 -0400
In-reply-to: <65238f9c-bed0-7ad5-1961-fa2ff3848782@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, k.kozlowski@samsung.com, broonie@kernel.org, Inha Song <ideal.song@samsung.com>

On 08/30/2016 04:57 PM, Sylwester Nawrocki wrote:
> I will use prepare/complete as with late_suspend/early_resume power
> sequences are wrong as you point out. I still need to debug why
> there is no errors reported when the SPI controller is suspended
> while there are supposed to be done SPI bus transfers.

As it turns out the reason there is no any errors with late_suspend/
early_resume is that the CODEC sets its regmap's "cache only" only flag
in its suspend() callback and then clears it in resume().  So any SPI
transfers which might happen when SPI controller is suspended
are prevented this way.
