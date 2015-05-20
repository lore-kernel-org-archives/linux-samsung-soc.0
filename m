From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 09:35:57 +0200
Message-ID: <555C395D.9080409@collabora.co.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk> <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk> <20150519195305.GA2586@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:53858 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751184AbbETHgE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 03:36:04 -0400
In-Reply-To: <20150519195305.GA2586@tarshish>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, David Hendricks <dhendrix@google.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hello Baruch,

On 05/19/2015 09:53 PM, Baruch Siach wrote:
> Hi Javier,
> 
> On Tue, May 19, 2015 at 03:34:11PM +0200, Javier Martinez Canillas wrote:
>> Google Chromebooks have a SPI flash that is used to store firmware and
>> different system parameters and data (i.e: Google Binary Block flags).
>> 
>> Since there isn't a driver for it yet, the spidev interface is used to
>> access the flash from user-space (i.e: using the flashrom tool).
>> 
>> Add a "google,spi-flash" compatible string so the Device Tree sources
>> use it instead of the "spidev" compatible which does not describe the
>> real HW and is just a Linux implementation detail.
>> 
>> A generic "google,spi-flash" OF device ID is used instead of the actual
>> vendor/model because these chips are commodity parts that are sourced
>> from multiple vendors. So specifying the exact vendor and model in the
>> DTS will add a maintenance burden with no real gain (the parts are 100%
>> compatible anyways) and will likely result in it simply being wrong for
>> a sizeable fraction of the machines.
> 
> The compatible string and dt binding should be documented somewhere under 
> Documentation/devicetree/bindings/. Also, please keep the dt list on Cc for dt 
> related patches.
>

Yes, I didn't add a binding doc because this is mostly a RFC to see if
Mark finds the approach feasible but yes I should had included anyways,
sorry about that.

I'll add when posting as a proper patch if he agrees with the solution.
 
> baruch
> 

Best regards,
Javier
