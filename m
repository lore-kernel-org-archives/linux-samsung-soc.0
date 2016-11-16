From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request API
Date: Wed, 16 Nov 2016 18:31:13 +0100
Message-ID: <2b33d23d-b7c5-6e6d-454f-755c86ddd5eb@samsung.com>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <20161116032620.GV3000@localhost>
 <CGME20161116170345epcas4p4615ed113ee5031ad4b6778996d69fb20@epcas4p4.samsung.com>
 <20161116170337.GA4124@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36183 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752805AbcKPRbT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 12:31:19 -0500
In-reply-to: <20161116170337.GA4124@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: arnd@arndb.de, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On 11/16/2016 06:03 PM, Krzysztof Kozlowski wrote:
> As I understood, everything won't be applied because ASoC tree already
> contains some work around this?

Yes, sorry, I didn't coordinate this work very well, there are some patches
for the pcm and the i2s driver already in the ASoC tree which would conflict
with this series. I'd suggest to ignore patches 5/8...8/8 for now.

-- 
Thanks,
Sylwester
