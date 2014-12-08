From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: request memory region in driver probe()
Date: Mon, 08 Dec 2014 19:01:27 +0100
Message-ID: <5485E777.8070203@samsung.com>
References: <1418049376-32129-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31549 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756083AbaLHSBr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Dec 2014 13:01:47 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NG9007U9ZLTZ150@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Dec 2014 18:05:53 +0000 (GMT)
In-reply-to: <1418049376-32129-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org

On 08/12/14 15:36, Sylwester Nawrocki wrote:
> The memory mapped registers region is common for both DAIs so request
> it in the I2S platform device driver probe for the platform device
> corresponding to the primary DAI, rather than in the ASoC DAI probe
> callback. While at it switch to devm_ioremap_resource(). This also
> drops the hard coded (0x100) register region size in the driver.

Please ignore this patch, there is one iounmap() call removal missing
in it. I'll resend it updated together with other patch(es) I'm working
on to get the CDCLK gating issue on Odroid X2/U3 fixed.

-- 
Thanks,
Sylwester
