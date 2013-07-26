From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: XCLKOUT in exynos5250 clock driver
Date: Fri, 26 Jul 2013 15:26:06 +0530
Message-ID: <51F247B6.9010902@linaro.org>
References: <20130725145158.GI9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:40690 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758311Ab3GZJ4K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 05:56:10 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp13so1829070pab.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jul 2013 02:56:10 -0700 (PDT)
In-Reply-To: <20130725145158.GI9858@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 07/25/2013 08:21 PM, Mark Brown wrote:
> I appear to be missing something in the clock driver for the exynos5250.
> I'm looking at the Arndale schematic and I see that the audio master
> clock is connected to XCLKOUT on the SoC.  However I can't see any
> reference to XCLKOUT or anything similar in the clock driver or any of
> the DTS files - where is this clock exposed by the clock driver?
> 
> Unfortunately I haven't been able to get access to the datasheet for the
> part so I can't check this myself.
> 

Information as per Exynos5250 user manual:
"XCLKOUT is an output pin for debugging clocks. Exynos5250 has a CLKOUT
logic which can select one of the clocks (within its clock domains) and
output that through XCLKOUT pin."

Not sure if XCLKOUT on Arndale schematics means the same.

-- 
Tushar Behera
