From: Sangbeom Kim <sbkim73@samsung.com>
Subject: RE: [PATCH 1/1] ASoC: Samsung: Convert to use snd_soc_register_card()
Date: Tue, 03 Jul 2012 19:35:54 +0900
Message-ID: <0d9701cd5907$9fb058f0$df110ad0$@com>
References: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19273 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755906Ab2GCKgX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jul 2012 06:36:23 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6K00CRQYR6JP20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Jul 2012 19:35:54 +0900 (KST)
Received: from DOSBKIM7302 ([12.23.118.225])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6K0027UYRTQ680@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Jul 2012 19:35:54 +0900 (KST)
In-reply-to: <1341304444-11188-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, tiwai@suse.de, patches@linaro.org

Hi!
On Tuesday, Jul 03, 2012 at 05:34PM, Sachin Kamat wrote:
> Current method for machine driver to register with the ASoC core is to use
> snd_soc_register_card() instead of creating a "soc-audio" platform device.

It looks better to include reason of using snd_soc_register_card
instead of creating "soc-audio" or warning message.

Acked-by: Sangbeom Kim <sbkim73@samsung.com>
