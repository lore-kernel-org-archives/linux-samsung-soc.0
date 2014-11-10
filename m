From: D Krishna Mohan <krishna.md@samsung.com>
Subject: Re: [PATCH 1/4] ASoC: ALC5631: Add device tree binding documentation
Date: Mon, 10 Nov 2014 19:39:51 +0530
Message-ID: <E07FA6F208344BC093C8D95F677E8F4A@sisodomain.com>
References: <1415606519-30744-1-git-send-email-krishna.md@samsung.com>
 <1415606519-30744-2-git-send-email-krishna.md@samsung.com>
 <20141110133708.GQ3815@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=iso-8859-1; reply-type=original
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51761 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861AbaKJOKt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Nov 2014 09:10:49 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NET004PUU20JMB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Nov 2014 23:10:48 +0900 (KST)
In-reply-to: <20141110133708.GQ3815@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com

Hi Mark Brown,

     The codec driver is present in mainline as rt5631.c., Its realtek's 
alc5631 so retained that name.
Similarly machine driver also is named as arndale_rt5631.c but inside that 
driver I have used alc5631 naming as the
audio daughter card on arndale board mentions alc5631 so I have used this 
convention here so that user should not
feel the absence of the driver.

Is that ok or do you want to have one naming all over?

-Krishna


--------------------------------------------------
From: "Mark Brown" <broonie@kernel.org>
Sent: Monday, November 10, 2014 7:07 PM
To: "Krishna Mohan Dani" <krishna.md@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>; 
<linux-arm-kernel@lists.infradead.org>; <alsa-devel@alsa-project.org>; 
<kgene.kim@samsung.com>
Subject: Re: [PATCH 1/4] ASoC: ALC5631: Add device tree binding 
documentation

On Mon, Nov 10, 2014 at 01:31:56PM +0530, Krishna Mohan Dani wrote:
> Document the device tree binding for the ALC5631 codec and update vendor
> specific prefix for the Realtek.

This driver isn't in mainline, you need to submit the driver. 
