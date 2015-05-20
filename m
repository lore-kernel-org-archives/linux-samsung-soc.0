From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 12:18:13 +0200
Message-ID: <555C5F65.7010204@collabora.co.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk> <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk> <20150520101318.GB21577@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:54080 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605AbbETKST (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 06:18:19 -0400
In-Reply-To: <20150520101318.GB21577@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Mark,

On 05/20/2015 12:13 PM, Mark Brown wrote:
> On Tue, May 19, 2015 at 03:34:11PM +0200, Javier Martinez Canillas wrote:
>> Google Chromebooks have a SPI flash that is used to store firmware and
>> different system parameters and data (i.e: Google Binary Block flags).
> 
>> ---
>>  drivers/spi/spidev.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> This is adding a binding with no documentation, documentation is
> mandatory for all bindings.
> 

Yes, I missed... sorry about that. Do you agree with the approach
though so I can re-spin the patches adding the missing DT binding?

Best regards,
Javier
