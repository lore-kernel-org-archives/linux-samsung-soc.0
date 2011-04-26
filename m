From: Liam Girdwood <lrg@slimlogic.co.uk>
Subject: Re: [alsa-devel] (no subject)
Date: Tue, 26 Apr 2011 09:26:30 +0100
Message-ID: <1303806390.3332.16.camel@odin>
References: <1303714472-2391-1-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:53320 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286Ab1DZI0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Apr 2011 04:26:37 -0400
Received: by wya21 with SMTP id 21so250556wya.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Apr 2011 01:26:36 -0700 (PDT)
In-Reply-To: <1303714472-2391-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, jassisinghbrar@gmail.com, broonie@opensource.wolfsonmicro.com

On Mon, 2011-04-25 at 15:54 +0900, Sangbeom Kim wrote:
> [PATCH 0/2] Add WM8994 PCM Machine driver for Exynos4
> 
> Hi,
> 
> This is patchset for WM8994 pcm machine driver that supports
> PCM audio on SMDKV310, SMDKC210 and test is done.
> 
> Based on these patches WM8994 pcm machine driver supports followings:
>  o Playback supports 8kHz sampling rates.
>  o Capture supports 8kHz sampling rates.
> 
> This patchset contains followings 
> 
>  o To Kukjin Kim and Ben Dooks,
> [PATCH 1/2] ARM: EXYNOS4: Add PCM audio support for WM8994
> 
>  o To Jassi Brar, Mark Brown and Liam Girdwood,
> [PATCH 2/2] ASoC: SAMSUNG: Add WM8580 PCM Machine driver 
> 
> Best Regards,
> SB Kim (Sangbeom Kim)
> 

Both

Acked-by: Liam Girdwood <lrg@ti.com>
